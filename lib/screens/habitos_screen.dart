import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/habito_provider.dart';
import '../widgets/habito_card.dart';
import 'dashboard_screen.dart';
import 'splash_screen.dart';

//Tela principal. Contém AppBar, Drawer, BottomNavigationBar e o TabBarView com as duas abas (Pendentes e Concluídos).

class HabitosScreen extends StatelessWidget {
  const HabitosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HabitoProvider>();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('EcoTrack'),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Center(
                child: Text('${(provider.progressoMeta * 100).toInt()}%'),
              ),
            ),
            const Icon(Icons.notifications_outlined),
            const SizedBox(width: 8),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Pendentes'),
              Tab(text: 'Concluídos'),
            ],
          ),
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
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const DashboardScreen()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.eco),
                title: const Text('Hábitos'),
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        ),

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          onTap: (index) {
            if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const DashboardScreen()),
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

        body: TabBarView(
          children: [
            provider.pendentes.isEmpty
                ? const Center(child: Text('Nenhum hábito pendente!'))
                : ListView.builder(
                    itemCount: provider.pendentes.length,
                    itemBuilder: (context, index) {
                      final habito = provider.pendentes[index];
                      return HabitoCard(
                        habito: habito,
                        onConcluir: () => provider.concluirHabito(habito),
                      );
                    },
                  ),

            provider.concluidos.isEmpty
                ? const Center(child: Text('Nenhum hábito concluído ainda.'))
                : ListView.builder(
                    itemCount: provider.concluidos.length,
                    itemBuilder: (context, index) {
                      final habito = provider.concluidos[index];
                      return HabitoCard(habito: habito);
                    },
                  ),
          ],
        ),
      ),
    );
  }
}