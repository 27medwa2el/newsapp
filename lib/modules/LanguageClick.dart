import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/main.dart';
import 'package:news/Provider/LocalizationProvider.dart';
import 'package:provider/provider.dart';


class LanguageClick extends StatefulWidget {

  @override
  _LanguageClickState createState() => _LanguageClickState();
}

class _LanguageClickState extends State<LanguageClick> {
  @override
  Widget build(BuildContext context) {

final provider=Provider.of<LocalizationProvider>(context);

      return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
            onTap: (){
              provider.changeLanguageToEn();

            },
            child: getLanguage('English', provider.language=='en')),
        InkWell( onTap: (){
          provider.changeLanguageToAr();
        },
            child: getLanguage('العربية', provider.language=='ar'))
      ],
    );
        }


  }
  Widget getLanguage(String language,bool selected)
  {
    return selected?
        Container(
          child: Row(
            children: [
              Text(language,style: TextStyle(color: MyThemeData.primaryColor),),
              Spacer(),
              Icon(Icons.check,color: MyThemeData.primaryColor,)
            ],
          ),
        )
        :
    Container(
      child: Row(
        children: [
          Text(language),
          Spacer(),
          
        ],
      ),
    );
  }


/*return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getLanguage('English', true),
        getLanguage('العربية', false)
      ],
    );*/