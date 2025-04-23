import 'package:flutter/material.dart';
import 'loginpage.dart';

class ProfilePage extends StatefulWidget {
  final String email;

  const ProfilePage({Key? key, required this.email}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _Background = false;

  void _toggleBackgroundColor() {
    setState(() {
      _Background = !_Background;
    });
  }

  Widget _buildListTile(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF7B698C)),
      title: Text(
        title,
        style: const TextStyle(color: Color(0xFF7B698C)),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, color: Color(0xFF7B698C), size: 16),
      onTap: () {
        // Tambah aksi di sini
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = _Background ? const Color.fromARGB(255, 238, 205, 216) : Colors.white;
    final Color textColor = const Color.fromARGB(255, 168, 106, 146);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              actions: [
                IconButton(
                  icon: Icon(Icons.color_lens, color: textColor),
                  tooltip: 'Ganti Warna Background',
                  onPressed: _toggleBackgroundColor,
                ),
                IconButton(
                  icon: Icon(Icons.logout, color: textColor),
                  tooltip: 'Logout',
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage()),
                      (Route<dynamic> route) => false,
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text('°❀･ My Profile ࿔*･',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            const SizedBox(height: 20),
            CircleAvatar(
              radius: 60,
              backgroundColor: textColor.withOpacity(0.2),
              child: Image.asset('assets/images/profil.png'),
            ),
            const SizedBox(height: 10),
            Text(
              widget.email,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold, // Lebih tegas
                color: textColor,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 10),
            Text('Kamu terlihat cantik hari ini (˶˃ ᵕ ˂˶)',
              style: TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic, // Lebih lembut dan manis
                color: textColor.withOpacity(0.9),
              ),
            ),

            const SizedBox(height: 24),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  const Divider(color: Color(0xFF7B698C)),
                  _buildListTile(Icons.receipt_long, 'Order History'),
                  _buildListTile(Icons.favorite_border, 'Favorites'),
                  _buildListTile(Icons.credit_card, 'Payment Methods'),
                  _buildListTile(Icons.settings, 'Account Settings'),
                  _buildListTile(Icons.help_outline, 'Help & Support'),
                  _buildListTile(Icons.info_outline, 'About'),
                  const Divider(color: Color(0xFF7B698C)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
