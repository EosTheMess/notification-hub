// Live Notification Feed Screen

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:intl/intl.dart';

import '../../core/models/notification.dart';
import '../../core/providers/app_providers.dart';
import '../../shared/theme/neon_rush_theme.dart';

class LiveFeedScreen extends ConsumerStatefulWidget {
  const LiveFeedScreen({super.key});

  @override
  ConsumerState<LiveFeedScreen> createState() => _LiveFeedScreenState();
}

class _LiveFeedScreenState extends ConsumerState<LiveFeedScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _showScrollToTop = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      final show = _scrollController.offset > 200;
      if (show != _showScrollToTop) {
        setState(() => _showScrollToTop = show);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final feedAsync = ref.watch(liveNotificationFeedProvider);

    return Scaffold(
      backgroundColor: NeonRushTheme.deepBlack,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          _buildAppBar(),
          feedAsync.when(
            data: (groups) => _buildNotificationList(groups),
            loading: () => _buildLoadingState(),
            error: (error, stack) => _buildErrorState(error.toString()),
          ),
        ],
      ),
      floatingActionButton: _showScrollToTop ? _buildScrollToTopFab() : null,
    );
  }

  Widget _buildAppBar() {
    return SliverAppBar(
      expandedHeight: 120,
      floating: true,
      pinned: true,
      snap: true,
      backgroundColor: NeonRushTheme.charcoal,
      surfaceTintColor: Colors.transparent,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                NeonRushTheme.charcoal,
                NeonRushTheme.deepBlack,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            border: Border(
              bottom: BorderSide(
                color: NeonRushTheme.neonGreen.withValues(alpha: 0.2),
                width: 1,
              ),
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          gradient: NeonRushTheme.neonGlowGradient,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.notifications_active_rounded,
                          color: NeonRushTheme.deepBlack,
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Live Feed', style: NeonRushTheme.heading2),
                            Text('Real-time notifications', style: NeonRushTheme.bodySmall),
                          ],
                        ),
                      ),
                      _buildConnectionIndicator(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildConnectionIndicator() {
    return Consumer(
      builder: (context, ref, _) {
        final devicesAsync = ref.watch(deviceManagerProvider);
        return devicesAsync.when(
          data: (devices) {
            final connectedCount = devices.where((d) => d.connectionState == DeviceConnectionState.connected).length;
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: connectedCount > 0 ? NeonRushTheme.neonGreenDim : NeonRushTheme.darkGray.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: connectedCount > 0 ? NeonRushTheme.neonGreen : NeonRushTheme.darkGray,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: connectedCount > 0 ? NeonRushTheme.neonGreen : NeonRushTheme.grayText,
                      shape: BoxShape.circle,
                    ),
                  ).animate(onPlay: (controller) => controller.repeat(reverse: true)).scale(duration: 1000.ms),
                  const SizedBox(width: 6),
                  Text(
                    '$connectedCount connected',
                    style: NeonRushTheme.labelMedium.copyWith(
                      color: connectedCount > 0 ? NeonRushTheme.neonGreen : NeonRushTheme.grayText,
                    ),
                  ),
                ],
              ),
            );
          },
          loading: () => const SizedBox.shrink(),
          error: (_, __) => const SizedBox.shrink(),
        );
      },
    );
  }

  Widget _buildNotificationList(List<NotificationGroup> groups) {
    if (groups.isEmpty) {
      return _buildEmptyState();
    }

    return SliverPadding(
      padding: const EdgeInsets.all(NeonRushTheme.spacingMD),
      sliver: SliverList.separated(
        itemCount: groups.length,
        separatorBuilder: (_, __) => const SizedBox(height: NeonRushTheme.spacingSM),
        itemBuilder: (context, index) {
          final group = groups[index];
          return _NotificationGroupCard(
            group: group,
            onDismiss: () => _dismissGroup(group),
            onQuickReply: (text) => _quickReplyGroup(group, text),
            onExpand: () => _toggleGroupExpansion(group),
          ).animate().fadeIn(duration: 300.ms, delay: (index * 50).ms).slideY(begin: 0.2, end: 0);
        },
      ),
    );
  }

  Widget _buildEmptyState() {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: NeonRushTheme.neonGreenDim,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.notifications_none_rounded,
                size: 64,
                color: NeonRushTheme.deepBlack,
              ),
            ).animate(onPlay: (controller) => controller.repeat(reverse: true)).scale(duration: 2000.ms),
            const SizedBox(height: NeonRushTheme.spacingLG),
            Text('No Notifications Yet', style: NeonRushTheme.heading3),
            const SizedBox(height: NeonRushTheme.spacingSM),
            Text(
              'Connect a device to start receiving notifications',
              style: NeonRushTheme.bodyMedium.copyWith(color: NeonRushTheme.grayText),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: NeonRushTheme.spacingXL),
            ElevatedButton.icon(
              onPressed: () => Navigator.pushNamed(context, '/devices'),
              icon: const Icon(Icons.add_rounded),
              label: const Text('Add Device'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadingState() {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              color: NeonRushTheme.neonGreen,
              strokeWidth: 3,
            ),
            const SizedBox(height: NeonRushTheme.spacingMD),
            Text('Loading notifications...', style: NeonRushTheme.bodyMedium),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorState(String error) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(NeonRushTheme.spacingXL),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline_rounded, size: 64, color: NeonRushTheme.error),
              const SizedBox(height: NeonRushTheme.spacingMD),
              Text('Failed to Load', style: NeonRushTheme.heading3),
              const SizedBox(height: NeonRushTheme.spacingSM),
              Text(
                error,
                style: NeonRushTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: NeonRushTheme.spacingLG),
              ElevatedButton(
                onPressed: () => ref.invalidate(liveNotificationFeedProvider),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildScrollToTopFab() {
    return FloatingActionButton.small(
      onPressed: () => _scrollController.animateTo(
        0,
        duration: NeonRushTheme.normalAnimation,
        curve: Curves.easeOutCubic,
      ),
      backgroundColor: NeonRushTheme.charcoal,
      foregroundColor: NeonRushTheme.neonGreen,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: NeonRushTheme.neonBorder,
      ),
      child: const Icon(Icons.keyboard_arrow_up_rounded),
    ).animate().fadeIn().scale();
  }

  void _dismissGroup(NotificationGroup group) {
    for (final notification in group.notifications) {
      ref.read(notificationRepositoryProvider.notifier).dismissNotification(
        notification.id,
        notification.sourceDeviceId,
      );
    }
  }

  void _quickReplyGroup(NotificationGroup group, String text) {
    for (final notification in group.notifications) {
      if (notification.supportsQuickReply) {
        ref.read(notificationRepositoryProvider.notifier).quickReply(
          notification.id,
          notification.sourceDeviceId,
          text,
        );
      }
    }
  }

  void _toggleGroupExpansion(NotificationGroup group) {
    // Expansion state would be managed locally or via provider
  }
}

class _NotificationGroupCard extends ConsumerStatefulWidget {
  final NotificationGroup group;
  final VoidCallback onDismiss;
  final Function(String) onQuickReply;
  final VoidCallback onExpand;

  const _NotificationGroupCard({
    required this.group,
    required this.onDismiss,
    required this.onQuickReply,
    required this.onExpand,
  });

  @override
  ConsumerState<_NotificationGroupCard> createState() => _NotificationGroupCardState();
}

class _NotificationGroupCardState extends ConsumerState<_NotificationGroupCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final notification = widget.group.notifications.first;
    final count = widget.group.count;
    final timeAgo = _formatTimeAgo(notification.timestamp);

    return Container(
      decoration: BoxDecoration(
        gradient: NeonRushTheme.cardGradient,
        borderRadius: NeonRushTheme.cardRadius,
        border: Border.all(
          color: notification.isRead ? NeonRushTheme.darkGray : NeonRushTheme.neonGreen.withValues(alpha: 0.5),
          width: notification.isRead ? 1 : 1.5,
        ),
        boxShadow: notification.isRead ? NeonRushTheme.cardShadow : NeonRushTheme.neonGlow,
      ),
      child: Column(
        children: [
          // Main notification card
          InkWell(
            onTap: widget.onExpand,
            borderRadius: NeonRushTheme.cardRadius,
            child: Padding(
              padding: const EdgeInsets.all(NeonRushTheme.spacingMD),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // App icon / indicator
                  _buildAppIndicator(notification),
                  const SizedBox(width: NeonRushTheme.spacingMD),
                  // Content
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                notification.appName,
                                style: NeonRushTheme.labelLarge.copyWith(
                                  color: NeonRushTheme.neonGreen,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            if (count > 1)
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                decoration: BoxDecoration(
                                  color: NeonRushTheme.neonGreenDim,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  '×$count',
                                  style: NeonRushTheme.monoSmall.copyWith(fontSize: 10),
                                ),
                              ),
                            const SizedBox(width: NeonRushTheme.spacingSM),
                            Text(timeAgo, style: NeonRushTheme.monoSmall),
                          ],
                        ),
                        const SizedBox(height: NeonRushTheme.spacingXS),
                        Text(
                          notification.title.isEmpty ? '(No title)' : notification.title,
                          style: NeonRushTheme.bodyLarge.copyWith(
                            fontWeight: notification.isRead ? FontWeight.w400 : FontWeight.w600,
                          ),
                          maxLines: _isExpanded ? null : 1,
                          overflow: _isExpanded ? null : TextOverflow.ellipsis,
                        ),
                        if (notification.content.isNotEmpty && notification.content != notification.title) ...[
                          const SizedBox(height: NeonRushTheme.spacingXS),
                          Text(
                            notification.content,
                            style: NeonRushTheme.bodyMedium,
                            maxLines: _isExpanded ? null : 2,
                            overflow: _isExpanded ? null : TextOverflow.ellipsis,
                          ),
                        ],
                        if (notification.hasAttachment && notification.attachmentPath != null) ...[
                          const SizedBox(height: NeonRushTheme.spacingSM),
                          _buildAttachmentPreview(notification),
                        ],
                      ],
                    ),
                  ),
                  // Expand indicator
                  Icon(
                    _isExpanded ? Icons.expand_less_rounded : Icons.expand_more_rounded,
                    color: NeonRushTheme.grayText,
                    size: NeonRushTheme.iconMD,
                  ),
                ],
              ),
            ),
          ),
          // Expanded actions
          if (_isExpanded) _buildActionBar(notification),
        ],
      ),
    );
  }

  Widget _buildAppIndicator(NotificationModel notification) {
    final platformColor = _getPlatformColor(notification.sourceDeviceId);
    
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: platformColor.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: platformColor.withValues(alpha: 0.5)),
      ),
      child: Icon(
        _getAppIcon(notification.appName),
        color: platformColor,
        size: NeonRushTheme.iconMD,
      ),
    );
  }

  Color _getPlatformColor(String deviceId) {
    // In a real app, this would come from the device model
    return NeonRushTheme.neonGreen;
  }

  IconData _getAppIcon(String appName) {
    final lower = appName.toLowerCase();
    if (lower.contains('mail') || lower.contains('gmail')) return Icons.mail_rounded;
    if (lower.contains('message') || lower.contains('sms') || lower.contains('whatsapp') || lower.contains('telegram')) return Icons.message_rounded;
    if (lower.contains('phone') || lower.contains('call')) return Icons.phone_rounded;
    if (lower.contains('calendar')) return Icons.calendar_today_rounded;
    if (lower.contains('twitter') || lower.contains('x.com')) return Icons.alternate_email_rounded;
    if (lower.contains('instagram')) return Icons.camera_alt_rounded;
    if (lower.contains('discord')) return Icons.discord_rounded;
    if (lower.contains('slack')) return Icons.work_rounded;
    if (lower.contains('github')) return Icons.code_rounded;
    return Icons.apps_rounded;
  }

  Widget _buildAttachmentPreview(NotificationModel notification) {
    return Container(
      height: 120,
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
                width: double.infinity,
                errorBuilder: (_, __, ___) => _buildPlaceholder(),
              )
            : _buildPlaceholder(),
      ),
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      color: NeonRushTheme.charcoalLight,
      child: Center(
        child: Icon(Icons.insert_drive_file_rounded, color: NeonRushTheme.grayText, size: 32),
      ),
    );
  }

  Widget _buildActionBar(NotificationModel notification) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      decoration: BoxDecoration(
        color: NeonRushTheme.charcoalLight,
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(16)),
        border: Border(top: BorderSide(color: NeonRushTheme.darkGray)),
      ),
      child: Row(
        children: [
          if (notification.supportsQuickReply) ...[
            Expanded(
              child: _QuickReplyField(
                placeholder: notification.quickReplyPlaceholder ?? 'Reply...',
                onSubmit: widget.onQuickReply,
              ),
            ),
            const SizedBox(width: NeonRushTheme.spacingSM),
          ],
          ...notification.actions.map((action) => Padding(
            padding: const EdgeInsets.only(left: NeonRushTheme.spacingSM),
            child: _ActionButton(
              action: action,
              onPressed: () => _handleAction(notification, action),
            ),
          )),
        ],
      ),
    );
  }

  void _handleAction(NotificationModel notification, NotificationAction action) {
    switch (action.type) {
      case ActionType.dismiss:
        widget.onDismiss();
        break;
      case ActionType.reply:
        // Quick reply handled by field
        break;
      case ActionType.open:
        // Open app - would need platform channel
        break;
      case ActionType.custom:
        // Send custom action to source device
        ref.read(networkServiceNotifierProvider.future)?.sendAction(
          notification.sourceDeviceId,
          notification.id,
          action.id,
          action.payload,
        );
        break;
    }
  }

  String _formatTimeAgo(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inSeconds < 60) return '${difference.inSeconds}s';
    if (difference.inMinutes < 60) return '${difference.inMinutes}m';
    if (difference.inHours < 24) return '${difference.inHours}h';
    if (difference.inDays < 7) return '${difference.inDays}d';
    return DateFormat('MMM d').format(timestamp);
  }
}

class _QuickReplyField extends StatefulWidget {
  final String placeholder;
  final Function(String) onSubmit;

  const _QuickReplyField({required this.placeholder, required this.onSubmit});

  @override
  State<_QuickReplyField> createState() => _QuickReplyFieldState();
}

class _QuickReplyFieldState extends State<_QuickReplyField> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      focusNode: _focusNode,
      style: NeonRushTheme.bodyMedium,
      decoration: InputDecoration(
        hintText: widget.placeholder,
        hintStyle: NeonRushTheme.bodySmall,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        border: OutlineInputBorder(
          borderRadius: NeonRushTheme.inputRadius,
          borderSide: NeonRushTheme.subtleBorder,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: NeonRushTheme.inputRadius,
          borderSide: NeonRushTheme.subtleBorder,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: NeonRushTheme.inputRadius,
          borderSide: NeonRushTheme.glowBorder,
        ),
        filled: true,
        fillColor: NeonRushTheme.charcoal,
      ),
      onSubmitted: (value) {
        if (value.trim().isNotEmpty) {
          widget.onSubmit(value.trim());
          _controller.clear();
        }
      },
      textInputAction: TextInputAction.send,
    );
  }
}

class _ActionButton extends StatelessWidget {
  final NotificationAction action;
  final VoidCallback onPressed;

  const _ActionButton({required this.action, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final isDestructive = action.type == ActionType.dismiss;
    
    return IconButton(
      onPressed: onPressed,
      style: IconButton.styleFrom(
        backgroundColor: isDestructive ? NeonRushTheme.error.withValues(alpha: 0.2) : NeonRushTheme.charcoal,
        foregroundColor: isDestructive ? NeonRushTheme.error : NeonRushTheme.neonGreen,
        side: BorderSide(
          color: isDestructive ? NeonRushTheme.error : NeonRushTheme.neonGreen.withValues(alpha: 0.5),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.all(12),
      ),
      icon: Icon(_getActionIcon(action.type), size: 20),
      tooltip: action.label,
    );
  }

  IconData _getActionIcon(ActionType type) {
    switch (type) {
      case ActionType.dismiss: return Icons.close_rounded;
      case ActionType.reply: return Icons.reply_rounded;
      case ActionType.open: return Icons.open_in_new_rounded;
      case ActionType.custom: return Icons.touch_app_rounded;
    }
  }
}