import 'package:flutter/material.dart';
import 'package:supafire/controllers/book_collection_page_controller.dart';
import 'package:supafire/ui/shared/layout_helpers.dart';
import 'package:supafire/ui/shared/shared_styles.dart';

class BookCollectionPage extends StatefulWidget {
  const BookCollectionPage({Key? key}) : super(key: key);

  @override
  State<BookCollectionPage> createState() => BookCollectionPageController();
}

class BookCollectionPageView extends StatelessWidget {
  final BookCollectionPageController viewController;

  const BookCollectionPageView({
    Key? key,
    required this.viewController,
  }) : super(key: key);

  final String url =
      "https://ouch-cdn2.icons8.com/QAh22NFGyC0EsoCo-yI98CCZE0F4eh18O7uO8vVBG0A/rs:fit:375:456/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvOTE3/LzgyMDU5N2Y4LTVh/M2EtNDEwNS05YjQx/LTk0NTcwMThmNmFh/Zi5zdmc.png";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: NetworkImage(url),
          fit: BoxFit.cover,
          width: size.width * 0.3,
        ),
        LayoutHelpers.largeVerticalSpace,
        Text(
          "No books found",
          style: SharedStyles.headingOne,
          textAlign: TextAlign.center,
        ),
        LayoutHelpers.smallVerticalSpace,
        Text(
          "Click the plus button to add the first book you want to read",
          style: SharedStyles.paragraphTwo,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
