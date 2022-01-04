import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kost/core/utils/utils.dart';

import 'widget/search_widget.dart';

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
              children: [
                appBar(context),
                profilWidget(context),
                Container(
                  height: heightMediaQuery(context) * 0.2,
                  decoration: BoxDecoration(
                    color: HexColor.containerItemsLight,
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
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade200,
          ),
        ),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  style: GoogleFonts.nunito(
                    fontSize: 17,
                    fontWeight: FontWeight.w900,
                    color: Colors.grey.shade500,
                  ),
                  text: 'Halo,',
                  children: [
                    const TextSpan(text: ' '),
                    TextSpan(
                      text: 'Fajar!',
                      style: GoogleFonts.nunito(
                        fontSize: 17,
                        fontWeight: FontWeight.w900,
                        color: HexColor.fontColorsBlack,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: HexColor.fontColorsOrange,
                    size: 14,
                  ),
                  const SizedBox(width: 3),
                  Text(
                    'Surakarta, Indonesia',
                    style: GoogleFonts.nunito(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Expanded(child: SizedBox()),
          Container(
            height: 40,
            width: 40,
            decoration: const BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget profilWidget(BuildContext context) {
    return Container(
      height: heightMediaQuery(context) * 0.3,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          SearchWidget(
            context,
          ),
        ],
      ),
    );
  }
}
