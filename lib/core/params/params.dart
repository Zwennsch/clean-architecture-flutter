class NoParams {}

class TemplateParams {}


// The things the gets passed to the API
class PokemonParams {
  final String id;
  const PokemonParams({
    required this.id,
  });
}
