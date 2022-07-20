import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:supafire/services/authentication_service.dart';
import 'package:supafire/ui/shared/layout_helpers.dart';
import 'package:supafire/ui/shared/shared_styles.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  final String src =
      "https://cdn.dribbble.com/users/94760/screenshots/14989947/media/b31ef3ab0e209cfa3b4c70396b104818.jpg?compress=1&resize=1000x750&vertical=top";

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: AuthenticationService().authState.map((event) => event),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            var user = snapshot.data as User;

            return Column(
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
                LayoutHelpers.mediumVerticalSpace,
                Text(
                  user.displayName.toString(),
                  style: SharedStyles.headingOne,
                ),
                LayoutHelpers.smallVerticalSpace,
                Text(
                  user.email.toString(),
                  style: SharedStyles.paragraphTwo,
                ),
              ],
            );
          }
        });
  }
}
