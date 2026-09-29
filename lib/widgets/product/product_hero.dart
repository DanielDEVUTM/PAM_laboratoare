import 'package:flutter/material.dart';
import 'package:fluttersdk_wind/fluttersdk_wind.dart';

import '../page_dots.dart';

/// Partea de sus a ecranului: poza produsului (carusel), inapoi si favorit.
class ProductHero extends StatefulWidget {
  final String image;

  const ProductHero({super.key, required this.image});

  @override
  State<ProductHero> createState() => _ProductHeroState();
}

class _ProductHeroState extends State<ProductHero> {
  static const int _pages = 3;

  final PageController _controller = PageController();
  int _current = 0;
  bool _favorite = true;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.paddingOf(context).top + 17;

    return WDiv(
      className: 'relative w-full h-[406px] bg-cream',
      children: [
        PageView.builder(
          controller: _controller,
          itemCount: _pages,
          onPageChanged: (index) => setState(() => _current = index),
          itemBuilder: (context, index) => WImage(
            src: 'asset://${widget.image}',
            className: 'w-full h-[406px] object-cover',
          ),
        ),
        WDiv(
          className: 'absolute top-[${top}px] left-[32px]',
          child: _CircleButton(
            onTap: () => Navigator.maybePop(context),
            child: const WIcon(
              Icons.arrow_back_ios_new,
              className: 'text-[14px] text-navy',
            ),
          ),
        ),
        WDiv(
          className: 'absolute top-[${top}px] right-[33px]',
          child: _CircleButton(
            onTap: () => setState(() => _favorite = !_favorite),
            child: WIcon(
              _favorite ? Icons.favorite : Icons.favorite_border,
              className: 'text-[18px] text-salmon',
            ),
          ),
        ),
        WDiv(
          className: 'absolute bottom-[11.75px] left-0 right-0',
          child: PageDots(count: _pages, current: _current, color: 'dim'),
        ),
      ],
    );
  }
}

class _CircleButton extends StatelessWidget {
  final VoidCallback onTap;
  final Widget child;

  const _CircleButton({required this.onTap, required this.child});

  @override
  Widget build(BuildContext context) {
    return WAnchor(
      onTap: onTap,
      child: WDiv(
        className:
            'flex items-center justify-center size-[32px] rounded-full bg-white shadow-button',
        children: [child],
      ),
    );
  }
}
