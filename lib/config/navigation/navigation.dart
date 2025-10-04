import 'package:flutter/material.dart';

abstract class Navigation {
  void navigation ({required context,required Widget screen});
}

class PushNavigation extends Navigation{
  @override
  void navigation({required context, required Widget screen}) {
    Navigator.push(context,MaterialPageRoute(builder: (context)=>screen));
  }

}

class PushNavigationAndRemove extends Navigation{
  @override
  void navigation({required context, required Widget screen}) {
    Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=>screen),(route)=>false);
  }

}