import 'package:flutter/material.dart';

class BookingDetailScreen extends StatelessWidget {
  const BookingDetailScreen({Key? key}) : super(key: key);

  // Warna-warna utama sesuai desain
  final Color primaryRed = const Color(0xFFE57373); // Merah tombol OTW/Tolak
  final Color statusPurple = const Color(0xFF9575CD); // Ungu label Accepted
  final Color textGrey = const Color(0xFF757575); // Abu-abu buat label kecil
  final Color bgLight = const Color(0xFFFFF8F8); // Background halaman agak pink muda muda

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgLight,
      appBar: AppBar(
        backgroundColor: bgLight,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Detail Booking',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black87),
            onPressed: () {},
          ),
        ],
      ),
      // Menggunakan Stack untuk memisahkan konten scrollable dan tombol fixed di bawah
      body: Stack(
        children: [
          // 1. Konten Utama (Scrollable)
          ListView(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 100), // Padding bawah ekstra buat space tombol
            children: [
              // --- Bagian Atas: Label Status & Foto ---
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Label "Accepted"
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    decoration: BoxDecoration(
                      color: statusPurple,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Accepted',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  // Foto Profil Bulat
                  const CircleAvatar(
                    radius: 30,
                    // Gantilah NetworkImage dengan gambar profil asli
                    backgroundImage: NetworkImage('https://via.placeholder.com/150'),
                    backgroundColor: Colors.grey,
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // --- Bagian Identitas & Tombol Kontak ---
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nama & Nomor (Expanded agar teks tidak overflow)
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Dewi Lestari',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '0812 3456 7890',
                          style: TextStyle(fontSize: 14, color: textGrey),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Tombol Telepon Outlined
                  _buildContactButton(Icons.call_outlined),
                  const SizedBox(width: 12),
                  // Tombol Chat Outlined
                  _buildContactButton(Icons.chat_bubble_outline_rounded),
                ],
              ),
              const SizedBox(height: 24),

              // --- Kartu Alamat ---
              _buildSectionCard(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.location_on, color: primaryRed, size: 28),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Jl. Melati No. 10, Bandung',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Patokan: Depan gerbang warna hitam',
                            style: TextStyle(fontSize: 13, color: textGrey),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Lihat di Maps',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.blue,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // --- Kartu Layanan ---
              _buildSectionCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Layanan', style: TextStyle(fontSize: 12, color: textGrey)),
                    const SizedBox(height: 6),
                    const Text(
                      'Mother Care Massage',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Durasi', style: TextStyle(fontSize: 13, color: textGrey)),
                        const Text(
                          '90 menit',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // --- Kartu Catatan Customer ---
              _buildSectionCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Catatan Customer', style: TextStyle(fontSize: 12, color: textGrey)),
                    const SizedBox(height: 6),
                    const Text(
                      'Ibu hamil trimester 2, tidak ada keluhan',
                      style: TextStyle(fontSize: 14, color: Colors.black87, height: 1.4),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // --- Kartu Timeline Status ---
              _buildSectionCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Timeline Status',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                    ),
                    const SizedBox(height: 16),
                    // Item Timeline 1 (Aktif/Hijau)
                    _buildTimelineItem(
                      status: 'Assigned',
                      time: '13 Mei 08.30',
                      isCompleted: true,
                      isFirst: true,
                    ),
                    // Item Timeline 2 (Aktif/Hijau)
                    _buildTimelineItem(
                      status: 'Accepted',
                      time: '13 Mei 08.32',
                      isCompleted: true,
                    ),
                    // Item Timeline 3 (Belum/Abu)
                    _buildTimelineItem(status: 'OTW', time: '-'),
                    // Item Timeline 4 (Belum/Abu)
                    _buildTimelineItem(status: 'Arrived', time: '-'),
                    // Item Timeline 5 (Belum/Abu)
                    _buildTimelineItem(status: 'Started', time: '-'),
                    // Item Timeline 6 (Terakhir/Abu)
                    _buildTimelineItem(status: 'Completed', time: '-', isLast: true),
                  ],
                ),
              ),
            ],
          ),

          // 2. Tombol Aksi Bawah (Fixed di bawah)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              decoration: BoxDecoration(
                color: bgLight,
                // Sedikit shadow biar kelihatan misah sama konten scroll
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, -5))
                ]
              ),
              child: Row(
                children: [
                  // Tombol Tolak (Outlined Merah)
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: primaryRed, width: 1.5),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: Text(
                        'Tolak',
                        style: TextStyle(color: primaryRed, fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Tombol OTW (Filled Merah)
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryRed,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: const Text(
                        'OTW',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- Helper Widget: Tombol Kontak (Telp/Chat) ---
  Widget _buildContactButton(IconData icon) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300, width: 1.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.black54, size: 22),
        onPressed: () {},
      ),
    );
  }

  // --- Helper Widget: Container Kartu Putih ---
  Widget _buildSectionCard({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        // Shadow tipis biar elegan sesuai desain
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }

  // --- Helper Widget: Item Timeline Custom ---
  Widget _buildTimelineItem({
    required String status,
    required String time,
    bool isCompleted = false,
    bool isFirst = false,
    bool isLast = false,
  }) {
    // Warna hijau kalau selesai, abu kalau belum
    final Color color = isCompleted ? const Color(0xFF4CAF50) : Colors.grey.shade300;
    
    return IntrinsicHeight(
      child: Row(
        children: [
          // Bagian Indikator (Garis & Lingkaran)
          SizedBox(
            width: 30,
            child: Column(
              children: [
                // Garis Atas (disembunyikan untuk item pertama)
                Expanded(
                  child: Container(width: 2, color: isFirst ? Colors.transparent : color),
                ),
                // Lingkaran Status
                Container(
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(color: color, width: 2.5),
                  ),
                ),
                // Garis Bawah (disembunyikan untuk item terakhir)
                Expanded(
                  child: Container(width: 2, color: isLast ? Colors.transparent : color),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          // Bagian Teks (Nama Status & Waktu)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    status,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: isCompleted ? FontWeight.w600 : FontWeight.normal,
                      color: isCompleted ? Colors.black87 : textGrey,
                    ),
                  ),
                  Text(
                    time,
                    style: TextStyle(fontSize: 13, color: textGrey),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}