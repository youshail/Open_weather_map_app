


import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../authentification_state_management/authentification_controller.dart';
import '../../../../helpers/app_field_validation.dart';
class AuthentificationPage extends GetView<AuthentificationController>{



  final scaffoldKeyAuthentification = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async {

        return false;
      },
      child: Scaffold(
          key: scaffoldKeyAuthentification,
          backgroundColor: Colors.white,

          appBar: AppBar(
            title: const Center(child:  Text("Login")),
          ),


          body:  Column(
            children: [
              Form(
                key: controller.FormsKey,
                child: Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 18),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                          child: TextFormField(

                            controller: controller.emailFieldController,
                            keyboardType: TextInputType.emailAddress,
                            validator: FieldValidator.compose([
                              FieldValidator.required(
                                  "Veuillez saisir votre e-mail"),
                              FieldValidator.email("L'adresse mail saisie est incorrecte "),
                            ]),

                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Email',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                          child: TextFormField(
                            controller: controller.passwordFieldController,
                            keyboardType: TextInputType.visiblePassword,
                            validator: FieldValidator.required(
                              "Veuillez entrer votre mot de passe pour continuer"),
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              ElevatedButton(
                onPressed: () {
                  controller.getValidateAuthentification();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigoAccent,
                    fixedSize: const Size(300, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: const Text('VALIDER'),
              ),
              const SizedBox(height: 18),

            ],
          )


      ),
    );

  }


  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.black87,
    primary: Colors.grey[300],
    minimumSize: const Size(88, 36),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
  );

}