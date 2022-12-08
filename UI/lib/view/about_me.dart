import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../reusables/reusable_widgets.dart';

List<Widget> aboutMe() => [
      subtitleText('About me'),
      const SizedBox(
        height: 14,
      ),
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: TextField(
          enableSuggestions: false,
          autocorrect: false,
          maxLines: null,
          minLines: 3,
          decoration: InputDecoration(
            hintText: 'Hey i\'m new in comate',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: textColor,
              ),
              borderRadius: BorderRadius.circular(15.0),
            ),
            contentPadding: const EdgeInsets.all(8),
          ),
        ),
      ),
      const SizedBox(
        height: 9,
      ),
    ];
