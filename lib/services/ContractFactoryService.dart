import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';
import 'package:woo_storestackflutter/utils/constants.dart';

class Contractfactoryservice extends ChangeNotifier {
  Constants constants = Constants();
  //SHARE Data
  String? storeName;
  bool storeNameLoading = true;

  //connect to blockchain network
  Web3Client? _client;
  String _abiCode = "";
  EthereumAddress? _contractAddress;
  DeployedContract? _contract;

  Contractfactoryservice() {
    _setUpNetwork();
  }
  _setUpNetwork() async {
    _client =
        Web3Client(constants.NETWORK_HTTP_RPC, Client(), socketConnector: () {
      return IOWebSocketChannel.connect(constants.NETWORK_WSS_RPC)
          .cast<String>();
    });
    await _fetchABIAndContractAddress();
    await _getDeployedContract();
    // print("Network connected! ${_client}");
  }
  //connect with smart contract

  //1 get abi and contract address
  Future<void> _fetchABIAndContractAddress() async {
    String abiFileRoot =
        await rootBundle.loadString(constants.CONTRACT_ABI_PATH);
    var abiJsonFormat = jsonDecode(abiFileRoot);

    _abiCode = jsonEncode(abiJsonFormat["abi"]);

    //get address
    _contractAddress = EthereumAddress.fromHex(constants.CONTRACT_ADDRESS);
    // print(_contractAddress);
  }

  //2 take abi and address to deploy contract
  Future<void> _getDeployedContract() async {
    _contract = DeployedContract(
        ContractAbi.fromJson(_abiCode!, "MarketPlaceProducts"),
        _contractAddress!);

    await _getStoreName();
    // print(_contract);
  }

  //fetch all function and data

  //GET STORE NAME FROM BLOCKCHIAN

  _getStoreName() async {
    List<dynamic> storeData = await _client!.call(
        contract: _contract!,
        function: _contract!.function("storeName"),
        params: []);
    // storeName = storeData[0];
    // print(storeData[0]);
    if (storeData[0].length > 0) {
      storeName = storeData[0];
      storeNameLoading = false;
    } else {
      storeNameLoading = true;
    }
    notifyListeners();
  }
}
