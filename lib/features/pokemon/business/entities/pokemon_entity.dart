import 'sub_entities.dart';

// This is what you get from the API
class PokemonEntity {
  final String name;
  final int id;
  final SpritesEntity sprites;
  final List<TypesEntity> types;
  const PokemonEntity({
    required this.name,
    required this.id,
    required this.sprites,
    required this.types,
  });
}
