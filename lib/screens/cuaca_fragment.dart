import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CuacaFragment extends StatefulWidget {
  const CuacaFragment({super.key});

  @override
  State<CuacaFragment> createState() => _CuacaFragmentState();
}

class _CuacaFragmentState extends State<CuacaFragment>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Biar full tinggi layar
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.shade400, Colors.blue.shade700],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Bandung, Indonesia',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Minggu, 2 November 2025',
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),
                const SizedBox(height: 40),

                // Animasi matahari berputar
                RotationTransition(
                  turns: _controller,
                  child: const Icon(
                    Icons.wb_sunny,
                    size: 120,
                    color: Colors.yellow,
                  ),
                ),

                const SizedBox(height: 20),
                const Text(
                  '28°C',
                  style: TextStyle(
                    fontSize: 72,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Cerah Berawan',
                  style: TextStyle(fontSize: 24, color: Colors.white70),
                ),
                const SizedBox(height: 40),

                // Info Cuaca
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      _buildWeatherInfo('Kelembaban', '65%', Icons.water_drop),
                      const Divider(color: Colors.white30),
                      _buildWeatherInfo('Kecepatan Angin', '12 km/h', Icons.air),
                      const Divider(color: Colors.white30),
                      _buildWeatherInfo(
                          'Tekanan Udara', '1013 hPa', Icons.compress),
                      const Divider(color: Colors.white30),
                      _buildWeatherInfo('Jarak Pandang', '10 km', Icons.visibility),
                    ],
                  ),
                ),
                const SizedBox(height: 30),

                const Text(
                  'Prakiraan 7 Hari',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),

                // Ini bagian yang bisa di-scroll horizontal di web + mobile
                SizedBox(
                  height: 130,
                  child: ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context).copyWith(
                      dragDevices: {
                        PointerDeviceKind.touch,
                        PointerDeviceKind.mouse,
                      },
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      child: Row(
                        children: [
                          const SizedBox(width: 10),
                          _buildDayForecast('Sen', '29°', Icons.wb_sunny),
                          _buildDayForecast('Sel', '27°', Icons.cloud),
                          _buildDayForecast('Rab', '26°', Icons.cloud),
                          _buildDayForecast('Kam', '28°', Icons.wb_sunny),
                          _buildDayForecast('Jum', '30°', Icons.wb_sunny),
                          _buildDayForecast('Sab', '28°', Icons.cloud),
                          _buildDayForecast('Min', '27°', Icons.cloud),
                          const SizedBox(width: 10),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWeatherInfo(String label, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.white, size: 24),
              const SizedBox(width: 15),
              Text(
                label,
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDayForecast(String day, String temp, IconData icon) {
    return Container(
      width: 90,
      margin: const EdgeInsets.symmetric(horizontal: 6),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            day,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Icon(icon, color: Colors.yellow, size: 32),
          const SizedBox(height: 10),
          Text(
            temp,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
