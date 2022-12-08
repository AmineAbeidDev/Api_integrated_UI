import 'package:http/http.dart' as http;
import 'dart:developer';
import 'dart:convert';

class Languages {
  static final _shared = Languages._private();

  Languages._private({List<String>? included, List<String>? excluded})
      : included = included ?? [],
        excluded = excluded ?? [];

  factory Languages({List<String>? included, List<String>? excluded}) {
    _shared.included = included ?? _shared.included;
    _shared.excluded = excluded ?? _shared.excluded;
    return (_shared);
  }

  List<String> included;
  List<String> excluded;

  factory Languages.fromRawJson(String rawJson) {
    List<String> list = (jsonDecode(rawJson) as List<dynamic>).cast<String>();
    final jsonObj = Languages(included: list);
    return (jsonObj);
  }
  Future<Languages> getPost(final String userInput, final String type) async {
    final url = Uri.parse('$type$userInput');
    final response = await http.get(url);
    return Languages.fromRawJson(response.body);
  }
}
