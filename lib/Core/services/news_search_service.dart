// import 'dart:developer';

// import 'package:dio/dio.dart';
// import 'package:newsapp/Featuers/home/data/Model/article_model.dart';

// class SearchNewsService {
//   final Dio dio;
//   // final String apiKey = '4eea4c3eb7289c28a6c0d47ebae0c269';
//   // final String apiKey = '99b497417fe9d9af2cf25c4c3ce8dfd6';
//   final String apiKey = '41fd30b8ee572d7910024376d750ab60';

//   final String keywords;

//   SearchNewsService(
//     this.dio,
//     this.keywords,
//   );

//   Future<List<DatasModel>> searchNews() async {
//     try {
//       Response response = await dio.get(
//         'https://api.mediastack.com/v1/news?access_key=$apiKey&keywords=$keywords',
//       );

//       if (response.statusCode == 200) {
//         Map<String, dynamic> jsonData = response.data;
//         List<dynamic> data = jsonData['data'];

//         List<DatasModel> dataList = [];
//         for (var datas in data) {
//           DatasModel datasModel = DatasModel.fromJson(datas);
//           dataList.add(datasModel);
//         }
//         return dataList;
//       } else {
//         // Handle non-200 status codes
//         log('Error: ${response.statusCode}');
//         return [];
//       }
//     } catch (e) {
//       // Handle any errors
//       log('Error: $e');
//       return [];
//     }
//   }
// }
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:newsapp/Featuers/home/data/Model/article_model.dart';

class SearchNewsService {
  final Dio dio;
  final String apiKey = '41fd30b8ee572d7910024376d750ab60';
  final String keywords;

  SearchNewsService(this.dio, this.keywords);

  Future<List<DatasModel>> searchNews() async {
    try {
      final String url =
          'https://api.mediastack.com/v1/news?access_key=$apiKey&keywords=$keywords';

      Response response = await dio.get(url);

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = response.data;

        // Validate that 'data' exists and is a list
        if (jsonData.containsKey('data') && jsonData['data'] is List) {
          List<dynamic> data = jsonData['data'];

          // Convert the dynamic list to a list of DatasModel objects
          return data.map((item) => DatasModel.fromJson(item)).toList();
        } else {
          log('Error: Invalid response structure');
          return [];
        }
      } else {
        log('Error: Received non-200 status code: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      log('Error during search: $e');
      return [];
    }
  }
}
