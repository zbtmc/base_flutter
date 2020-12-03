import 'dart:io';
import 'package:path_provider/path_provider.dart';

///文件操作工具
class FileUtils {

  ///获取缓存文件大小
  static Future loadCache() async {
    Directory tempDir = await getTemporaryDirectory();
    double _cachesize = await _getTotalSizeOfFilesInDir(tempDir);
    return _cachesize;
  }

  ///轮询临时目录的文件夹，得到总的文件大小
  static Future _getTotalSizeOfFilesInDir(final FileSystemEntity file) async {
    if (file is File) {
      int length = await file.length();
      return double.parse(length.toString());
    }
    if (file is Directory) {
      final List<FileSystemEntity> children = file.listSync();
      double total = 0;
      if (children != null)
        for (final FileSystemEntity child in children)
          total += await _getTotalSizeOfFilesInDir(child);
      return total;
    }
    return 0;
  }

  ///格式化大小
  static renderSize(double value) {
    if (null == value) {
      return 0;
    }
    List<String> unitArr = List()..add('B')..add('K')..add('M')..add('G');
    int index = 0;
    while (value > 1024) {
      index++;
      value = value / 1024;
    }
    String size = value.toStringAsFixed(2);
    return size + unitArr[index];
  }

  ///清除缓存
  static Future clearCache() async {
    Directory tempDir = await getTemporaryDirectory();
    //删除缓存目录
    await _delDir(tempDir);
  }

  ///递归方式删除目录
  static Future _delDir(FileSystemEntity file) async {
    if (file is Directory) {
      final List<FileSystemEntity> children = file.listSync();
      for (final FileSystemEntity child in children) {
        await _delDir(child);
      }
    }
    await file.delete();
  }

}
