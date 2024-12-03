import 'dart:convert';
import 'package:home/models/reports.dart';
import 'package:http/http.dart' as http;
class DatabaseService {
  // Phương thức giả định trả về dữ liệu mẫu
  Future<List<Reports>> getReports() async {
    // Dữ liệu mẫu
    return [
      Reports(year: 2021, quantity: 15),
      Reports(year: 2022, quantity: 25),
      Reports(year: 2023, quantity: 20),
      Reports(year: 2024, quantity: 30),
    ];
  }

}