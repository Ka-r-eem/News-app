import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: Colors.black87),
      decoration: InputDecoration(
        hintText: "Search...",
        hintStyle: TextStyle(color: Colors.grey),
      ),
    );
  }
}
