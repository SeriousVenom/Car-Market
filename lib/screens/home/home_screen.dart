import 'package:car_market/components/widgets/app_bar.dart';
import 'package:car_market/components/widgets/footer.dart';
import 'package:car_market/domain/config/localization.dart';
import 'package:car_market/domain/config/navigation.dart';
import 'package:car_market/screens/home/bloc/home_bloc.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: AppLocalization.carMarket,
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                HeaderSection(),
                CombinedTextSection(),
                ProductCatalogSection(),
                BenefitsSection(),
                FooterW(),
              ],
            ),
          );
        },
      ),
    );
  }
}

// Header with image, title, and button
class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      color: Colors.grey[200],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 300,
            color: Colors.blueGrey,
            child: Center(child: Text('[Image]', style: TextStyle(color: Colors.white))),
          ),
          SizedBox(height: 20),
          SelectableText.rich(
            TextSpan(
              text: 'Welcome to Our Store',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {},
            child: Text('Learn More'),
          ),
        ],
      ),
    );
  }
}

// Combined text section for CompanyInfo and Footer to ensure single text selection logic
class CombinedTextSection extends StatelessWidget {
  const CombinedTextSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: SelectableText.rich(
        TextSpan(
          children: [
            TextSpan(
              text: 'About Our Company\n\n',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: 'We are a leading provider of quality products. Our mission is to deliver the best products to our customers.\n\n',
              style: TextStyle(fontSize: 16),
            ),
            TextSpan(
              text: 'Contact Us\n\n',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: 'Email: contact@myshop.com\n',
              style: TextStyle(fontSize: 16),
            ),
            TextSpan(
              text: 'Phone: +1 234 567 890\n\n',
              style: TextStyle(fontSize: 16),
            ),
            TextSpan(
              text: 'Privacy Policy\n',
              style: TextStyle(fontSize: 16, color: Colors.blue),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  // Handle link tap
                },
            ),
            TextSpan(
              text: 'Terms of Service\n',
              style: TextStyle(fontSize: 16, color: Colors.blue),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  // Handle link tap
                },
            ),
          ],
        ),
      ),
    );
  }
}

// Product catalog grid
class ProductCatalogSection extends StatelessWidget {
  const ProductCatalogSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Our Catalog', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 6,
              mainAxisSpacing: 8,
              crossAxisSpacing: 6,
              childAspectRatio: 1,
            ),
            itemCount: 6,
            itemBuilder: (context, index) {
              return ProductCard();
            },
          ),
          SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {},
              child: Text('View Full Catalog'),
            ),
          ),
        ],
      ),
    );
  }
}

// Product card for catalog
class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 5, offset: Offset(0, 3)),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.grey[300],
              child: Center(child: Text('[Image]', style: TextStyle(color: Colors.black54))),
            ),
          ),
          SizedBox(height: 10),
          Text('Product Name', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          Text('\$Price', style: TextStyle(color: Colors.green)),
        ],
      ),
    );
  }
}

// Section with benefits of working with us
class BenefitsSection extends StatelessWidget {
  const BenefitsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      color: Colors.grey[100],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Why Choose Us?', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Column(
            children: List.generate(3, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Icon(Icons.check, color: Colors.blue),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text('Benefit description goes here. We offer the best services for our clients.'),
                    ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
