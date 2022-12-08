import '../../models/languages.dart';
import '../../models/industry.dart';
import '../../models/skills.dart';
import 'package:bloc/bloc.dart';
import 'api_event.dart';
import 'api_state.dart';

class ApiLanguagesBloc extends Bloc<ApiEvent, ApiLanguagesState> {
  ApiLanguagesBloc() : super(ApiLanguagesStateInit(Languages(included: []))) {
    on<ApiFetchEvent>((event, emit) async {
      final userInput = event.lookFor;
      final typeOfElements = event.typeOfElements;
      final result = await Languages().getPost(userInput, typeOfElements);
      emit(ApiLanguagesStateFetched(result));
    });
    on<ApiExcludeEvent>(
      (event, emit) {
        final included = event.included;
        final excluded = event.excluded;
        emit(ApiLanguagesStateSelected(Languages(
          included: included,
          excluded: excluded,
        )));
      },
    );
  }
}

class ApiIndustryBloc extends Bloc<ApiEvent, ApiIndustryState> {
  ApiIndustryBloc() : super(ApiIndustryStateInit(Industries(included: []))) {
    on<ApiFetchEvent>((event, emit) async {
      final userInput = event.lookFor;
      final typeOfElements = event.typeOfElements;
      final result = await Industries().getPost(userInput, typeOfElements);
      emit(ApiIndustryStateFetched(result));
    });
    on<ApiExcludeEvent>((event, emit) {
      final included = event.included;
      final excluded = event.excluded;
      if (excluded.length > 1) {
        included.insert(0, excluded[0]);
        excluded.removeAt(0);
        included.sort();
      }
      emit(ApiIndustryStateSelected(Industries(
        included: included,
        excluded: excluded,
      )));
    });
  }
}

class ApiSkillsBloc extends Bloc<ApiEvent, ApiSkillsState> {
  ApiSkillsBloc() : super(ApiSkillsStateInit(Skills(included: []))) {
    on<ApiFetchEvent>((event, emit) async {
      final userInput = event.lookFor;
      final typeOfElements = event.typeOfElements;

      final result = await Skills().getPost(userInput, typeOfElements);

      emit(ApiSkillsStateFetched(result));
    });
    on<ApiExcludeEvent>((event, emit) {
      final included = event.included;
      final excluded = event.excluded;
      emit(ApiSkillsStateSelected(Skills(
        included: included,
        excluded: excluded,
      )));
    });
  }
}
