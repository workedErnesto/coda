import 'package:coda/coda_app.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  final Dio dio = Dio();
  GetIt.I.registerSingleton<Dio>(dio);

  runApp(const CodaApp());
}
