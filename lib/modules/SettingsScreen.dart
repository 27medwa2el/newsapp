import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news/NewsScreen/NewsApp.dart';
import 'package:news/modules/LanguageClick.dart';
import 'package:news/Provider/LocalizationProvider.dart';
import 'package:provider/provider.dart';
import '../main.dart';

class SettingsScreen extends StatefulWidget {
  static final ROUTE_NAME = 'settingsScreen';

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String selectedId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(
        color: Colors.white,
        width: 270,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DrawerHeader(
              child: Center(
                  child: Text(
                    AppLocalizations
                        .of(context)
                        .newsApp,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  )),
              decoration: BoxDecoration(color: MyThemeData.primaryColor),
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(NewsAppScreen.ROUTE_NAME);
              },
              icon: Row(
                children: [
                  Icon(
                    Icons.list,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Text(
                    AppLocalizations
                        .of(context)
                        .categories,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(SettingsScreen.ROUTE_NAME);
              },
              icon: Row(
                children: [
                  Icon(
                    Icons.settings,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Text(
                    AppLocalizations
                        .of(context)
                        .settings,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        toolbarHeight: 80,
        shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(70))),
        backgroundColor: MyThemeData.primaryColor,
        title: Text(
          AppLocalizations
              .of(context)
              .settings,
        ),
      ),
      body:
         Column(
           crossAxisAlignment: CrossAxisAlignment.start,
            children: [


               Padding(
                 padding: const EdgeInsets.all(30),
                 child: Text(

              AppLocalizations.of(context).language,
        textAlign: TextAlign.left,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
               ),

      InkWell(
        onTap: showLanguageSheet,
        child: Container(
          height: 40,
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.only(left: 35,right: 35),
          decoration: BoxDecoration(
            border: Border.all(
              color: MyThemeData.primaryColor
            )

          ),
          child: Row(
              children: [
                Expanded(child: Text('Language',style: TextStyle(color: MyThemeData.primaryColor),)),
                Icon(Icons.arrow_drop_down_sharp,color: MyThemeData.primaryColor,)
              ]

          ),),
      )
        ],
      ),

    );
  }
  showLanguageSheet(){

    showModalBottomSheet(context: context, builder: (context){
      return LanguageClick();

    });
}
}
