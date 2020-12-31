import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:lms_app/data/model/class.dart';
import 'package:lms_app/data/model/user.dart';

class RemoteService {
  Future<Token> loginUser(String username, String password) async {
    final url = "http://www.example.com/";
    Dio dio = new Dio();
    dio.interceptors.add(LogInterceptor(responseBody: true));
    final connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult != ConnectivityResult.none) {
      try {
        final response = await dio
            .post(url, data: {"username": username, "password": password});

        final token = Token();
        //! we dont know response schema yet!!

        return Future.value(token);
      } on DioError catch (e) {}
    } else {
      //! if there is no internet connection
      return null;
    }
  }

  Future<User> fetchUser() async {
    final url = "http://www.example.com/";
    Dio dio = new Dio();
    dio.interceptors.add(LogInterceptor(responseBody: true));
    final connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult != ConnectivityResult.none) {
      try {
        final response = await dio.get(url);

        final user = User();
        //! we dont know response schema yet!!

        return Future.value(user);
      } on DioError catch (e) {}
    } else {
      //! if there is no internet connection
      return null;
    }
  }

  Future<List<Class>> fetchAllClasses() async {
    final url = "http://www.example.com/";
    Dio dio = new Dio();
    dio.interceptors.add(LogInterceptor(responseBody: true));
    final connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult != ConnectivityResult.none) {
      try {
        final response = await dio.get(url);

        //! we dont know response schema yet!!

        return null;
      } on DioError catch (e) {}
    } else {
      //! if there is no internet connection
      return null;
    }
  }

  Future<List<ClassToday>> fetchTodaysClasses() async {
    final url = "http://www.example.com/";
    Dio dio = new Dio();
    dio.interceptors.add(LogInterceptor(responseBody: true));
    final connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult != ConnectivityResult.none) {
      try {
        final response = await dio.get(url);

        //! we dont know response schema yet!!

        return null;
      } on DioError catch (e) {}
    } else {
      //! if there is no internet connection
      return null;
    }
  }
}
