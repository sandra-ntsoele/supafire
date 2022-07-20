import 'package:flutter/material.dart';
import 'package:supafire/controllers/home_page_controller.dart';
import 'package:supafire/ui/shared/shared_styles.dart';

class BookCollectionListView extends StatelessWidget {
  final HomePageController viewController;

  const BookCollectionListView({
    Key? key,
    required this.viewController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Welcome home",
          style: SharedStyles.headingOne,
        ),
      ],
    );
  }
}
