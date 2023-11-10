import 'package:cryptos/features/coinfetch/repos/fetchrepo.dart';
import 'package:cryptos/models/fetch_coins_models.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final fetchControllerProvider = StateNotifierProvider<fetchController, bool>(
    (ref) => fetchController(cfrepo: ref.watch(fetchrepoProvider)));

final getallcoinsProvider = FutureProvider(
    (ref) => ref.watch(fetchControllerProvider.notifier).getallCoins());

final getpricecoinsProvider = FutureProvider(
    (ref) => ref.watch(fetchControllerProvider.notifier).getcoinsprice());

final getvolumnecoinsProvider = FutureProvider(
    (ref) => ref.watch(fetchControllerProvider.notifier).getcoinsvolumne());

final getimgprovider = FutureProvider.family(
    (ref,String name) => ref.watch(fetchControllerProvider.notifier).getimg(name));

class fetchController extends StateNotifier<bool> {
  final fetchtrpo frepo;

  fetchController({required fetchtrpo cfrepo})
      : frepo = cfrepo,
        super(false);

  Future<BigDataModel> getallCoins() async {
    return await frepo.getopcoins();
  }

  Future<BigDataModel> getcoinsprice() async {
    return await frepo.getcoinsprice();
  }

  Future<BigDataModel> getcoinsvolumne() async {
    return await frepo.getcoinsvolumne();
  }

  Future<String> getimg(String name) async {
    return await frepo.geticon(name);
  }
}
