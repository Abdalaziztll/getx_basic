import 'package:get/get.dart';
import 'package:getx_crush_couese/model/cat_model.dart';

class CatContoller extends GetxController {
  CatModel? cat = null;

  getCat() async {
    var data = await GetConnect().get("https://freetestapi.com/api/v1/cats/1");
    if (data.isOk) {
      cat = CatModel.fromMap(data.body);

      update();
    } else {
      Get.snackbar('title', 'Dolore adipisicing sit exercitation ut esse.');
    }
  }
}
