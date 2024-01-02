class NoParams {}

class TemplateParams {}

// The things the gets passed to the API
class PokemonParams {
  final String id;
  const PokemonParams({
    required this.id,
  });
}

class PokemonImageParams {
  final String name;
  final String imageUrl;
  PokemonImageParams({required this.name, required this.imageUrl});
}
