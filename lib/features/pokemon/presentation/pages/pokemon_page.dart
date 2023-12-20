import 'package:clean_architec/features/pokemon/presentation/widgets/pokemon_widget.dart';
import 'package:flutter/widgets.dart';

import '../widgets/search_pokemon_widget.dart';

class PokemonPage extends StatelessWidget {
  const PokemonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children:  [
          PokemonWidget(),
          SearchPokemonWidget(),
        ],
      ),
    );
  }
}
