import 'package:flutter/material.dart';
import 'package:marvel_universe/model/comic_char.dart';

class Gridview extends StatelessWidget {
  const Gridview({
    Key? key,
    required this.data,
  }) : super(key: key);

  final List<ComicChar> data;


  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 15,
            childAspectRatio: 0.7,
            crossAxisSpacing: 15),
        itemCount: data.length,
        itemBuilder: (context, index) {
          return CharTile(charsData: data, index: index);
        });
  }
}

class CharTile extends StatelessWidget {
  const CharTile({
    Key? key,
    required this.charsData,
    required this.index,
  }) : super(key: key);

  final List<ComicChar> charsData;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      child: Column(
        children: [
          Expanded(
              child: Image.network(
                charsData[index].thumbnailUrl,
                fit: BoxFit.fill,
              )),
          const SizedBox(height: 5),
          Center(
              child: Text(
                charsData[index].name,
                style: const TextStyle(
                    color: Colors.redAccent, fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              )),
        ],
      ),
    );
  }
}