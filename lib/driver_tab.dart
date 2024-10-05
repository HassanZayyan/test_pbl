import 'package:flutter/material.dart';
import 'constant.dart';

class DriverTab extends StatelessWidget {
  const DriverTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        _buildPostCard(),
        _buildPostCard(),
      ],
    );
  }

  Widget _buildPostCard() {
    return Card(
      margin: const EdgeInsets.fromLTRB(12, 12, 12, 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/mas amba 1.jpg'),
            ),
            title: Text('Mas Amba', style: textTextStyle.copyWith(fontWeight: FontWeight.bold)),
            subtitle: Text('69 menit yang lalu', style: textTextStyle.copyWith(fontSize: 12)),
            trailing: Icon(Icons.more_vert),
          ),
           Divider(
            thickness: 1, 
            indent: 16, 
            endIndent: 16, 
            color: textColor,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 8),
            child: Text('ehh..... gweh lagi di sini nih ada yang mau nitip muwani gaa??', style: textTextStyle),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(25),  
            child: Image.asset(
              'assets/Gambar WhatsApp 2024-10-05 pukul 00.14.30_3f8e196d.jpg',
              height: 250,
              width: double.infinity, 
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('14:30 - 15:15', style: textTextStyle.copyWith(fontSize: 18, fontWeight: FontWeight.bold)),
                ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryButtonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  ),
                  icon: Icon(Icons.message_rounded, size: 18),
                  label: Text('Mau Nitip!!', style: textTextStyle.copyWith(fontSize: 14)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
