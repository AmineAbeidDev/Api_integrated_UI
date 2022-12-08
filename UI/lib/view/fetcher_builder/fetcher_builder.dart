import 'package:test/constants/api_endpoint.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../api_manager/bloc/api_state.dart';
import '../../reusables/reusable_widgets.dart';
import '../../api_manager/bloc/api_bloc.dart';

Widget builder(int sumOfElements, String typeOfElements) {
  return Builder(
    builder: (context) {
      final stateA = context.watch<ApiLanguagesBloc>().state;
      final stateB = context.watch<ApiIndustryBloc>().state;
      final stateC = context.watch<ApiSkillsBloc>().state;

      if ((stateA is ApiLanguagesStateFetched ||
              stateA is ApiLanguagesStateSelected) &&
          typeOfElements == apiLanguagesFetch) {
        return Align(
          child: Wrap(
              spacing: 12,
              runSpacing: 8,
              children: selectionsManager(
                included: stateA.searched.included,
                excluded: stateA.searched.excluded,
                context: context,
                showElements: sumOfElements,
                typeOfElements: typeOfElements,
              )),
        );
      }
      else if ((stateB is ApiIndustryStateFetched ||
              stateB is ApiIndustryStateSelected) &&
          typeOfElements == apiIndustryFetch) {

        return Align(
          child: Wrap(
              spacing: 12,
              runSpacing: 8,
              children: selectionsManager(
                included: stateB.searched.included,
                excluded: stateB.searched.excluded,
                context: context,
                showElements: sumOfElements,
                typeOfElements: typeOfElements,
              )),
        );
      }
      else if ((stateC is ApiSkillsStateFetched ||
              stateC is ApiSkillsStateSelected) &&
          typeOfElements == apiSkillsFetch) {

        return Align(
          child: Wrap(
              spacing: 12,
              runSpacing: 8,
              children: selectionsManager(
                included: stateC.searched.included,
                excluded: stateC.searched.excluded,
                context: context,
                showElements: sumOfElements,
                typeOfElements: typeOfElements,
              )),
        );
      }
       else {
        return const Text('Loading...');
      }
    },
  );
}
