import 'package:flutter/material.dart';
import '../responsive.dart';
import '../app_theme.dart';
import '../widgets/gradient_button.dart';

class MixerVipScreen extends StatelessWidget {
  const MixerVipScreen({Key? key}) : super(key: key);

  Widget _header(BuildContext context, Sizing s) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Mixer",
          style: TextStyle(
            fontSize: s.scale(20),
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        Icon(Icons.close, size: s.scale(22), color: AppColors.muted),
      ],
    );
  }

  Widget _planCard(BuildContext context, Sizing s,
      {required String title,
        required String price,
        required String description,
        required Color backgroundColor,
        required bool selected}) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(s.scale(14)),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color:  Colors.grey.shade300,
            width: selected ? 2 : 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: s.scale(14),
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF22242B)
                    ,
                  ),
                ),
                Image.asset(
                  "assets/images/image868.png",
                  width: s.scale(35.2),
                  height: s.scale(35.2),
                  color: selected ? Color(0xFFA16000)
                      : Colors.pink,
                ),
              ],
            ),
            SizedBox(height: s.scale(6)),
            Text(
              price,
              style: TextStyle(
                fontSize: s.scale(18),
                fontWeight: FontWeight.bold,
                color: selected?  Color(0xFFA16000):Color(0xFF5E1053),
              ),
            ),
            SizedBox(height: s.scale(4)),
            Text(
              description,
              style: TextStyle(
                fontSize: s.scale(12),
                color: AppColors.muted,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _featureItem(BuildContext context, Sizing s, String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: s.scale(6)),
      child: Row(
        children: [
          Icon(Icons.check, color: Color(0xFFFFCC99), size: s.scale(16)),
          SizedBox(width: s.scale(8)),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: s.scale(13),
                color: AppColors.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final s = Sizing(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: s.scale(20),
            vertical: s.scale(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _header(context, s),
              SizedBox(height: s.scale(20)),
              Text(
                "Level Up Your Mixer Experience",
                style: TextStyle(
                  fontSize: s.scale(18),
                  fontWeight: FontWeight.w900,
                  color: Colors.brown,
                ),
              ),
              SizedBox(height: s.scale(60)),
              Text(
                "Select a plan",
                style: TextStyle(
                  fontSize: s.scale(14),
                  color: AppColors.muted,
                ),
              ),
              SizedBox(height: s.scale(14)),
              Row(
                children: [
                  _planCard(
                    context,
                    s,
                    title: "Mixer",
                    price: "\$24.99",
                    description: "All of the below",
                    selected: false,
                    backgroundColor: AppColors.redu,
                  ),
                  SizedBox(width: s.scale(12)),
                  _planCard(
                    context,
                    s,
                    title: "Mixer VIP",
                    price: "\$99.99",
                    description: "Mixer + VIP seating,\nfood & beverages",
                    selected: true,
                    backgroundColor: Color(0xFFFFF1D1),
                  ),
                ],
              ),
              SizedBox(height: s.scale(40)),

              // Features container with label cutting border
              Stack(
                clipBehavior: Clip.none,
                children: [
                  // Main container with features
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(s.scale(14)),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFF4E4),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Color(0xFFA16000)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: s.scale(20)), // leave space for label box
                        _featureItem(context, s, "Unlimited Likes"),
                        _featureItem(context, s, "See who liked you"),
                        _featureItem(context, s, "Find people with wide range"),
                        _featureItem(context, s, "Access to events"),
                        _featureItem(context, s, "VIP seating, food & beverages"),
                      ],
                    ),
                  ),

                  // Label box positioned in the middle of container top border
                  Positioned(
                    top: -s.scale(12), // adjust to overlap border
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: s.scale(16),
                          vertical: s.scale(6),
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFFFF4E4), // box background
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Color(0xFFA16000)),
                        ),
                        child: Text(
                          "Included with Mixer VIP",
                          style: TextStyle(
                            fontSize: s.scale(12),
                            fontWeight: FontWeight.w500,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),

              GradientButton(
                colors: [Color(0xFFF9A825), Color(0xFF8E6B32)],
                height: s.scale(50),
                borderRadius: 30,
                onPressed: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      "assets/images/image868.png",
                      width: s.scale(24),
                      height: s.scale(24),
                    ),
                    SizedBox(width: s.scale(8)),
                    Text(
                      "Continue – \$99.99 total",
                      style: TextStyle(
                        fontSize: s.scale(16),
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: s.scale(12)),
              Text(
                "By continuing, you agree to be charged, with auto-renewal until canceled "
                    "in App Store settings, under Mixer’s Terms.",
                style: TextStyle(
                  fontSize: s.scale(10),
                  color: AppColors.muted,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

