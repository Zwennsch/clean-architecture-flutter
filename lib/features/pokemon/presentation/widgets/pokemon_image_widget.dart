import 'package:flutter/material.dart';

class PokemonImageWidget extends StatelessWidget {
  final Widget child;
  const PokemonImageWidget({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Why is this late? Can't you just return the Expanded instead?
    late Widget widget;
    widget = Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.orange,
          image: const DecorationImage(
            image: AssetImage('assets/images/mapp.png'),
          ),
        ),
        child: child,
      ),
    );
    return widget;
  }
}
