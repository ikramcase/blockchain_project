import 'package:flutter/material.dart';

class Constants {
  //========>blockchain

  //contract data

  final CONTRACT_ADDRESS = "0xe5625ed8fad0bcbecadceb2f14fd948ef8d28f3b";
  final CONTRACT_ABI_PATH = "assets/abis/MarketPlaceProducts.json";

  //blockchain network data
  final NETWORK_HTTP_RPC =
      "https://sepolia.infura.io/v3/786e22975a574ac0990c493922ba6ab3";
  final NETWORK_WSS_RPC =
      "wss://sepolia.infura.io/ws/v3/786e22975a574ac0990c493922ba6ab3";
  final CHAIN_ID = 11155111;

  final imageMoke =
      "https://images.unsplash.com/photo-1636467472048-99be973392b2?q=80&w=2000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";

  final mainYellowColor = Color(0xffF1B026);
  final mainBlackColor = Color(0xff08090B);
  final mainGrayColor = Color(0xffA2A9C2);
  final mainYBGColor = Color(0xffF4F4F5);
  final mainWhiteGColor = Color(0xffF8F1FC);

  final List<String> categoryList = <String>[
    "Games",
    "Arts",
    "Sports",
    "3D",
    "Photoghraphy",
    "Collectables"
  ];

  final mokeParaghraph =
      "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available. ";
}
