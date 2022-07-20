import 'package:flutter/material.dart';
import 'package:supafire/controllers/home_page_controller.dart';
import 'package:supafire/ui/shared/layout_helpers.dart';
import 'package:supafire/ui/shared/shared_styles.dart';

class ProfilePage extends StatelessWidget {
  final HomePageController viewController;

  const ProfilePage({
    Key? key,
    required this.viewController,
  }) : super(key: key);

  final String src =
      "https://cdn.dribbble.com/users/94760/screenshots/14989947/media/b31ef3ab0e209cfa3b4c70396b104818.jpg?compress=1&resize=1000x750&vertical=top";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(src),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(
                    color: Colors.black,
                    width: 5,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                height: 150,
                width: 150,
              ),
              Expanded(
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.exit_to_app_rounded),
                  padding: EdgeInsets.zero,
                  alignment: Alignment.centerRight,
                ),
              )
            ],
          ),
          LayoutHelpers.smallVerticalSpace,
          Text(
            "MF Doom",
            style: SharedStyles.headingOne,
          ),
        ],
      ),
    );
  }
}
