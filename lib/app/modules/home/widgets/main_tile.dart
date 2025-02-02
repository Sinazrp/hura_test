import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hura_test/core/extensions/color.dart';

class MainTile extends StatelessWidget {
  final Widget icon;
  final String title;
  final Function onTap;

  const MainTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Container(
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: context.getScheme.primary.withOpacity(0.3),
              width: 1,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              Gap(8),
              Text(title,
                  style: TextStyle(
                      fontSize: 15, color: context.getScheme.primary)),
            ],
          ),
        ),
      ),
    );
  }
}
