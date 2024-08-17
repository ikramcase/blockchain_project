import 'package:flutter/material.dart';
import 'package:woo_storestackflutter/utils/constants.dart';
import 'package:woo_storestackflutter/wigets/CustomTextFieldWidget.dart';

class CreateProductPage extends StatefulWidget {
  const CreateProductPage({super.key});

  @override
  State<CreateProductPage> createState() => _CreateProductPageState();
}

class _CreateProductPageState extends State<CreateProductPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  String dropdownvalue = "Games";

  @override
  Widget build(BuildContext context) {
    Constants constants = Constants();

    return Scaffold(
      backgroundColor: constants.mainYBGColor,
      appBar: AppBar(
        title: Text("Upload Product to Blockchain"),
        backgroundColor: constants.mainYellowColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "Create Product and add to Blockahin",
                style: TextStyle(
                    color: constants.mainBlackColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  customTextFieldWidget(1, "Product Name", nameController),
                  customTextFieldWidget(1, "Product Price", priceController),
                  customTextFieldWidget(
                      1, "Product Description", descriptionController),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  Text(
                    "Select Category",
                    style: TextStyle(
                        color: constants.mainBlackColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  DropdownButton<String>(
                      value: dropdownvalue,
                      items: constants.categoryList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                            value: value, child: Text(value));
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          dropdownvalue = value!;
                        });
                      })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
