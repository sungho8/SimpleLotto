import 'dart:math';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class MainController extends GetxController {
  RxList<int> numberList = <int>[1, 2, 3, 4, 5, 6, 7].obs;
  RxInt counter = 0.obs;

  void generateLottoNumbers() {
    Set<int> lottoNumbers = {};
    Random random = Random();
    while (lottoNumbers.length < 7) {
      lottoNumbers.add(random.nextInt(45) + 1);
    }
    List<int> sortedNumbers = lottoNumbers.toList();
    sortedNumbers.sort();
    numberList.clear();
    numberList.addAll(sortedNumbers);
    counter.value++;
  }
}
