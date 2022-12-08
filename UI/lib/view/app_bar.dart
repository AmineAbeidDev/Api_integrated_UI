import 'package:flutter/material.dart';

import '../constants/colors.dart';

AppBar appBar() => AppBar(
        backgroundColor: primaryColor,
        shadowColor: const Color.fromARGB(
          0,
          0,
          0,
          0,
        ),
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 14, 10, 0),
            child: Text(
              'Skip',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          )
        ],
      );