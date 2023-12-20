// the skeleton directory contains all the skeletons of the application like bottom navigation bar ....
import 'package:clean_architec/features/pokemon/presentation/pages/data_page.dart';
import 'package:clean_architec/features/pokemon/presentation/pages/pokemon_page.dart';
import 'package:clean_architec/features/skeleton/providers/selected_page_provider.dart';
import 'package:clean_architec/features/skeleton/widgets/custom_bottom_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

List<Widget> pages = const [PokemonPage(), DataPage()];

class Skelton extends StatelessWidget {
  const Skelton({super.key});

  @override
  Widget build(BuildContext context) {
    int selectedPage = Provider.of<SelectedPageProvider>(context).selectedPage;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Poke-Mapp'),
      ),
      body: pages[selectedPage],
      bottomNavigationBar: const CustomBottomBarWidget(),
    );
  }
}
