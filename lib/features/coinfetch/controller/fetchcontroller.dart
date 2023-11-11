import 'package:cryptos/core/providers.dart';
import 'package:cryptos/features/coinfetch/repos/fetchrepo.dart';
import 'package:cryptos/models/fetch_coins_models.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final fetchControllerProvider = StateNotifierProvider<fetchController, bool>(
    (ref) => fetchController(cfrepo: ref.watch(fetchrepoProvider)));

final getallcoinsProvider = FutureProvider.family((ref, WidgetRef refs) =>
    ref.watch(fetchControllerProvider.notifier).getallCoins(refs));

// final getpricecoinsProvider = FutureProvider(
//     (ref) => ref.watch(fetchControllerProvider.notifier).getcoinsprice());

// final getvolumnecoinsProvider = FutureProvider(
//     (ref) => ref.watch(fetchControllerProvider.notifier).getcoinsvolumne());

final getimgprovider = FutureProvider.family((ref, String name) =>
    ref.watch(fetchControllerProvider.notifier).getimg(name));

class fetchController extends StateNotifier<bool> {
  final fetchtrpo frepo;

  fetchController({required fetchtrpo cfrepo})
      : frepo = cfrepo,
        super(false);

  Future<BigDataModel> getallCoins(WidgetRef ref) async {
    final s = await frepo.getopcoins();
    ref.watch(coinsprovider.notifier).state = s;
    return ref.watch(coinsprovider.notifier).state;
  }

  void getallcoinss(WidgetRef ref) async {
    state = true;
    final s = await frepo.getopcoins();
    ref.watch(coinsprovider.notifier).state = s;
    state = false;
  }

  void getcoinsprice(WidgetRef ref) async {
    state = true;
    final s = await frepo.getcoinsprice();
    ref.watch(coinsprovider.notifier).state = s;
    state = false;
  }

  void getcoinsvolumne(WidgetRef ref) async {
    state = true;
    final s = await frepo.getcoinsvolumne();
    ref.watch(coinsprovider.notifier).state = s;
    state = false;
  }

  Future<String> getimg(String name) async {
    return await frepo.geticon(name);
  }
}
