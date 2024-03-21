import 'package:flutter/material.dart';

class NavigationService {
  late GlobalKey<NavigatorState> navigationKey;

  static NavigationService instance = NavigationService();

  NavigationService() {
    navigationKey = GlobalKey<NavigatorState>();
  }

  navigate(Widget widget) async {
    return await navigationKey.currentState!
        .push(MaterialPageRoute(builder: (context) => widget));
  }

  Future navigateWithTopToBottomAnimation(Widget widget) async {
    return await navigationKey.currentState!.push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => widget,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, -1.0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      ),
    );
  }

  navigateReplace(Widget widget) {
    return navigationKey.currentState!
        .pushReplacement(MaterialPageRoute(builder: (context) => widget));
  }

  void goBack() {
    if (navigationKey.currentState?.canPop() ?? false) {
      navigationKey.currentState?.pop();
    }
  }
}
