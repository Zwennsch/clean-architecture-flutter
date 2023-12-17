import 'package:clean_architec/core/constants/constants.dart';
import 'package:clean_architec/features/pokemon/business/entities/pokemon_entity.dart';
import 'package:clean_architec/features/pokemon/presentation/providers/pokemon_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/errors/failure.dart';

class DataWidget extends StatelessWidget {
  const DataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    late Widget widget;
    PokemonEntity? pokemon = Provider.of<PokemonProvider>(context).pokemon;
    Failure? failure = Provider.of<PokemonProvider>(context).failure;
    if (pokemon != null) {
      widget = SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              leading: const Text('API'),
              title: Text('https://pokeapi.co/api/pokemon/${pokemon.id}'),
              tileColor: Colors.orange,
            ),
            ListTile(
              title: Text(kName),
              subtitle: Text(pokemon.name),
            ),
            const Divider(),
            ListTile(
              title: Text(kId),
              subtitle: Text(pokemon.id.toString()),
            ),
            const Divider(),
            ListTile(
              leading: const Text('{ }'),
              title: Text(kSprites),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                children: [
                  ListTile(
                    leading: const Text('{ }'),
                    title: Text(kOther),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Column(
                      children: [
                        ListTile(
                          leading: const Text('{ }'),
                          title: Text(kOfficialArtwork),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Column(
                            children: [
                              ListTile(
                                title: Text(kFrontDefault),
                                subtitle: SelectableText(pokemon.sprites.other
                                    .officialArtwork.frontDefault),
                              ),
                              ListTile(
                                title: Text(kFrontShiny),
                                subtitle: SelectableText(pokemon
                                    .sprites.other.officialArtwork.frontShiny),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            ListTile(
              leading: const Text('[]'),
              title: Text(kTypes),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                children: List.generate(
                  pokemon.types.length,
                  (index) => Column(
                    children: [
                      ListTile(
                        leading: const Text('{}'),
                        title: Text(kType),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: ListTile(
                          title: Text(kName),
                          subtitle:
                              Text(pokemon.types.elementAt(index).type.name),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      );
    } else if (failure != null) {
      widget = Center(
        child: Text(failure.errorMessage),
      );
    } else {
      widget = const Center(
        child: CircularProgressIndicator(),
      );
    }

    return widget;
  }
}
