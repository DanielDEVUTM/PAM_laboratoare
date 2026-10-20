import 'package:flutter/material.dart';
import 'package:fluttersdk_wind/fluttersdk_wind.dart';

class SearchField extends StatefulWidget {
  /// Textul curent din state; daca se schimba din afara (Clear filters),
  /// campul se actualizeaza.
  final String value;
  final ValueChanged<String> onChanged;

  const SearchField({super.key, this.value = '', required this.onChanged});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  late final TextEditingController _controller = TextEditingController(
    text: widget.value,
  );

  @override
  void didUpdateWidget(SearchField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != _controller.text) _controller.text = widget.value;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _clear() {
    _controller.clear();
    widget.onChanged('');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final hint = context.wColorExt('pebble');

    return WDiv(
      className: 'h-[46px] rounded-full bg-pearl border border-divider',
      child: TextField(
        controller: _controller,
        onChanged: (value) {
          widget.onChanged(value);
          setState(() {});
        },
        textInputAction: TextInputAction.search,
        style: TextStyle(fontSize: 14, color: context.wColorExt('ink')),
        decoration: InputDecoration(
          hintText: 'Search products',
          hintStyle: TextStyle(fontSize: 14, color: hint),
          prefixIcon: Icon(Icons.search, color: hint, size: 20),
          suffixIcon: _controller.text.isEmpty
              ? null
              : IconButton(
                  icon: Icon(Icons.close, color: hint, size: 18),
                  onPressed: _clear,
                ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 13),
        ),
      ),
    );
  }
}
