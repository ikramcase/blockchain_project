import 'package:flutter/material.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:woo_storestackflutter/utils/constants.dart';
import 'package:woo_storestackflutter/wigets/CustomButtonWiget.dart';

class ProductDetailsPage extends StatelessWidget {
  ProductDetailsPage({super.key});
  Constants constants = Constants();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constants.mainYBGColor,
      appBar: AppBar(
        backgroundColor: constants.mainYBGColor,
        elevation: 0,
        title: Text(
          "Product Detail",
          style: TextStyle(color: constants.mainYellowColor),
          //iconTheme: IconThemeData(color: constants.mainYellowColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.40,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/coverrr.png"),
                  fit: BoxFit.cover,
                  scale: 1,
                ),
                color: constants.mainYellowColor,
              ),
            ),
            Container(
              color: constants.mainBlackColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.gamepad_rounded,
                            color: constants.mainYBGColor,
                            size: 40,
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Column(
                          children: [
                            Text(
                              "Category",
                              style:
                                  TextStyle(color: constants.mainYellowColor),
                            ),
                            Text(
                              "Games",
                              style: TextStyle(
                                  color: constants.mainWhiteGColor,
                                  fontSize: 15),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      print("Will open etherscan");
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.link,
                          color: constants.mainYBGColor,
                        ),
                        Text(
                          "Explore",
                          style: TextStyle(color: constants.mainYellowColor),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                "Description",
                style: TextStyle(
                    color: constants.mainBlackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
                //iconTheme: IconThemeData(color: constants.mainYellowColor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 18.0, left: 18.0),
              child: Text(
                constants.mokeParaghraph,
                style: TextStyle(
                    color: constants.mainBlackColor,
                    fontWeight: FontWeight.normal,
                    fontSize: 15),
                textAlign: TextAlign.justify,
                //iconTheme: IconThemeData(color: constants.mainYellowColor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                color: constants.mainWhiteGColor,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          RandomAvatar("0x2309438242093580398420348203984",
                              height: 60, width: 60)
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Seller",
                              style: TextStyle(color: constants.mainBlackColor),
                            ),
                            Text(
                              "0x23094382420935803984203",
                              style: TextStyle(
                                  color: constants.mainGrayColor, fontSize: 15),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "0.5 Eth",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: constants.mainBlackColor),
                ),
                customButtonWiget(() {
                  print("Buy Now");
                }, 5, constants.mainBlackColor, "BUY NOW",
                    constants.mainWhiteGColor)
              ],
            )
          ],
        ),
      ),
    );
  }
}
