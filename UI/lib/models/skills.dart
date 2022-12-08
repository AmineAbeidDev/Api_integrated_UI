import 'package:http/http.dart' as http;
import 'dart:developer';
import 'dart:convert';

class Skills {
  static final _shared = Skills._private();

  Skills._private({List<String>? included, List<String>? excluded})
      : included = included ?? [],
        excluded = excluded ?? [];

  factory Skills({List<String>? included, List<String>? excluded}) {
    _shared.included = included ?? _shared.included;
    _shared.excluded = excluded ?? _shared.excluded;
    return (_shared);
  }

  List<String> included;
  List<String> excluded;

  factory Skills.newSelections(List<String> selected, List<String> unselected) {
    final obj = Skills(included: unselected, excluded: unselected);
    return obj;
  }

  factory Skills.fromRawJson(String rawJson) {
    List<String> list = (jsonDecode(rawJson) as List<dynamic>).cast<String>();
    final jsonObj = Skills(included: list);
    return (jsonObj);
  }
  Future<Skills> getPost(final String userInput, final String type) async {
    final url = Uri.parse('$type$userInput');
    final response = await http.get(url);
    return Skills.fromRawJson(response.body);
  }
}
