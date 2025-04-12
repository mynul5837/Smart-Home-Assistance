import 'package:flutter/material.dart';
import 'package:smart_home_flutter_ui/constants/app_colors.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isDarkMode = false;
  bool isNotificationsEnabled = true;
  bool isBiometricEnabled = false;
  double volumeLevel = 0.7;
  String selectedLanguage = 'English';

  final List<String> languages = [
    'English',
    'Spanish',
    'French',
    'German',
    'Chinese',
    'Japanese'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.fg1Color,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Settings',
          style: TextStyle(color: AppColor.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColor.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Appearance'),
            _buildSettingTile(
              'Dark Mode',
              'Switch between light and dark theme',
              Icons.dark_mode,
              Switch(
                value: isDarkMode,
                onChanged: (value) {
                  setState(() => isDarkMode = value);
                },
                activeColor: AppColor.white,
              ),
            ),
            const SizedBox(height: 20),
            _buildSectionTitle('Notifications'),
            _buildSettingTile(
              'Push Notifications',
              'Get notified about important updates',
              Icons.notifications,
              Switch(
                value: isNotificationsEnabled,
                onChanged: (value) {
                  setState(() => isNotificationsEnabled = value);
                },
                activeColor: AppColor.white,
              ),
            ),
            const SizedBox(height: 20),
            _buildSectionTitle('Sound'),
            _buildSettingTile(
              'Volume',
              'Adjust system sound level',
              Icons.volume_up,
              SizedBox(
                width: 150,
                child: Slider(
                  value: volumeLevel,
                  onChanged: (value) {
                    setState(() => volumeLevel = value);
                  },
                  activeColor: AppColor.white,
                  inactiveColor: AppColor.white.withOpacity(0.3),
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildSectionTitle('Language'),
            _buildSettingTile(
              'Select Language',
              'Choose your preferred language',
              Icons.language,
              DropdownButton<String>(
                value: selectedLanguage,
                dropdownColor: AppColor.fg1Color,
                icon: const Icon(Icons.arrow_drop_down, color: AppColor.white),
                style: const TextStyle(color: AppColor.white),
                underline: Container(),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    setState(() => selectedLanguage = newValue);
                  }
                },
                items: languages.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 20),
            _buildSectionTitle('Security'),
            _buildSettingTile(
              'Biometric Authentication',
              'Use fingerprint or face ID',
              Icons.fingerprint,
              Switch(
                value: isBiometricEnabled,
                onChanged: (value) {
                  setState(() => isBiometricEnabled = value);
                },
                activeColor: AppColor.white,
              ),
            ),
            const SizedBox(height: 20),
            _buildSectionTitle('About'),
            _buildSettingTile(
              'Version',
              'Smart Home v1.0.0',
              Icons.info_outline,
              null,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        style: const TextStyle(
          color: AppColor.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildSettingTile(
      String title, String subtitle, IconData icon, Widget? trailing) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColor.white),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColor.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: AppColor.white.withOpacity(0.7),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          if (trailing != null) trailing,
        ],
      ),
    );
  }
}