import 'package:bfastui/adapters/router.adapter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

FutureBuilder pageGuardWrapper(
  RouterAdapter router,
  BuildContext context,
  var args,
) {
  List<Future<bool>> allGuards =
      router.guards != null && router.guards.length != 0
          ? router.guards.map((e) => e.canActivate(router.routerName)).toList()
          : [Future<bool>.value(true)];
  return FutureBuilder(
    future: Future.wait<bool>(allGuards),
    builder: (_, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        bool data = snapshot.data?.reduce((value, element) => value && element);
        if (snapshot.hasData == true && data == true) {
          return router.page(context, args).build(args);
        } else {
          try {
            Modular.to.maybePop();
          } catch (e) {}
          return Container(color: Colors.white);
        }
      } else {
        return router.onGuardCheck != null
            ? router.onGuardCheck
            : Container(
                color: Colors.white,
                child: CircularProgressIndicator(),
                alignment: Alignment.center,
              );
      }
    },
  );
}
