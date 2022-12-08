import 'package:test/models/industry.dart';
import 'package:test/models/languages.dart';

import '../../models/skills.dart';

//! abstarct states
abstract class ApiLanguagesState {
  final Languages searched;

  ApiLanguagesState(this.searched);
}

abstract class ApiIndustryState {
  final Industries searched;

  ApiIndustryState(this.searched);
}
abstract class ApiSkillsState {
  final Skills searched;

  ApiSkillsState(this.searched);
}

//! Init States
class ApiLanguagesStateInit extends ApiLanguagesState {
  ApiLanguagesStateInit(super.searched);
}

class ApiIndustryStateInit extends ApiIndustryState {
  ApiIndustryStateInit(super.searched);
}
class ApiSkillsStateInit extends ApiSkillsState {
  ApiSkillsStateInit(super.searched);
}

//! fetch States
class ApiLanguagesStateFetched extends ApiLanguagesState {
  ApiLanguagesStateFetched(super.searched);
}

class ApiIndustryStateFetched extends ApiIndustryState {
  ApiIndustryStateFetched(super.searched);
}

class ApiSkillsStateFetched extends ApiSkillsState {
  ApiSkillsStateFetched(super.searched);
}

//! Selection States
class ApiLanguagesStateSelected extends ApiLanguagesState {
  ApiLanguagesStateSelected(super.searched);
}

class ApiIndustryStateSelected extends ApiIndustryState {
  ApiIndustryStateSelected(super.searched);
}
class ApiSkillsStateSelected extends ApiSkillsState {
  ApiSkillsStateSelected(super.searched);
}
