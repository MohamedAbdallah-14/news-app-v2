import 'dart:convert';

import 'package:news_app/core/data/api_manager/api_manager.dart';
import 'package:news_app/core/helpers/app_logger.dart';

Future<String?> request2curl(Request? request) async {
  if (request == null) return null;
  var curl = '';
  // Add PATH + REQUEST_METHOD
  curl +=
      "curl --request ${request.method} '${request.baseUrl}${request.path}' ";
  // Include queryParamters
  var buffer = StringBuffer();
  final queryParameters = await request.queryParameters ?? {};
  if (queryParameters.isNotEmpty) {
    curl += '-G';
    queryParameters.forEach((key, value) {
      buffer.write(' --data-urlencode "$key=$value"');
    });
    curl += buffer.toString();
  }
  final headers = request.headers ?? {};
  if (headers.isNotEmpty) {
    // Include headers
    buffer = StringBuffer();
    for (final key in headers.keys) {
      if (key == 'content-length') continue;
      buffer.write(" -H '$key: ${headers[key]}'");
    }
    curl += buffer.toString();
  }
  // Include data if there is data
  curl += " --data-binary '${jsonEncode(request.data)}'";
  if (shouldLog) AppLogger.instance.log(curl);

  return curl;
}
