import 'package:flutter/material.dart';
import 'package:sport_manager/components/login_signup/login_page.dart';
import 'package:get/get.dart';
import 'localization/LocaleString.dart';

void main()  {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
        return GetMaterialApp(
          translations: LocaleString(),
          // locale is the language which will be the default one
          locale: Locale('nl'),
          title: 'SportManager',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.purple,
          ),
          home: LogInPage(),
        );
  }
}
