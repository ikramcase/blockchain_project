import 'package:flutter/material.dart';
import 'package:woo_storestackflutter/pages/DiscoveryPage.dart';

import '../utils/constants.dart';
import '../wigets/CustomButtonWiget.dart';

class Splashpage extends StatelessWidget {
  const Splashpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Constants constants = Constants();
    return Scaffold(
        body: Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/splahPink.jpg"),
              fit: BoxFit.cover,
              scale: 1,
            ),
            //color: constants.mainYellowColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 30.0, left: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                    height: MediaQuery.of(context).size.height * 0.50,
                    width: MediaQuery.of(context).size.width * 0.50,
                    child: Text(
                      "Healthcare Digital Wallet",
                      style: TextStyle(
                          fontSize: 30, color: constants.mainBlackColor),
                    )),
              ),
              customButtonWiget(() {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => DiscoveryPage()));
              }, 20, constants.mainYellowColor, "Connect wallet",
                  constants.mainBlackColor),
            ],
          ),
        ),
      ],
    ));
  }
}
