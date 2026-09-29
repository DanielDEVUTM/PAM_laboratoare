import 'package:flutter/material.dart';
import 'package:fluttersdk_wind/fluttersdk_wind.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const WDiv(
      className: 'flex flex-row items-center justify-between h-[64px] px-[31px]',
      children: [
        _MenuButton(),
        WDiv(
          className: 'pl-[4px]',
          child: WText(
            'GemStore',
            className: 'text-[19px] font-bold text-black',
          ),
        ),
        _NotificationButton(),
      ],
    );
  }
}

class _MenuButton extends StatelessWidget {
  const _MenuButton();

  @override
  Widget build(BuildContext context) {
    return WAnchor(
      onTap: () {},
      child: const WDiv(
        className: 'flex flex-col items-start justify-center size-[22px]',
        children: [
          WDiv(className: 'w-[12px] h-[2px] rounded-full bg-charcoal'),
          WDiv(className: 'w-[20px] h-[2px] mt-[6px] rounded-full bg-charcoal'),
          WDiv(className: 'w-[20px] h-[2px] mt-[7px] rounded-full bg-charcoal'),
        ],
      ),
    );
  }
}

class _NotificationButton extends StatelessWidget {
  const _NotificationButton();

  @override
  Widget build(BuildContext context) {
    return WAnchor(
      onTap: () {},
      child: WDiv(
        className: 'relative w-[24px] h-[26px]',
        children: [
          Image.asset(
            'assets/icons/bell.png',
            width: 24,
            height: 26,
            color: Colors.black,
          ),
          const WDiv(
            className:
                'absolute top-[4px] right-[4px] size-[7px] rounded-full bg-berry',
          ),
        ],
      ),
    );
  }
}
