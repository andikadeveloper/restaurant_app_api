import 'package:flutter/material.dart';
import 'package:restaurant_app_api/app/data/models/restaurant_model.dart';

import 'customer_review_card.dart';

class ListCustomerReview extends StatelessWidget {
  const ListCustomerReview({Key? key, required this.listReview})
      : super(key: key);

  final List<CustomerReview> listReview;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        listReview.length,
        (index) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: CustomerReviewCard(
              customerReview: listReview[index],
            ),
          );
        },
      ),
    );
  }
}
