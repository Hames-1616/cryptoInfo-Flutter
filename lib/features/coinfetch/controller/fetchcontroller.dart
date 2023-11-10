import 'package:cryptos/features/coinfetch/repos/fetchrepo.dart';
import 'package:cryptos/models/fetch_coins_models.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final fetchControllerProvider = StateNotifierProvider<fetchController, bool>(
    (ref) => fetchController(cfrepo: ref.watch(fetchrepoProvider)));

final getallcoinsProvider = FutureProvider((ref) => ref.watch(fetchControllerProvider.notifier).getallCoins());

class fetchController extends StateNotifier<bool> {
  final fetchtrpo frepo;

  fetchController({required fetchtrpo cfrepo})
      : frepo = cfrepo,
        super(false);

  Future<BigDataModel> getallCoins() async {
    return await frepo.getopcoins();
  }
}
