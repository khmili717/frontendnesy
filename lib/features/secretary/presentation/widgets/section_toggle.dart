import 'package:flutter/material.dart';

class SectionToggle extends StatelessWidget {
  final TabController tabController;
  final String? semanticsLabel;

  const SectionToggle({
    super.key,
    required this.tabController,
    this.semanticsLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: semanticsLabel ?? 'Basculer entre les sections',
      child: Container(
        height: 50,
        constraints: const BoxConstraints(maxWidth: 400),
        decoration: BoxDecoration(
          color: const Color(0xFFE8FAFA),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 4),
              blurRadius: 8,
              color: const Color(0xFFD6D6D6).withOpacity(0.15),
            ),
          ],
        ),
        child: AnimatedBuilder(
          animation: tabController,
          builder: (context, child) {
            return Row(
              children: [
                // Patients tab
                Expanded(
                  child: GestureDetector(
                    onTap: () => tabController.animateTo(0),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: tabController.index == 0 
                            ? const Color(0xFF11939A) 
                            : Colors.transparent,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Patients',
                          style: TextStyle(
                            fontFamily: 'League Spartan',
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: tabController.index == 0 
                                ? const Color(0xFFE8FAFA) 
                                : const Color(0xFF11939A),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // Appointments tab
                Expanded(
                  child: GestureDetector(
                    onTap: () => tabController.animateTo(1),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: tabController.index == 1 
                            ? const Color(0xFF11939A) 
                            : Colors.transparent,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Rendez-vous',
                          style: TextStyle(
                            fontFamily: 'League Spartan',
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: tabController.index == 1 
                                ? const Color(0xFFE8FAFA) 
                                : const Color(0xFF11939A),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
} 