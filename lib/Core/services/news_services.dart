import 'package:dio/dio.dart';
import 'package:newsapp/Featuers/home/data/Model/article_model.dart';

class NewsService {
  final Dio dio;
  NewsService(this.dio);
  Future<List<DatasModel>> news({required String category}) async {
    Response response = await dio.get(
        'https://api.mediastack.com/v1/news?access_key=4eea4c3eb7289c28a6c0d47ebae0c269&keywords=tennis&countries=us,gb,de');
    Map<String, dynamic> jasonData = response.data;
    List<dynamic> data = jasonData['data'];

    List<DatasModel> dataList = [];
    for (var datas in data) {
      DatasModel datasModel = DatasModel.fromJson(datas);
      dataList.add(datasModel);
    }
    return dataList;
  }
}
