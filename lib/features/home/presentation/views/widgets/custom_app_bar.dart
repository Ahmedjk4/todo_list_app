import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 128,
          ),
          Text(
            'TODOS  ',
            style: TextStyle(fontSize: 32, fontFamily: 'Booklove'),
          ),
          Text('📒'),
        ],
      ),
    );
  }
}
