import 'package:flutter/material.dart';

class ImageLoadingWidget extends StatelessWidget {
  const ImageLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 100,
      child: Center(
        child: SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
