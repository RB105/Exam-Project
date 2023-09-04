import 'dart:io' show Directory;

import 'package:dio/dio.dart';
import 'package:exam_project/core/constants/endpoints.dart';
import 'package:flutter/material.dart' show debugPrint;
import 'package:path_provider/path_provider.dart'
    show getApplicationDocumentsDirectory;

class FileDownloader {
  static Future<void> downloadFile() async {
    String fileName = DownloadFileEndPoint.map.split('/').last;
    try {
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String savePath = "${appDocDir.path}/$fileName";
      await Dio().download(DownloadFileEndPoint.map, savePath,onReceiveProgress: (count, total) {
        
      },);
      debugPrint(savePath);
    } on DioException catch (e) {
      debugPrint(e.message);
    }
  }
}
