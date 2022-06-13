import 'package:flutter/material.dart';
import 'package:marvel_universe/widgets/search_bar.dart';

import '../bloc/char_bloc.dart';

class CharGridView extends StatelessWidget {
  final CharLoaded state;

  const CharGridView({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16,),
        const SearchBar(),
        const SizedBox(height: 18,),
        Flexible(child: GView(state: state)),
      ],
    );
  }
}

class GView extends StatelessWidget {
  const GView({
    Key? key,
    required this.state,
  }) : super(key: key);

  final CharLoaded state;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 15,
            childAspectRatio: 0.7,
            crossAxisSpacing: 15),
        itemCount: state.charsData.length,
        itemBuilder: (context, index) {
          return Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
            child: Column(
              children: [
                Expanded(
                    child: Image.network(
                  state.charsData[index].thumbnailUrl,
                  fit: BoxFit.fill,
                )),
                const SizedBox(height: 5),
                Center(
                    child: Text(
                  state.charsData[index].name,
                  style: const TextStyle(
                      color: Colors.redAccent, fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                )),
              ],
            ),
          );
        });
  }
}
