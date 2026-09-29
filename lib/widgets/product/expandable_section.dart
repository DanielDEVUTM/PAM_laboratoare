import 'package:flutter/material.dart';
import 'package:fluttersdk_wind/fluttersdk_wind.dart';

/// Sectiune cu titlu si sageata (Description, Reviews, Similar Product).
/// La apasare se strange / se deschide continutul.
class ExpandableSection extends StatefulWidget {
  final String title;
  final Widget child;

  const ExpandableSection({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  State<ExpandableSection> createState() => _ExpandableSectionState();
}

class _ExpandableSectionState extends State<ExpandableSection> {
  bool _expanded = true;

  @override
  Widget build(BuildContext context) {
    return WDiv(
      className: 'flex flex-col items-stretch',
      children: [
        WAnchor(
          onTap: () => setState(() => _expanded = !_expanded),
          child: WDiv(
            className: 'flex flex-row items-center justify-between h-[47px]',
            children: [
              WText(
                widget.title,
                className: 'mt-[5px] font-mont text-[15.5px] font-medium text-charcoal',
              ),
              Transform.translate(
                offset: const Offset(3.5, 5.5),
                child: WIcon(
                  _expanded
                      ? Icons.keyboard_arrow_down
                      : Icons.keyboard_arrow_right,
                  className: 'text-[28px] text-charcoal',
                ),
              ),
            ],
          ),
        ),
        const WDiv(className: 'h-[1px] bg-divider'),
        if (_expanded) widget.child,
      ],
    );
  }
}
