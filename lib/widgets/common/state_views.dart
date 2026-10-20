import 'package:flutter/material.dart';
import 'package:fluttersdk_wind/fluttersdk_wind.dart';

/// Starea Loading.
class LoadingView extends StatelessWidget {
  final String message;

  const LoadingView({super.key, this.message = 'Loading products...'});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: WDiv(
        className: 'flex flex-col items-center',
        children: [
          SizedBox(
            width: 32,
            height: 32,
            child: CircularProgressIndicator(
              strokeWidth: 3,
              color: context.wColorExt('brown'),
            ),
          ),
          WText(message, className: 'mt-[16px] text-[14px] text-muted'),
        ],
      ),
    );
  }
}

/// Starea Empty: nu exista date sau nimic nu corespunde filtrelor.
class EmptyView extends StatelessWidget {
  final String title;
  final String message;
  final IconData icon;
  final String? actionLabel;
  final VoidCallback? onAction;

  const EmptyView({
    super.key,
    required this.title,
    required this.message,
    this.icon = Icons.search_off,
    this.actionLabel,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return _MessageView(
      icon: icon,
      iconClassName: 'text-[56px] text-smoke',
      title: title,
      message: message,
      actionLabel: actionLabel,
      onAction: onAction,
    );
  }
}

/// Starea Error, cu buton de reincercare.
class ErrorView extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const ErrorView({super.key, required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return _MessageView(
      icon: Icons.error_outline,
      iconClassName: 'text-[56px] text-salmon',
      title: 'Something went wrong',
      message: message,
      actionLabel: 'Try again',
      onAction: onRetry,
    );
  }
}

class _MessageView extends StatelessWidget {
  final IconData icon;
  final String iconClassName;
  final String title;
  final String message;
  final String? actionLabel;
  final VoidCallback? onAction;

  const _MessageView({
    required this.icon,
    required this.iconClassName,
    required this.title,
    required this.message,
    this.actionLabel,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: WDiv(
        className: 'flex flex-col items-center px-[40px]',
        children: [
          WIcon(icon, className: iconClassName),
          WText(
            title,
            className: 'mt-[16px] text-[18px] font-medium text-ink text-center',
          ),
          WText(
            message,
            className:
                'mt-[8px] text-[13px] leading-[19px] text-muted text-center',
          ),
          if (actionLabel != null && onAction != null)
            WDiv(
              className: 'mt-[24px]',
              child: PrimaryButton(label: actionLabel!, onTap: onAction!),
            ),
        ],
      ),
    );
  }
}

/// Buton plin, in stilul butonului "Add To Cart".
class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const PrimaryButton({super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return WAnchor(
      onTap: onTap,
      child: WDiv(
        className: 'px-[28px] py-[12px] rounded-full bg-carbon',
        child: WText(label, className: 'text-[14px] font-medium text-white'),
      ),
    );
  }
}
