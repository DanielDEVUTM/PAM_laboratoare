import '../models/product.dart';
import '../models/review.dart';

class AppData {
  AppData._();

  static const List<Product> featureProducts = [
    Product(
      name: 'Turtleneck Sweater',
      price: 39.99,
      image: 'assets/images/feature_1.jpg',
    ),
    Product(
      name: 'Long Sleeve Dress',
      price: 45.00,
      image: 'assets/images/feature_2.jpg',
    ),
    Product(
      name: 'Sportwear Set',
      price: 80.00,
      image: 'assets/images/feature_3.jpg',
    ),
  ];

  static const List<Product> recommended = [
    Product(
      name: 'White fashion hoodie',
      price: 29.00,
      image: 'assets/images/recommended_1.jpg',
    ),
    Product(
      name: 'Cotton T-shirt',
      price: 30.00,
      image: 'assets/images/recommended_2.jpg',
    ),
  ];

  static const Product sportwearSet = Product(
    name: 'Sportwear Set',
    price: 80.00,
    image: 'assets/images/product_hero.png',
  );

  /// Culorile disponibile (nume de culori din tema Wind).
  static const List<String> productColors = ['beige', 'onyx', 'coral'];

  static const List<String> productSizes = ['S', 'M', 'L'];

  static const double ratingAverage = 4.9;
  static const int ratingsCount = 83;
  static const int reviewsCount = 47;

  /// (stele, procent afisat, cat din bara e plina)
  static const List<(int, int, double)> ratingBreakdown = [
    (5, 80, 0.84),
    (4, 12, 0.19),
    (3, 5, 0.08),
    (2, 3, 0.05),
    (1, 0, 0),
  ];

  static const String sportwearDescription =
      'Sportswear is no longer under culture, it is no longer indie or '
      'cobbled together as it once was. Sport is fashion today. The top is '
      'oversized in fit and style, may need to size down.';

  static const List<Review> reviews = [
    Review(
      author: 'Jennifer Rose',
      avatar: 'assets/images/avatar_1.jpg',
      time: '5m ago',
      rating: 5,
      text:
          'I love it.  Awesome customer service!! Helped me out with adding an '
          'additional item to my order. Thanks again!',
    ),
    Review(
      author: 'Kelly Rihana',
      avatar: 'assets/images/avatar_2.jpg',
      time: '9m ago',
      rating: 5,
      text:
          "I'm very happy with order, It was delivered on and good quality. "
          'Recommended!',
    ),
  ];

  static const List<Product> similarProducts = [
    Product(
      name: 'Rise Crop Hoodie',
      price: 43.00,
      image: 'assets/images/similar_1.jpg',
    ),
    Product(
      name: 'Gym Crop Top',
      price: 39.99,
      image: 'assets/images/similar_2.jpg',
    ),
    Product(
      name: 'Sport Sweatshirt',
      price: 47.99,
      image: 'assets/images/similar_3.jpg',
    ),
  ];
}
