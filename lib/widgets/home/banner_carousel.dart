import 'package:flutter/material.dart';
import 'package:fluttersdk_wind/fluttersdk_wind.dart';

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
    return WDiv(
      className: 'px-[32px]',
      child: WDiv(
        className: 'relative h-[168px] rounded-xl overflow-hidden',
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: _pages,
            onPageChanged: (index) => setState(() => _current = index),
            itemBuilder: (context, index) => const _BannerPage(),
          ),
          WDiv(
            className: 'absolute bottom-[9px] left-0 right-0',
            child: _PageIndicator(count: _pages, current: _current),
          ),
        ],
      ),
    );
  }
}

class _BannerPage extends StatelessWidget {
  const _BannerPage();

  @override
  Widget build(BuildContext context) {
    return const WDiv(
      className: 'relative w-full h-[168px]',
      children: [
        WImage(
          src: 'asset://assets/images/banner.jpg',
          className: 'w-full h-[168px] object-cover',
        ),
        WText(
          'Autumn\nCollection\n2021',
          className:
              'absolute top-[18px] left-[188px] text-[22.5px] font-bold leading-[31px] text-white',
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
    return WDiv(
      className: 'flex flex-row items-center justify-center',
      children: [
        for (int i = 0; i < count; i++)
          WDiv(
            className: i == 0 ? '' : (i == 1 ? 'ml-[11px]' : 'ml-[11.5px]'),
            child: i == current ? const _ActiveDot() : const _Dot(),
          ),
      ],
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot();

  @override
  Widget build(BuildContext context) {
    return const WDiv(className: 'size-[4px] rounded-full bg-white');
  }
}

class _ActiveDot extends StatelessWidget {
  const _ActiveDot();

  @override
  Widget build(BuildContext context) {
    return const WDiv(
      className:
          'flex items-center justify-center size-[10.5px] rounded-full border border-white',
      children: [_Dot()],
    );
  }
}
