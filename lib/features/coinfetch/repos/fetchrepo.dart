import 'package:cryptos/core/providers.dart';
import 'package:cryptos/models/fetch_coins_models.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final fetchrepoProvider =
    Provider((ref) => fetchtrpo(cdio: ref.watch(dioprovider)));

class fetchtrpo {
  final Dio dio;

  fetchtrpo({required Dio cdio}) : dio = cdio;

  Future<BigDataModel> getopcoins() async {
    dio.options.headers['X-CMC_PRO_API_KEY'] =
        "3316f59c-2878-4884-8d02-b41197093373";
    var response = await dio.get(
        "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest");

    final bigDataModel = BigDataModel.fromJson(response.data);

     bigDataModel.dataModel.sort((a, b) => a.id.compareTo(b.id));
    // return BigDataModel.fromJson(response.data);
    return bigDataModel;
  }

    Future<BigDataModel> getcoinsprice() async {
    dio.options.headers['X-CMC_PRO_API_KEY'] =
        "3316f59c-2878-4884-8d02-b41197093373";
    var response = await dio.get(
        "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest");

    final bigDataModel = BigDataModel.fromJson(response.data);

     bigDataModel.dataModel.sort((a, b) => a.quoteModel.usdModel.price.compareTo(b.id));
    // return BigDataModel.fromJson(response.data);
    return bigDataModel;
  }
      Future<BigDataModel> getcoinsvolumne() async {
    dio.options.headers['X-CMC_PRO_API_KEY'] =
        "3316f59c-2878-4884-8d02-b41197093373";
    var response = await dio.get(
        "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest");

    final bigDataModel = BigDataModel.fromJson(response.data);

     bigDataModel.dataModel.sort((a, b) => a.quoteModel.usdModel.volume24h.compareTo(b.id));
    // return BigDataModel.fromJson(response.data);
    return bigDataModel;
  }
}
