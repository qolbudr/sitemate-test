import 'package:dio/dio.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sitemate_test/core/widget/w_refresher.dart';
import 'package:sitemate_test/page/search_page/widget/w_product_card.dart';
import 'package:sitemate_test/service/s_product/model/product_response_model/product_response_model.dart';
import 'package:sitemate_test/service/s_product/s_product.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final refreshController = RefreshController(initialRefresh: true);
  List<Product> product = [];
  int skip = 0;
  final searchText = TextEditingController();

  void onGetData() async {
    try {
      if (refreshController.isRefresh) skip = 0;
      final dio = Dio();
      final response = await SProduct(dio).get(keywords: searchText.text, skip: skip);
      List<Product> result = [];
      if (refreshController.isRefresh) result = response.products ?? [];
      if (refreshController.isLoading) result = [...product, ...response.products ?? []];
      skip += response.products?.length ?? 0;
      product = result;
      setState(() {});
      if (refreshController.isRefresh) refreshController.refreshCompleted();
      if (refreshController.isLoading) refreshController.loadComplete();
    } catch (e) {
      final snackBar = SnackBar(
        content: Text(e.toString()),
      );
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sitemate Challenge"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: searchText,
              onChanged: (value) {
                EasyDebounce.debounce(
                  'my-debouncer',
                  const Duration(milliseconds: 500),
                  () => refreshController.requestRefresh(),
                );
              },
              decoration: const InputDecoration(
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: WRefresher(
                controller: refreshController,
                onRefresh: () => onGetData(),
                onLoading: () => onGetData(),
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    if (product.isEmpty) ...[
                      const SizedBox(height: 20),
                      const Center(
                        child: Text("No data found"),
                      ),
                    ] else ...[
                      ...product.map(
                        (e) => WProductCard(e: e),
                      ),
                    ]
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
