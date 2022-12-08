import 'package:http/http.dart' as http;
import 'dart:convert';

class Industries {
  static final _shared = Industries._private();

  Industries._private({List<String>? included, List<String>? excluded})
      : included = included ?? [],
        excluded = excluded ?? [];

  factory Industries({List<String>? included, List<String>? excluded}) {
    _shared.included = included ?? _shared.included;
    _shared.excluded = excluded ?? _shared.excluded;
    return (_shared);
  }

  List<String> included;
  List<String> excluded;

  factory Industries.fromRawJson(String rawJson) {
    List<String> list = (jsonDecode(rawJson) as List<dynamic>).cast<String>();
    final jsonObj = Industries(included: list);
    return (jsonObj);
  }
  Future<Industries> getPost(final String userInput, final String type) async {
    final url = Uri.parse('$type$userInput');
    final response = await http.get(url);
    return Industries.fromRawJson(response.body);
  }
}
