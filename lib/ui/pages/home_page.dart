import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spacexopedia/bloc/navigation/bloc.dart';
import 'package:flutter_spacexopedia/ui/pages/launch/all_launch.dart';
import 'package:flutter_spacexopedia/ui/pages/roadster/roadster_page.dart';
import 'package:flutter_spacexopedia/ui/pages/rockets/rocket_page.dart';
import 'package:flutter_spacexopedia/ui/widgets/bottom_navigation_bar.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key key,
  }) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: SBottomNavigationBar(),
      body: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          if (state is SelectPageIndex) {
            pageindex = state.index;
          }
          return pageindex == 0
              ? AllLaunch()
              : pageindex == 1
                  ? RoadsterPage()
                  : pageindex == 2
                      ? RocketPage()
                      : Center(child: Text("Page $pageindex"));
        },
      ),
    );
  }
}