// Main application entry point

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'core/providers/app_providers.dart';
import 'shared/theme/neon_rush_theme.dart';
import 'features/live_feed/live_feed_screen.dart';
import 'features/device_manager/device_manager_screen.dart';
import 'features/filter_settings/filter_settings_screen.dart';
import 'features/archive/archive_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const ProviderScope(
      child: NotificationHubApp(),
    ),
  );
}

class NotificationHubApp extends ConsumerWidget {
  const NotificationHubApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Notification Hub',
      debugShowCheckedModeBanner: false,
      theme: NeonRushTheme.themeData,
      home: const MainShell(),
      onGenerateRoute: _generateRoute,
    );
  }

  Route<dynamic>? _generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/live-feed':
        return _neonRoute(const LiveFeedScreen());
      case '/devices':
        return _neonRoute(const DeviceManagerScreen());
      case '/filters':
        return _neonRoute(const FilterSettingsScreen());
      case '/archive':
        return _neonRoute(const ArchiveScreen());
      default:
        return null;
    }
  }

  PageRouteBuilder _neonRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.1, 0),
              end: Offset.zero,
            ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOutCubic)),
            child: child,
          ),
        );
      },
      transitionDuration: NeonRushTheme.normalAnimation,
    );
  }
}

class MainShell extends ConsumerStatefulWidget {
  const MainShell({super.key});

  @override
  ConsumerState<MainShell> createState() => _MainShellState();
}

class _MainShellState extends ConsumerState<MainShell> with TickerProviderStateMixin {
  int _selectedIndex = 0;
  late final AnimationController _fabController;
  late final Animation<double> _fabAnimation;

  static final List<Widget> _screens = [
    const LiveFeedScreen(),
    const DeviceManagerScreen(),
    const FilterSettingsScreen(),
    const ArchiveScreen(),
  ];

  static final List<NavigationDestination> _destinations = [
    NavigationDestination(
      icon: Icon(Icons.dashboard_outlined, size: NeonRushTheme.iconMD),
      selectedIcon: Icon(Icons.dashboard, size: NeonRushTheme.iconMD),
      label: 'Live Feed',
    ),
    NavigationDestination(
      icon: Icon(Icons.devices_outlined, size: NeonRushTheme.iconMD),
      selectedIcon: Icon(Icons.devices, size: NeonRushTheme.iconMD),
      label: 'Devices',
    ),
    NavigationDestination(
      icon: Icon(Icons.filter_alt_outlined, size: NeonRushTheme.iconMD),
      selectedIcon: Icon(Icons.filter_alt, size: NeonRushTheme.iconMD),
      label: 'Filters',
    ),
    NavigationDestination(
      icon: Icon(Icons.archive_outlined, size: NeonRushTheme.iconMD),
      selectedIcon: Icon(Icons.archive, size: NeonRushTheme.iconMD),
      label: 'Archive',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _fabController = AnimationController(
      duration: NeonRushTheme.normalAnimation,
      vsync: this,
    );
    _fabAnimation = CurvedAnimation(parent: _fabController, curve: Curves.easeOutBack);
    _fabController.forward();
  }

  @override
  void dispose() {
    _fabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: _buildNeonNavBar(),
      floatingActionButton: _buildFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildNeonNavBar() {
    return Container(
      decoration: BoxDecoration(
        color: NeonRushTheme.charcoal,
        border: Border(
          top: BorderSide(
            color: NeonRushTheme.neonGreen.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: NeonRushTheme.neonGreen.withValues(alpha: 0.1),
            blurRadius: 20,
            spreadRadius: -5,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: NavigationBar(
          selectedIndex: _selectedIndex,
          onDestinationSelected: (index) => setState(() => _selectedIndex = index),
          destinations: _destinations,
          height: 72,
          backgroundColor: Colors.transparent,
          indicatorColor: NeonRushTheme.neonGreenDim,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          animationDuration: NeonRushTheme.normalAnimation,
        ),
      ),
    );
  }

  Widget _buildFab() {
    return ScaleTransition(
      scale: _fabAnimation,
      child: Container(
        decoration: BoxDecoration(
          gradient: NeonRushTheme.buttonGradient,
          borderRadius: BorderRadius.circular(32),
          boxShadow: NeonRushTheme.neonGlow,
        ),
        child: FloatingActionButton(
          onPressed: _showQuickActions,
          backgroundColor: Colors.transparent,
          elevation: 0,
          highlightElevation: 0,
          hoverElevation: 0,
          focusElevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
            side: BorderSide.none,
          ),
          child: const Icon(
            Icons.add_rounded,
            color: NeonRushTheme.deepBlack,
            size: 28,
          ),
        ),
      ),
    ).animate().scale(delay: 300.ms, curve: Curves.elasticOut);
  }

  void _showQuickActions() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => _QuickActionsSheet(onActionSelected: (action) {
        Navigator.pop(context);
        // Handle quick actions
      }),
    );
  }
}

class _QuickActionsSheet extends StatelessWidget {
  final void Function(QuickAction) onActionSelected;

  const _QuickActionsSheet({required this.onActionSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: NeonRushTheme.charcoal,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        border: Border.all(color: NeonRushTheme.neonGreen.withValues(alpha: 0.3)),
        boxShadow: NeonRushTheme.cardShadow,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 12),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: NeonRushTheme.darkGray,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(NeonRushTheme.spacingLG),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Quick Actions', style: NeonRushTheme.heading3),
                const SizedBox(height: NeonRushTheme.spacingMD),
                _QuickActionTile(
                  icon: Icons.qr_code_scanner_rounded,
                  label: 'Pair New Device',
                  description: 'Scan QR code to connect a device',
                  onTap: () => onActionSelected(QuickAction.pairDevice),
                ),
                _QuickActionTile(
                  icon: Icons.settings_ethernet_rounded,
                  label: 'Manual Pairing',
                  description: 'Enter IP address manually',
                  onTap: () => onActionSelected(QuickAction.manualPair),
                ),
                _QuickActionTile(
                  icon: Icons.refresh_rounded,
                  label: 'Rescan Network',
                  description: 'Discover devices on local network',
                  onTap: () => onActionSelected(QuickAction.rescan),
                ),
                _QuickActionTile(
                  icon: Icons.notifications_active_rounded,
                  label: 'Test Notification',
                  description: 'Send a test notification to hub',
                  onTap: () => onActionSelected(QuickAction.testNotification),
                ),
              ],
            ),
          ),
        ],
      ),
    ).animate().slideY(begin: 1, end: 0, curve: Curves.easeOutCubic);
  }
}

class _QuickActionTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String description;
  final VoidCallback onTap;

  const _QuickActionTile({
    required this.icon,
    required this.label,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: NeonRushTheme.cardRadius,
      child: Container(
        padding: const EdgeInsets.all(NeonRushTheme.spacingMD),
        margin: const EdgeInsets.only(bottom: NeonRushTheme.spacingSM),
        decoration: BoxDecoration(
          color: NeonRushTheme.charcoalLight,
          borderRadius: NeonRushTheme.cardRadius,
          border: Border.all(color: NeonRushTheme.darkGray),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(NeonRushTheme.spacingSM),
              decoration: BoxDecoration(
                color: NeonRushTheme.neonGreenDim,
                borderRadius: NeonRushTheme.inputRadius,
              ),
              child: Icon(icon, color: NeonRushTheme.deepBlack, size: NeonRushTheme.iconMD),
            ),
            const SizedBox(width: NeonRushTheme.spacingMD),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: NeonRushTheme.labelLarge),
                  Text(description, style: NeonRushTheme.bodySmall),
                ],
              ),
            ),
            Icon(Icons.chevron_right_rounded, color: NeonRushTheme.grayText),
          ],
        ),
      ),
    );
  }
}

enum QuickAction {
  pairDevice,
  manualPair,
  rescan,
  testNotification,
}