import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LocalStorageController extends GetxController {
  final appData = GetStorage();

  RxBool isDarkMode = true.obs;
  RxBool isGridView = true.obs;

  @override
  void onInit() {
    getData();

    // TODO: implement onInit
    super.onInit();
  }

  void darkMode(bool bool) {
    appData.write('darkMode', bool);
  }

  void gridView(bool bool) {
    appData.write('gridView', bool);
  }

  void getData() {
    appData.writeIfNull('darkMode', false);
    appData.writeIfNull('homeView', true);

    // isDarkMode = appData.read('darkMode');
    // isGridView = appData.read('gridView');
  }
}
