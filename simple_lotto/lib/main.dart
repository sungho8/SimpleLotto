import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:simple_lotto/main_scene.dart';

const Map<String, String> UNIT_ID = kReleaseMode
    ? {
        'ios': '[YOUR iOS AD UNIT ID]',
        'android': 'ca-app-pub-7882733072028788/2548252961',
      }
    : {
        'ios': 'ca-app-pub-3940256099942544/2934735716',
        'android': 'ca-app-pub-3940256099942544/6300978111',
      };

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: MainScene(),
      debugShowCheckedModeBanner: false,
    );
  }
}
