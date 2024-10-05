import 'package:car_market/components/ui_const.dart';
import 'package:car_market/domain/config/navigation.dart';
import 'package:car_market/screens/catalog/bloc/catalog_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BrandFilterDropdownW extends StatefulWidget {
  final String selectedBrand;

  const BrandFilterDropdownW({super.key, required List<String> brands, required this.selectedBrand}) : _brands = brands;

  final List<String> _brands;

  @override
  State<BrandFilterDropdownW> createState() => _BrandFilterDropdownWState();
}

class _BrandFilterDropdownWState extends State<BrandFilterDropdownW> {
  OverlayEntry? _overlayEntry;
  bool _isHovered = false;
  bool _isDropdownHovered = false;
  String? _selectedBrand;

  @override
  void didUpdateWidget(covariant BrandFilterDropdownW oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedBrand != oldWidget.selectedBrand) {
      setState(() {
        _selectedBrand = widget.selectedBrand;
      });
    }
  }

  @override
  void initState() {
    _selectedBrand = widget.selectedBrand;
    super.initState();
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
                children: widget._brands.map((brand) => _buildBrandOption(brand)).toList(),
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

  Widget _buildBrandOption(String brand) {
    return RadioListTile<String>(
      title: Text(brand),
      value: brand,
      groupValue: _selectedBrand,
      onChanged: (value) {
        setState(() {
          _selectedBrand = value!;
          _removeOverlay();
        });

        context.read<CatalogBloc>().add(FilterByBrand(brand: _selectedBrand!));
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
              const Icon(Icons.directions_car),
              const SizedBox(width: 4.0),
              Text(
                _selectedBrand!,
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
