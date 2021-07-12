import 'package:flutter/material.dart';

class CustomElvatedButton extends StatelessWidget {
  final String text;
  final pageRoute;

  const CustomElvatedButton({@required this.text, @required this.pageRoute});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: pageRoute,
      child: Text('$text'),
    );
  }
}
