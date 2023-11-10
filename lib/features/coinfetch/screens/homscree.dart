import 'package:cached_network_image/cached_network_image.dart';
import 'package:cryptos/core/graph.dart';
import 'package:cryptos/core/price.dart';
import 'package:cryptos/features/coinfetch/controller/fetchcontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Homescreen extends ConsumerStatefulWidget {
  const Homescreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomescreenState();
}

class _HomescreenState extends ConsumerState<Homescreen> {
  bool def = true;
  bool price = false;
  bool volume = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        elevation: 0,
        actions: [
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 10),
                      child: const Text(
                        "EXCHANGES",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.notifications,
                      color: Colors.black,
                      size: 28,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 25),
                      child: const Icon(
                        Icons.settings,
                        color: Colors.black,
                        size: 28,
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
      body: Center(
          child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 265,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.grey.shade300),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.search_rounded,
                        color: Colors.black45,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Search Cryptocurrency",
                        style: TextStyle(color: Colors.black45),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Container(
                  height: 40,
                  width: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: Colors.black54)),
                  child: InkWell(
                    focusColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return SimpleDialog(
                              children: [
                                Column(children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        def = false;
                                        volume = false;
                                        price = true;
                                      });
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Price"),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        def = false;

                                        price = false;
                                        volume = true;
                                      });
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Volumne"),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        volume = false;
                                        price = false;
                                        def = true;
                                      });
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Top-default"),
                                  ),
                                ])
                              ],
                            );
                          });
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.filter_alt_rounded,
                          color: Colors.black45,
                        ),
                        Text(
                          "Filter",
                          style: TextStyle(color: Colors.black45),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 30, top: 30),
            child: Row(
              children: [
                InkWell(
                    onTap: () {},
                    focusColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: const Text(
                      "Cryptocurrency",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 21,
                          fontWeight: FontWeight.w600),
                    )),
                const SizedBox(
                  width: 25,
                ),
                InkWell(
                    onTap: () {},
                    focusColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: const Text(
                      "NFT",
                      style: TextStyle(
                          color: Colors.black45,
                          fontSize: 21,
                          fontWeight: FontWeight.w600),
                    )),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 35, left: 35, top: 35),
            // padding: const EdgeInsets.only(right:35,left: 35,top: 35),
            alignment: Alignment.center,
            height: 180,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.black),
                color: Colors.grey.shade300),
            child: ref
                .watch(def
                    ? getallcoinsProvider
                    : price
                        ? getpricecoinsProvider
                        : volume
                            ? getvolumnecoinsProvider
                            : getallcoinsProvider)
                .when(
                    data: (info) {
                      return Container(
                        margin:
                            const EdgeInsets.only(right: 20, left: 20, top: 15),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: ref
                                      .watch(getimgprovider(
                                          info.dataModel[0].symbol))
                                      .when(
                                          data: (data) {
                                            return CachedNetworkImage(
                                              imageUrl: data,
                                              placeholder: (context, url) =>
                                                  const Icon(Icons
                                                      .currency_rupee_rounded),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      const Center(
                                                child:
                                                    CircularProgressIndicator(
                                                        color: Colors.black),
                                              ),
                                            );
                                          },
                                          error: (e, t) {
                                            return null;
                                          },
                                          loading: ()=>null),
                                  
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            info.dataModel[0].symbol,
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            info.dataModel[0].name,
                                            style: const TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                        )
                                      ]),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 80),
                                  child: Column(children: [
                                    Text(
                                      convertString(info.dataModel[0].quoteModel
                                          .usdModel.price),
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                        convert24Percent(info
                                            .dataModel[0]
                                            .quoteModel
                                            .usdModel
                                            .percentChange_24h),
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: getcolor(convert24Percent(
                                                info
                                                    .dataModel[0]
                                                    .quoteModel
                                                    .usdModel
                                                    .percentChange_24h))))
                                  ]),
                                ),
                              ],
                            ),
                            SizedBox(
                                height: 190,
                                child: LineChartSample2(
                                  color: getcolor(convert24Percent(info
                                      .dataModel[0]
                                      .quoteModel
                                      .usdModel
                                      .percentChange_24h)),
                                  below: false,
                                ))
                          ],
                        ),
                      );
                    },
                    error: (e, st) {
                      return Text(e.toString() + st.toString());
                    },
                    loading: () => const Center(
                          child: CircularProgressIndicator(color: Colors.black),
                        )),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(right: 30, left: 30, top: 30),
            child: Text(
              def
                  ? "Top Cryptocurrency"
                  : price
                      ? "Price"
                      : volume
                          ? "Volume"
                          : "",
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 21,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
            width: MediaQuery.of(context).size.width,
            height: 390,
            child: ref
                .watch(def
                    ? getallcoinsProvider
                    : price
                        ? getpricecoinsProvider
                        : volume
                            ? getvolumnecoinsProvider
                            : getallcoinsProvider)
                .when(
                    data: (info) {
                      return ListView.builder(
                          itemCount: 20,
                          itemBuilder: (context, index) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.only(bottom: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                          height: 60,
                                          width: 60,
                                          child: ref
                                      .watch(getimgprovider(
                                          info.dataModel[index+1].symbol))
                                      .when(
                                          data: (data) {
                                            return CachedNetworkImage(
                                              imageUrl: data,
                                              placeholder: (context, url) =>
                                                  const Icon(Icons
                                                      .currency_rupee_rounded),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      const Center(
                                                child:
                                                    CircularProgressIndicator(
                                                        color: Colors.black),
                                              ),
                                            );
                                          },
                                          error: (e, t) {
                                            return null;
                                          },
                                          loading: ()=>null),),
                                      // const SizedBox(width: 10,),
                                      Container(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  info.dataModel[index + 1]
                                                      .symbol,
                                                  style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  info.dataModel[index + 1]
                                                      .name,
                                                  style: const TextStyle(
                                                    fontSize: 15,
                                                  ),
                                                ),
                                              )
                                            ]),
                                      ),
                                      Image.asset(getcolors(info
                                          .dataModel[index + 1]
                                          .quoteModel
                                          .usdModel
                                          .percentChange_24h))
                                    
                                    ],
                                  ),
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            convertString(info
                                                .dataModel[index + 1]
                                                .quoteModel
                                                .usdModel
                                                .price),
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                              convert24Percent(info
                                                  .dataModel[index + 1]
                                                  .quoteModel
                                                  .usdModel
                                                  .percentChange_24h),
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: getcolor(
                                                      convert24Percent(info
                                                          .dataModel[
                                                              index + 1]
                                                          .quoteModel
                                                          .usdModel
                                                          .percentChange_24h)))),
                                        )
                                      ]),
                                ],
                              ),
                            );
                          });
                    },
                    error: (e, st) {
                      return Text(e.toString() + st.toString());
                    },
                    loading: () => const Center(
                          child: CircularProgressIndicator(color: Colors.black),
                        )),
          ),
        ],
      )),
    );
  }
}
