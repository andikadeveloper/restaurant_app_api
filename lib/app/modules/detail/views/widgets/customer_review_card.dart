import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app_api/app/data/models/restaurant_model.dart';
import 'package:restaurant_app_api/app/utils/constants.dart';

class CustomerReviewCard extends StatelessWidget {
  const CustomerReviewCard({
    Key? key,
    required this.customerReview,
  }) : super(key: key);

  final CustomerReview customerReview;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundColor: primaryColor.withOpacity(0.5),
          child: Icon(
            Icons.person,
            color: Colors.black,
          ),
        ),
        Expanded(
          child: Container(
            height: Get.height * 0.2,
            margin: const EdgeInsets.only(left: 5),
            child: Card(
              color: primaryColor.withOpacity(0.5),
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      customerReview.name,
                      style: Get.textTheme.subtitle1!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      customerReview.review,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      softWrap: true,
                      style: Get.textTheme.caption,
                    ),
                    Spacer(),
                    Text(
                      customerReview.date,
                      style: Get.textTheme.subtitle2,
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
