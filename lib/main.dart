import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UI SAMPLES',
      home: HomePage(title: 'UI Samples'),
    );
  }
}

class HomePage extends StatelessWidget {

  static final screensList = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  static final widgetList = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
  static final groupList = [0, 1, 2, 3, 4, 5, 6, 7, 8];
  static final otherList = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 19, 11];

  static final headers = ["Screen", "Widget", "Group", "Other"];

  final String title;

  final headerColorMap = {
    "Screen": 0xFFDEF657,
    "Widget": 0xFFF68857,
    "Group": 0xFF57F669,
    "Other": 0xFF37F0E9
  };

  final headerContentMap = {
    "Screen": screensList,
    "Widget": widgetList,
    "Group": groupList,
    "Other": otherList
  };

  var userScreenProgress = {
    "Screen": 2,
    "Widget": 5,
    "Group": 5,
    "Other": 12
  };

  HomePage({Key key, this.title}) : super(key: key);

  Widget pickCategoryPrompt() {
    return Padding(
      padding: EdgeInsets.only(top: 30.0),
      child: SizedBox(
        width: double.infinity,
        child: Container(
            padding: EdgeInsets.only(left: 20.0, top: 15.0, right: 20.0, bottom: 15.0),
            decoration: BoxDecoration(
                color: Color(0xFF08234E),
                borderRadius: BorderRadius.all(
                    Radius.circular(10.0)
                )
            ),
            child: Center(
              child: Text(
                "Pick a UI category to get started!",
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.normal,
                    color: Color(0xFFCCD9FF)
                ),
              ),
            )
        ),
      ),
    );
  }

  Widget tathastuSignature() {
    return Padding(
      padding: EdgeInsets.only(
          top: 20.0
      ),
      child: Center(
        child: Text(
          "Tathastu by Robin Kamboj",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.normal,
              color: Color(0xFF6C758D)
          ),
        ),
      ),
    );
  }

  Widget progressBlueprintWidget() {
    return SizedBox(
      width: double.infinity,
      height: 10.0,
      child: Container(
        margin: EdgeInsets.only(
            left: 10.0, right: 10.0
        ),
        decoration: BoxDecoration(
            color: Color(0xFF205491),
            borderRadius: BorderRadius.all(
                Radius.circular(5.0)
            )
        ),
      ),
    );
  }

  Widget actualProgressWidget(position) {
    return FractionallySizedBox(
      widthFactor: userScreenProgress[headers[position]]/headerContentMap[headers[position]].length,
      heightFactor: 1.0,
      child: Container(
        margin: EdgeInsets.only(
            left: 10.0, right: 10.0
        ),
        decoration: BoxDecoration(
            color: Color(headerColorMap[headers[position]]),
            borderRadius: BorderRadius.all(
                Radius.circular(5.0)
            )
        ),
      ),
    );
  }

  BoxDecoration rowBackground() {
    return BoxDecoration(
        color: Color(0xFF051A36),
        borderRadius: BorderRadius.all(
            Radius.circular(6.0)
        )
    );
  }

  BoxDecoration rowUpperHalfBackground() {
    return BoxDecoration(
        color: Color(0xFF0D294C),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(6.0),
            topRight: Radius.circular(6.0)
        )
    );
  }

  BoxDecoration rowLowerHalfBackground() {
    return BoxDecoration(
        color: Color(0xFF051A36),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(6.0),
            bottomRight: Radius.circular(6.0)
        )
    );
  }

  Widget centerTextInRow(centerText) {
    return Center(
      child: Text(
        centerText.toUpperCase(),
        textAlign: TextAlign.center,
        style: TextStyle(
            letterSpacing: 1.0,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFFFFFFFF)
        ),
      ),
    );
  }

  Widget layOutCategoryGrid() {
    return Expanded(
      child: Padding(
          padding: EdgeInsets.only(top: 26.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2
            ),
            itemCount: headers.length,
            itemBuilder: (context, position) {
              return GridRow(position);
            },
          )
      ),
    );
  }

  Widget homeHeading() {
    return Text(
      "UI SAMPLES",
      style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
          color: Color(0xFFDDDEE0)
      ),
    );
  }

  Widget homeSubHeading() {
    return Padding(
      padding: EdgeInsets.only(top: 3.0),
      child: Text(
        "FOR FLUTTER",
        style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.normal,
            color: Color(0xFF858C9F)
        ),
      ),
    );
  }

  Widget columnComponents() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        homeHeading(),
        homeSubHeading(),
        pickCategoryPrompt(),
        layOutCategoryGrid(),
        tathastuSignature()
      ],
    );
  }

  BoxDecoration homeBackground() {
    return BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF00194A), Color(0xFF000318)]
      ),
    );
  }

  EdgeInsets containerPadding() {
    return const EdgeInsets.only(
        left: 20.0, right: 20.0, top: 60.0, bottom: 40.0
    );
  }

  void _setStatusBarColor() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Color(0xFF00194A)
    ));
  }

  @override
  Widget build(BuildContext context) {

    _setStatusBarColor();

    return Material(
      type: MaterialType.transparency,
      child: Container(
          padding: containerPadding(),
          decoration: homeBackground(),
          child: columnComponents()
      ),
    );
  }
}

class GridRow extends StatefulWidget {

  int position;

  GridRow(this.position);

  @override
  State<StatefulWidget> createState() => _GridRowState(position);
}

class _GridRowState extends State<GridRow> {

  int position;

  _GridRowState(this.position);

  static final screensList = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  static final widgetList = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
  static final groupList = [0, 1, 2, 3, 4, 5, 6, 7, 8];
  static final otherList = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 19, 11];

  static final headers = ["Screen", "Widget", "Group", "Other"];

  final headerColorMap = {
    "Screen": 0xFFDEF657,
    "Widget": 0xFFF68857,
    "Group": 0xFF57F669,
    "Other": 0xFF37F0E9
  };

  final headerContentMap = {
    "Screen": screensList,
    "Widget": widgetList,
    "Group": groupList,
    "Other": otherList
  };

  var userScreenProgress = {
    "Screen": 0,
    "Widget": 0,
    "Group": 0,
    "Other": 0
  };

//  _incrementCategoryProgress(String category) {
//    SharedPreferences.getInstance().then((preferences) {
//      int progress = (preferences.getInt("${category}_progress") ?? 0) + 1;
//      preferences.setInt("${category}_progress", progress).then((value) {
//        setState(() {
//          if(userScreenProgress[category] < headerContentMap[category].length)
//            userScreenProgress[category] += 1;
//        });
//      });
//    });
//  }

  _openCategoryListScreen(String category) {
    Navigator.push(
        context,
        SlideRightRoute(page: CategoryListScreen(category))
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _openCategoryListScreen(headers[position]),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: SizedBox(
            width: double.infinity,
            child: Container(
              decoration: rowBackground(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    flex: 7,
                    child: Container(
                      decoration: rowUpperHalfBackground(),
                      child: centerTextInRow(headers[position]),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      decoration: rowLowerHalfBackground(),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 10.0, bottom: 6.0),
                            child: Text(
                              "${userScreenProgress[headers[position]]} of ${headerContentMap[headers[position]].length}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  letterSpacing: 1.0,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w900,
                                  color: Color(headerColorMap[headers[position]])
                              ),
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 10.0,
                            child: Stack(
                              children: <Widget>[
                                progressBlueprintWidget(),
                                actualProgressWidget(position)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
        ),
      ),
    );
  }

  BoxDecoration rowBackground() {
    return BoxDecoration(
        color: Color(0xFF051A36),
        borderRadius: BorderRadius.all(
            Radius.circular(6.0)
        )
    );
  }

  BoxDecoration rowUpperHalfBackground() {
    return BoxDecoration(
        color: Color(0xFF0D294C),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(6.0),
            topRight: Radius.circular(6.0)
        )
    );
  }

  BoxDecoration rowLowerHalfBackground() {
    return BoxDecoration(
        color: Color(0xFF051A36),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(6.0),
            bottomRight: Radius.circular(6.0)
        )
    );
  }

  Widget progressBlueprintWidget() {
    return SizedBox(
      width: double.infinity,
      height: 10.0,
      child: Container(
        margin: EdgeInsets.only(
            left: 10.0, right: 10.0
        ),
        decoration: BoxDecoration(
            color: Color(0xFF205491),
            borderRadius: BorderRadius.all(
                Radius.circular(5.0)
            )
        ),
      ),
    );
  }

  Widget centerTextInRow(centerText) {
    return Center(
      child: Text(
        centerText.toUpperCase(),
        textAlign: TextAlign.center,
        style: TextStyle(
            letterSpacing: 1.0,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFFFFFFFF)
        ),
      ),
    );
  }

  Widget actualProgressWidget(position) {
    return FractionallySizedBox(
      widthFactor: userScreenProgress[headers[position]]/headerContentMap[headers[position]].length,
      heightFactor: 1.0,
      child: Container(
        margin: EdgeInsets.only(
            left: 10.0, right: 10.0
        ),
        decoration: BoxDecoration(
            color: Color(headerColorMap[headers[position]]),
            borderRadius: BorderRadius.all(
                Radius.circular(5.0)
            )
        ),
      ),
    );
  }
}

class SlideRightRoute extends PageRouteBuilder {
  final Widget page;
  SlideRightRoute({this.page})
      : super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    page,
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 2),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        ),
  );
}

class CategoryListScreen extends StatelessWidget {

  final String categoryTitle;

  CategoryListScreen(this.categoryTitle);

  void _setStatusBarColor() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Color(0xFF00194A)
    ));
  }

  @override
  Widget build(BuildContext context) {

    _setStatusBarColor();

    return Material(
      type: MaterialType.transparency,
      child: Container(
        padding: containerPadding(),
        decoration: homeBackground(),
      ),
    );
  }

  BoxDecoration homeBackground() {
    return BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF00194A), Color(0xFF000318)]
      ),
    );
  }

  EdgeInsets containerPadding() {
    return const EdgeInsets.only(
        left: 20.0, right: 20.0, top: 60.0, bottom: 40.0
    );
  }
}