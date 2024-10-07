import 'package:car_market/components/ui_const.dart';
import 'package:car_market/screens/catalog/bloc/catalog_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class PriceFilterDropdownW extends StatefulWidget {
  final double? minPrice;
  final double? maxPrice;

  const PriceFilterDropdownW({
    super.key,
    required Function(double?, double?) onTap,
    this.minPrice,
    this.maxPrice,
  }) : _onTap = onTap;

  final Function(double?, double?) _onTap;

  @override
  State<PriceFilterDropdownW> createState() => _PriceFilterDropdownWState();
}

class _PriceFilterDropdownWState extends State<PriceFilterDropdownW> {
  OverlayEntry? _overlayEntry;
  bool _isHovered = false;
  bool _isDropdownHovered = false;
  double? _minPrice;
  double? _maxPrice;

  final TextEditingController _minPriceController = TextEditingController();
  final TextEditingController _maxPriceController = TextEditingController();

  @override
  void didUpdateWidget(covariant PriceFilterDropdownW oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.minPrice != oldWidget.minPrice || widget.maxPrice != oldWidget.maxPrice) {
      setState(() {
        _minPriceController.text = widget.minPrice?.toString() ?? '';
        _maxPriceController.text = widget.maxPrice?.toString() ?? '';
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
              padding: const EdgeInsets.all(8.0),
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildPriceInputField('Минимальная цена', _minPriceController),
                  const SizedBox(height: 8.0),
                  _buildPriceInputField('Максимальная цена', _maxPriceController),
                  const SizedBox(height: 8.0),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _minPrice = double.tryParse(_minPriceController.text);
                        _maxPrice = double.tryParse(_maxPriceController.text);
                        _removeOverlay();
                      });
                      widget._onTap(_minPrice, _maxPrice);
                    },
                    child: const Text('Применить'),
                  )
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

  Widget _buildPriceInputField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
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
        width: ResponsiveValue<double>(
          context,
          defaultValue: 300.0,
          conditionalValues: [
            Condition.smallerThan(name: TABLET, value: 200.0),
            Condition.largerThan(name: DESKTOP, value: 400.0),
          ],
        ).value!,
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
              const Icon(Icons.filter_alt),
              const SizedBox(width: 4.0),
              Text(
                'Фильтр по цене',
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

  @override
  void dispose() {
    _minPriceController.dispose();
    _maxPriceController.dispose();
    super.dispose();
  }
}
