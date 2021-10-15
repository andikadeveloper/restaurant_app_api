import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:restaurant_app_api/app/data/models/restaurant_model.dart';
import 'package:restaurant_app_api/app/data/providers/restaurant_provider.dart';

import 'restaurant_provider_test.mocks.dart';

var dummyResponse = '''{
  "error": false,
  "message": "success",
  "restaurant": {
    "id": "rqdv5juczeskfw1e867",
    "name": "Melting Pot",
    "description": "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet.",
    "city": "Medan",
    "address": "Jln. Pandeglang no 19",
    "pictureId": "14",
    "categories": [
      {
        "name": "Italia"
      },
      {
        "name": "Modern"
      }
    ],
    "menus": {
      "foods": [
        {
          "name": "Paket rosemary"
        },
        {
          "name": "Toastie salmon"
        },
        {
          "name": "Bebek crepes"
        },
        {
          "name": "Salad lengkeng"
        }
      ],
      "drinks": [
        {
          "name": "Es krim"
        },
        {
          "name": "Sirup"
        },
        {
          "name": "Jus apel"
        },
        {
          "name": "Jus jeruk"
        },
        {
          "name": "Coklat panas"
        },
        {
          "name": "Air"
        },
        {
          "name": "Es kopi"
        },
        {
          "name": "Jus alpukat"
        },
        {
          "name": "Jus mangga"
        },
        {
          "name": "Teh manis"
        },
        {
          "name": "Kopi espresso"
        },
        {
          "name": "Minuman soda"
        },
        {
          "name": "Jus tomat"
        }
      ]
    },
    "rating": 4.2,
    "customerReviews": [
      {
        "name": "Ahmad",
        "review": "Tidak rekomendasi untuk pelajar!",
        "date": "13 November 2019"
      }
    ]
  }
}''';

@GenerateMocks([http.Client])
void main() {
  group(
    'fetch restaurant',
    () {
      final restaurantId = 'rqdv5juczeskfw1e867';

      Uri url =
          Uri.parse('https://restaurant-api.dicoding.dev/detail/$restaurantId');

      test(
        'returns a Restaurant if the http call completes successfully',
        () async {
          // arrange
          final client = MockClient();
          final restaurantProvider = RestaurantProvider(client: client);

          // act
          when(
            client.get(url),
          ).thenAnswer((_) async => http.Response(dummyResponse, 200));

          // assert
          expect(await restaurantProvider.getRestaurant(restaurantId),
              isA<Restaurant>());
        },
      );

      test(
        'throws an exception if the http call completes with an error',
        () {
          // arrange
          final client = MockClient();
          final restaurantProvider = RestaurantProvider(client: client);

          // act
          when(
            client.get(url),
          ).thenAnswer((_) async => http.Response('Not Found', 404));

          // assert
          expect(
            restaurantProvider.getRestaurant(restaurantId),
            throwsException,
          );
        },
      );
    },
  );
}
