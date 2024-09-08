import 'dart:convert';
import 'dart:io';
import 'package:httpclient/models/usermodel.dart';
import 'package:httpclient/util/logger/logger.dart';

import '../AppUrl/AppCallUri.dart';
import '../models/userpostmodel.dart';

class HttpService {
  static Future<HttpClientResponse> getResponse() async {
    HttpClient client = HttpClient();
    Uri uri = Uri.parse("${CallUri.getBaseUri()}");
    HttpClientRequest request = await client.getUrl(uri);
    request.headers.set(HttpHeaders.contentTypeHeader, 'application/json');
    HttpClientResponse response = await request.close();
    return response;
  }

  static Future<HttpClientResponse> postResponse(PostUser postUser) async {
    HttpClient client = HttpClient();
    Uri uri = Uri.parse("${CallUri.getBaseUri()}");

    HttpClientRequest request = await client.postUrl(uri);
    request.headers.set(HttpHeaders.contentTypeHeader, 'application/json');
    request.headers.set(
        HttpHeaders.accessControlAllowMethodsHeader, 'GET, POST, PUT, DELETE');
    request.write(jsonEncode(postUser.toJson()));

    CallLog.callLogInfo(postUser.toJson());

    HttpClientResponse response = await request.close();
    return response;
  }

  static Future<HttpClientResponse> pushResponse(PostUser postUser) async {
    HttpClient client = HttpClient();
    Uri uri = Uri.parse('${CallUri.getBaseUri()}/${postUser.id}');
    final HttpClientRequest request = await client.putUrl(uri);
    request.headers.set(HttpHeaders.contentTypeHeader, 'application/json');
    CallLog.callLogDebug('Request Payload: ${postUser.toJson()}');
    request.write(jsonEncode(postUser.toJson()));
    final HttpClientResponse response = await request.close();
    return response;
  }

  static Future<HttpClientResponse> deleteResponse(PostUser postUser) async {
    HttpClient client = HttpClient();
    Uri uri = Uri.parse('${CallUri.getBaseUri()}/${postUser.id}');
    final HttpClientRequest request = await client.deleteUrl(uri);
    request.headers.set(HttpHeaders.contentTypeHeader, 'application/json');
    final HttpClientResponse response = await request.close();
    return response;
  }
}
