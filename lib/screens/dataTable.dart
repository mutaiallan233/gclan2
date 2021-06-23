import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:explore/widgetsService/staggered_grid.dart';
import 'package:flutter/material.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:explore/widgets/web_scrollbar.dart';
import 'package:explore/widgets/bottom_bar.dart';
import 'package:explore/widgets/carousel.dart';
import 'package:explore/widgets/destination_heading.dart';
import 'package:explore/widgets/explore_drawer.dart';
import 'package:explore/widgets/featured_heading.dart';
import 'package:explore/widgets/featured_tiles.dart';
import 'package:explore/widgets/floating_quick_access_bar.dart';
import 'package:explore/widgets/responsive.dart';
import 'package:explore/widgets/top_bar_contents.dart';
import 'package:flutter/material.dart';

class InfoTable extends StatefulWidget {
  //static const String route = '/';
  final String appBarText, appBarImage, headerTitle, headerText, uiDesign;
  //final Image img;

  const InfoTable(
      {Key key,
        this.appBarText,
        this.appBarImage,
        this.headerText,
        this.headerTitle,
        this.uiDesign})
      : super(key: key);


  @override
  _InfoTableState createState() => _InfoTableState();
}

class _InfoTableState extends State<InfoTable> {
  ScrollController _scrollController;
  double _scrollPosition = 0;
  double _opacity = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

 
  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }
 FirebaseFirestore firebase = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;
        

    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        extendBodyBehindAppBar: true,
        appBar: ResponsiveWidget.isSmallScreen(context)
            ? AppBar(
                backgroundColor:
                    Theme.of(context).bottomAppBarColor.withOpacity(_opacity),
                elevation: 0,
                centerTitle: true,
                actions: [
                  IconButton(
                    icon: Icon(Icons.brightness_6),
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () {
                      EasyDynamicTheme.of(context).changeTheme();
                    },
                  ),
                ],
                title: Text(
                  widget.appBarText,
                  style: TextStyle(
                    color: Colors.blueGrey[100],
                    fontSize: 20,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                    letterSpacing: 3,
                  ),
                ),
              )
            : PreferredSize(
                preferredSize: Size(screenSize.width, 1000),
                child: TopBarContents(_opacity),
              ),
        drawer: ExploreDrawer(),
        body: WebScrollbar(
          color: Colors.blueGrey,
          backgroundColor: Colors.blueGrey.withOpacity(0.3),
          width: 10,
          heightFraction: 0.3,
          controller: _scrollController,
          child: SingleChildScrollView(
            controller: _scrollController,
            physics: ClampingScrollPhysics(),
            child: Center(
        child: Container(
          height: MediaQuery
              .of(context)
              .size
              .height - 60.0,
          child: StreamBuilder<DocumentSnapshot>(
              stream: firestore
                  .collection('services')
                  .doc(widget.appBarText)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasData) {
                  DocumentSnapshot doc = snapshot.data;
                  return ListView(
                    scrollDirection: Axis.horizontal,
                    children: doc
                        .data()['categories']
                        .keys
                        .map<Widget>((d) {
                      return Column(
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(top: screenSize.height*0.35),
                            child: Container(

                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width - 40.0,

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                //color: Color(0xff5a348b),
                                gradient: LinearGradient(
                                    colors: [Colors.white38, Colors.black12],
                                    begin: Alignment.centerRight,
                                    end: Alignment(-1.0, -1.0)
                                ), //Gradient
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(d.toString())


                                ],),
                            ),
                          ),
                         /* Padding(
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
                          ),*/
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
        ),
      ),
          ),
        ),
      );
  }
}

