import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/habito_provider.dart';
import '../widgets/habito_card.dart';
import 'dashboard_screen.dart';

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
            // Indicador de progresso
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

        // Drawer
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

        // BottomNavigationBar
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          onTap: (index) {
            if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const DashboardScreen()),
              );
            }
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.eco), label: 'Hábitos'),
            BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Início'),
          ],
        ),

        // TabBarView com as duas abas
        body: TabBarView(
          children: [
            // Aba Pendentes
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

            // Aba Concluídos
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