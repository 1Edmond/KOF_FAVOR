import 'package:flutter/material.dart';
import 'package:test_project/data/app_data.dart';
import 'package:test_project/models/demande.dart';

class RefusPage extends StatefulWidget {
  const RefusPage({super.key});

  @override
  State<RefusPage> createState() => _RefusPageState();
}

class _RefusPageState extends State<RefusPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (var i
            in AppData.allDemandes.where((element) => element.statut == 2))
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
          subtitle: Text(demande.description),
        ),
      ),
    );
  }
}
