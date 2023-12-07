import 'dart:io';

import 'package:path_provider/path_provider.dart';

class FileService {
  static Future<String> saveFileByte(List<int> byte, {String? path}) async {
    if (path != null) {
      File(path).writeAsBytesSync(byte);
      return path;
    }
    final Directory directory = await getApplicationDocumentsDirectory();
    final String fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';
    final String filePath = '${directory.path}/$fileName';
    File(filePath).writeAsBytesSync(byte);
    return filePath;
  }

  static Future<void> deleteFile() async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final listFile = directory.listSync();
    for(var element in listFile){
      if(element.path.contains('.jpg')){
        element.deleteSync(recursive: true);
      }
    }
  }
}
