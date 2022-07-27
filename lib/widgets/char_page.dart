import 'package:flutter/material.dart';
import 'package:marvel_universe/widgets/search_bar.dart';

import '../bloc/char_bloc.dart';
import '../model/comic_char.dart';
import 'gridview.dart';

class CharPage extends StatefulWidget {
  final CharLoaded state;
  const CharPage({Key? key, required this.state}) : super(key: key);

  @override
  State<CharPage> createState() => _CharPageState();
}

class _CharPageState extends State<CharPage> {
  late Gridview _gridView;

  @override
  void initState() {
    _gridView = Gridview(data: widget.state.charsData);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 16,
        ),
        SearchBar(
          callback: (String text) {
            setState(() {
              _gridView = Gridview(
                data: (filteredData(widget.state, text)),
              );
            });
          },
        ),
        const SizedBox(
          height: 18,
        ),
        Flexible(child: _gridView),
      ],
    );
  }

  List<ComicChar> filteredData(CharLoaded state, String text) {
    List<ComicChar> filteredData= [];
    for (var element in state.charsData) {
      if (element.name.toLowerCase().contains(text.toLowerCase())){
        filteredData.add(element);
      }
    }
    return filteredData;
  }
}
