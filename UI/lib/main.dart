import 'package:flutter_bloc/flutter_bloc.dart';
import 'api_manager/bloc/api_bloc.dart';
import 'package:flutter/material.dart';
import 'constants/api_endpoint.dart';
import 'constants/colors.dart';
import 'view/about_me.dart';
import 'view/app_bar.dart';
import 'view/fetcher.dart';

void main() async {
  runApp(MaterialApp(
    home: MultiBlocProvider(
      providers: [
        BlocProvider<ApiLanguagesBloc>(
          create: (context) => ApiLanguagesBloc(),
        ),
        BlocProvider<ApiIndustryBloc>(
          create: (context) => ApiIndustryBloc(),
        ),
        BlocProvider<ApiSkillsBloc>(
          create: (context) => ApiSkillsBloc(),
        ),
      ],
      child: const MyHomePage(),
    ),
  ));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Container(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        color: primaryColor,
        child: ListView(
          children: [
            const Text(
              'Fill Your Profile',
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.w700,
                fontSize: 27,
              ),
            ),
            const SizedBox(
              height: 9,
            ),
            ...aboutMe(),
            ...fetcher(
              context: context,
              typeOfElements: apiLanguagesFetch,
              sumOfElements: 6,
              elementsTitle: 'Languages',
            ),
            ...fetcher(
              context: context,
              typeOfElements: apiIndustryFetch,
              sumOfElements: 3,
              elementsTitle: 'Industry',
            ),
            ...fetcher(
              context: context,
              typeOfElements: apiSkillsFetch,
              sumOfElements: 6,
              elementsTitle: 'Skills',
            ),
            const SizedBox(height: 80,)
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 70,
        width: 300,
        decoration: BoxDecoration(
            color: textColor, borderRadius: BorderRadius.circular(45)),
        alignment: Alignment.center,
        child: const Text(
          'CONFIRM',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
