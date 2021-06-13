import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:sheets/model/user.dart';
import 'package:sheets/widget/button_widget.dart';

class UserFormWidget extends StatefulWidget {
  final ValueChanged<User> onSavedUser;

  const UserFormWidget({Key? key,required this.onSavedUser}) : super(key: key);

  @override
  _UserFormWidgetState createState() => _UserFormWidgetState();
}

class _UserFormWidgetState extends State<UserFormWidget> {
  late TextEditingController controllerName;
  late TextEditingController controllerEmail;
  late bool isBeginner;
  final formKey = GlobalKey<FormState>();
  
  @override
  void initState() {
    super.initState();
    initUser();
  }

  void initUser() {
    controllerEmail = TextEditingController();
    controllerName = TextEditingController();
    this.isBeginner = true;
  }

  Widget buildName() => TextFormField(
        controller: controllerName,
        decoration: InputDecoration(
          labelText: 'Name',
          border: OutlineInputBorder(),
        ),
        validator: (value) =>
            value != null && value.isEmpty ? 'Enter Name' : null,
      );

  Widget buildEmail() => TextFormField(
        controller: controllerEmail,
        decoration: InputDecoration(
          labelText: 'Email',
          border: OutlineInputBorder(),
        ),
        validator: (value) =>
            value != null && value.isEmpty ? 'Enter Email' : null,
      );

  Widget buildFlutterBeginner() => SwitchListTile(
      contentPadding: EdgeInsets.zero,
      controlAffinity: ListTileControlAffinity.leading,
      value: isBeginner,
      title: Text('Is Flutter Beginner?'),
      onChanged: (value) => setState(() =>
        isBeginner =value
      ),);

  Widget buildSubmit() => ButtonWidget(
      text: 'Save',
      onClicked: () {
        final form = formKey.currentState!;
        final isValid = form.validate();

        if (isValid) {
          final user = User(
              name: controllerName.text,
              email: controllerEmail.text,
              isBeginner: isBeginner);
          widget.onSavedUser(user);
        }
      });
  @override
  Widget build(BuildContext context) => Form(
        key: formKey,
        child: Column(
          children: [
            buildName(),
            const SizedBox(height: 16),
            buildEmail(),
            const SizedBox(height: 16),
            buildFlutterBeginner(),
            const SizedBox(height: 16),
            buildSubmit()
          ],
        ),
      );
}
