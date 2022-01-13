import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kost/core/models/distanceyou_models.dart';

import '../widget/widget.dart';
import 'package:kost/core/utils/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: HexColor.backgroundColorsLight,
        body: Stack(
          children: [
            RefreshIndicator(
              edgeOffset: 50,
              onRefresh: () async => await Future.delayed(
                const Duration(seconds: 2),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: heightMediaQuery(context) * 0.17,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20, bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Distance You',
                            style: GoogleFonts.nunito(
                              color: HexColor.fontsColorsBlue,
                              // letterSpacing: -0.1,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'See More',
                            style: GoogleFonts.nunito(
                              color: Colors.grey.shade500,
                              // letterSpacing: -0.1,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    listDistance(context),
                    SizedBox(height: heightMediaQuery(context) * 0.02),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        'Following',
                        style: GoogleFonts.nunito(
                          color: HexColor.fontsColorsBlue,
                          // letterSpacing: -0.1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: heightMediaQuery(context) * 0.02),
                    SizedBox(
                      height: heightMediaQuery(context) * 0.22,
                      child: ListView.builder(
                        itemCount: 4,
                        physics: const PageScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, i) => followingItem(context, i),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            appBar(context),
          ],
        ),
      ),
    );
  }

  Widget followingItem(BuildContext context, int i) {
    return Container(
      width: widthMediaQuery(context),
      padding: const EdgeInsets.only(right: 20, left: 20),
      child: Container(
        decoration: BoxDecoration(
          color: i.isEven ? Colors.grey : Colors.yellow,
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget appBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      height: heightMediaQuery(context) * 0.135,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  style: GoogleFonts.nunito(
                    fontSize: 12,
                    fontWeight: FontWeight.w900,
                    color: Colors.grey.shade500,
                  ),
                  text: 'Halo,',
                  children: [
                    const TextSpan(text: ' '),
                    TextSpan(
                      text: 'Fajar!',
                      style: GoogleFonts.nunito(
                        fontSize: 12,
                        fontWeight: FontWeight.w900,
                        color: HexColor.fontColorsBlack,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                child: Text(
                  'Be a Smart Consument',
                  maxLines: 2,
                  style: GoogleFonts.nunito(
                    fontSize: 17,
                    letterSpacing: -0.5,
                    fontWeight: FontWeight.w800,
                    color: HexColor.fontColorsBlack,
                    wordSpacing: -0.5,
                  ),
                ),
              )
            ],
          ),
          const Expanded(child: SizedBox()),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  offset: const Offset(0, 0.5),
                  blurRadius: 2.0,
                  spreadRadius: 0.2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Map<String, dynamic>> list = [
    {'name': 'Fajar'},
    {'name': 'Doni'},
  ];

  Widget listDistance(BuildContext context) {
    return SizedBox(
      height: heightMediaQuery(context) * 0.3,
      child: ListView.builder(
        itemCount: list.length,
        scrollDirection: Axis.horizontal,
        physics: const PageScrollPhysics(),
        itemBuilder: (context, i) => i != 4
            ? DistanceItem(
                context: context,
                distanceYou: DistanceYouModel.fromMap(list[i]),
              )
            : Container(
                width: widthMediaQuery(context) * 0.3,
                padding: const EdgeInsets.only(right: 20, left: 5),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
