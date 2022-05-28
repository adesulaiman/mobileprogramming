import 'package:dio/dio.dart';

import '../models/cuaca_model.dart';

class CuacaService {
  late Dio _dio;

  CuacaService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.openweathermap.org/data/2.5/weather',
      ),
    );
  }

  Future<CuacaModel> tampikanCuaca({String? city}) async {
    var response = await _dio.get(
      '?q=$city&appid=b5bedb63d4f648d38784f1b284518479&units=metric',
    );
    return CuacaModel.fromJson(response.data);
  }
}
