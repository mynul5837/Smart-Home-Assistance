import 'package:flutter/material.dart';
import 'package:smart_home_flutter_ui/constants/app_colors.dart';

class ManageUsersScreen extends StatefulWidget {
  const ManageUsersScreen({super.key});

  @override
  State<ManageUsersScreen> createState() => _ManageUsersScreenState();
}

class _ManageUsersScreenState extends State<ManageUsersScreen> {
  final List<Map<String, dynamic>> users = [
    {
      'name': 'Mynul Islam',
      'role': 'Admin',
      'image': 'assets/images/mynul.jpg',
      'status': 'Active',
    },
    {
      'name': 'Ariful Islam',
      'role': 'User',
      'image': 'assets/images/Arif.jpg',
      'status': 'Active',
    },
    {
      'name': 'Adnan Morshed',
      'role': 'User',
      'image': 'assets/images/adnan.jpg',
      'status': 'Inactive',
    },
    {
      'name': 'Hasan Al Banna',
      'role': 'User',
      'image': 'assets/images/banna.jpg',
      'status': 'Active',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.fg1Color,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Manage Users',
          style: TextStyle(color: AppColor.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColor.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_add, color: AppColor.white),
            onPressed: () {
              // TODO: Implement add user functionality
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.85,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            return Container(
              decoration: BoxDecoration(
                color: AppColor.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(user['image']),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    user['name'],
                    style: const TextStyle(
                      color: AppColor.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    user['role'],
                    style: TextStyle(
                      color: AppColor.white.withOpacity(0.7),
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: user['status'] == 'Active'
                          ? Colors.green.withOpacity(0.2)
                          : Colors.red.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      user['status'],
                      style: TextStyle(
                        color: user['status'] == 'Active'
                            ? Colors.green
                            : Colors.red,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.edit,
                          color: AppColor.white,
                          size: 20,
                        ),
                        onPressed: () {
                          // TODO: Implement edit functionality
                        },
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                          size: 20,
                        ),
                        onPressed: () {
                          // TODO: Implement delete functionality
                        },
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}