import 'package:dio/dio.dart';
import 'package:newsapp/Featuers/home/data/Model/article_model.dart';

class NewsService {
  final Dio dio;
  final String apiKey = '4eea4c3eb7289c28a6c0d47ebae0c269';
  final String countries;

  NewsService(this.dio, this.countries);

  Future<List<DatasModel>> news({required String category}) async {
    try {
      Response response = await dio.get(
        'https://api.mediastack.com/v1/news?access_key=$apiKey&countries=$countries&categories=$category',
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = response.data;
        List<dynamic> data = jsonData['data'];

        List<DatasModel> dataList = [];
        for (var datas in data) {
          DatasModel datasModel = DatasModel.fromJson(datas);
          dataList.add(datasModel);
        }
        return dataList;
      } else {
        // Handle non-200 status codes
        print('Error: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      // Handle any errors
      print('Error: $e');
      return [];
    }
  }
}
