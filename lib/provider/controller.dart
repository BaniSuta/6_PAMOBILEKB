import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PredictionProvider with ChangeNotifier {
  List<String> predictionMessages = []; // Initialized as empty list
  bool isLoading = false;
  String? errorMessage;

  // Fungsi untuk mengirim data ke API dan mendapatkan respons
  Future<void> predict() async {
    final url = Uri.parse('https://supercar.loca.lt/api/predict');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        // Pastikan 'prediction' ada di response
        if (data.containsKey('prediction')) {
          List<String> classPredictions = List<String>.from(data['prediction']);

          predictionMessages = [];

          // Tambahkan prediksi dengan batasan
          int limit = min(15, classPredictions.length);
          for (int i = 0; i < limit; i++) {
            predictionMessages.add(classPredictions[i]);
          }
        } else {
          errorMessage = 'Invalid response format';
        }
      } else {
        errorMessage = 'Failed to get prediction: ${response.statusCode}';
      }
    } catch (e) {
      errorMessage = 'Error: $e';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
