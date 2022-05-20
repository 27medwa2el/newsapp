import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/main.dart';
import 'package:news/modules/sources.dart';

class TabItem extends StatelessWidget {
  bool selected=true;
  Sources source;
TabItem(this.source,this.selected);

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: selected ? Container(
        padding: EdgeInsets.all((12)),
        decoration: BoxDecoration(
         color:  MyThemeData.primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(20)),
            border: Border.all(color: MyThemeData.primaryColor)

        ),
        child: Text(
          source.name,style: TextStyle(
          fontSize: 14, color: Colors.white
        ),
        ),
      )
         : Container(
        padding: EdgeInsets.all((12)),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border.all(color: MyThemeData.primaryColor)

          ),
          child: Text(
          source.name,style: TextStyle(
              fontSize: 14, color: MyThemeData.primaryColor
          ),
          ),
        )
    );
  }
}
