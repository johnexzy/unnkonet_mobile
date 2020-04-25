import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:UNNKONET/body.dart';
import 'package:UNNKONET/drawer.dart';
import 'body.ent.dart';

// import 'style.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final Color konetblue = Color.fromARGB(
    255,
    49,
    5,
    131,
  );

  final Color konetred = Color.fromRGBO(151, 0, 30, 0.651);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UNNKONET',
      theme: ThemeData(
          primarySwatch: Colors.red,
          scaffoldBackgroundColor: Colors.white
          //textTheme: TextTheme(overline: AppBarTextStyle)
          ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isLiked = false;
  Color konetblue = Color.fromARGB(
    255,
    49,
    5,
    131,
  );

  // bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    
    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

    return DefaultTabController(
      length: 4,
      initialIndex: 1,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: konetblue,
            //elevation: 200.0,
            //titleSpacing: 8.0,
            centerTitle: true,
            title: Text("UNNKONET"),
            actions: <Widget>[
              IconButton(
                  icon: Icon(isLiked ? Icons.favorite_border : Icons.favorite),
                  onPressed: () => setState(() {
                        isLiked ? isLiked = false : isLiked = true;
                      }))
            ],
          ),
          body: TabBarView(
            children: [
              // Body("NEWS"),
              Entertainment("entertainment"), 
              Body("NEWS"),
              Body("SPORTS"),
              Body("TECH"),
              //Center(child: Text("Data"))
            ],
          ),
          drawer: DrawerApp(),
          bottomNavigationBar: Container(
            height: 65.0,
            decoration: BoxDecoration(borderRadius: BorderRadius.vertical(
                      top: Radius.circular(12),
                      bottom: Radius.circular(0),
                    ),color: konetblue,),
            
            child: TabBar(
              labelPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              tabs: [
              
              // Tab(
              //   icon: Icon(FontAwesomeIcons.newspaper, size: 18,),
              //   child: Text( "NEWS", style: TextStyle(fontSize:9),),
              // ),
              Tab(
                icon: Icon(FontAwesomeIcons.tv, size: 18,),
                child: Text( "ENTERTAINMENT", style: TextStyle(fontSize:9),),

              ),
              Tab(
                icon: Icon(FontAwesomeIcons.home, size: 18,),
                child: Text( "HOME", style: TextStyle(fontSize:9),),
              ),
              Tab(
                icon: Icon(FontAwesomeIcons.solidFutbol, size: 18,),
                child: Text( "SPORTS", style: TextStyle(fontSize:9),),
              ),

              Tab(
                icon: Icon(FontAwesomeIcons.code, size: 18,),
                child: Text( "TECH", style: TextStyle(fontSize:9),),
              ),
              //Tab(text: 'BIRTHDAY'),
            ]),
          )),
    );
  }
}
