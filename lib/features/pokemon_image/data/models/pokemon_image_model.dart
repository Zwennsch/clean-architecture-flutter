import 'package:clean_architec/core/constants/constants.dart';
import 'package:clean_architec/features/pokemon_image/business/entities/pokemon_image_entity.dart';

class PokemonImageModel extends PokemonImageEntity {
  const PokemonImageModel({ required super.path});

  factory PokemonImageModel.fromJson({required Map<String, dynamic> json}) {
    return PokemonImageModel(path: json[kPath]);
  }

  Map<String, dynamic> toJson() {
    return {kPath: path};
  }
}
