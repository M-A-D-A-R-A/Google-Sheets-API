import 'package:gsheets/gsheets.dart';
import 'package:sheets/model/user.dart';

class UserSheetsApi {
  static const _credentials = r'''

  {
  "type": "service_account",
  "project_id": "sheets-316715",
  "private_key_id": "eaac91b20662e756dd99cc781095e13d97d42255",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC8ccNgUnR4IGAZ\nCnQ8C7aBJSvIZvCXTeP7GS8AVv1r2gN/mVv54q5kVBnhIL1bKoB6yTZAiC0SIYf/\nFNOmHuDrnOP84qVL5xj+ZXeDBpbmkSoi8aBpXdifaBmBbjPUUq34JaEe19dsdLCk\nDzrvMSqBLqXro0NXQnZ79UKMnqwxw8k9oUJ/UL8GROl9LEfdxqQCPSRh6PVFDMmF\nDwt95XVGKX76TAjvm88mdz+0AMgYpyAt+L3ZPOBfc8IU31U4iPxxxk0wOxFm68HL\nZdkg1+xa+eotnzuWhYlaBYYCrsxX0PitwRNDTFh9IpkhyHFABK3Z86nirAHaWIk3\nv0ETbO3DAgMBAAECggEAMlrx+uS9s7XvB/H3sm3s1GDC7Ne5Fa1eLOSDX0Nfj7jf\ns3KfFcyhjjS8/6AYiWp3j5gB88ePx6cHKL3/eoYI010GvTYxNnGoB57Ei1Iw86a5\nzEGl/FH0B1CxdBknJ2b6jvM7NTs3GQerhgN925nXQlLdSnTDk2cysxgMMvhZiihR\nu7DfW+ZCsLd66NAnehxIhIX0tCQzRnycDqGjrsv+K35RAMUCVnrFwA340kjeh+M9\n/iHqj4PMCnpizeP1uVOFHb3JRvWwcbr+gNX6Eys04QLhBTRzOuBrhj9UalD/q68Z\noECRYn7vTANah06zArJPtpSKKbedguao6VzyolTzlQKBgQDzAHXN5ENdmWRzsvU2\nRN5dE/E5Gq4CLi7lEZkSblM9maADQGcp0GxX0rEe2l8kXh1RoXXFpKqNXVx8hOss\nS5Nel2COwuFuDuBw8wfHZUB4CqW1E8gMCPFAdwtxw4OlOT3EA5e3juZiSb0FND/M\n4CR6V2TcPsObdifyHpUPE6VqDwKBgQDGhjjpJuyRoQCnmq0P4hMXedWU/GqEp2e7\nwCjG+uQo7onA+JGvfwFx5E61Ev9aDo1RImv+jPZRmc5lbuBZwrd/ahK6K2//dhP7\nHqE57FbGlrgBQ4oKHlkCd/lrPLMJK+j82PdKBAw9GXZHSFw0pHHZqyYPklNQSdws\nWzvH7QfFDQKBgQDEEz37KVFWKByO4vrLlFxcfGfrLOT1a3B5c26xGYZfMSOVHBVh\n/wQ9BQvYGlokzTAZGxAdr1XTBV9INjRQpJa//6Nw7jzaAnUFjoRbVw7jDaxR5SlI\n1LpdyvDYFeuWmQ6GqGN2QH8TFe7IUTWdycqFURlYQeix+3AWBKk/5hlV7wKBgFDv\n4f30V5ib2md6oToLgpscmd4u9sJ0ec9K7ZUKLsEdV14sOUEid5VWblxWjXLK4gSF\nEyBpmfb0zPf/t0oBH8y7kz0BfpzZKBZGi5bQ6yP1yLkDLyEm9EUUYsS8r4V6uHd1\ngYRUmCTE37r6HlV8Acqrg03v6zWdlz0iSQIeef91AoGAJmocggMU5PDggSByqbQt\nS9vryD00tb2XEWm5dgisv+cR4qlZsgyMzQfRQdW9CNlalp+Q/h90kpsPpe4fIJSB\nTNmYwa7SPBwzqIk10LKxeS/1aGvOQEujCoEGG1XchysV7hnZkdXUiDWnAQHaZrD7\nJT1xIrwVL2wNchiRpLKFznw=\n-----END PRIVATE KEY-----\n",
  "client_email": "sheets@sheets-316715.iam.gserviceaccount.com",
  "client_id": "100897505861807163601",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/sheets%40sheets-316715.iam.gserviceaccount.com"
}

  
   ''';
  static const _spreadsheetid = '1M2o3y7x3Ni_5pakIeiwbfOsxs1spO3BDB0aNUmAWan4';

  static final _gsheets = GSheets(_credentials);

  static Worksheet? _userSheet;

  static Future init() async {
    try {
      final Spreadsheet = await _gsheets.spreadsheet(_spreadsheetid);
      _userSheet = await _geWorkSheet(Spreadsheet, title: 'User');

      final firstRow = UserFeilds.getFeilds();
      _userSheet!.values.insertRow(1, firstRow);
      //print('Init Error: $UserFeilds');
    } on Exception catch (e) {
      //print('Init Error: $e');
    }
  }

  static Future<Worksheet> _geWorkSheet(
    Spreadsheet spreadsheet, {
    required String title,
  }) async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return spreadsheet.worksheetByTitle(title)!;
    }
  }

  static Future insert(List<Map<String, dynamic>> rowList) async {
    if (_userSheet == null) return;
    _userSheet!.values.map.appendRows(rowList);
  }

  static Future<int> getRowCount() async {
    if (_userSheet == null) return 0;
    final lastRow = await _userSheet!.values.lastRow();
    return lastRow== null ?0: int.tryParse(lastRow.first)?? 0;
  }
}
