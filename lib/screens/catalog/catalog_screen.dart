import 'package:car_market/components/ui_const.dart';
import 'package:car_market/components/widgets/app_bar.dart';
import 'package:car_market/components/widgets/footer.dart';
import 'package:car_market/data/models/vehicle_model.dart';
import 'package:car_market/domain/config/localization.dart';
import 'package:car_market/screens/catalog/bloc/catalog_bloc.dart';
import 'package:car_market/screens/catalog/widgets/brend_filter.dart';
import 'package:car_market/screens/catalog/widgets/price_filter.dart';
import 'package:car_market/screens/catalog/widgets/product_card.dart';
import 'package:car_market/screens/catalog/widgets/sort_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(title: AppLocalization.catalogTitle),
      backgroundColor: Colors.white,
      body: BlocBuilder<CatalogBloc, CatalogState>(
        builder: (context, state) {
          switch (state.status) {
            case CatalogStatus.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case CatalogStatus.inProgress:
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const SizedBox(height: 14.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: ResponsiveRowColumn(
                        rowMainAxisAlignment: MainAxisAlignment.start,
                        columnCrossAxisAlignment: CrossAxisAlignment.start,
                        layout: ResponsiveRowColumnType.ROW,
                        children: [
                          ResponsiveRowColumnItem(
                            rowFlex: 1,
                            child: SortDropdownW(selectedSort: state.listSort),
                          ),
                          const ResponsiveRowColumnItem(
                            child: SizedBox(width: 14.0, height: 14.0),
                          ),
                          ResponsiveRowColumnItem(
                            rowFlex: 1,
                            child: PriceFilterDropdownW(
                              minPrice: state.filterMinPrice,
                              maxPrice: state.filterMaxPrice,
                              onTap: (minPrice, maxPrice) => context.read<CatalogBloc>().add(
                                    FilterByPriceRange(minPrice: minPrice, maxPrice: maxPrice),
                                  ),
                            ),
                          ),
                          const ResponsiveRowColumnItem(
                            child: SizedBox(width: 14.0, height: 14.0),
                          ),
                          ResponsiveRowColumnItem(
                            rowFlex: 1,
                            child: BrandFilterDropdownW(
                              brands: state.brandList,
                              selectedBrand: state.currentFilterBrand,
                            ),
                          ),
                          const ResponsiveRowColumnItem(
                            child: SizedBox(width: 14.0, height: 14.0),
                          ),
                          ResponsiveRowColumnItem(
                            rowFlex: 1,
                            child: ElevatedButton(
                              onPressed: () => context.read<CatalogBloc>().add(const ResetFilters()),
                              child: const Text('Сбросить фильтры'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: ResponsiveValue<double>(
                            context,
                            defaultValue: 350,
                            conditionalValues: [
                              Condition.smallerThan(name: TABLET, value: 200),
                              Condition.largerThan(name: DESKTOP, value: 450),
                            ],
                          ).value,
                          mainAxisSpacing: 8.0,
                          crossAxisSpacing: 8.0,
                          // childAspectRatio: 0.85,
                        ),
                        itemCount: state.filteredVehicleList.length,
                        itemBuilder: (context, index) {
                          VehicleModel vehicle = state.filteredVehicleList[index];
                          return ProductCardW(
                            vehicle: vehicle,
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    const FooterW(),
                  ],
                ),
              );
            case CatalogStatus.success:
              return const Center(
                child: Text('Success'),
              );
            case CatalogStatus.failure:
              return const Center(
                child: Text('Error'),
              );
          }
        },
      ),
    );
  }
}
