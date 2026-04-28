import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/habito_provider.dart';
import '../widgets/dashboard_card.dart';
import 'habitos_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HabitoProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          const Icon(Icons.notifications_outlined),
          const SizedBox(width: 8),
        ],
      ),

      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.green),
              child: Text(
                'EcoTrack',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text('Dashboard'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.eco),
              title: const Text('Hábitos'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const HabitosScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Configurações'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.help_outline),
              title: const Text('Ajuda'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const HabitosScreen()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.eco), label: 'Hábitos'),
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Início'),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: [
            DashboardCard(
              titulo: 'Hábitos Concluídos',
              valor: '${provider.concluidos.length}',
              icone: Icons.check_circle,
              cor: Colors.green,
            ),
            DashboardCard(
              titulo: 'Hábitos Pendentes',
              valor: '${provider.pendentes.length}',
              icone: Icons.pending_actions,
              cor: Colors.orange,
            ),
            DashboardCard(
              titulo: 'Pontuação Verde',
              valor: '${provider.pontuacao} pts',
              icone: Icons.star,
              cor: Colors.amber,
            ),
            DashboardCard(
              titulo: 'Meta Semanal',
              valor: '${(provider.progressoMeta * 100).toInt()}%',
              icone: Icons.flag,
              cor: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}