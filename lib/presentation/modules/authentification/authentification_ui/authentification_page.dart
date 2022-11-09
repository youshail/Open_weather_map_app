


import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../authentification_state_management/authentification_controller.dart';

class AuthentificationPage extends GetView<AuthentificationController>{



  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async {

        return false;
      },
      child: Scaffold(
          key: scaffoldKey,
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
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Veuillez saisir votre e-mail';
                              }
                              return null;
                            },
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
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Veuillez entrer votre mot de passe pour continuer';
                              }
                              return null;
                            },
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
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child:  ElevatedButton(
                    style: raisedButtonStyle,
                    child: const Text('VALIDER'),
                    onPressed: () {
                      controller.getValidateAuthentification();
                    },
                  ),
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
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );

}