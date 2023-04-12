


import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class AuthentificationController extends GetxController{


  /// text editing controllers

  late TextEditingController emailFieldController;
  late TextEditingController passwordFieldController;

  /// Form Key

  late GlobalKey<FormState>  FormsKey;


  getValidateAuthentification(){

    if(FormsKey.currentState!.validate()){
       /// J'ai utilisé pour vider la mémoire
      /// Envoyez argument [email] de qui aurons-nous besoin dans next page
       Get.offNamed(Routes.WEATHER_PAGE,preventDuplicates: true, arguments:{"email": emailFieldController.text} );

    }

  }





  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() {
    emailFieldController.dispose();
    passwordFieldController.dispose();


  }

  @override
  void onInit() {
    FormsKey = GlobalKey<FormState>();
    emailFieldController = TextEditingController(text: "");
    passwordFieldController = TextEditingController(text: "");

  }

}