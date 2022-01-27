import 'package:flutter/material.dart';
import 'package:kost/core/models/distanceyou_models.dart';
import 'package:kost/core/utils/utils.dart';

class DistanceItem extends StatelessWidget {
  const DistanceItem({
    Key? key,
    required this.context,
    required this.distanceYou,
  }) : super(key: key);

  final BuildContext context;
  final DistanceYouModel? distanceYou;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthMediaQuery(context),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: const BoxDecoration(),
        child: Stack(
          children: [
            Container(
              height: (heightMediaQuery(context) * 0.3) * 0.47,
              decoration: BoxDecoration(
                color: distanceYou!.isBookmark! ? Colors.orange : Colors.blue,
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 40,
                  horizontal: 10,
                ),
                height: (heightMediaQuery(context) * 0.3) * 0.7,
                width: widthMediaQuery(context) * 0.7,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.4),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: distanceYou != null
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(distanceYou!.name!),
                        ],
                      )
                    : const SizedBox(),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                height: (heightMediaQuery(context) * 0.3) * 0.53,
                width: widthMediaQuery(context) * 0.19,
                decoration: const BoxDecoration(),
                child: Column(
                  children: List.from([
                    Icons.bookmarks_outlined,
                    Icons.bubble_chart_rounded
                  ])
                      .map(
                        (e) => Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 6,
                              horizontal: 10,
                            ),
                            child: Container(
                              width: 50,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                              child: Icon(
                                e,
                                color: (distanceYou!.isBookmark! &&
                                        e == Icons.bookmarks_outlined)
                                    ? Colors.blue.shade600
                                    : Colors.grey.shade400,
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DistanceItemShimmer extends StatelessWidget {
  const DistanceItemShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthMediaQuery(context),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: const BoxDecoration(),
        child: Stack(
          children: [
            Container(
              height: (heightMediaQuery(context) * 0.3) * 0.47,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.4),
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 40,
                  horizontal: 10,
                ),
                height: (heightMediaQuery(context) * 0.3) * 0.7,
                width: widthMediaQuery(context) * 0.7,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.4),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                height: (heightMediaQuery(context) * 0.3) * 0.53,
                width: widthMediaQuery(context) * 0.19,
                decoration: const BoxDecoration(),
                child: Column(
                  children: List.from([
                    Icons.bookmarks_outlined,
                    Icons.bubble_chart_rounded
                  ])
                      .map(
                        (e) => Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 6,
                              horizontal: 10,
                            ),
                            child: Container(
                              width: 50,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
