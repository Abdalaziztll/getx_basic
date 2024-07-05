import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_crush_couese/controller/cat_contoller.dart';
import 'package:getx_crush_couese/controller/cat_obx_controller.dart';
import 'package:getx_crush_couese/model/cat_model.dart';
import 'package:getx_crush_couese/model/handling_model.dart';

class CatPage extends StatelessWidget {
  CatPage({super.key});

  final con = Get.put(CatContoller());

  @override
  Widget build(BuildContext context) {
    con.getCat();
    return Scaffold(
      body: Center(
        child: GetBuilder<CatContoller>(
          builder: (controller) {
            return InkWell(
                onTap: () {
                  controller.getCat();
                },
                child: Text(controller.cat.toString()));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {}),
    );
  }
}

class CatPageWithObs extends StatelessWidget {
  CatPageWithObs({super.key,});

  final con = Get.put(CatObxController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () {
            if (con.cat.value is CatModel) {
              return Text((con.cat.value as CatModel).name);
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        con.getNewCat();
      }),
    );
  }
}
