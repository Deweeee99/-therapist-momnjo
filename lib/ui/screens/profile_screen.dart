import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  final Color primaryPink = const Color(0xFFE8647C); // Pink sesuai tema mockup baru
  final Color bgLight = const Color(0xFFFFF7F7); // Background krem/pink muda

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgLight, // Background disamakan dengan tema mockup
      appBar: AppBar(
        backgroundColor: bgLight,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () {
            // Cek apakah ada rute sebelumnya, biar ga error kalau dijadikan footer
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
        ),
        title: const Text(
          'Profil Saya',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            // 1. Header Profil (Dibungkus dalam Card Putih)
            _buildProfileHeader(),
            const SizedBox(height: 16),

            // 2. Info Detail (Area, Pengalaman, Spesialisasi)
            _buildDetailInfo(),
            const SizedBox(height: 16),

            // 3. Menu List (Dibungkus dalam Card Putih)
            _buildMenuList(),
            const SizedBox(height: 40), // Spasi bawah biar ga mentok
          ],
        ),
      ),
    );
  }

  // --- WIDGET BUILDERS ---

  Widget _buildProfileHeader() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Avatar
          Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.pink.shade50,
            ),
            // Hapus 'const' di sini karena NetworkImage bukan nilai konstan (const)
            child: const CircleAvatar(
              radius: 36,
              // Bisa diganti pakai AssetImage jika fotonya ada di folder assets
              backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=5'), 
            ),
          ),
          const SizedBox(width: 16),
          // Info Terapis
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Rina Terapis',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
                ),
                const SizedBox(height: 4),
                Text(
                  'Terapis ID: TRP00128',
                  style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 18),
                    const SizedBox(width: 4),
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: '4.9 ',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          TextSpan(
                            text: '(128 review)',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailInfo() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildInfoRow('Area Kerja', 'Bandung & Cimahi'),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Divider(color: Colors.grey.shade200, height: 1),
          ),
          _buildInfoRow('Pengalaman', '3 Tahun'),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Divider(color: Colors.grey.shade200, height: 1),
          ),
          _buildInfoRow('Spesialisasi', 'Mother Care, Baby Spa'),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            label,
            style: TextStyle(fontSize: 13, color: Colors.grey.shade600, fontWeight: FontWeight.w500),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    ); // Mengubah tanda koma (,) menjadi titik koma (;) di sini
  }

  Widget _buildMenuList() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          const SizedBox(height: 8), // Padding atas dalam kotak
          _buildMenuItem(Icons.person_outline, 'Data Diri'),
          _buildMenuDivider(),
          _buildMenuItem(Icons.description_outlined, 'Dokumen'),
          _buildMenuDivider(),
          _buildMenuItem(Icons.menu_book_outlined, 'SOP & Panduan'),
          _buildMenuDivider(),
          _buildMenuItem(Icons.settings_outlined, 'Pengaturan'),
          _buildMenuDivider(),
          _buildMenuItem(Icons.help_outline, 'Bantuan & Dukungan'),
          _buildMenuDivider(),
          _buildMenuItem(Icons.info_outline, 'Tentang Aplikasi'),
          const SizedBox(height: 8), // Padding bawah dalam kotak
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      dense: true, // Biar jaraknya ga terlalu renggang, lebih compact
      leading: Icon(icon, color: Colors.grey.shade700, size: 22),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
      trailing: Icon(Icons.chevron_right, color: Colors.grey.shade400, size: 20),
      onTap: () {
        // Logika navigasi ke masing-masing halaman menu
      },
    );
  }

  Widget _buildMenuDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Divider(color: Colors.grey.shade200, height: 1),
    );
  }
}