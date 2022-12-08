
import 'package:test/view/fetcher_builder/fetcher_builder.dart';
import '../reusables/reusable_widgets.dart';
import 'package:flutter/material.dart';

List<Widget> fetcher({
  required BuildContext context,
  required String typeOfElements,
  required int sumOfElements,
  required String elementsTitle,
}) {
  return [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        subtitleText(elementsTitle),
        searchBar(context, typeOfElements),
      ],
    ),
    const SizedBox(
      height: 20,
    ),
    builder(sumOfElements, typeOfElements),
    const SizedBox(
      height: 15,
    ),
  ];
}
