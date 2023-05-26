import 'dart:convert';

import 'package:dio/src/response.dart';
import 'package:phone_activator/features/virtual_number/data/datasources/api/buy_number_request.dart';
import 'package:phone_activator/features/virtual_number/domain/repositories/buy_number_repository.dart';

import '../models/buy_model.dart';

class BuyNumberImpl implements BuyNumberRepository{
  static const BuyNumberRequest _buyNumberRequest = BuyNumberRequest();
  const BuyNumberImpl();

  @override
  Future<BuyModel> buy(String refreshToken, String sessionId, String shortName) async{
    final Response response = await _buyNumberRequest.buy(refreshToken, sessionId, shortName);
    return BuyModel.fromJson(jsonDecode(response.data));

  }
}