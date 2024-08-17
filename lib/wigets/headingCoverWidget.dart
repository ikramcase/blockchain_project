import 'package:flutter/cupertino.dart';
import 'package:woo_storestackflutter/utils/constants.dart';
import 'package:woo_storestackflutter/wigets/CustomButtonWiget.dart';

Widget headingCoverWidget(context) {
  Constants constants = Constants();
  return Stack(
    alignment: Alignment.bottomRight,
    children: [
      Container(
        height: MediaQuery.of(context).size.height * 0.40,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/cover.png"),
            fit: BoxFit.cover,
            scale: 1,
          ),
          color: constants.mainYellowColor,
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
                height: MediaQuery.of(context).size.height * 0.10,
                width: MediaQuery.of(context).size.width * 0.50,
                child: Text("Healthcare Digital Wallet")),
          ),
          customButtonWiget(() {}, 25, constants.mainYBGColor, "Connect wallet",
              constants.mainBlackColor),
        ],
      ),
    ],
  );
}
