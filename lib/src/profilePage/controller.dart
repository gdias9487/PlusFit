import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:mvc_pattern/mvc_pattern.dart';


const default_server = '7ca5364fcb5f.ngrok.io';

const default_headers = {
  HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
};

 //final Controller controller = Controller._();

class Controller extends ControllerMVC {
  Controller();

  bool isOK(http.Response response) {
    return response.statusCode >= 200 && response.statusCode < 300;
  }

  bool isFail(http.Response response) {
    return !isOK(response);
  }

  Future call(
      {String server = default_server,
      String path,
      Map<String, String> params,
      Map<String, String> headers = default_headers,

      Future process(json)}) async {
      var uri = Uri.https(server, path, params);
      var response = http.get(uri, headers: headers);

      var res = await response;
      if (isOK(res)) {
        return jsonDecode(res.body);
      } else {
        throw Exception('Falha ao chamar a api REST.');
      }
  }
}