import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../api_manager/bloc/api_event.dart';
import '../../api_manager/bloc/api_bloc.dart';
import '../../constants/api_endpoint.dart';
import '../../constants/colors.dart';

List<String> excludeFromCurrent(List<String> current, List<String> exclude) {
  Set<String> currentSet = current.toSet();
  Set<String> excludeSet = exclude.toSet();

  final ret = List<String>.from(currentSet.difference(excludeSet));
  return (ret);
}

List<Widget> unselectedElements({
  required List<String> included,
  required List<String> excluded,
  required BuildContext context,
  required int showElements,
  required String typeOfElements,
}) {
  final elemsSum = showElements;
  final list = excludeFromCurrent(included, excluded);
  final displayList = list
      .getRange(0, (elemsSum > list.length) ? list.length : elemsSum)
      .toList();

  final ret = List.generate(
    displayList.length,
    (index) => GestureDetector(
      onTap: () {
        excluded.add(displayList[index]);
        if (typeOfElements == apiLanguagesFetch) {
          context.read<ApiLanguagesBloc>().add(ApiExcludeEvent(
                excluded: excluded,
                included: list,
              ));
        } else if (typeOfElements == apiIndustryFetch) {
          context.read<ApiIndustryBloc>().add(ApiExcludeEvent(
                excluded: excluded,
                included: list,
              ));
        } else if (typeOfElements == apiSkillsFetch) {
          context.read<ApiSkillsBloc>().add(ApiExcludeEvent(
                excluded: excluded,
                included: list,
              ));
        }
      },
      child: Container(
          height: 35,
          padding: const EdgeInsets.fromLTRB(12, 8, 12, 10),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            displayList[index],
          )),
    ),
  );
  return ret;
}

List<Widget> selectedElements(List<String> included, List<String> excluded,
    BuildContext context, String typeOfElements) {

  final ret = List.generate(
    excluded.length,
    (index) => GestureDetector(
      onTap: () {
        included.add(excluded[index]);
        included.sort();
        excluded.remove(excluded[index]);
        if (typeOfElements == apiLanguagesFetch) {
          context.read<ApiLanguagesBloc>().add(ApiExcludeEvent(
                excluded: excluded,
                included: included,
              ));
        } else if (typeOfElements == apiIndustryFetch) {
          context.read<ApiIndustryBloc>().add(ApiExcludeEvent(
                excluded: excluded,
                included: included,
              ));
        } else if (typeOfElements == apiSkillsFetch) {
          context.read<ApiSkillsBloc>().add(ApiExcludeEvent(
                excluded: excluded,
                included: included,
              ));
        }
      },
      child: Container(
          height: 35,
          padding: const EdgeInsets.fromLTRB(12, 8, 12, 10),
          decoration: BoxDecoration(
            color: selectionColor,
            border: Border.all(color: selectionColor),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            excluded[index],
          )),
    ),
  );
  return ret;
}
