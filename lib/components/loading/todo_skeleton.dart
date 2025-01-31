import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class TodoSkeleton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          title: Container(
            width: double.infinity,
            height: 20,
            color: Colors.white,
          ),
          subtitle: Container(
            width: double.infinity,
            height: 15,
            margin: EdgeInsets.only(top: 8),
            color: Colors.white,
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              3,
              (index) => Container(
                width: 30,
                height: 30,
                margin: EdgeInsets.only(left: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
} 