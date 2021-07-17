import 'package:flutter/material.dart';
import 'package:flutter_blog/controller/post_controller.dart';
import 'package:flutter_blog/util/validator_util.dart';
import 'package:flutter_blog/view/components/custom_elevated_button.dart';
import 'package:flutter_blog/view/components/custom_text_form_field.dart';
import 'package:flutter_blog/view/components/custom_textarea.dart';
import 'package:flutter_blog/view/pages/post/home_page.dart';
import 'package:get/get.dart';

class WritePage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _title = TextEditingController();
  final _content = TextEditingController();

  @override
  Widget build(BuildContext context) {
    PostController p = Get.find();
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              CustomTextFormField(
                controller: _title,
                hint: 'Title',
                funValidator: validateTitle(),
              ),
              CustomTextArea(
                controller: _content,
                hint: 'Content',
                funValidator: validateContent(),
              ),
              CustomElvatedButton(
                text: '글쓰기',
                funPageRoute: () async {
                  if (_formKey.currentState.validate()) {
                    await p.save(_title.text, _content.text);
                    await Get.off(() => HomePage());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
