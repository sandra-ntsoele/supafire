import 'package:flutter/material.dart';
import 'package:supafire/ui/views/book_collection_page.dart';
import 'package:supafire/ui/widgets/empty_state.dart';

class BookCollectionPageController extends State<BookCollectionPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: null,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return BookCollectionPageView(viewController: this);
        } else {
          return const EmptyState();
        }
      },
    );
  }
}
