import 'package:car_market/components/ui_const.dart';
import 'package:car_market/domain/config/navigation.dart';
import 'package:car_market/screens/catalog/bloc/catalog_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SortDropdownW extends StatefulWidget {
  final SortType selectedSort;

  const SortDropdownW({super.key, required this.selectedSort});

  @override
  State<SortDropdownW> createState() => _SortDropdownWState();
}

class _SortDropdownWState extends State<SortDropdownW> {
  OverlayEntry? _overlayEntry;
  SortType _selectedOption = SortType.defaultOrder;
  bool _isHovered = false;
  bool _isDropdownHovered = false;

  @override
  void didUpdateWidget(covariant SortDropdownW oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedSort != oldWidget.selectedSort) {
      setState(() {
        _selectedOption = widget.selectedSort;
      });
    }
  }

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
                  _buildOption(SortType.defaultOrder),
                  _buildOption(SortType.priceAscending),
                  _buildOption(SortType.priceDescending),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    overlay.insert(_overlayEntry!);
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

  Widget _buildOption(SortType option) {
    return RadioListTile<SortType>(
      title: Text(option.title),
      value: option,
      groupValue: _selectedOption,
      onChanged: (value) {
        setState(() {
          _selectedOption = value!;
          _removeOverlay();
        });
        context.read<CatalogBloc>().add(SortingList(sortType: _selectedOption));
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
                _selectedOption.title,
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
