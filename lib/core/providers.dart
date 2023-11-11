import 'package:cryptos/models/big_data_model.dart';
import 'package:cryptos/models/fetch_coins_models.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioprovider = Provider((ref) => Dio());
final coinsprovider = StateProvider<BigDataModel>((ref) => BigDataModel(
    statusModel: StatusModel("", 0, "", 0,
        0, "", 0),
    dataModel: [DataModel(
        0,
        "",
        "",
        "",
        0,
        "",
        [],
        0,
        0,
        0,
        0,
        "",
        QuoteModel(
            usdModel: UsdModel(
                price: 0,
                volume24h: 0,
                percentChange_1h: 0,
                percentChange_24h: 0,
                percentChange_7d: 0,
                percentChange_30d: 0,
                percentChange_60d: 0,
                percentChange_90d: 0,
                marketCap: 0,
                lastUpdated: "")))]));
