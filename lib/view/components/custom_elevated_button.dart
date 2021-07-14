import 'package:flutter/material.dart';

class CustomElvatedButton extends StatelessWidget {
  final String text;
  final funPageRoute;

  const CustomElvatedButton({@required this.text, @required this.funPageRoute});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: funPageRoute,
      child: Text('$text'),
    );
  }
}
