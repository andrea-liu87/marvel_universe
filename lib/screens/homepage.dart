import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_universe/bloc/char_bloc.dart';
import 'package:marvel_universe/bloc/char_repository.dart';
import 'package:marvel_universe/constants/constants.dart';
import 'package:marvel_universe/data/http_helper.dart';
import 'package:marvel_universe/model/comic_char.dart';

import '../widgets/background_image.dart';
import '../widgets/char_grid_view.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final CharBloc _charBloc = CharBloc(CharRepositoryImpl());
  List<ComicChar> characterList = [];

  @override
  void initState() {
    _charBloc.add(FetchingCharacter());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.kColorRedPrimary,
        title: const Text('Marvel Universe Database'),
      ),
      body: Stack(children: [
        const BackgroundImage(),
        Container(
          margin: const EdgeInsets.all(10),
          child: BlocProvider(
            create: (context) => _charBloc,
              child: BlocBuilder<CharBloc, CharState>(
                builder: (context, state) {
                  if (state is CharLoaded) {
                    return CharGridView(state: state,);
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          ),
      ]),
    );
  }
}
