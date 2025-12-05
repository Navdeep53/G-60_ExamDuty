import 'package:flutter/material.dart';
import 'login_screen.dart';

import 'feedback_summary.dart';
import 'submission_tracking.dart';
import 'honorarium_summary.dart';

class AdminDashboardScreen extends StatelessWidget {
  final String userName;
  final String userEmail;

  const AdminDashboardScreen({
    super.key,
    required this.userName,
    required this.userEmail,
  });

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Logout"),
        content: const Text(
          "Are you sure you want to logout?\nYou will be redirected to the login screen.",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const LoginScreen()),
                (route) => false,
              );
            },
            child: const Text(
              "Logout",
              style: TextStyle(
                color: Color(0xFF5335EA),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Enabled card
  Widget _enabledCard({
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 7),
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(22),
        color: Colors.white,
        child: InkWell(
          borderRadius: BorderRadius.circular(22),
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 14),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.8,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        subtitle,
                        style: const TextStyle(
                          fontSize: 12.3,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.chevron_right_rounded,
                  size: 28,
                  color: Colors.black38,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Disabled (grey) card
  Widget _disabledCard({
    required String title,
    required String subtitle,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 7),
      child: Material(
        elevation: 0,
        borderRadius: BorderRadius.circular(22),
        color: const Color(0xFFF1F1F4),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 14),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15.5,
                        color: Color(0xFF9B9B9B),
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 12.1,
                        color: Color(0xFFB3B3B3),
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.chevron_right_rounded,
                size: 28,
                color: Color(0xFFBEBEBE),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNav() {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 8, top: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(22),
          topRight: Radius.circular(22),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 14,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          // HOME (active)
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 3),
              decoration: BoxDecoration(
                color: const Color(0xFFE9E5FD),
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.07),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  SizedBox(height: 7),
                  Icon(
                    Icons.home_rounded,
                    color: Color(0xFF5135EA),
                    size: 25,
                  ),
                  SizedBox(height: 1),
                  Text(
                    "Home",
                    style: TextStyle(
                      color: Color(0xFF5135EA),
                      fontWeight: FontWeight.bold,
                      fontSize: 13.5,
                      letterSpacing: 0.1,
                    ),
                  ),
                  SizedBox(height: 7),
                ],
              ),
            ),
          ),
          // MY PROFILE (inactive)
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 3),
              decoration: BoxDecoration(
                color: const Color(0xFFF6F6F6),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: const Color(0xFFD9D9D9),
                  width: 1.2,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  SizedBox(height: 7),
                  Icon(
                    Icons.person_rounded,
                    color: Color(0xFFA3A3A3),
                    size: 25,
                  ),
                  SizedBox(height: 1),
                  Text(
                    "My Profile",
                    style: TextStyle(
                      color: Color(0xFFA3A3A3),
                      fontWeight: FontWeight.w600,
                      fontSize: 13.5,
                      letterSpacing: 0.1,
                    ),
                  ),
                  SizedBox(height: 7),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: _buildBottomNav(),
      body: SafeArea(
        child: Column(
          children: [
            // HEADER + user card
            Stack(
              children: [
                Container(
                  height: 192,
                  width: double.infinity,
                  color: const Color(0xFF5335EA),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 18),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 51,
                            height: 51,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 8,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Container(
                                width: 32,
                                height: 32,
                                decoration: const BoxDecoration(
                                  color: Color(0xFF5335EA),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.school_rounded,
                                  color: Colors.white,
                                  size: 21,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            "ExamDuty+",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 6),
                            child: IconButton(
                              icon: const Icon(
                                Icons.logout,
                                color: Colors.white,
                                size: 26,
                              ),
                              onPressed: () => _showLogoutDialog(context),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xFF9180CB),
                          borderRadius: BorderRadius.circular(17),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12.withOpacity(0.13),
                              blurRadius: 8,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 13,
                          horizontal: 11,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 43,
                              height: 43,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 7,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: ClipOval(
                                child: Image.asset(
                                  'assets/admin_logo.png',
                                  width: 36,
                                  height: 36,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 13),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  userName,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16.5,
                                    color: Colors.white,
                                    fontFamily: "Poppins",
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  userEmail,
                                  style: const TextStyle(
                                    fontSize: 13.5,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            // LIST
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(top: 18, bottom: 8),
                child: Column(
                  children: [
                    _disabledCard(
                      title: "Add/Delete User",
                      subtitle: "Add or Delete user profiles",
                    ),
                    _disabledCard(
                      title: "Assign Tasks",
                      subtitle:
                          "Assign the roles for Observers & Super Proctors",
                    ),
                    _enabledCard(
                      title: "Feedback Summary",
                      subtitle:
                          "Feedbacks of exam center quality and logistics",
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => FeedbackSummaryScreen(
                              userName: userName,
                              userEmail: userEmail,
                            ),
                          ),
                        );
                      },
                    ),
                    _enabledCard(
                      title: "Submission Tracking",
                      subtitle:
                          "Submission status of invigilation form, feedback & attendance",
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => SubmissionTrackingScreen(
                              userName: userName,
                              userEmail: userEmail,
                            ),
                          ),
                        );
                      },
                    ),
                    _enabledCard(
                      title: "Honorarium Summary",
                      subtitle: "Submit & view Accommodation Details",
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => HonorariumSummaryScreen(
                              userName: userName,
                              userEmail: userEmail,
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 4),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
