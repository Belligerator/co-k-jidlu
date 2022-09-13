import 'package:cojekjidlu/locator.dart';
import 'package:cojekjidlu/services/nav_service.dart';
import 'package:cojekjidlu/theme.dart';
import 'package:flutter/material.dart';

class ModalService {
  final _navService = locator.get<NavService>();

  Future<void> showAlert(BuildContext context, String message,
      {String title = 'Upozornění',
      String buttonText = 'OK',
      Function()? callback}) {
    Widget continueButton = TextButton(
      child: Text(buttonText),
      onPressed: () {
        _navService.navigator.pop();
        if (callback != null) {
          callback();
        }
      },
    );
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        continueButton,
      ],
    );

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Future<bool> showConfirm(
    BuildContext context,
    String title,
    String message, {
    String okButtonText = 'OK',
    String cancelButtonText = 'Zrušit',
    bool danger = false,
    Function()? okCallback,
  }) {
    var dangerTitleTextStyle = Theme.of(context)
        .textTheme
        .headline6!
        .copyWith(color: dangerColor, fontWeight: FontWeight.bold);

    Widget cancelButton = TextButton(
      child: const Text("Zpět"),
      onPressed: () {
        _navService.navigator.pop(false);
      },
    );
    Widget continueButton = TextButton(
      child: Text(okButtonText),
      onPressed: () {
        _navService.navigator.pop(true);
        if (okCallback != null) {
          okCallback();
        }
      },
    );
    AlertDialog alert = AlertDialog(
      title: Text(title, style: danger ? dangerTitleTextStyle : null),
      content: Text(message),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    ).then((val) => val == true);
  }

  void showToast(BuildContext context, String message,
      [Duration duration = const Duration(milliseconds: 4000)]) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: duration,
    ));
  }
}
