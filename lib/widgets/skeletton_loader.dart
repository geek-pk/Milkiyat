import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

Widget skeletonLoader(context) {
  return SkeletonItem(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16, top: 100),
          child: SkeletonLine(
            style: SkeletonLineStyle(
                height: 270,
                width: double.infinity,
                borderRadius: BorderRadius.circular(16)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: SkeletonParagraph(
            style: SkeletonParagraphStyle(
              lines: 1,
              lineStyle: SkeletonLineStyle(
                  randomLength: true,
                  height: 16,
                  borderRadius: BorderRadius.circular(8),
                  maxLength: 200),
            ),
          ),
        ),
        SizedBox(
          height: 400,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SkeletonLine(
                        style: SkeletonLineStyle(
                            height: 150,
                            width: MediaQuery.of(context).size.width / 2,
                            borderRadius: BorderRadius.circular(16)),
                      ),
                      const SizedBox(height: 12),
                      SkeletonParagraph(
                        style: SkeletonParagraphStyle(
                          lines: 3,
                          lineStyle: SkeletonLineStyle(
                              randomLength: true,
                              height: 10,
                              borderRadius: BorderRadius.circular(16),
                              maxLength: 150),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SkeletonLine(
                        style: SkeletonLineStyle(
                            height: 150,
                            width: MediaQuery.of(context).size.width / 2,
                            borderRadius: BorderRadius.circular(16)),
                      ),
                      const SizedBox(height: 12),
                      SkeletonParagraph(
                        style: SkeletonParagraphStyle(
                          lines: 3,
                          lineStyle: SkeletonLineStyle(
                              randomLength: true,
                              height: 10,
                              borderRadius: BorderRadius.circular(16),
                              maxLength: 150),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
