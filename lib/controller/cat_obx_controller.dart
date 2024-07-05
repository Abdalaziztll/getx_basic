import 'package:get/get.dart';
import 'package:getx_crush_couese/main.dart';
import 'package:getx_crush_couese/model/cat_model.dart';
import 'package:getx_crush_couese/model/handling_model.dart';

class CatObxController extends GetxController {
  Rx<ResutlModel> cat = ResutlModel().obs;

  getNewCat() async {
    var data = await GetConnect().get("https://freetestapi.com/api/v1/cats/1");
    if (data.isOk) {
      cat.value = CatModel.fromMap(data.body);
    } else {
      Get.to(() => MyHomePage(title: 'title'));
    }
  }
}
