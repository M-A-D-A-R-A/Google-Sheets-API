import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sheets/api/sheets/user_sheet_api.dart';
import 'package:sheets/main.dart';
import 'package:sheets/model/user.dart';
import 'package:sheets/widget/button_widget.dart';
import 'package:sheets/widget/user_form_widget.dart';

class CreateSheetsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text(MyApp.title),
        centerTitle: true,
      ),
      body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(32),
          child: UserFormWidget(onSavedUser: (user) async {
            final id = await UserSheetsApi.getRowCount() + 1;
            final newUser = user.copy(id: id);
            await UserSheetsApi.insert([newUser.toJson()]);
          })));

  // Future insertUsers() async {

  //   final

  //   await UserSheetsApi.insert(jsonUsers);
  // }
}
