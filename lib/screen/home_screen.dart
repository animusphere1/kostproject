import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kost/core/utils/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: HexColor.backgroundColorsLight,
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                appBar(context),
                SizedBox(
                  height: heightMediaQuery(context) * 0.04,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, right: 20, bottom: 20),
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
                SizedBox(height: heightMediaQuery(context) * 0.04),
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
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget appBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
                    fontWeight: FontWeight.bold,
                    color: HexColor.fontsColorsBlue,
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

  final List<int> listNya = [1, 2, 3, 4, 5];

  Widget listDistance(BuildContext context) {
    return SizedBox(
      height: heightMediaQuery(context) * 0.3,
      child: ListView.builder(
        itemCount: listNya.length + 1,
        scrollDirection: Axis.horizontal,
        physics: const PageScrollPhysics(),
        itemBuilder: (context, i) => i != listNya.length
            ? distanceItems(context, i)
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

  Widget distanceItems(BuildContext context, int i) {
    return Container(
      width: widthMediaQuery(context),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: const BoxDecoration(),
        child: Stack(
          children: [
            Container(
              height: (heightMediaQuery(context) * 0.3) * 0.5,
              decoration: BoxDecoration(
                color: i.isEven ? Colors.orange : Colors.blue,
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
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
          ],
        ),
      ),
    );
  }
}
