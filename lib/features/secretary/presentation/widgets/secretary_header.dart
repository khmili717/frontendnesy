import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foresight_care/features/auth/presentation/providers/auth_provider.dart';

class SecretaryHeader extends ConsumerWidget {
  const SecretaryHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);
    
    return _buildHeader(user?.nom ?? '', user?.prenom ?? '');
  }

  Widget _buildHeader(String nom, String prenom) {
    return Container(
      width: 361,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left side - Profile and welcome
          Expanded(
            child: Row(
              children: [
                // Profile picture container
                Container(
                  width: 40.75,
                  height: 40.97,
                  child: Stack(
                    children: [
                      // Background circle
                      Container(
                        width: 40.75,
                        height: 40.97,
                        decoration: BoxDecoration(
                          color: const Color(0xFFD9D9D9),
                          borderRadius: BorderRadius.circular(28.62),
                        ),
                      ),
                      // Profile image placeholder
                      Positioned(
                        left: -15,
                        top: -14.29,
                        child: Container(
                          width: 72,
                          height: 72,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: const Color(0xFF15AEB4),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                // Welcome text
                Container(
                  width: 101,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'BIENVENU,',
                        style: const TextStyle(
                          fontFamily: 'League Spartan',
                          fontWeight: FontWeight.w300,
                          fontSize: 12,
                          height: 0.92,
                          color: Color(0xFF15AEB4),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '$prenom $nom',
                        style: const TextStyle(
                          fontFamily: 'League Spartan',
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          height: 1.4,
                          color: Color(0xFF393C3C),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 150),
          // Right side - Role and notifications
          Row(
            children: [
              // Role indicator
              Column(
                children: [
                  // Secretary icon
                  Container(
                    width: 20,
                    height: 20.42,
                    child: Stack(
                      children: [
                        // Building icon components
                        Positioned(
                          left: 5.11,
                          top: 0,
                          child: Container(
                            width: 14.89,
                            height: 16.34,
                            decoration: BoxDecoration(
                              border: Border.all(color: const Color(0xFF15AEB4)),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          top: 4.54,
                          child: Container(
                            width: 14.72,
                            height: 15.88,
                            decoration: BoxDecoration(
                              border: Border.all(color: const Color(0xFF15AEB4)),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 9.19,
                          top: 8.17,
                          child: Container(
                            width: 5.73,
                            height: 3.75,
                            decoration: BoxDecoration(
                              border: Border.all(color: const Color(0xFF15AEB4)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'SECRETAIRE',
                    style: const TextStyle(
                      fontFamily: 'League Spartan',
                      fontWeight: FontWeight.w300,
                      fontSize: 12,
                      height: 0.92,
                      color: Color(0xFF15AEB4),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 5),
              // Notification area
              Container(
                width: 316,
                height: 33,
                padding: const EdgeInsets.only(left: 5, right: 10, top: 3, bottom: 3),
                decoration: BoxDecoration(
                  color: const Color(0xFFCBE9F4),
                  borderRadius: BorderRadius.circular(23),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Notification badge
                    Container(
                      width: 26,
                      height: 26,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.notifications_outlined,
                        size: 14,
                        color: Color(0xFF393C3C),
                      ),
                    ),
                    // Settings icon
                    const Icon(
                      Icons.settings_outlined,
                      size: 14,
                      color: Color(0xFF15AEB4),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
} 