import 'package:flutter/material.dart';

class FailureWidget extends StatelessWidget {
  final String? errorMessage;
  final VoidCallback? onRetry;

  const FailureWidget({
    Key? key,
    required this.errorMessage,
    this.onRetry,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error,
            color: Colors.grey,
          ),
          SizedBox(height: 16),
          Text(
            errorMessage ?? '',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          onRetry != null
              ? ElevatedButton(
                  onPressed: onRetry,
                  child: Text('Retry'),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
