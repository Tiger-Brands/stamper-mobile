// ignore_for_file: strict_raw_type

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class MyObserver extends AutoRouterObserver {
  @override
  Future<void> didPush(Route route, Route? previousRoute) async {
    //await FirebaseAnalytics.instance.
  }
  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {}
  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {}
}
