import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final double width;
  final double height;
  const LoadingWidget({
    Key? key,
    this.width = 40,
    this.height = 40,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width,
        height: height,
        child: CircularProgressIndicator(
          color: Colors.grey,
        ),
      ),
    );
  }
}
