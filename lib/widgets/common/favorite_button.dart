import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttersdk_wind/fluttersdk_wind.dart';

import '../../cubits/favorites/favorites_cubit.dart';

/// Inima rotunda alba care adauga/elimina produsul din favorite.
class FavoriteButton extends StatelessWidget {
  final String productId;
  final double size;

  const FavoriteButton({super.key, required this.productId, this.size = 32});

  @override
  Widget build(BuildContext context) {
    final favorite = context.select<FavoritesCubit, bool>(
      (cubit) => cubit.state.contains(productId),
    );

    return WAnchor(
      onTap: () => context.read<FavoritesCubit>().toggle(productId),
      child: WDiv(
        className:
            'flex items-center justify-center size-[${size}px] rounded-full bg-white shadow-button',
        children: [
          WIcon(
            favorite ? Icons.favorite : Icons.favorite_border,
            className: 'text-[${(size * 0.56).round()}px] text-salmon',
          ),
        ],
      ),
    );
  }
}

/// Iconita de favorite cu numarul de produse salvate.
class FavoritesBadge extends StatelessWidget {
  final VoidCallback onTap;

  const FavoritesBadge({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final count = context.select<FavoritesCubit, int>((c) => c.state.length);

    return WAnchor(
      onTap: onTap,
      child: WDiv(
        className: 'relative w-[28px] h-[26px]',
        children: [
          const WIcon(
            Icons.favorite_border,
            className: 'text-[24px] text-black',
          ),
          if (count > 0)
            WDiv(
              className: 'absolute top-0 right-0 flex items-center justify-center size-[14px] rounded-full bg-berry',
              children: [
                WText('$count', className: 'text-[8px] font-bold text-white'),
              ],
            ),
        ],
      ),
    );
  }
}
