import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
      content: Text('Hello world'),
      action: SnackBarAction(label: 'Close', onPressed: () {}),
      duration: Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog.adaptive(
          title: Text('Hello'),
          content: Text('World'),
          actions: [
            TextButton(onPressed: context.pop, child: Text('OK')),
            TextButton(
              onPressed: context.pop,
              child: Text('NOT OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: ValueKey(10),
      appBar: AppBar(
        title: Text('Snackbars and dialogs'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  children: [
                    Text('Chupa chupa chupa'),
                    Image.network('https://betawiki.net/images/archive/1/10/20250624054352!MacOS_Tahoe_Logo.png'),
                  ],
                );
              },
              child: Text('Used Licences'),
            ),
            FilledButton.tonal(
              onPressed: () => openDialog(context),
              child: Text('Open alert'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCustomSnackbar(context),
        label: Text('Show Snackbar'),
        icon: Icon(Icons.remove_red_eye_outlined),
      ),
    );
  }
}
