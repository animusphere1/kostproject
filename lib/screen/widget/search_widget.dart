import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kost/core/utils/utils.dart';

class SearchWidget extends StatelessWidget {
  final bool isReadOnly;
  final Function? function;
  final FocusNode? focusNode;

  const SearchWidget(
    BuildContext context, {
    Key? key,
    this.isReadOnly = false,
    this.function,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: HexColor.fontColorsOrange,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade800.withOpacity(0.4),
              blurRadius: 1.0,
              spreadRadius: 0.5,
              offset: const Offset(0, 1.5),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              const Icon(Icons.search, size: 20, color: Colors.white),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  readOnly: isReadOnly,
                  focusNode: focusNode,
                  onTap: () =>
                      function != null ? function!() : debug('Masih Kosong'),
                  decoration: InputDecoration(
                    hintText: "Cari Kost ?",
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintStyle: GoogleFonts.nunito(
                      height: 1.3,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                  style: GoogleFonts.nunito(
                    height: 1.3,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
