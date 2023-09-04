import 'dart:io' show Directory;

import 'package:dio/dio.dart' show Dio, DioException;
import 'package:exam_project/core/constants/endpoints.dart'
    show DownloadFileEndPoint;
import 'package:flutter/material.dart' show ChangeNotifier, debugPrint;
import 'package:path_provider/path_provider.dart'
    show getApplicationDocumentsDirectory;

class SettingsProvider extends ChangeNotifier {
  // variables
  double progresValue = 0.0;
  String downloadMessage = "";
  bool isDownloaded = false;

  Future<void> downloadFile() async {
    isDownloaded = false;
    notifyListeners();
    String fileName = DownloadFileEndPoint.map.split('/').last;
    try {
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String savePath = "${appDocDir.path}/$fileName";
      await Dio().download(
        DownloadFileEndPoint.map,
        savePath,
        onReceiveProgress: onReceiveProgress,
      );
      isDownloaded = true;
      progresValue = 0.0;
      notifyListeners();
      debugPrint(savePath);
    } on DioException catch (e) {
      debugPrint(e.message);
    }
  }

  void onReceiveProgress(int received, int total) {
    var percentage = received / total * 100;
    progresValue = percentage / 100;
    downloadMessage = "Downloading... ${percentage.floor()}%";
    notifyListeners();
  }

  @override
  void dispose() {
    isDownloaded = false;
    downloadMessage = "";
    notifyListeners();
    super.dispose();
  }
}
