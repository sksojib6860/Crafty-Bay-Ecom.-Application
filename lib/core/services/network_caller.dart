import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

part '../models/network_response.dart';

class NetworkCaller {
  final Logger _logger = Logger();
  final Map<String, String> headers;
  final VoidCallback onUserUnAuthorized;
  final List<String> deData;

  NetworkCaller({
    required this.headers,
    required this.onUserUnAuthorized,
    required this.deData,
  });

  Future<NetworkResponse> getRequest(String url) async {
    try {
      Uri uri = Uri.parse(url);
      logRequest(url);
      Response response = await get(uri, headers: headers);
      logResponse(url, response);
      final decodedData = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return NetworkResponse(
          isSuccess: true,
          responseCode: response.statusCode,
          body: decodedData,
        );
      } else if (response.statusCode == 401) {
        onUserUnAuthorized();
        return NetworkResponse(
          isSuccess: false,
          responseCode: response.statusCode,
          errorMessage: 'Unauthorized',
        );
      } else {
        return NetworkResponse(
          isSuccess: false,
          responseCode: response.statusCode,
          errorMessage: decodedData[deData],
        );
      }
    } catch (e) {
      return NetworkResponse(
        isSuccess: false,
        responseCode: -10,
        errorMessage: e.toString(),
      );
    }
  }

  Future<NetworkResponse> postRequest(
    String url, {
    Map<String, dynamic>? body,
  }) async {
    try {
      Uri uri = Uri.parse(url);
      logRequest(url, body: body);
      Response response = await post(
        uri,
        headers: headers,
        body: jsonEncode(body),
      );
      logResponse(url, response);
      final decodedData = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return NetworkResponse(
          isSuccess: true,
          responseCode: response.statusCode,
          body: decodedData,
        );
      } else if (response.statusCode == 401) {
        // onUserUnAuthorized();
        return NetworkResponse(
          isSuccess: false,
          responseCode: response.statusCode,
          errorMessage: _extractError(decodedData),
        );
      } else {
        return NetworkResponse(
          isSuccess: false,
          responseCode: response.statusCode,
          errorMessage: _extractError(decodedData),
        );
      }
    } catch (e) {
      return NetworkResponse(
        isSuccess: false,
        responseCode: -10,
        errorMessage: e.toString(),
      );
    }
  }

  void logRequest(String url, {Map<String, dynamic>? body}) {
    _logger.i(
      "URL: $url\n"
      "Body: $body",
    );
  }

  void logResponse(String url, Response response) {
    _logger.i(
      "URL: $url\n"
      "body response: ${response.body}\n"
      "status code: ${response.statusCode}",
    );
  }

  /// Extracts error message from decoded JSON using provided keys
  String _extractError(Map<String, dynamic> decodedData) {
    for (var key in deData) {
      if (decodedData.containsKey(key)) {
        return decodedData[key]?.toString() ?? 'Unknown error';
      }
    }
    return decodedData['msg']?.toString() ?? 'Unknown error';
  }
}
