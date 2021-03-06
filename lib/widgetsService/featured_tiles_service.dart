import 'package:explore/screens/value_page.dart';
import 'package:explore/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: must_be_immutable
class FeaturedTiles extends StatelessWidget {
  FeaturedTiles({
    Key key,
    this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  final List<String> assets = [
    'assets/images/gamshooter.jpg',
    'assets/images/gamracer.jpg',
    'assets/images/gambattleroyale.jpg',
    'assets/images/gamaction.jpg',
    'assets/images/gamadventure.jpg',
  ];

  final List<String> title = [
    'Shooter Games',
    'Racing Games',
    'Battle Royale',
    'Action Games',
    'Adventure'
  ];

  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isSmallScreen(context)
        ? Padding(
      padding: EdgeInsets.only(top: screenSize.height / 50),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            StreamBuilder<QuerySnapshot>(
                stream: db.collection('services').snapshots(),
                builder:
                    (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    return Row(
                      children: snapshot.data.docs.map((doc) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                height: screenSize.width / 2.5,
                                width: screenSize.width / 1.5,
                                child: ClipRRect(
                                  borderRadius:
                                  BorderRadius.circular(5.0),
                                  child: GestureDetector(
                                    child: Image.network(
                                      doc.data()['img'],
                                      fit: BoxFit.cover,
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ValuePage(
                                              appBarImage: doc.data()['img'],
                                              appBarText: doc.data()['title'],
                                              uiDesign: 'service',
                                            )),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: screenSize.height / 70,
                              ),
                              child: Text(
                                doc.data()['title'],
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context)
                                      .primaryTextTheme
                                      .subtitle1
                                      .color,
                                ),
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                    );
                  } else
                    return SizedBox(
                      height: 50,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                }),
          ],
          /*children: [
                  SizedBox(width: screenSize.width / 15),
                  ...Iterable<int>.generate(assets.length).map(
                    (int pageIndex) => Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: screenSize.width / 2.5,
                              width: screenSize.width / 1.5,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5.0),
                                child: Image.asset(
                                  assets[pageIndex],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: screenSize.height / 70,
                              ),
                              child: Text(
                                title[pageIndex],
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context)
                                      .primaryTextTheme
                                      .subtitle1
                                      .color,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: screenSize.width / 15),
                      ],
                    ),
                  ),
                ],*/
        ),
      ),
    )
        : Padding(
      padding: EdgeInsets.only(
        top: screenSize.height * 0.06,
        left: screenSize.width / 15,
        right: screenSize.width / 15,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          /*children: [
                ...Iterable<int>.generate(assets.length).map((int pageIndex) => Column(
                    children: [
                      SizedBox(
                        height: screenSize.width / 6,
                        width: screenSize.width / 3.8,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: Image.asset(
                            assets[pageIndex],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: screenSize.height / 70,
                        ),
                        child: Text(
                          title[pageIndex],
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context)
                                .primaryTextTheme
                                .subtitle1!
                                .color,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],*/
          children: [
            StreamBuilder<QuerySnapshot>(
                stream: db.collection('services').snapshots(),
                builder:
                    (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    return Row(
                      children: snapshot.data.docs.map((doc) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                height: screenSize.width / 4.0,
                                width: screenSize.width / 3.5,
                                child: ClipRRect(
                                  borderRadius:
                                  BorderRadius.circular(5.0),
                                  child: Image.network(
                                    doc.data()['img'],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: screenSize.height / 70,
                              ),
                              child: Text(
                                doc.data()['title'],
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context)
                                      .primaryTextTheme
                                      .subtitle1
                                      .color,
                                ),
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                    );
                  } else
                    return SizedBox(
                      height: 50,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                }),
          ],
        ),
      ),
    );
  }
}
