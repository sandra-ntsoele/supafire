import 'package:flutter/material.dart';
import 'package:supafire/controllers/home_page_controller.dart';
import 'package:supafire/ui/shared/app_colors.dart';

class CustomBottomNavBar extends StatelessWidget {
  final HomePageController viewController;

  const CustomBottomNavBar({
    Key? key,
    required this.viewController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: viewController.currentIndex,
      selectedIconTheme: IconThemeData(
        color: AppColours.black,
      ),
      unselectedIconTheme: IconThemeData(
        color: AppColours.grey,
      ),
      selectedFontSize: 0,
      unselectedFontSize: 0,
      onTap: (sourceIndex) => viewController.changeCurrentIndex(sourceIndex),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_rounded),
          label: "",
        )
      ],
    );
  }
}
