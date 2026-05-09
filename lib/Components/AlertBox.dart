import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:student_managemnet/Provider/Counter_Provider.dart';

void showResetDialouge(
  BuildContext context, {
  required VoidCallbackAction onReset,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        child: Container(
          height: 220,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 5),
              Container(
                height: 80,
                width: 80,

                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/thinking.png"),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.white,
                ),
              ),
              Text(
                "Reset Alert",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                ),
              ),
              Text(
                "Are you sure you want to reset?\nThis action cannot be undone.",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w300,
                  fontSize: 14,
                  color: Colors.grey.shade700,
                ),
              ),
              SizedBox(height: 10),
              // line Container
              Container(height: 0.5, color: Colors.grey.shade300),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //Cancel Button
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 40,
                        width: 120,

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Center(
                          child: Text(
                            "Cancel",
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),

                        //Reset Button
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        onReset() {}
                      },
                      child: Container(
                        height: 40,
                        width: 120,

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.redAccent,
                        ),
                        child: Center(
                          child: Text(
                            "Reset",
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
