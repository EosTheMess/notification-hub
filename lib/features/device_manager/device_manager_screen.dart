// Device Manager Screen
// Allows users to add, manage, and disconnect devices

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:intl/intl.dart';

import '../../core/models/notification.dart';
import '../../core/providers/app_providers.dart';

class DeviceManagerScreen extends ConsumerStatefulWidget {
  const DeviceManagerScreen({super.key});

  @override
  ConsumerState<DeviceManagerScreen> createState() => _DeviceManagerScreenState();
}

class _DeviceManagerScreenState extends ConsumerState<DeviceManagerScreen> {
  final _formKey = GlobalKey<FormState>();
  final _deviceNameController = TextEditingController();
  final _deviceIpController = TextEditingController();
  final _devicePortController = TextEditingController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(deviceManagerProvider.notifier).loadDevices();
    });
  }

  @override
  void dispose() {
    _deviceNameController.dispose();
    _deviceIpController.dispose();
    _devicePortController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final devicesAsync = ref.watch(deviceManagerProvider);

    return Scaffold(
      backgroundColor: NeonRushTheme.deepBlack,
      body: devicesAsync.when(
        data: (devices) {
          return _buildDeviceList(devices);
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
              Text('Failed to load devices', style: NeonRushTheme.heading3),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () => ref.refresh(deviceManagerProvider),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDeviceList(List<DeviceModel> devices) {
    if (devices.isEmpty) {
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
              child: Icon(
                Icons.devices_rounded,
                size: 64,
                color: NeonRushTheme.neonGreen,
              ),
            ),
            const SizedBox(height: 16),
            Text('No Devices Connected', style: NeonRushTheme.heading3),
            Text(
              'Connect Android, iOS, or Linux devices to receive notifications',
              style: NeonRushTheme.bodyMedium.copyWith(color: NeonRushTheme.grayText),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () => _showAddDeviceDialog(),
              icon: const Icon(Icons.add_rounded),
              label: const Text('Add Device'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(0),
      itemCount: devices.length,
      itemBuilder: (context, index) {
        final device = devices[index];
        return _DeviceCard(
          key: ValueKey(device.id),
          device: device,
          onDismiss: () => _removeDevice(device.id),
        );
      },
    );
  }

  Future<void> _showAddDeviceDialog() async {
    final bool success = await showDialog(
      context: context,
      builder: (context) => _AddDeviceDialog(
        onSave: _onSaveDevice,
      ),
    ) as bool?;

    if (success != false) {
      // Device was added or updated
      _deviceNameController.clear();
      _deviceIpController.clear();
      _devicePortController.clear();
    }
  }

  void _onSaveDevice(DeviceModel device) {
    ref.read(deviceManagerProvider.notifier).addDevice(device);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${device.name} added successfully', style: NeonRushTheme.bodyMedium),
        backgroundColor: NeonRushTheme.neonGreen,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _removeDevice(String deviceId) {
    showDialog(
      context: context,
      builder: (context) => _ConfirmDialog(
        title: 'Remove Device',
        content: 'Are you sure you want to remove this device and stop receiving notifications from it?',
        confirmText: 'Remove',
        cancelText: 'Cancel',
        onConfirm: () {
          Navigator.pop(context);
          ref.read(deviceManagerProvider.notifier).removeDevice(deviceId);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Device removed', style: NeonRushTheme.bodyMedium),
              backgroundColor: NeonRushTheme.error,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              duration: const Duration(seconds: 2),
            ),
          );
        },
      ),
    );
  }
}

class _DeviceCard extends ConsumerWidget {
  final DeviceModel device;
  final VoidCallback onDismiss;

  const _DeviceCard({
    required this.device,
    required this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: NeonRushTheme.charcoal,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: device.connectionState == DeviceConnectionState.connected
              ? NeonRushTheme.neonGreen.withValues(alpha: 0.5)
              : NeonRushTheme.darkGray,
        ),
        boxShadow: device.connectionState == DeviceConnectionState.connected
            ? NeonRushTheme.neonGlow
            : [],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with device info
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: NeonRushTheme.charcoalLight,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Row(
              children: [
                // Platform indicator
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: _getPlatformColor(device.platform),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        device.name,
                        style: NeonRushTheme.labelLarge.copyWith(
                          color: NeonRushTheme.pureWhite,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        'IP: ${device.localIp} | Port: ${device.port ?? 8765}',
                        style: NeonRushTheme.bodySmall.copyWith(color: NeonRushTheme.grayText),
                      ),
                    ],
                  ),
                ),
                // Status badge
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: device.connectionState == DeviceConnectionState.connected
                        ? NeonRushTheme.neonGreenDim
                        : NeonRushTheme.darkGray.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    device.connectionState.name.toUpperCase(),
                    style: NeonRushTheme.labelMedium.copyWith(
                      color: device.connectionState == DeviceConnectionState.connected
                          ? NeonRushTheme.neonGreen
                          : NeonRushTheme.grayText,
                    ),
                  ),
                ),
                // Remove button
                IconButton(
                  icon: Icon(
                    Icons.close_rounded,
                    color: NeonRushTheme.error,
                    size: 20,
                  ),
                  onPressed: onDismiss,
                  tooltip: 'Remove Device',
                ),
              ],
            ),
          ),
          // Content
          Container(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Permissions
                _buildPermissionChip(device.permissions),
                const SizedBox(height: 12),
                // Allowed Apps
                _buildSectionTitle('Allowed Apps'),
                ..._buildAppChips(device.allowedApps),
                const SizedBox(height: 8),
                // Blocked Apps
                _buildSectionTitle('Blocked Apps'),
                ..._buildAppChips(device.blockedApps),
                const SizedBox(height: 8),
                // Keyword Filters
                _buildSectionTitle('Keyword Filters'),
                ..._buildKeywordChips(device.keywordFilters),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color _getPlatformColor(DevicePlatform platform) {
    switch (platform) {
      case DevicePlatform.android:
        return NeonRushTheme.neonGreen;
      case DevicePlatform.ios:
        return NeonRushTheme.neonGreen;
      case DevicePlatform.linux:
        return NeonRushTheme.neonGreen;
      case DevicePlatform.macos:
        return NeonRushTheme.neonGreen;
      case DevicePlatform.windows:
        return NeonRushTheme.neonGreen;
      default:
        return NeonRushTheme.neonGreen;
    }
  }

  Widget _buildPermissionChip(DevicePermissions permissions) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: NeonRushTheme.charcoalLight,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: NeonRushTheme.darkGray),
      ),
      child: Row(
        children: [
          Icon(
            Icons.shield_rounded,
            size: 14,
            color: NeonRushTheme.grayText,
          ),
          const SizedBox(width: 6),
          Text(
            permissions.name.toUpperCase(),
            style: NeonRushTheme.bodySmall.copyWith(color: NeonRushTheme.grayText),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        title,
        style: NeonRushTheme.labelMedium.copyWith(color: NeonRushTheme.grayText),
      ),
    );
  }

  List<Widget> _buildAppChips(List<String> apps) {
    if (apps.isEmpty) {
      return [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: NeonRushTheme.darkGray,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            'None configured',
            style: NeonRushTheme.bodySmall.copyWith(color: NeonRushTheme.grayText),
          ),
        ),
      ];
    }

    return apps.map((app) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: NeonRushTheme.charcoalLight,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          app,
          style: NeonRushTheme.bodySmall.copyWith(color: NeonRushTheme.offWhite),
        ),
      );
    }).toList();
  }

  List<Widget> _buildKeywordChips(List<String> keywords) {
    if (keywords.isEmpty) {
      return [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: NeonRushTheme.darkGray,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            'No filters',
            style: NeonRushTheme.bodySmall.copyWith(color: NeonRushTheme.grayText),
          ),
        ),
      ];
    }

    return keywords.map((keyword) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: NeonRushTheme.charcoalLight,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              keyword,
              style: NeonRushTheme.bodySmall.copyWith(color: NeonRushTheme.offWhite),
            ),
            const SizedBox(width: 4),
            InkWell(
              onTap: () => _removeKeyword(keyword),
              child: Icon(
                Icons.remove_circle_rounded,
                size: 14,
                color: NeonRushTheme.error,
              ),
            ),
          ],
        ),
      );
    }).toList();
  }

  void _removeKeyword(String keyword) {
    ref.read(deviceManagerProvider.notifier).removeKeyword(keyword);
    setState(() {});
  }
}

class _AddDeviceDialog extends ConsumerWidget {
  final void Function(DeviceModel) onSave;
  final String? initialName;
  final String? initialIp;
  final int? initialPort;

  const _AddDeviceDialog({
    required this.onSave,
    this.initialName,
    this.initialIp,
    this.initialPort,
    Key? key,
  }) : super(key: key);

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                initialName != null ? 'Update Device' : 'Add Device',
                style: NeonRushTheme.heading3,
              ),
              const SizedBox(height: 20),
              _buildTextField(
                controller: _deviceNameController,
                label: 'Device Name',
                initialValue: initialName,
                validator: (value) => value!.isEmpty ? 'Enter a name' : null,
              ),
              const SizedBox(height: 12),
              _buildTextField(
                controller: _deviceIpController,
                label: 'IP Address',
                initialValue: initialIp,
                validator: (value) {
                  if (value!.isEmpty) return 'Enter IP';
                  final parts = value.split('.');
                  if (parts.length != 4) return 'Invalid IP format';
                  return null;
                },
              ),
              const SizedBox(height: 12),
              _buildTextField(
                controller: _devicePortController,
                label: 'Port',
                initialValue: initialPort != null ? initialPort.toString() : '8765',
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) return 'Enter port';
                  final port = int.tryParse(value);
                  if (port == null || port < 1 || port > 65535) return 'Invalid port number';
                  return null;
                },
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context, false),
                    child: Text('Cancel', style: NeonRushTheme.labelMedium),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final device = DeviceModel(
                          id: DateTime.now().millisecondsSinceEpoch.toString(),
                          name: _deviceNameController.text,
                          platform: DevicePlatform.linux,
                          localIp: _deviceIpController.text,
                          port: int.parse(_devicePortController.text),
                          connectionState: DeviceConnectionState.disconnected,
                          lastSeen: DateTime.now(),
                          permissions: DevicePermissions.readOnly,
                        );
                        onSave(device);
                        Navigator.pop(context, true);
                      }
                    },
                    child: Text('Save', style: NeonRushTheme.labelMedium),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    String? initialValue,
    required String? Function(String?) validator,
  }) {
    return TextFormField(
      controller: controller,
      initialValue: initialValue,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: NeonRushTheme.bodyMedium.copyWith(color: NeonRushTheme.offWhite),
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
      validator: validator,
    );
  }
}

class _ConfirmDialog extends StatelessWidget {
  final String title;
  final String content;
  final String confirmText;
  final String cancelText;
  final VoidCallback onConfirm;

  const _ConfirmDialog({
    required this.title,
    required this.content,
    required this.confirmText,
    required this.cancelText,
    required this.onConfirm,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: NeonRushTheme.charcoal,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title, style: NeonRushTheme.heading3),
            const SizedBox(height: 16),
            Text(content, style: NeonRushTheme.bodyMedium),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(cancelText, style: NeonRushTheme.bodySmall),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: () => onConfirm(),
                  child: Text(confirmText, style: NeonRushTheme.labelMedium),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}