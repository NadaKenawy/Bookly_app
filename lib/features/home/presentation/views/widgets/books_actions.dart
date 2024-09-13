import 'package:bookly_app/core/function/launch_url.dart';
import 'package:bookly_app/core/widgets/custom_button.dart';
import 'package:bookly_app/features/home/data/model/book_model/book_model.dart';
import 'package:flutter/material.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({
    super.key,
    required this.bookModel,
  });
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Expanded(
              child: CustomButton(
            onPressed: () async {
              lauunchCustomUrl(context, bookModel.volumeInfo.previewLink!);
            },
            backgroundColor: Colors.white,
            textColor: Colors.black,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16), bottomLeft: Radius.circular(16)),
            text: 'Free',
          )),
          Expanded(
              child: CustomButton(
            onPressed: () async {
              lauunchCustomUrl(context, bookModel.volumeInfo.previewLink!);
            },
            backgroundColor: Color(0xffEF8262),
            textColor: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16)),
            text: getText(bookModel),
          )),
        ],
      ),
    );
  }

  String getText(BookModel bookModel) {
    if (bookModel.volumeInfo.previewLink == null) {
      return 'Not Avaliable';
    } else {
      return 'Preview';
    }
  }
}
