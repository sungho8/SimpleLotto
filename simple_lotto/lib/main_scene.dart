import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_lotto/main.dart';
import 'package:simple_lotto/main_controller.dart';
import 'package:simple_lotto/text_item.dart';
import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class MainScene extends GetView<MainController> {
  const MainScene({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TargetPlatform os = Theme.of(context).platform;

    BannerAd banner = BannerAd(
      listener: BannerAdListener(
        onAdFailedToLoad: (Ad ad, LoadAdError error) {},
        onAdLoaded: (_) {},
      ),
      size: AdSize.banner,
      adUnitId: UNIT_ID[os == TargetPlatform.iOS ? 'ios' : 'android']!,
      request: const AdRequest(),
    )..load();

    Get.put(MainController());

    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Obx(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < controller.numberList.length; i++)
                      Row(
                        children: [
                          TextItem(counter: controller.numberList[i]),
                          const SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                  ],
                ),
                const SizedBox(
                  height: 80,
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.generateLottoNumbers();
                  },
                  child: const Text('번호 뽑기'),
                ),
              ],
            ),
          ),
        ]),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(bottom: 20),
        height: 75,
        child: AdWidget(
          ad: banner,
        ),
      ),
    );
  }
}
