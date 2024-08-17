import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:woo_storestackflutter/pages/CreateProductPage.dart';
import 'package:woo_storestackflutter/services/ContractFactoryService.dart';
import 'package:woo_storestackflutter/wigets/CustomButtonWiget.dart';
import 'package:woo_storestackflutter/wigets/CustomProductCardWidget.dart';
import 'package:woo_storestackflutter/wigets/CustomTextFieldWidget.dart';
import 'package:woo_storestackflutter/wigets/headingCoverWidget.dart';

import '../utils/constants.dart';

class DiscoveryPage extends StatelessWidget {
  DiscoveryPage({Key? key}) : super(key: key);
  Constants constants = Constants();

  @override
  Widget build(BuildContext context) {
    var contractFactory = Provider.of<Contractfactoryservice>(context);
    return Scaffold(
      backgroundColor: constants.mainYBGColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CreateProductPage()));
        },
        backgroundColor: constants.mainYellowColor,
        child: Icon(
          Icons.widgets_sharp,
          size: 40,
          color: constants.mainBlackColor,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            headingCoverWidget(context),
            Padding(
              padding: EdgeInsets.only(top: 8.0, left: 10),
              child: Text(
                "Categories",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Container(
              height: 40,
              child: ListView.builder(
                itemCount: constants.categoryList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(left: 20.0, top: 8),
                    child: Text(
                      constants.categoryList[index],
                      style: TextStyle(
                          fontSize: 15, color: constants.mainGrayColor),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0, left: 10, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Newest Products",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  contractFactory.storeNameLoading
                      ? CircularProgressIndicator()
                      : Text(
                          contractFactory.storeName.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                ],
              ),
            ),
            SizedBox(
              // color: Colors.black,
              height: MediaQuery.of(context).size.height,
              child: AlignedGridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  padding: EdgeInsets.all(15),
                  itemCount: 10,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  crossAxisCount: 2,
                  itemBuilder: (context, index) {
                    return customProductCardWidget(context, constants.imageMoke,
                        "product ${index + 1}", "0.8");
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
