import 'package:flutter/material.dart';

class BiodataFragment extends StatefulWidget {
  const BiodataFragment({super.key});

  static String savedNama = 'Muhammad Reza Faishal';
  static String savedAlamat = 'Griya Bandung Indah jl Pesona Alam';
  static String savedGender = 'Laki-laki';
  static String? savedProdi; // ubah jadi nullable supaya bisa tampil placeholder
  static DateTime? savedTanggalLahir;

  @override
  State<BiodataFragment> createState() => _BiodataFragmentState();
}

class _BiodataFragmentState extends State<BiodataFragment> {
  String? _selectedGender;
  String? _selectedProdi;
  DateTime? _selectedDate;
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();

  final List<String> _prodiList = [
    'Informatika',
    'Sistem Informasi',
    'Teknik Komputer',
    'Elektro',
    'Industri',
    'Pemrograman Mobile',
  ];

  @override
  void initState() {
    super.initState();
    
    _namaController.text = BiodataFragment.savedNama;
    _alamatController.text = BiodataFragment.savedAlamat;
    _selectedGender = BiodataFragment.savedGender;
    _selectedProdi = BiodataFragment.savedProdi;
    _selectedDate = BiodataFragment.savedTanggalLahir;
  }

  void _saveData() {
  
    BiodataFragment.savedNama = _namaController.text;
    BiodataFragment.savedAlamat = _alamatController.text;
    BiodataFragment.savedGender = _selectedGender ?? 'Laki-laki';
    BiodataFragment.savedProdi = _selectedProdi;
    BiodataFragment.savedTanggalLahir = _selectedDate;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Data berhasil disimpan!'),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.blue.shade100,
                  backgroundImage:  const AssetImage('assets/images/muka_gue.jpg'),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Foto Profil',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            'Informasi Pribadi',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _namaController,
            decoration: const InputDecoration(
              labelText: 'Nama Lengkap',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.person),
            ),
          ),
          const SizedBox(height: 15),
          TextField(
            controller: _alamatController,
            decoration: const InputDecoration(
              labelText: 'Alamat',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.home),
            ),
            maxLines: 3,
          ),
          const SizedBox(height: 15),
          const Text('Jenis Kelamin', style: TextStyle(fontSize: 16)),
          Row(
            children: [
              Expanded(
                child: RadioMenuButton<String>(
                  value: 'Laki-laki',
                  groupValue: _selectedGender,
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value;
                    });
                  },
                  child: const Text('Laki-laki'),
                ),
              ),
              Expanded(
                child: RadioMenuButton<String>(
                  value: 'Perempuan',
                  groupValue: _selectedGender,
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value;
                    });
                  },
                  child: const Text('Perempuan'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          DropdownButtonFormField<String>(
            initialValue: _prodiList.contains(_selectedProdi) ? _selectedProdi : null,
            decoration: const InputDecoration(
              labelText: 'Program Studi',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.school),
            ),
            hint: const Text('Pilih Program Studi'),
            items: _prodiList.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedProdi = value;
              });
            },
          ),
          const SizedBox(height: 15),
          InkWell(
            onTap: () => _selectDate(context),
            child: InputDecorator(
              decoration: const InputDecoration(
                labelText: 'Tanggal Lahir',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.calendar_today),
              ),
              child: Text(
                _selectedDate == null
                    ? 'Pilih Tanggal'
                    : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _saveData,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade700,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              child: const Text('Simpan', style: TextStyle(fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }
}

class Kontak {
  final String nama;
  final String nomorTelepon;
  final String inisial;

  Kontak({
    required this.nama,
    required this.nomorTelepon,
    required this.inisial,
  });
}
