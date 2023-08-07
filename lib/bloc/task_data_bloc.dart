import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/model/model.dart';
import 'package:http/http.dart' as http;

class RateBloc extends Cubit<List<Rate>> {
  RateBloc() : super([]);

  Future<void> fetchCurrencies() async {
    final response = await http.get(Uri.parse('https://api.coincap.io/v2/rates'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body)['data'] as List;
      final rates = data.map((rateJson) => Rate.fromJson(rateJson)).toList();
      emit(rates);
    } else {
      emit([]);
    }
  }
}