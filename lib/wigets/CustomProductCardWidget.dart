import 'package:flutter/material.dart';
import 'package:woo_storestackflutter/pages/ProductDetailsPage.dart';
import 'package:woo_storestackflutter/utils/constants.dart';

Widget customProductCardWidget(
    context, String imageUrl, String productName, String price) {
  Constants constants = Constants();
  return Padding(
    padding: EdgeInsets.all(6.0),
    child: Container(
      height: 300,
      decoration: BoxDecoration(
        color: constants.mainYBGColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailsPage(),
              ));
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8.0),
              child: Text(productName,
                  style:
                      TextStyle(fontSize: 20, color: constants.mainBlackColor)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 1.0, left: 8.0, bottom: 8),
              child: Row(
                children: [
                  Icon(Icons.monetization_on_outlined,
                      color: constants.mainBlackColor),
                  Text(
                    price + "ETH",
                    style: TextStyle(
                        fontSize: 15, color: constants.mainBlackColor),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}
