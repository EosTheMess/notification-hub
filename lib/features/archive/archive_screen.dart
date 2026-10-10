// Archive Screen
// View and search past notifications

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../core/models/notification.dart';
import '../../core/providers/app_providers.dart';
import '../../shared/theme/neon_rush_theme.dart';

class ArchiveScreen extends ConsumerStatefulWidget {
  const ArchiveScreen({super.key});

  @override
  ConsumerState<ArchiveScreen> createState() => _ArchiveScreenState();
}

class _ArchiveScreenState extends ConsumerState<ArchiveScreen> {
  final _searchController = TextEditingController();
  ArchiveQuery _query = const ArchiveQuery();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final archivesAsync = ref.watch(archiveProviderProvider(_query));

    return Scaffold(
      backgroundColor: NeonRushTheme.deepBlack,
      body: Column(
        children: [
          // Header
          Container(
            padding: EdgeInsets.fromLTRB(24, MediaQuery.of(context).padding.top + 16, 24, 16),
            decoration: BoxDecoration(
              gradient: NeonRushTheme.cardGradient,
              border: Border(bottom: BorderSide(color: NeonRushTheme.darkGray)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Activity Archive', style: NeonRushTheme.heading2),
                const SizedBox(height: 16),
                // Search bar
                _buildSearchBar(),
                const SizedBox(height: 12),
                // Filter chips
                _buildFilterChips(),
              ],
            ),
          ),
          // Archive content
          Expanded(
            child: archivesAsync.when(
              data: (notifications) {
                if (notifications.isEmpty) {
                  return _buildEmptyState();
                }
                return _buildNotificationList(notifications);
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
                    Text('Failed to load archive', style: NeonRushTheme.heading3),
                    Text(error.toString(), style: NeonRushTheme.bodySmall),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      controller: _searchController,
      style: NeonRushTheme.bodyMedium,
      decoration: InputDecoration(
        hintText: 'Search notifications...',
        hintStyle: NeonRushTheme.bodySmall.copyWith(color: NeonRushTheme.grayText),
        prefixIcon: Icon(Icons.search_rounded, color: NeonRushTheme.grayText),
        suffixIcon: _searchController.text.isNotEmpty
            ? IconButton(
                onPressed: () {
                  _searchController.clear();
                  setState(() => _query = _query.copyWith(searchText: null));
                },
                icon: Icon(Icons.close_rounded, color: NeonRushTheme.grayText),
              )
            : null,
        filled: true,
        fillColor: NeonRushTheme.charcoal,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: NeonRushTheme.subtleBorder,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: NeonRushTheme.subtleBorder,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: NeonRushTheme.glowBorder,
        ),
      ),
      onChanged: (value) {
        setState(() {
          _query = _query.copyWith(
            searchText: value.isNotEmpty ? value : null,
            offset: 0,
          );
        });
      },
    );
  }

  Widget _buildFilterChips() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        FilterChip(
          label: Text('All Dates', style: NeonRushTheme.bodySmall),
          selected: _query.startDate == null,
          onSelected: (_) => _showDateRangePicker(),
          backgroundColor: NeonRushTheme.charcoal,
          selectedColor: NeonRushTheme.neonGreenDim,
          checkmarkColor: NeonRushTheme.neonGreen,
          side: BorderSide(color: NeonRushTheme.darkGray),
        ),
        if (_query.searchText != null)
          Chip(
            label: Text('Search: ${_query.searchText}', style: NeonRushTheme.bodySmall),
            backgroundColor: NeonRushTheme.charcoalLight,
            deleteIcon: Icon(Icons.close_rounded, color: NeonRushTheme.error),
            onDeleted: () {
              _searchController.clear();
              setState(() => _query = _query.copyWith(searchText: null));
            },
          ),
      ],
    );
  }

  Future<void> _showDateRangePicker() async {
    final result = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
      initialDateRange: DateTimeRange(
        start: _query.startDate ?? DateTime.now().subtract(const Duration(days: 30)),
        end: _query.endDate ?? DateTime.now(),
      ),
      builder: (context, child) => Theme(
        data: ThemeData.dark().copyWith(
          colorScheme: ColorScheme.dark(
            primary: NeonRushTheme.neonGreen,
            onPrimary: NeonRushTheme.deepBlack,
            surface: NeonRushTheme.charcoal,
            onSurface: NeonRushTheme.offWhite,
            onSecondary: NeonRushTheme.deepBlack,
          ),
          dialogBackgroundColor: NeonRushTheme.charcoal,
        ),
        child: child!,
      ),
    );

    if (result != null) {
      setState(() {
        _query = _query.copyWith(
          startDate: result.start,
          endDate: result.end,
          offset: 0,
        );
      });
    }
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: NeonRushTheme.neonGreenDim,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.archive_rounded,
              size: 64,
              color: NeonRushTheme.deepBlack,
            ),
          ),
          const SizedBox(height: 16),
          Text('No Archived Notifications', style: NeonRushTheme.heading3),
          Text(
            'Notifications will appear here once they are received',
            style: NeonRushTheme.bodyMedium.copyWith(color: NeonRushTheme.grayText),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationList(List<NotificationModel> notifications) {
    return ListView.builder(
      padding: const EdgeInsets.all(24),
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        final notification = notifications[index];
        return _ArchiveNotificationCard(
          notification: notification,
          onDismiss: () => setState(() {}),
        ).animate(delay: (index * 30).ms).fadeIn(duration: 200.ms);
      },
    );
  }
}

class _ArchiveNotificationCard extends StatelessWidget {
  final NotificationModel notification;
  final VoidCallback onDismiss;

  const _ArchiveNotificationCard({required this.notification, required this.onDismiss});

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('MMM d, h:mm a');

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: NeonRushTheme.charcoal,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: notification.isRead ? NeonRushTheme.darkGray : NeonRushTheme.neonGreen.withValues(alpha: 0.3),
          width: notification.isRead ? 1 : 1.5,
        ),
        boxShadow: notification.isRead ? [] : NeonRushTheme.subtleGlow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Container(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            decoration: BoxDecoration(
              color: NeonRushTheme.charcoalLight,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Row(
              children: [
                // Platform indicator
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: _getStatusColor(notification.sourceDeviceId),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 10),
                // App name
                Text(
                  notification.appName,
                  style: NeonRushTheme.labelLarge.copyWith(color: NeonRushTheme.neonGreen),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const Spacer(),
                // Status indicator
                if (!notification.isRead)
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: NeonRushTheme.neonGreen,
                      shape: BoxShape.circle,
                    ),
                  ),
                const SizedBox(width: 8),
                Text(
                  dateFormat.format(notification.timestamp),
                  style: NeonRushTheme.monoSmall,
                ),
              ],
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification.title.isEmpty ? '(No title)' : notification.title,
                  style: NeonRushTheme.bodyLarge.copyWith(
                    fontWeight: notification.isRead ? FontWeight.w400 : FontWeight.w600,
                  ),
                ),
                if (notification.content.isNotEmpty && notification.content != notification.title) ...[
                  const SizedBox(height: 8),
                  Text(
                    notification.content,
                    style: NeonRushTheme.bodyMedium,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
                if (notification.hasAttachment && notification.attachmentPath != null) ...[
                  const SizedBox(height: 12),
                  Container(
                    height: 120,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: NeonRushTheme.darkGray),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: notification.attachmentMimeType?.startsWith('image/') == true
                          ? Image.file(
                              File(notification.attachmentPath!),
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) => _buildPlaceholder(),
                            )
                          : _buildPlaceholder(),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(String sourceDeviceId) {
    // In a real app, this would be based on device platform
    return NeonRushTheme.neonGreen;
  }

  Widget _buildPlaceholder() {
    return Container(
      color: NeonRushTheme.charcoalLight,
      child: Center(
        child: Icon(Icons.insert_drive_file_rounded, color: NeonRushTheme.grayText, size: 32),
      ),
    );
  }
}