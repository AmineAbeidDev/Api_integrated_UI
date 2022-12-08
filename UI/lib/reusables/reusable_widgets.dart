import 'package:test/constants/api_endpoint.dart';
import 'selections_utils/selections_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../api_manager/bloc/api_event.dart';
import '../api_manager/bloc/api_bloc.dart';
import 'package:flutter/material.dart';
import '../constants/colors.dart';

Text subtitleText(String string) => Text(
      string,
      style: const TextStyle(
        color: textColor,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );

SizedBox searchBar(BuildContext context, String typeOfElement) {
  if (typeOfElement == apiLanguagesFetch) {
    context.read<ApiLanguagesBloc>().add(ApiFetchEvent(
          lookFor: '',
          typeOfElements: typeOfElement,
        ));
  } else if (typeOfElement == apiIndustryFetch) {
    context.read<ApiIndustryBloc>().add(ApiFetchEvent(
          lookFor: '',
          typeOfElements: typeOfElement,
        ));
  } else if (typeOfElement == apiSkillsFetch) {
    context.read<ApiSkillsBloc>().add(ApiFetchEvent(
          lookFor: '',
          typeOfElements: typeOfElement,
        ));
  }

  final userInput = TextEditingController();

  return SizedBox(
    width: 130,
    height: 34,
    child: TextField(
      controller: userInput,
      style: const TextStyle(
        fontSize: 18,
      ),
      decoration: const InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: textColor,
          ),
        ),
        suffixIcon: Icon(
          Icons.search,
          size: 16,
        ),
      ),
      onChanged: (value) {
        final lookFor = userInput.text;

        if (typeOfElement == apiLanguagesFetch) {
          context.read<ApiLanguagesBloc>().add(ApiFetchEvent(
                lookFor: lookFor,
                typeOfElements: typeOfElement,
              ));
        } else if (typeOfElement == apiIndustryFetch) {
          context.read<ApiIndustryBloc>().add(ApiFetchEvent(
                lookFor: lookFor,
                typeOfElements: typeOfElement,
              ));
        } else if (typeOfElement == apiSkillsFetch) {
          context.read<ApiSkillsBloc>().add(ApiFetchEvent(
                lookFor: lookFor,
                typeOfElements: typeOfElement,
              ));
        }
      },
    ),
  );
}

List<Widget> selectionsManager(
        {required List<String> included,
        required List<String> excluded,
        required BuildContext context,
        required int showElements,
        required String typeOfElements}) =>
    List<Widget>.from(
        selectedElements(included, excluded, context, typeOfElements))
      ..addAll(unselectedElements(
          included: included,
          excluded: excluded,
          context: context,
          showElements: showElements,
          typeOfElements: typeOfElements));
