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
///todo: pass value to this page from clicked tile on the tile games

class ValuePage extends StatefulWidget {
  //static const String route = '/';
  final String appBarText, appBarImage, headerTitle, headerText, uiDesign;
  //final Image img;


  const ValuePage({Key key, this.appBarText, this.appBarImage, this.headerText, this.headerTitle, this.uiDesign}) : super(key: key);


  @override
  _ValuePageState createState() => _ValuePageState();
}

class _ValuePageState extends State<ValuePage> {
  ScrollController _scrollController;
  double _scrollPosition = 0;
  double _opacity = 0;

  _scrollListener() {
    if(mounted){
      setState(() {
        _scrollPosition = _scrollController.position.pixels;
      });
    }

  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;

    if(widget.uiDesign == 'gamer'){
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
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      child: SizedBox(
                        height: screenSize.height * 0.35,
                        width: screenSize.width,
                        child: Image.network(
                          // 'assets/images/gclanshift.jpeg',
                          widget.appBarImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        /*FloatingQuickAccessBar(screenSize: screenSize),
                      Container(
                        child: Column(
                          children: [
                            FeaturedHeading(screenSize: screenSize),
                            FeaturedTiles(screenSize: screenSize)
                          ],
                        ),
                      ),*/
                      ],
                    )
                  ],
                ),
                //DestinationHeading(screenSize: screenSize),
                //DestinationCarousel(),
                SizedBox(height: screenSize.height / 10),
                BottomBar(),
              ],
            ),
          ),
        ),
      );
    }
    else if(widget.uiDesign == 'service'){
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
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      child: SizedBox(
                        height: screenSize.height * 0.35,
                        width: screenSize.width,
                        child: Image.network(
                          // 'assets/images/gclanshift.jpeg',
                          widget.appBarImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        /*FloatingQuickAccessBar(screenSize: screenSize),
                      Container(
                        child: Column(
                          children: [
                            FeaturedHeading(screenSize: screenSize),
                            FeaturedTiles(screenSize: screenSize)
                          ],
                        ),
                      ),*/
                      ],
                    )
                  ],
                ),
                //DestinationHeading(screenSize: screenSize),
                //DestinationCarousel(),
                SizedBox(height: screenSize.height / 10),
                BottomBar(),
              ],
            ),
          ),
        ),
      );
    }
    else
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
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    child: SizedBox(
                      height: screenSize.height * 0.35,
                      width: screenSize.width,
                      child: Image.network(
                       // 'assets/images/gclanshift.jpeg',
                        widget.appBarImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      /*FloatingQuickAccessBar(screenSize: screenSize),
                      Container(
                        child: Column(
                          children: [
                            FeaturedHeading(screenSize: screenSize),
                            FeaturedTiles(screenSize: screenSize)
                          ],
                        ),
                      ),*/
                    ],
                  )
                ],
              ),
              //DestinationHeading(screenSize: screenSize),
              //DestinationCarousel(),
              SizedBox(height: screenSize.height / 10),
              BottomBar(),
            ],
          ),
        ),
      ),
    );
  }
}
