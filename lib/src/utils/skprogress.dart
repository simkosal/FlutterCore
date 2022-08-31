import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Show Progress Dialog
///
/// Start Loading
/// Stop Loading
/// Throw Error [Object]
class SkProgress {
  late BuildContext context;

  SkProgress(this.context);

  Future<void> startLoading({Widget? widget}) async {
    return await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return SimpleDialog(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          children: <Widget>[loadingWidget(widget)],
        );
      },
    );
  }

  Widget loadingWidget(Widget? widget) {
    // Customize progress widgets
    if (widget != null) return widget;
    // Default base on OS
    if (Platform.isAndroid) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return const CupertinoActivityIndicator();
  }

  Future<void> stopLoading() async {
    Navigator.of(context).pop();
  }

  Future<void> showError(Object? error, {String? action}) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        action: SnackBarAction(
          label: action ?? 'Dismiss',
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
        backgroundColor: Colors.red,
        content: Text(error.toString()),
      ),
    );
  }
}
