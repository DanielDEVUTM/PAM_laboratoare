import 'package:flutter/material.dart';
import 'package:fluttersdk_wind/fluttersdk_wind.dart';

/// Poza din JSON (URL). Cat se incarca apare un fundal gri, iar daca nu se
/// poate incarca (fara internet) apare o iconita in locul ei.
class AppImage extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  final BorderRadius borderRadius;
  final Alignment alignment;

  const AppImage(
    this.url, {
    super.key,
    this.width,
    this.height,
    this.borderRadius = BorderRadius.zero,
    this.alignment = Alignment.center,
  });

  @override
  Widget build(BuildContext context) {
    final background = context.wColorExt('mist') ?? Colors.grey.shade100;
    final placeholder = ColoredBox(
      color: background,
      child: const SizedBox.expand(),
    );

    return ClipRRect(
      borderRadius: borderRadius,
      child: SizedBox(
        width: width,
        height: height,
        child: url.isEmpty
            ? placeholder
            : Image.network(
                url,
                fit: BoxFit.cover,
                alignment: alignment,
                loadingBuilder: (context, child, progress) =>
                    progress == null ? child : placeholder,
                errorBuilder: (context, error, stackTrace) => ColoredBox(
                  color: background,
                  child: Center(
                    child: Icon(
                      Icons.image_not_supported_outlined,
                      color: context.wColorExt('smoke'),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
