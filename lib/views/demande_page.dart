import 'package:flutter/material.dart';
import 'package:test_project/data/app_data.dart';
import 'package:test_project/models/demande.dart';

class DemandePage extends StatefulWidget {
  const DemandePage({super.key});

  @override
  State<DemandePage> createState() => _DemandePageState();
}

class _DemandePageState extends State<DemandePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (var i
            in AppData.allDemandes.where((element) => element.statut == 0))
          DemandeItem(demande: i)
      ],
    );
  }

  DemandeItem({required Demande demande}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: ListTile(
          leading: CircleAvatar(
            radius: 40,
            child: Container(
                width: 55,
                child: Text(
                  "KOF\nFAVOR",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13),
                )),
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(demande.userName),
          ),
          subtitle: Column(
            children: [
              Row(
                children: [
                  Text(demande.description),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        demande.statut = 1;
                      });
                    },
                    child: Text("Accepter"),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green)),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        demande.statut = 2;
                      });
                    },
                    child: Text("Refuser"),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
