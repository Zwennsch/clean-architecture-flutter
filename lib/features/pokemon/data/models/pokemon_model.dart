import 'package:clean_architec/features/pokemon/business/entities/pokemon_entity.dart';

class PokemonModel extends PokemonEntity {
  PokemonModel(
      {required super.name,
      required super.id,
      required super.sprites,
      required super.types});

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      name: json[kName],
      id: json[kId],
      sprites: SpritesModel.fromJson(json[kSprites]),
      types: TypesModel.fromJson(json[kTypes]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      kName: name,
      kId: id,
      kSprites: sprites,
      kTypes: types,
    };
  }
}
