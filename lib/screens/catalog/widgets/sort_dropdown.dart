import 'package:car_market/components/ui_const.dart';
import 'package:flutter/material.dart';

class SortDropdown extends StatefulWidget {
  const SortDropdown({super.key});

  @override
  _SortDropdownState createState() => _SortDropdownState();
}

class _SortDropdownState extends State<SortDropdown> {
  OverlayEntry? _overlayEntry;
  String _selectedOption = 'По популярности';
  bool _isHovered = false;
  bool _isDropdownHovered = false;

  void _showOverlay(BuildContext context) {
    if (_overlayEntry != null) return;

    final overlay = Overlay.of(context);
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: offset.dy + size.height,
        left: offset.dx,
        child: MouseRegion(
          onEnter: (_) {
            setState(() {
              _isDropdownHovered = true;
            });
          },
          onExit: (_) {
            _isDropdownHovered = false;
            _delayedRemoveOverlay();
          },
          child: Material(
            elevation: 4.0,
            child: Container(
              width: size.width,
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildOption('По популярности'),
                  _buildOption('По цене: от низкой к высокой'),
                  _buildOption('По цене: от высокой к низкой'),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    overlay?.insert(_overlayEntry!);
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void _delayedRemoveOverlay() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (!_isHovered && !_isDropdownHovered) {
        _removeOverlay();
      }
    });
  }

  Widget _buildOption(String option) {
    return RadioListTile<String>(
      title: Text(option),
      value: option,
      groupValue: _selectedOption,
      onChanged: (value) {
        setState(() {
          _selectedOption = value!;
          _removeOverlay();
        });
        // Здесь можно добавить логику для обновления сортировки
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          _isHovered = true;
          _showOverlay(context);
        });
      },
      onExit: (event) {
        setState(() {
          _isHovered = false;
          _delayedRemoveOverlay();
        });
      },
      child: Container(
        width: 300.0,
        decoration: BoxDecoration(
          color: _isHovered ? Colors.grey[300] : Colors.grey[200],
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(Icons.sort),
              const SizedBox(width: 4.0),
              Text(
                _selectedOption,
                style: AppTextStyles.mainStyle,
              ),
              const Spacer(),
              const Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
      ),
    );
  }
}
