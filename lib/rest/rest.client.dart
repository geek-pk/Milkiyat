import 'package:dio/dio.dart';
import 'package:milkiyat/constants/consts.dart';
import 'package:retrofit/http.dart';

part 'rest.client.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class RestClient {
  factory RestClient() {
    var dio = Dio();

    dio.options = BaseOptions(receiveTimeout: 5000, connectTimeout: 5000);

    dio.interceptors.add(InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
      var headers = options.headers;
      options.headers = headers;
      handler.next(options);
    }));

    return _RestClient(dio, baseUrl: baseUrl);
  }

  @GET("home/")
  Future<dynamic> fetchData();
}
