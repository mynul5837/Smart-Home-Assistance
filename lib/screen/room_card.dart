import 'package:flutter/material.dart';

import 'package:smart_home_flutter_ui/model/smart_home_model.dart';
import 'package:smart_home_flutter_ui/screen/room_control_screen.dart';

import '../constants/app_colors.dart';

class RoomCard extends StatelessWidget {
  const RoomCard({super.key, required this.roomData});
  final SmartHomeModel roomData;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => RoomControlScreen(roomData: roomData)));
      },
      child: Container(
        width: size.width * 0.35,
        height: size.height * 0.5,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: AppColor.fgColor,
          borderRadius: BorderRadius.circular(size.width * 0.07),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(roomData.roomImage),
            colorFilter: ColorFilter.mode(
                AppColor.black.withOpacity(0.4), BlendMode.darken),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColor.black.withOpacity(0.2),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: AppColor.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.thermostat,
                        color: AppColor.white,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        roomData.roomTemperature,
                        style: const TextStyle(
                          color: AppColor.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: roomData.roomStatus ? AppColor.fgColor : AppColor.grey.withOpacity(0.3),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    roomData.roomStatus ? Icons.power_settings_new : Icons.power_off,
                    color: AppColor.white,
                    size: 16,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Text(
              roomData.roomName,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColor.white,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(
                  Icons.person,
                  color: AppColor.white.withOpacity(0.8),
                  size: 16,
                ),
                const SizedBox(width: 4),
                Text(
                  '${roomData.userAccess} users',
                  style: TextStyle(
                    color: AppColor.white.withOpacity(0.8),
                    fontSize: 14,
                  ),
                ),
                const SizedBox(width: 12),
                Icon(
                  Icons.device_hub,
                  color: AppColor.white.withOpacity(0.8),
                  size: 16,
                ),
                const SizedBox(width: 4),
                Text(
                  '${roomData.devices?.length ?? 0} devices',
                  style: TextStyle(
                    color: AppColor.white.withOpacity(0.8),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
