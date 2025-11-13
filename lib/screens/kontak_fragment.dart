import 'package:flutter/material.dart';

class KontakFragment extends StatelessWidget {
  const KontakFragment({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> kontakList = [
      {'nama': 'Ahmad Fadli', 'telepon': '0812-3456-7890', 'inisial': 'AF'},
      {'nama': 'Budi Santoso', 'telepon': '0813-4567-8901', 'inisial': 'BS'},
      {'nama': 'Citra Dewi', 'telepon': '0814-5678-9012', 'inisial': 'CD'},
      {'nama': 'Doni Prakoso', 'telepon': '0815-6789-0123', 'inisial': 'DP'},
      {'nama': 'Eka Putri', 'telepon': '0816-7890-1234', 'inisial': 'EP'},
      {'nama': 'Fajar Ramadhan', 'telepon': '0817-8901-2345', 'inisial': 'FR'},
      {'nama': 'Gita Savitri', 'telepon': '0818-9012-3456', 'inisial': 'GS'},
      {'nama': 'Hendra Gunawan', 'telepon': '0819-0123-4567', 'inisial': 'HG'},
      {'nama': 'Indah Permata', 'telepon': '0821-1234-5678', 'inisial': 'IP'},
      {'nama': 'Joko Widodo', 'telepon': '0822-2345-6789', 'inisial': 'JW'},
      {'nama': 'Kartika Sari', 'telepon': '0823-3456-7890', 'inisial': 'KS'},
      {'nama': 'Lukman Hakim', 'telepon': '0824-4567-8901', 'inisial': 'LH'},
      {'nama': 'Maya Anggraini', 'telepon': '0825-5678-9012', 'inisial': 'MA'},
      {'nama': 'Nanda Pratama', 'telepon': '0826-6789-0123', 'inisial': 'NP'},
      {'nama': 'Oscar Wijaya', 'telepon': '0827-7890-1234', 'inisial': 'OW'},
    ];

    return ListView.builder(
      itemCount: kontakList.length,
      itemBuilder: (context, index) {
        final kontak = kontakList[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blue.shade700,
            child: Text(
              kontak['inisial']!,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          title: Text(
            kontak['nama']!,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          subtitle: Text(kontak['telepon']!),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.phone, color: Colors.green),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.message, color: Colors.blue),
                onPressed: () {},
              ),
            ],
          ),
        );
      },
    );
  }
}