import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:csv/csv.dart';

Future<void> exportDataToCSV(List<List<dynamic>> data, String filename) async {
  String csvData = const ListToCsvConverter().convert(data);

  final directory = await getExternalStorageDirectory();
  final pathOfTheFileToWrite = directory!.path + "/$filename.csv";
  File file = File(pathOfTheFileToWrite);

  await file.writeAsString(csvData);
  print("File saved at: $pathOfTheFileToWrite");
}
