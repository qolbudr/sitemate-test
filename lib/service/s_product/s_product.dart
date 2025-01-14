import 'package:dio/dio.dart';
import 'package:sitemate_test/core/errors/exception.dart';
import 'package:sitemate_test/service/s_product/model/product_response_model/product_response_model.dart';

class SProduct {
  final Dio dio;

  SProduct(this.dio);

  Future<ProductResponse> get({String? keywords, num? limit = 10, num? skip = 0}) async {
    try {
      String url = '';
      if(keywords?.isNotEmpty ?? false) {
        url = 'https://dummyjson.com/products/search?q=$keywords';
      } else {
        url = 'https://dummyjson.com/products?limit=$limit&skip=$skip';
      }

      final response = await dio.get(url);
      if (response.statusCode == 200) return ProductResponse.fromJson(response.data);

      throw ServerException(code: response.statusCode, message: response.data['message']);
    } catch (e) {
      rethrow;
    }
  }
}