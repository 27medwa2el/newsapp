import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
String imagePath;
String name;
Color color;
bool rightSided;
String id;
Function onCategoryClicked;
CategoryItem(
    this.imagePath,this.name,this.color,this.rightSided,this.id,this.onCategoryClicked
    );
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onCategoryClicked(id);
      },
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: rightSided? BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20),bottomRight: Radius.circular(20))
          : BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20),bottomLeft: Radius.circular(20))
        ),

      child: Column(
        children:[
        Image.asset(imagePath,width: 170,height: 160,),
        Text(name,style: TextStyle(fontSize: 22,color: Colors.white),)
        ]
      ),

      ),
    );
  }
}
