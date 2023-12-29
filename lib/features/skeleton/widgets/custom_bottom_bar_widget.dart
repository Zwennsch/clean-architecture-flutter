import 'package:clean_architec/features/skeleton/providers/selected_page_provider.dart';
import 'package:clean_architec/features/skeleton/widgets/custom_bottom_bar_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomBottomBarWidget extends StatelessWidget {
  const CustomBottomBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    int selectedPage = Provider.of<SelectedPageProvider>(context).selectedPage;

    return SafeArea(
      child: BottomAppBar(
        elevation: 0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: selectedPage == 0
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
              child: LayoutBuilder(
                builder: (context, box) => SizedBox(
                  width: box.maxWidth / 2,
                  child: const Divider(
                    height: 0,
                    color: Colors.orangeAccent,
                    thickness: 2,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomBottomBarIconWidget(
                    callback: () {
                      Provider.of<SelectedPageProvider>(context, listen: false)
                          .changePage(0);
                    },
                    iconDataSelected: Icons.search_outlined,
                    isSelected: selectedPage == 0,
                    iconDataUnselected: Icons.search_outlined),
                CustomBottomBarIconWidget(
                    callback: () {
                      Provider.of<SelectedPageProvider>(context, listen: false)
                          .changePage(1);
                    },
                    iconDataSelected: Icons.menu,
                    isSelected: selectedPage == 1,
                    iconDataUnselected: Icons.menu),
              ],
            )
          ],
        ),
      ),
    );
  }
}
