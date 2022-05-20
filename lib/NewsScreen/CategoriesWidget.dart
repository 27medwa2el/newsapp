import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/NewsScreen/Widget/CategoryItem.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../main.dart';

class Categories extends StatelessWidget {
Function onCategoryClicked;
Categories(this.onCategoryClicked);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(22.0),
      child: ListView(

        children: [
          Center(child: Text(AppLocalizations.of(context).chose,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold), )),
          SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CategoryItem('assets/images/bussines.png', AppLocalizations.of(context).business, Colors.red, false,'business',onCategoryClicked),CategoryItem('assets/images/health.png', AppLocalizations.of(context).health, Colors.blue,true,'health',onCategoryClicked)
            ],
          ),SizedBox(height: 8,),
          Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CategoryItem('assets/images/sports.png',AppLocalizations.of(context).sports , Colors.blueAccent, false,'sports',onCategoryClicked),CategoryItem('assets/images/politics.png', AppLocalizations.of(context).politics, Colors.blueGrey,true,'technology',onCategoryClicked)
            ],
          ),SizedBox(height: 8,),
          Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CategoryItem('assets/images/science.png', AppLocalizations.of(context).science, Colors.red, false,'science',onCategoryClicked),CategoryItem('assets/images/environment.png', AppLocalizations.of(context).environment, Colors.lightBlueAccent,true,'entertainment',onCategoryClicked)
            ],
          )

        ],


      ),
    );
  }
}
