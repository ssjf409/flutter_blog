import 'package:flutter/material.dart';
import 'package:flutter_blog/components/custom_elevated_button.dart';
import 'package:flutter_blog/components/custom_text_form_field.dart';
import 'package:flutter_blog/pages/user/login_page.dart';
import 'package:get/get.dart';

class JoinPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              height: 200,
              child: Text(
                '회원가입 페이지',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _joinForm(),
          ],
        ),
      ),
    );
  }

  Widget _joinForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            hint: 'username',
            funValidator: (value) {
              print(value);
            },
          ),
          CustomTextFormField(
            hint: 'password',
            funValidator: (value) {},
          ),
          CustomTextFormField(
            hint: 'email',
            funValidator: (value) {},
          ),
          CustomElvatedButton(
            text: '회원가입',
            funPageRoute: () {
              _formKey.currentState.validate();
              Get.to(LoginPage());
            },
          ),
        ],
      ),
    );
  }
}
