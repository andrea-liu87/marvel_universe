import 'package:flutter/material.dart';
import 'package:marvel_universe/constants/constants.dart';

class SearchBar extends StatefulWidget {
  Function callback;
  SearchBar({Key? key, required this.callback}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      decoration: ShapeDecoration(
        shape: const StadiumBorder(),
        color: Constants.kColorRedPrimary.withOpacity(0.75),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.search, size: 26),
          const SizedBox(width: 8,),
          Expanded(
            child: TextFormField(
              onChanged: (value){
                setState(() {
                  widget.callback(value);
                });
              },
              decoration: const InputDecoration(
                isDense: true,
                hintText: 'Search Character',
                contentPadding: EdgeInsets.zero,
                hintStyle: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  height: 1,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
