import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/NewsScreen/CategoriesWidget.dart';
import 'package:news/NewsScreen/HomeTaps.dart';

import 'package:http/http.dart' as http;
import 'package:news/main.dart';
import 'package:news/modules/SettingsScreen.dart';
import 'package:news/modules/SourcesResponse.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



class NewsAppScreen extends StatefulWidget {
  static final ROUTE_NAME = 'News Screen';

  @override
  _NewsAppScreenState createState() => _NewsAppScreenState();
}

class _NewsAppScreenState extends State<NewsAppScreen> {
  Future<SourcesResponse> sourceResponse;
  String selectedId;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Container(
          color: Colors.white,
          width: 270,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DrawerHeader(child:
              Center(child: Text(AppLocalizations.of(context).newsApp, style: TextStyle(fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white), textAlign: TextAlign.center,)),
                decoration: BoxDecoration(color: MyThemeData.primaryColor),
              ),
              IconButton(
                onPressed: (){onDrawerCategoryClicked();
                Navigator.pop(context);
                },
                icon: Row(
                  children: [
                    Icon(Icons.list, color: Colors.black,),
                    SizedBox(width: 7,),
                    Text(AppLocalizations.of(context).categories, style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),)

                  ],

                ),
              ),
              IconButton(
                onPressed: (){
                  Navigator.of(context).pushReplacementNamed(SettingsScreen.ROUTE_NAME);
                },
                icon: Row(
                  children: [
                    Icon(Icons.settings, color: Colors.black,),
                    SizedBox(width: 7,),
                    Text(AppLocalizations.of(context).settings, style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),)
                  ],

                ),
              )

            ],
          ),
        ),
        appBar: AppBar(
          toolbarHeight: 80,
          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(70))
          ),
          backgroundColor: MyThemeData.primaryColor,
          title: Text(
            AppLocalizations.of(context).newsApp,
          ),


        ),
        body:selectedId==null? Categories(onCategoryClicked)
            :FutureBuilder<SourcesResponse>(
            future: sourceResponse,
            builder: (buildContext, snapShot) {
              if (snapShot.hasError) {
                return Text(snapShot.hasError.toString());
              } else if (snapShot.hasData) {
                return HomeTaps(snapShot.data.sources);
              } else
                return    Center(child: CircularProgressIndicator());
            }),
    );



  }
void onCategoryClicked(String id)
{
  setState(() {
    selectedId=id;
    sourceResponse = loadSoruces();
  });

}
void onDrawerCategoryClicked(){
    setState(() {
      selectedId=null;
    });

}
  Future<SourcesResponse> loadSoruces() async {
    Uri uri = Uri.https('newsapi.org', '/v2/top-headlines/sources',
        {'apiKey': '4c57af7bda314d87b0770e54e5675689',
        'category': selectedId});

    final response = await http.get(uri);
    if (response.statusCode == 200)
      return SourcesResponse.fromJsonMap(jsonDecode(response.body));
    else
      throw (Exception(response.body));
  }
}