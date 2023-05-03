import 'package:flutter/material.dart';
import 'package:test_project/data/app_data.dart';
import 'package:test_project/models/demande.dart';

class AddDemandePage extends StatefulWidget {
  const AddDemandePage({super.key});

  @override
  State<AddDemandePage> createState() => _AddDemandePageState();
}

class _AddDemandePageState extends State<AddDemandePage> {
  addDemande() {}
  var motifController = TextEditingController();
  var contenuController = TextEditingController();
  String userChoice = AppData.userData.first;
  DateTime? userCreneau = DateTime.now();
  double formFieldMargin = 15;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Faire une demande"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
              key: formKey,
              child: Column(
                children: [
                  DropdownButtonFormField(
                      decoration:
                          const InputDecoration(border: OutlineInputBorder()),
                      items: AppData.userData
                          .map((String e) => DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              ))
                          .toList(),
                      value: userChoice,
                      onChanged: (value) {
                        setState(() {
                          userChoice = value.toString();
                        });
                      }),
                  SizedBox(
                    height: formFieldMargin,
                  ),
                  TextFormField(
                    controller: motifController,
                    validator: (value) {
                      return value != "" ? null : "Vous devez saisir ce champ.";
                      //if (value!.isEmpty) return null;
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Tapez le motif"),
                  ),
                  SizedBox(
                    height: formFieldMargin,
                  ),
                  TextFormField(
                    controller: contenuController,
                    maxLines: 5,
                    validator: (value) {
                      return value != "" ? null : "Vous devez saisir ce champ.";
                      //if (value!.isEmpty) return null;
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Tapez le contenu"),
                  ),
                  SizedBox(
                    height: formFieldMargin,
                  ),
                  GestureDetector(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        decoration: BoxDecoration(border: Border.all()),
                        child: const Text(
                          "Choisir le créneau",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      onTap: () {
                        showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2022, 10, 10),
                                lastDate: DateTime(2024, 10, 10))
                            .then((value) {
                          setState(() {
                            userCreneau = value;
                          });
                        });
                      }),
                  SizedBox(
                    height: formFieldMargin,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        // showDialog(
                        //   context: context,
                        //   builder: (context) {
                        //     return Scaffold(
                        //       body: Center(
                        //         child: Container(
                        //           child: Text(
                        //               """ description: ${contenuController.text},
                        //          userName: ${userChoice},
                        //          motif: ${motifController.text},
                        //          dateDemande: ${userCreneau!}"""),
                        //         ),
                        //       ),
                        //     );
                        //   },
                        // );
                        if (formKey.currentState!.validate()) {
                          AppData.allDemandes.add(Demande(
                              id: AppData.allDemandes.length.toString(),
                              description: contenuController.text,
                              userName: userChoice,
                              motif: motifController.text,
                              dateDemande: userCreneau!,
                              statut: 0));
                        }
                        Navigator.pop(context);
                      },
                      child: const Text("VALIDER"))
                ],
              )),
        ));
  }
}
