import 'package:flutter/material.dart';

class FooterW extends StatelessWidget {
  const FooterW({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      color: Colors.blueGrey[800],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SelectableText(
            'Contact Us',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 10),
          SelectableText('Email: contact@myshop.com', style: TextStyle(color: Colors.white)),
          SelectableText('Phone: +1 234 567 890', style: TextStyle(color: Colors.white)),
          SizedBox(height: 20),
          Row(
            children: [
              TextButton(
                onPressed: () {},
                child: SelectableText('Privacy Policy', style: TextStyle(color: Colors.white)),
              ),
              SizedBox(width: 10),
              TextButton(
                onPressed: () {},
                child: SelectableText('Terms of Service', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
