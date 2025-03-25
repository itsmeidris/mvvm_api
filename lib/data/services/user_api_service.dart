import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_api/constants/app_endpoints.dart';

class UserApiService {
  static Future<List<dynamic>> fetchUsersApi() async {
    try {
      //Make the api call to get the data
      final apiResponse = await Dio().get(AppEndpoints.baseUrl);
      //Check the response code status
      if (apiResponse.statusCode == 200) {
        //Retrun the raw data
        return apiResponse.data as List<dynamic>;
      } else {
        throw Exception('Failed to fetch users : ${apiResponse.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error while fetching data: $e');
      }
      throw Exception('Error while fetching data: $e');
    }
  }
}
