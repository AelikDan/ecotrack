import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/habito_provider.dart';
import '../widgets/dashboard_card.dart';
import 'habitos_screen.dart';
import 'splash_screen.dart'; // importar

//Tela de métricas. Exibe os cards em GridView com hábitos concluídos, pendentes, pontuação e meta semanal — todos atualizados pelo Provider.

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
          } else if (index == 2) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const SplashScreen()),
              (route) => false,
            );
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.eco), label: 'Hábitos'),
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Início'),
        ],
      ),

      //Cards do dashboard
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Bem vindo ao seu DashBoard!",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
            const SizedBox(height: 8),
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
