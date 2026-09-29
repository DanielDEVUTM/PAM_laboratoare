import 'package:flutter/material.dart';
import 'package:fluttersdk_wind/fluttersdk_wind.dart';

/// Configuratia Wind (echivalentul lui tailwind.config.js).
///
/// Culorile, fonturile, colturile si umbrele din macheta Figma sunt definite
/// aici o singura data si folosite in widget-uri prin className, de ex.
/// `text-ink bg-snow rounded-xl shadow-card font-mont`.
final WindThemeData appWindTheme = WindThemeData(
  brightness: Brightness.light,
  syncWithSystem: false,
  fontFamilies: {
    'sans': 'GoogleSans', // ecranul Home
    'mont': 'MontserratAlternates', // ecranul Product
  },
  colors: {
    // Text
    'ink': _color(0xFF1D1F22),
    'charcoal': _color(0xFF33302E),
    'night': _color(0xFF231F20),
    'jet': _color(0xFF202020),
    'coal': _color(0xFF303030),
    'soot': _color(0xFF48494C),
    'graphite': _color(0xFF353945),
    'dusk': _color(0xFF777E90),
    'steel': _color(0xFF737680),
    'ash': _color(0xFF919196),
    'muted': _color(0xFF9B9B9B),
    'pebble': _color(0xFF9D9D9D),
    'silver': _color(0xFFA0A0A4),
    'smoke': _color(0xFFC5C5C5),
    'fog': _color(0xFFCCCBCB),

    // Fundaluri si linii
    'snow': _color(0xFFF8F8FA),
    'pearl': _color(0xFFF8F8F8),
    'mist': _color(0xFFF3F3F3),
    'divider': _color(0xFFF3F3F6),
    'track': _color(0xFFEFF0F1),
    'line': _color(0xFFF9F9F9),
    'cream': _color(0xFFFFFCFA),
    'iron': _color(0xFF515151),
    'carbon': _color(0xFF343434),

    // Accente
    'brown': _color(0xFF3A2C27),
    'berry': _color(0xFFEF466F),
    'sage': _color(0xFF508A7B),

    // Culorile produsului (Color)
    'beige': _color(0xFFE7C0A7),
    'onyx': _color(0xFF050302),
    'coral': _color(0xFFEE6969),
  },
  borderRadius: {
    // lg = 8 (carduri), xl = 10 (bannere), 3xl = 30 (sheet / Add To Cart)
    'xl': 10,
    '3xl': 30,
  },
  shadows: {
    'card': const [
      BoxShadow(color: Color(0x08000000), blurRadius: 8, offset: Offset(0, 4)),
    ],
    'button': const [
      BoxShadow(color: Color(0x14000000), blurRadius: 12, offset: Offset(0, 4)),
    ],
    'sheet': const [
      BoxShadow(color: Color(0x0F000000), blurRadius: 12, offset: Offset(0, -4)),
    ],
    'swatch': const [
      BoxShadow(color: Color(0x26000000), blurRadius: 8, offset: Offset(0, 3)),
    ],
  },
);

MaterialColor _color(int value) =>
    MaterialColor(value, {500: Color(value)});
