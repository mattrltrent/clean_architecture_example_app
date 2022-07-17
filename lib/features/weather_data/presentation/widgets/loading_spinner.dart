import 'package:flutter/cupertino.dart';

class LoadingSpinner extends StatelessWidget {
  const LoadingSpinner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoActivityIndicator();
  }
}
