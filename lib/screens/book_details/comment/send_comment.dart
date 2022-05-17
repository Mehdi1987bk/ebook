import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:kango/presentation/bloc/bloc_provider.dart';
import 'package:kango/screens/book_details/book_details_bloc.dart';

import '../../../generated/l10n.dart';
import '../../../presentation/resourses/app_colors.dart';

class SendComment extends StatefulWidget {
  @override
  _SendCommentState createState() => _SendCommentState();
}

class _SendCommentState extends State<SendComment> {
  final TextEditingController _comment = TextEditingController();
  final ValueNotifier<bool> _valueNotifier = ValueNotifier(false);
  double rating = 0;

  @override
  void initState() {
    super.initState();
    _comment.addListener(() {
      _valueNotifier.value = _comment.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 15,),
          RatingBar(
            initialRating: rating,
            direction: Axis.horizontal,
            itemCount: 5,
            itemSize: 35,
            ratingWidget: RatingWidget(
              full: const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              empty: const Icon(
                Icons.star_border,
                color: Colors.amber,
              ),
              half: const Icon(
                Icons.star_border,
                color: Colors.amber,
              ),
            ),
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            onRatingUpdate: (rat) {
              setState(() {
                rating = rat;
              });
            },
          ),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width ,
            margin: const EdgeInsets.only(left: 22, right: 22,top: 15),
            child: TextField(
              controller: _comment,
              style: const TextStyle(fontSize: 16, color: Colors.black),
              decoration: InputDecoration(
                hintText: S.of(context).bookName,
                hintStyle: const TextStyle(color: AppColors.buttonText),
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: AppColors.appColor)),
              ),
            ),
          ),
          SizedBox(height: 15,),
          ValueListenableBuilder<bool>(
            valueListenable: _valueNotifier,
            builder: (_, value, __) {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: AppColors.appColor,
                    padding: EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: MediaQuery.of(context).size.width * 0.39),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    )),
                onPressed: value ? _sendComment : null,
                child: Text(S.of(context).login),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _comment.dispose();
    super.dispose();
  }

  _sendComment() {
    final bloc = BlocProvider.of<BookDetailsBloc>(context);
    bloc.sendComment(_comment.text.trim(), rating.toInt()).then((value) {
      _comment.clear();
      bloc.load(refresh: true);
      setState(() {
        rating = 0;
      });
    });
  }
}
