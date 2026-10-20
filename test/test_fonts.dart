import 'package:flutter/services.dart';

/// Incarca fonturile aplicatiei, ca layout-ul din teste sa fie cel real
/// (implicit testele folosesc fontul Ahem, cu toate literele patrate).
Future<void> loadAppFonts() async {
  const fonts = {
    'GoogleSans': ['Light', 'Regular', 'Medium', 'Bold'],
    'Montserrat': ['Light', 'Regular', 'Medium', 'SemiBold', 'Bold'],
    'MontserratAlt': ['Light', 'Regular'],
  };
  for (final MapEntry(key: family, value: weights) in fonts.entries) {
    final loader = FontLoader(family);
    for (final weight in weights) {
      loader.addFont(rootBundle.load('assets/fonts/$family-$weight.ttf'));
    }
    await loader.load();
  }
}
