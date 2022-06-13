import 'package:flutter/material.dart';
import 'package:marvel_universe/constants/constants.dart';

class SearchBar extends StatelessWidget {
  const SearchBar();

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
