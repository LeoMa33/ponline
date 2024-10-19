import 'package:flutter/material.dart';
import 'package:ponline/widgets/button.dart';
import 'package:ponline/widgets/header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomHeader(),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(),
              Text(
                'Bienvenue,',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              Text(
                'Léo',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: 'Avec '),
                    TextSpan(
                        text: 'Ponline',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: ', travailles ta '),
                    TextSpan(
                        text: 'mémoire ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: '\ntout en '),
                    TextSpan(
                        text: "t'amusant !",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 60,
        ),
        Column(
          children: [
            CustomButton(
              title: 'Jouer seul',
              onTap: () => {},
            ),
            const SizedBox(
              height: 10,
            ),
            const CustomButton(title: 'Jouer à deux'),
            const SizedBox(
              height: 10,
            ),
            const CustomButton(
              title: 'Boutique',
              type: ButtonType.WHITE,
            ),
          ],
        ),
        const SizedBox(
          height: 90,
        ),
      ],
    );
  }
}
