import 'package:flutter/material.dart';
import 'package:flutter_core/src/utils/skprogress.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Core'),
        ),
        body: ListView(
          children: [
            NewFeatureWidget(
              context: context,
              featureName: 'Progress',
              onPressed: () {
                SkProgress(context).startLoading();
                Future.delayed(const Duration(seconds: 7), () {
                  SkProgress(context).stopLoading();
                });
              },
            ),
            NewFeatureWidget(
              context: context,
              featureName: 'Progress',
              onPressed: () {
                SkProgress(context).startLoading();
                Future.delayed(const Duration(seconds: 7), () {
                  SkProgress(context).stopLoading();
                });
              },
            ),
          ],
        ));
  }
}

class NewFeatureWidget extends StatelessWidget {
  const NewFeatureWidget(
      {Key? key,
      required this.context,
      required this.featureName,
      this.onPressed})
      : super(key: key);

  final BuildContext context;
  final String? featureName;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: const Icon(Icons.navigate_next),
      title: Text(featureName ?? 'N/A'),
      onTap: () {
        SkProgress(context).startLoading();
        Future.delayed(const Duration(seconds: 7), () {
          SkProgress(context).stopLoading();
        });
      },
    );
  }
}
