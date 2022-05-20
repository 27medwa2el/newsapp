import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:news/NewsScreen/NewsApp.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news/Provider/LocalizationProvider.dart';
import 'package:news/modules/SettingsScreen.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(MyApp());
}
 class MyThemeData{
  static final primaryColor=Color(0xff39A552);
 }

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create:(_)=> LocalizationProvider(),
      builder: (context,widget){
      final provider =Provider.of<LocalizationProvider>(context);
        return   MaterialApp(
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [
              Locale('en', ''), // English, no country code
              Locale('ar', ''), // Spanish, no country code
            ],
            title: 'Flutter Demo',
            locale: Locale(provider.language),
            theme: ThemeData(



            ),

            routes:
            {
              NewsAppScreen.ROUTE_NAME:(buildContext)=>NewsAppScreen(),
              SettingsScreen.ROUTE_NAME: (buildContext)=>SettingsScreen()
            },
            initialRoute: NewsAppScreen.ROUTE_NAME,
          );


      },
    );
    /**/
  }
}

