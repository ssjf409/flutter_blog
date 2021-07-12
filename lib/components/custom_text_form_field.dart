import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hint;

  const CustomTextFormField({@required this.hint});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        decoration: InputDecoration(
          // border는 enabled, focused, error, focusdError 4개 둔다.
          // hint 변수를 그냥 넣는거 보다는 $hint와 같은 표현이 좋다. null 방어됨
          hintText: '$hint',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
