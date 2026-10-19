// Filter Settings Screen
// Whitelist/blacklist apps, keyword filtering, and deduplication settings

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../core/models/notification.dart';
import '../../core/providers/app_providers.dart';
import '../../shared/theme/neon_rush_theme.dart';

class FilterSettingsScreen extends ConsumerStatefulWidget {
  const FilterSettingsScreen({super.key});

  @override
  ConsumerState<FilterSettingsScreen> createState() => _FilterSettingsScreenState();
}

class _FilterSettingsScreenState extends ConsumerState<FilterSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final settingsAsync = ref.watch(filterSettingsNotifierProvider);

    return Scaffold(
      backgroundColor: NeonRushTheme.deepBlack,
      body: settingsAsync.when(
        data: (settings) {
          return _buildSettingsList(settings);
        },
        loading: () => const Center(
          child: CircularProgressIndicator(color: NeonRushTheme.neonGreen),
        ),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline_rounded, color: NeonRushTheme.error, size: 64),
              const SizedBox(height: 16),
              Text('Failed to load settings', style: NeonRushTheme.heading3),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () => ref.refresh(filterSettingsNotifierProvider),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingsList(FilterSettings settings) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        _buildSection(
          title: 'App Filtering',
          icon: Icons.apps_rounded,
          children: [
            _buildAppListSection(
              title: 'Whitelist Apps',
              subtitle: 'Only these apps will show notifications',
              apps: settings.whitelistApps,
              onAdd: (app) => _updateSettings(settings.copyWith(whitelistApps: [...settings.whitelistApps, app])),
              onRemove: (app) => _updateSettings(settings.copyWith(
                whitelistApps: settings.whitelistApps.where((a) => a != app).toList(),
              )),
            ),
            const SizedBox(height: 16),
            _buildAppListSection(
              title: 'Blacklist Apps',
              subtitle: 'These apps will be hidden from notifications',
              apps: settings.blacklistApps,
              onAdd: (app) => _updateSettings(settings.copyWith(blacklistApps: [...settings.blacklistApps, app])),
              onRemove: (app) => _updateSettings(settings.copyWith(
                blacklistApps: settings.blacklistApps.where((a) => a != app).toList(),
              )),
            ),
          ],
        ),
        const SizedBox(height: 24),
        _buildSection(
          title: 'Keyword Filtering',
          icon: Icons.search_rounded,
          children: [
            _buildKeywordListSection(
              title: 'Whitelist Keywords',
              subtitle: 'Notifications containing these keywords will always show',
              keywords: settings.keywordWhitelist,
              onAdd: (kw) => _updateSettings(settings.copyWith(keywordWhitelist: [...settings.keywordWhitelist, kw])),
              onRemove: (kw) => _updateSettings(settings.copyWith(
                keywordWhitelist: settings.keywordWhitelist.where((k) => k != kw).toList(),
              )),
            ),
            const SizedBox(height: 16),
            _buildKeywordListSection(
              title: 'Blacklist Keywords',
              subtitle: 'Notifications containing these keywords will be hidden',
              keywords: settings.keywordBlacklist,
              onAdd: (kw) => _updateSettings(settings.copyWith(keywordBlacklist: [...settings.keywordBlacklist, kw])),
              onRemove: (kw) => _updateSettings(settings.copyWith(
                keywordBlacklist: settings.keywordBlacklist.where((k) => k != kw).toList(),
              )),
            ),
          ],
        ),
        const SizedBox(height: 24),
        _buildSection(
          title: 'Deduplication',
          icon: Icons.filter_list_rounded,
          children: [
            SwitchListTile(
              title: Text('Enable Deduplication', style: NeonRushTheme.labelLarge),
              subtitle: Text(
                'Group identical notifications from different devices',
                style: NeonRushTheme.bodySmall,
              ),
              value: settings.enableDeduplication,
              onChanged: (value) => _updateSettings(settings.copyWith(enableDeduplication: value)),
              activeColor: NeonRushTheme.neonGreen,
              inactiveTrackColor: NeonRushTheme.darkGray,
              inactiveThumbColor: NeonRushTheme.grayText,
              contentPadding: EdgeInsets.zero,
            ),
            if (settings.enableDeduplication) ...[
              const SizedBox(height: 16),
              _buildDropdownSection(
                label: 'Deduplication Window',
                value: settings.dedupWindow,
                items: DeduplicationWindow.values,
                onChanged: (value) => _updateSettings(settings.copyWith(dedupWindow: value!)),
              ),
            ],
          ],
        ),
        const SizedBox(height: 24),
        _buildSection(
          title: 'General',
          icon: Icons.settings_rounded,
          children: [
            SwitchListTile(
              title: Text('Show System Notifications', style: NeonRushTheme.labelLarge),
              subtitle: Text(
                'Include system-level notifications (battery, network, etc.)',
                style: NeonRushTheme.bodySmall,
              ),
              value: settings.showSystemNotifications,
              onChanged: (value) => _updateSettings(settings.copyWith(showSystemNotifications: value)),
              activeColor: NeonRushTheme.neonGreen,
              inactiveTrackColor: NeonRushTheme.darkGray,
              inactiveThumbColor: NeonRushTheme.grayText,
              contentPadding: EdgeInsets.zero,
            ),
            const SizedBox(height: 16),
            _buildDropdownSection(
              label: 'Minimum Priority',
              value: settings.minPriority,
              items: NotificationPriority.values,
              onChanged: (value) => _updateSettings(settings.copyWith(minPriority: value!)),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSection({
    required String title,
    required IconData icon,
    required List<Widget> children,
  }) {
    return Container(
      decoration: BoxDecoration(
        gradient: NeonRushTheme.cardGradient,
        borderRadius: NeonRushTheme.cardRadius,
        border: Border.all(color: NeonRushTheme.darkGray),
        boxShadow: NeonRushTheme.cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: NeonRushTheme.charcoalLight,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: NeonRushTheme.neonGreenDim,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(icon, color: NeonRushTheme.deepBlack, size: 20),
                ),
                const SizedBox(width: 12),
                Text(title, style: NeonRushTheme.heading3),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppListSection({
    required String title,
    required String subtitle,
    required List<String> apps,
    required void Function(String) onAdd,
    required void Function(String) onRemove,
  }) {
    final controller = TextEditingController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(child: Text(title, style: NeonRushTheme.labelLarge)),
            ElevatedButton.icon(
              onPressed: () => _showAddAppDialog(controller, onAdd),
              icon: const Icon(Icons.add_rounded, size: 18),
              label: Text('Add', style: NeonRushTheme.labelMedium),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(subtitle, style: NeonRushTheme.bodySmall),
        const SizedBox(height: 12),
        if (apps.isEmpty)
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: NeonRushTheme.charcoalLight,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: NeonRushTheme.darkGray),
            ),
            child: Text('No apps configured', style: NeonRushTheme.bodySmall),
          )
        else
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: apps.map((app) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: NeonRushTheme.charcoalLight,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: NeonRushTheme.darkGray),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(app, style: NeonRushTheme.bodyMedium),
                    const SizedBox(width: 8),
                    InkWell(
                      onTap: () => onRemove(app),
                      child: Icon(
                        Icons.close_rounded,
                        size: 16,
                        color: NeonRushTheme.error,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
      ],
    );
  }

  Widget _buildKeywordListSection({
    required String title,
    required String subtitle,
    required List<String> keywords,
    required void Function(String) onAdd,
    required void Function(String) onRemove,
  }) {
    final controller = TextEditingController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(child: Text(title, style: NeonRushTheme.labelLarge)),
            ElevatedButton.icon(
              onPressed: () => _showAddKeywordDialog(controller, onAdd),
              icon: const Icon(Icons.add_rounded, size: 18),
              label: Text('Add', style: NeonRushTheme.labelMedium),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(subtitle, style: NeonRushTheme.bodySmall),
        const SizedBox(height: 12),
        if (keywords.isEmpty)
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: NeonRushTheme.charcoalLight,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: NeonRushTheme.darkGray),
            ),
            child: Text('No keywords configured', style: NeonRushTheme.bodySmall),
          )
        else
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: keywords.map((keyword) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: NeonRushTheme.charcoalLight,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: NeonRushTheme.darkGray),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(keyword, style: NeonRushTheme.bodyMedium),
                    const SizedBox(width: 8),
                    InkWell(
                      onTap: () => onRemove(keyword),
                      child: Icon(
                        Icons.close_rounded,
                        size: 16,
                        color: NeonRushTheme.error,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
      ],
    );
  }

  Widget _buildDropdownSection<T extends Enum>({
    required String label,
    required T value,
    required List<T> items,
    required void Function(T?) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: NeonRushTheme.labelMedium),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: NeonRushTheme.charcoalLight,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: NeonRushTheme.darkGray),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<T>(
              value: value,
              isExpanded: true,
              dropdownColor: NeonRushTheme.charcoal,
              style: NeonRushTheme.bodyMedium,
              icon: Icon(Icons.keyboard_arrow_down_rounded, color: NeonRushTheme.neonGreen),
              items: items.map((item) {
                return DropdownMenuItem<T>(
                  value: item,
                  child: Text(item.name.toUpperCase(), style: NeonRushTheme.bodyMedium),
                );
              }).toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }

  void _showAddAppDialog(TextEditingController controller, void Function(String) onAdd) {
    showDialog(
      context: context,
      builder: (context) => _AddItemDialog(
        title: 'Add App',
        label: 'App Package Name',
        hint: 'e.g., com.whatsapp',
        controller: controller,
        onAdd: onAdd,
      ),
    );
  }

  void _showAddKeywordDialog(TextEditingController controller, void Function(String) onAdd) {
    showDialog(
      context: context,
      builder: (context) => _AddItemDialog(
        title: 'Add Keyword',
        label: 'Keyword',
        hint: 'e.g., "urgent", "meeting"',
        controller: controller,
        onAdd: onAdd,
      ),
    );
  }

  void _updateSettings(FilterSettings newSettings) {
    ref.read(filterSettingsNotifierProvider.notifier).updateSettings(newSettings);
  }
}

class _AddItemDialog extends StatefulWidget {
  final String title;
  final String label;
  final String hint;
  final TextEditingController controller;
  final void Function(String) onAdd;

  const _AddItemDialog({
    required this.title,
    required this.label,
    required this.hint,
    required this.controller,
    required this.onAdd,
    Key? key,
  }) : super(key: key);

  @override
  State<_AddItemDialog> createState() => _AddItemDialogState();
}

class _AddItemDialogState extends State<_AddItemDialog> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: NeonRushTheme.charcoal,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(widget.title, style: NeonRushTheme.heading3),
              const SizedBox(height: 20),
              TextFormField(
                controller: widget.controller,
                decoration: InputDecoration(
                  labelText: widget.label,
                  hintText: widget.hint,
                  filled: true,
                  fillColor: NeonRushTheme.charcoalLight,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: NeonRushTheme.subtleBorder,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: NeonRushTheme.subtleBorder,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: NeonRushTheme.glowBorder,
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                ),
                validator: (value) => value!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Cancel', style: NeonRushTheme.bodySmall),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        widget.onAdd(widget.controller.text.trim());
                        widget.controller.clear();
                        Navigator.pop(context);
                      }
                    },
                    child: Text('Add', style: NeonRushTheme.labelMedium),
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