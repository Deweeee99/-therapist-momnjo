import 'package:flutter/material.dart';

class EarningsScreen extends StatefulWidget {
  const EarningsScreen({Key? key}) : super(key: key);

  @override
  State<EarningsScreen> createState() => _EarningsScreenState();
}

class _EarningsScreenState extends State<EarningsScreen> {
  // Menggunakan warna pink yang lebih solid sesuai dengan desain mockup
  final Color mockupPink = const Color(0xFFE8647C); 
  final Color bgLight = const Color(0xFFFFF7F7); // Background krem/pink sangat muda

  String _selectedTab = 'Rincian'; // Default tab

  // Data dummy untuk list riwayat pendapatan
  final List<Map<String, dynamic>> _earningsHistory = [
    {
      'date': '13 Mei',
      'time': '10.00',
      'name': 'Dewi Lestari',
      'amount': 'Rp 150.000',
      'status': 'Completed',
    },
    {
      'date': '13 Mei',
      'time': '08.00',
      'name': 'Siti Aisyah',
      'amount': 'Rp 100.000',
      'status': 'Completed',
    },
    {
      'date': '12 Mei',
      'time': '13.00',
      'name': 'Anita Putri',
      'amount': 'Rp 120.000',
      'status': 'Completed',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Menggunakan warna background muda seperti pada desain
      backgroundColor: bgLight,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 1. Header Kustom (Tanpa tombol back, karena ini bagian dari footer)
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Earnings',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  Icon(Icons.center_focus_weak, color: Colors.grey.shade700, size: 26),
                ],
              ),
            ),

            // 2. Row Periode
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Periode',
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                  ),
                  Row(
                    children: [
                      const Text(
                        'Mei 2024',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black87),
                      ),
                      const SizedBox(width: 4),
                      Icon(Icons.keyboard_arrow_down, color: Colors.grey.shade700, size: 20),
                    ],
                  ),
                ],
              ),
            ),

            // 3. Card Total Earnings
            _buildEarningsCard(),
            const SizedBox(height: 24),

            // 4. Custom Tabs (Rincian, Bonus, Payout)
            _buildTabs(),
            const SizedBox(height: 24),

            // 5. Container List Riwayat (Putih full sampai bawah)
            Expanded(
              child: Container(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: ListView.separated(
                  padding: const EdgeInsets.only(top: 10, bottom: 20),
                  itemCount: _earningsHistory.length,
                  separatorBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Divider(color: Colors.grey.shade200, height: 1),
                  ),
                  itemBuilder: (context, index) {
                    final item = _earningsHistory[index];
                    return _buildHistoryItem(item);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- WIDGET BUILDERS ---

  Widget _buildEarningsCard() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 16, 20, 0),
      decoration: BoxDecoration(
        color: mockupPink,
        borderRadius: BorderRadius.circular(16),
        // Tambahan shadow tipis biar elegan
        boxShadow: [
          BoxShadow(
            color: mockupPink.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          // Bagian atas Card (Warna Pink)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Column(
              children: [
                Text(
                  'Total Earnings',
                  style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 13, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Rp 8.250.000',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          
          // Bagian bawah Card (Warna Putih)
          Container(
            // Memberikan efek kotak putih berada di dalam card pink
            margin: const EdgeInsets.fromLTRB(2, 0, 2, 2),
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildSubEarning('Hari Ini', 'Rp 850.000'),
                Container(width: 1, height: 40, color: Colors.grey.shade200), // Garis pembatas
                _buildSubEarning('Minggu Ini', 'Rp 3.250.000'),
                Container(width: 1, height: 40, color: Colors.grey.shade200), // Garis pembatas
                _buildSubEarning('Bulan Ini', 'Rp 8.250.000'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubEarning(String label, String amount) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(color: Colors.grey.shade500, fontSize: 11, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 6),
        Text(
          amount,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildTabs() {
    final tabs = ['Rincian', 'Bonus', 'Payout'];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: tabs.map((tab) {
          final isSelected = _selectedTab == tab;
          return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedTab = tab;
                });
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: isSelected ? mockupPink : Colors.white,
                  borderRadius: BorderRadius.circular(20), // Bentuk Pill sesuai desain
                ),
                alignment: Alignment.center,
                child: Text(
                  tab,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.grey.shade700,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildHistoryItem(Map<String, dynamic> item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sisi Kiri: Tanggal & Waktu memanjang
          SizedBox(
            width: 95,
            child: Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: Text(
                '${item['date']} ${item['time']}',
                style: TextStyle(fontSize: 12, color: Colors.grey.shade600, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          
          // Bagian Tengah: Nama Customer
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: Text(
                item['name'],
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
            ),
          ),
          
          // Sisi Kanan: Harga & Status
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                item['amount'],
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 6),
              // Pill Status Completed (Warna Hijau)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  item['status'],
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}