import 'package:flutter/material.dart';

class BeritaFragment extends StatelessWidget {
  const BeritaFragment({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> beritaList = [
      {
        'judul': 'Teknologi AI Terbaru Mengubah Industri',
        'deskripsi': 'Perkembangan kecerdasan buatan membawa perubahan besar...',
        'tanggal': '2 Nov 2025',
        'kategori': 'Teknologi',
      },
      {
        'judul': 'Ekonomi Digital Indonesia Terus Berkembang',
        'deskripsi': 'Pertumbuhan ekonomi digital mencapai rekor tertinggi...',
        'tanggal': '2 Nov 2025',
        'kategori': 'Ekonomi',
      },
      {
        'judul': 'Inovasi Pendidikan di Era Modern',
        'deskripsi': 'Metode pembelajaran baru diterapkan di berbagai sekolah...',
        'tanggal': '1 Nov 2025',
        'kategori': 'Pendidikan',
      },
      {
        'judul': 'Perubahan Iklim dan Dampaknya',
        'deskripsi': 'Para ahli memperingatkan dampak perubahan iklim global...',
        'tanggal': '1 Nov 2025',
        'kategori': 'Lingkungan',
      },
      {
        'judul': 'Startup Indonesia Go International',
        'deskripsi': 'Beberapa startup lokal berhasil ekspansi ke luar negeri...',
        'tanggal': '31 Okt 2025',
        'kategori': 'Bisnis',
      },
      {
        'judul': 'Terobosan Medis dalam Pengobatan Kanker',
        'deskripsi': 'Penelitian terbaru menemukan metode baru pengobatan...',
        'tanggal': '31 Okt 2025',
        'kategori': 'Kesehatan',
      },
      {
        'judul': 'Olahraga Nasional Raih Prestasi',
        'deskripsi': 'Atlet Indonesia berhasil meraih medali emas di turnamen...',
        'tanggal': '30 Okt 2025',
        'kategori': 'Olahraga',
      },
      {
        'judul': 'Festival Budaya Nusantara 2025',
        'deskripsi': 'Berbagai kebudayaan daerah dipamerkan dalam festival...',
        'tanggal': '30 Okt 2025',
        'kategori': 'Budaya',
      },
      {
        'judul': 'Pembangunan Infrastruktur Terus Berlanjut',
        'deskripsi': 'Pemerintah mempercepat proyek infrastruktur nasional...',
        'tanggal': '29 Okt 2025',
        'kategori': 'Infrastruktur',
      },
      {
        'judul': 'Pariwisata Indonesia Mulai Pulih',
        'deskripsi': 'Sektor pariwisata menunjukkan tren positif pasca pandemi...',
        'tanggal': '29 Okt 2025',
        'kategori': 'Pariwisata',
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: beritaList.length,
      itemBuilder: (context, index) {
        final berita = beritaList[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 15),
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: InkWell(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Membuka: ${berita['judul']}')),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.article,
                 size: 40,
                      color: Colors.blue.shade700,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade700,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            berita['kategori']!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          berita['judul']!,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          berita['deskripsi']!,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade600,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(
                              Icons.access_time,
                              size: 14,
                              color: Colors.grey.shade500,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              berita['tanggal']!,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}