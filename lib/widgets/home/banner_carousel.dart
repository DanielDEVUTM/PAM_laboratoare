import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';

class BannerCarousel extends StatefulWidget {
  const BannerCarousel({super.key});

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  static const int _pages = 3;

  final PageController _controller = PageController();
  int _current = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: SizedBox(
          height: 168,
          child: Stack(
            children: [
              PageView.builder(
                controller: _controller,
                itemCount: _pages,
                onPageChanged: (index) => setState(() => _current = index),
                itemBuilder: (context, index) => const _BannerPage(),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 9,
                child: _PageIndicator(count: _pages, current: _current),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BannerPage extends StatelessWidget {
  const _BannerPage();

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset('assets/images/banner.jpg', fit: BoxFit.cover),
        const Positioned(
          left: 188,
          top: 18,
          child: Text(
            'Autumn\nCollection\n2021',
            style: HomeTextStyles.bannerTitle,
          ),
        ),
      ],
    );
  }
}

class _PageIndicator extends StatelessWidget {
  final int count;
  final int current;

  const _PageIndicator({required this.count, required this.current});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < count; i++) ...[
          if (i > 0) SizedBox(width: i == 1 ? 11 : 11.5),
          i == current ? const _ActiveDot() : const _Dot(),
        ],
      ],
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 4,
      height: 4,
      decoration: const BoxDecoration(
        color: AppColors.white,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _ActiveDot extends StatelessWidget {
  const _ActiveDot();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10.5,
      height: 10.5,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.white),
      ),
      child: const _Dot(),
    );
  }
}
