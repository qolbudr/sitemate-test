import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sitemate_test/service/s_product/model/product_response_model/product_response_model.dart';

class WProductCard extends StatelessWidget {
  const WProductCard({super.key, required this.e});
  final Product e;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.withOpacity(0.5), width: 1),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: e.images?.firstOrNull ?? '',
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(e.title ?? ''),
                Text(e.price?.toString() ?? ''),
              ],
            ),
          )
        ],
      ),
    );
  }
}
