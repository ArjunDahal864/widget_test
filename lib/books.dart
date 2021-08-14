import 'package:flutter/material.dart';

class Books extends StatelessWidget {
  final numbers ;
  const Books({Key? key, required this.numbers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: numbers,
        shrinkWrap: true,
        itemBuilder: (context, index) => ListTile(

            title: Text(
          "$index Book",
        )),
      ),
    );
  }
}
