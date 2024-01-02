import 'dart:io';

import 'package:clean_architec/core/errors/failure.dart';
import 'package:clean_architec/features/pokemon_image/business/entities/pokemon_image_entity.dart';
import 'package:clean_architec/features/pokemon_image/presentation/providers/pokemon_image_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PokemonImageWidget extends StatelessWidget {
  final Widget child;
  const PokemonImageWidget({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    PokemonImageEntity? pokemonImageEntity =
        Provider.of<PokemonImageProvider>(context).pokemonImage;
    Failure? failure = Provider.of<PokemonImageProvider>(context).failure;
    // TODO: Why is this late? Can't you just return the Expanded instead?
    late Widget widget;
    if (pokemonImageEntity != null) {
      widget = Expanded(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.orange,
            image: DecorationImage(
              image: FileImage(File(pokemonImageEntity.path)),
            ),
          ),
          child: child,
        ),
      );
    } else if (failure != null) {
      widget = Expanded(
        child: Center(
          child: Text(
            failure.errorMessage,
            style: const TextStyle(fontSize: 20.0),
          ),
        ),
      );
    } else {
      widget = const Expanded(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return widget;
  }
}
