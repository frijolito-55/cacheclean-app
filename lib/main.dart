import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

void main() {
  runApp(const CacheCleanApp());
}

class CacheCleanApp extends StatelessWidget {
  const CacheCleanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CacheClean',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1E88E5), // Azul vibrante para controles y acciones
          brightness: Brightness.light,
          primary: const Color(0xFF1E88E5),
          secondary: const Color(0xFF43A047), // Verde para estados óptimos
          background: const Color(0xFFF7F9FC),
          surface: Colors.white,
        ),
        scaffoldBackgroundColor: const Color(0xFFF7F9FC),
        fontFamily: 'Roboto',
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double currentPercent = 0.82;
  String statusMessage = 'Estado Óptimo';
  bool isCleaning = false;

  void _simulateClean() async {
    setState(() {
      isCleaning = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Optimizando y limpiando archivos residuales...'),
        duration: Duration(seconds: 2),
      ),
    );

    await Future.delayed(const Duration(seconds: 2));

    if (mounted) {
      setState(() {
        currentPercent = 0.95;
        statusMessage = '¡Excelente rendimiento!';
        isCleaning = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('¡Limpieza completada con éxito! Se liberaron 1.4 GB.'),
          backgroundColor: Color(0xFF43A047),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.cleaning_services_rounded, color: Color(0xFF1E88E5)),
            SizedBox(width: 8),
            Text(
              'CacheClean',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {},
            tooltip: 'Configuración',
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Header / Saludo
              Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hola de nuevo',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 2),
                    const Text(
                      'Rendimiento del Dispositivo',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1F2937),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              // Indicador Circular de Progreso (82% y estado Óptimo)
              Center(
                child: CircularPercentIndicator(
                  radius: 110.0,
                  lineWidth: 18.0,
                  animation: true,
                  percent: currentPercent,
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: const Color(0xFF43A047), // Verde óptimo
                  backgroundColor: const Color(0xFFE8F5E9),
                  center: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${(currentPercent * 100).toInt()}%',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 42.0,
                          color: Color(0xFF1F2937),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: Color(0xFF43A047),
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            statusMessage,
                            style: const TextStyle(
                              color: Color(0xFF43A047),
                              fontWeight: FontWeight.w600,
                              fontSize: 14.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Botón de Limpieza Rápida
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: isCleaning ? null : _simulateClean,
                  icon: isCleaning
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Icon(Icons.bolt_rounded),
                  label: Text(
                    isCleaning ? 'Limpiando...' : 'Limpieza Rápida',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xFF1E88E5), // Azul principal
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 28),

              // Cuatro botones centrales de acciones rápidas
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Acciones Rápidas',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F2937),
                  ),
                ),
              ),
              const SizedBox(height: 14),

              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 14,
                crossAxisSpacing: 14,
                childAspectRatio: 1.35,
                children: [
                  _QuickActionButton(
                    icon: Icons.delete_sweep_rounded,
                    title: 'Caché Residual',
                    subtitle: '780 MB libres',
                    accentColor: const Color(0xFF1E88E5),
                    onTap: () {},
                  ),
                  _QuickActionButton(
                    icon: Icons.memory_rounded,
                    title: 'Acelerar RAM',
                    subtitle: '62% en uso',
                    accentColor: const Color(0xFF0288D1),
                    onTap: () {},
                  ),
                  _QuickActionButton(
                    icon: Icons.folder_delete_rounded,
                    title: 'Archivos Grandes',
                    subtitle: '12 detectados',
                    accentColor: const Color(0xFF26A69A),
                    onTap: () {},
                  ),
                  _QuickActionButton(
                    icon: Icons.apps_rounded,
                    title: 'Gestor de Apps',
                    subtitle: '34 instaladas',
                    accentColor: const Color(0xFF5C6BC0),
                    onTap: () {},
                  ),
                ],
              ),

              const SizedBox(height: 28),

              // Dos tarjetas inferiores de resumen: Almacenamiento y Memoria RAM
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Resumen del Sistema',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F2937),
                  ),
                ),
              ),
              const SizedBox(height: 14),

              Row(
                children: [
                  Expanded(
                    child: _SystemCard(
                      title: 'Almacenamiento',
                      icon: Icons.storage_rounded,
                      usageText: '54.2 / 128 GB',
                      percent: 0.42,
                      color: const Color(0xFF1E88E5),
                      detailText: '73.8 GB Libres',
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: _SystemCard(
                      title: 'Memoria RAM',
                      icon: Icons.speed_rounded,
                      usageText: '3.7 / 6.0 GB',
                      percent: 0.62,
                      color: const Color(0xFF43A047),
                      detailText: '2.3 GB Libres',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _QuickActionButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color accentColor;
  final VoidCallback onTap;

  const _QuickActionButton({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.accentColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      elevation: 1,
      shadowColor: Colors.black12,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: accentColor.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: accentColor, size: 24),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Color(0xFF1F2937),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SystemCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final String usageText;
  final double percent;
  final Color color;
  final String detailText;

  const _SystemCard({
    required this.title,
    required this.icon,
    required this.usageText,
    required this.percent,
    required this.color,
    required this.detailText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        elevation: 1,
        shadowColor: Colors.black12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 20),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: Color(0xFF1F2937),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            usageText,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Color(0xFF1F2937),
            ),
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: LinearProgressIndicator(
              value: percent,
              backgroundColor: color.withOpacity(0.15),
              valueColor: AlwaysStoppedAnimation<Color>(color),
              minHeight: 6,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            detailText,
            style: TextStyle(
              fontSize: 11,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
