import 'package:flutter/material.dart';
import 'package:supafire/controllers/home_page_controller.dart';
import 'package:supafire/ui/shared/app_colors.dart';
import 'package:supafire/ui/shared/shared_styles.dart';
import 'package:supafire/ui/widgets/custom_bottom_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => HomePageController();
}

class HomePageView extends StatelessWidget {
  final HomePageController viewController;

  const HomePageView({
    Key? key,
    required this.viewController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: CustomBottomNavBar(viewController: viewController),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: AppColours.black,
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome home",
                style: SharedStyles.headingOne,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
