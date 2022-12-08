abstract class ApiEvent {}

class ApiFetchEvent extends ApiEvent {
  final String lookFor;
  final String typeOfElements;

  ApiFetchEvent({
    required this.lookFor,
    required this.typeOfElements,
  });
}

class ApiExcludeEvent extends ApiEvent {
  final List<String> excluded;
  final List<String> included;

  ApiExcludeEvent({
    required this.excluded,
    required this.included,
  });
}
