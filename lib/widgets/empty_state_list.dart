import 'package:flutter/material.dart';

class EmptyStateList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'No transactions added yet',
          style: Theme.of(context).textTheme.title,
        ),
        SizedBox(
          height: 10,
        ),
        Container(
            height: 200,
            child: Image.asset(
              'assets/images/waiting.png',
              fit: BoxFit.cover,
            ))
      ],
    );
  }
}
