import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:woo_storestackflutter/utils/constants.dart';

Widget customButtonWiget(Function onPress, double borderSize, Color bgColor, String buttonTitle, Color buttonTextColor){
  return InkWell(
    onTap: ()=>onPress(),
    child: Container(
      height: 50,
      width: 150,
      // color: constants.mainYellowColor,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderSize),
        color: bgColor,
      ),
      child: Center(child: Text(buttonTitle, style: TextStyle(color: buttonTextColor, fontWeight: FontWeight.bold),)),
    ),
  );

}