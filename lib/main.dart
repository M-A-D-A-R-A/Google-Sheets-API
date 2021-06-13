import 'package:flutter/material.dart';
import 'package:sheets/api/sheets/user_sheet_api.dart';
import 'package:sheets/page/create_sheets_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserSheetsApi.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Google Sheets APi';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: title,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: CreateSheetsPage(),
      );
}
