import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


FirebaseFirestore firestore = FirebaseFirestore.instance;

class serviceSearchGrid extends StatelessWidget {
  const serviceSearchGrid({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: StreamBuilder<DocumentSnapshot>(
          stream: firestore
              .collection('services')
              .doc('Purchase PC')
              .snapshots(),
          builder: (BuildContext context,
              AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasData) {
              DocumentSnapshot doc = snapshot.data;
        return GridView.count(
                mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
              crossAxisCount: 3,
              children: doc
              .data()['categories']
              .keys
              .map<Widget>((d) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.network(doc
                      .data()['categories'][d], fit: BoxFit.cover),
                );
        }).toList(),
        );
            } else {
              return SizedBox();
            }
          }),
    );
   
  }
}
