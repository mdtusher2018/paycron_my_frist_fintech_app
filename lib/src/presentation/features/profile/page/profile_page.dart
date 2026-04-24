import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:paycron_app/src/core/di/dependency_injection.dart';
import 'package:paycron_app/src/domain/entites/profile_entity.dart';
import 'package:paycron_app/src/presentation/features/profile/notifiers/profile_notifier.dart';
import 'package:paycron_app/src/presentation/router/routes.dart';
import 'package:paycron_app/src/presentation/shared/themes/colors.dart';
import 'package:paycron_app/src/presentation/shared/widgets/common_text.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileState = ref.watch(profileNotifierProvider);

    ref.listen<ProfileState>(profileNotifierProvider, (previous, next) {
      if (next is ProfileError && next.profile != null) {
        ref
            .read(snackBarServiceProvider)
            .showError(next.error.toString(), context: ref.context);
      }
    });

    return Scaffold(
      backgroundColor: AppColors.mainBG,
      body: profileState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (profile) => _ProfileBody(profile: profile),
        error: (message, _, profile) {
          if (profile == null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, color: Colors.red, size: 48),
                  const SizedBox(height: 12),
                  CommonText(message.toString(), textAlign: TextAlign.center),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () =>
                        ref.read(profileNotifierProvider.notifier).refetch(),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }
          return _ProfileBody(profile: profile);
        },
        refetching: (profile) => _ProfileBody(profile: profile),
      ),
    );
  }
}

class _ProfileBody extends ConsumerWidget {
  final GetMyProfileEntity profile;
  const _ProfileBody({required this.profile});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RefreshIndicator(
      onRefresh: () async =>
          ref.read(profileNotifierProvider.notifier).refetch(),
      child: CustomScrollView(
        slivers: [
          _ProfileAppBar(profile: profile, ref: ref),
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _InfoCard(profile: profile),
                const SizedBox(height: 16),
                _QuickActionsCard(),
                const SizedBox(height: 16),
                _DangerZone(ref: ref, context: context),
                const SizedBox(height: 30),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileAppBar extends StatelessWidget {
  final GetMyProfileEntity profile;
  final WidgetRef ref;
  const _ProfileAppBar({required this.profile, required this.ref});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 240,
      pinned: true,
      backgroundColor: Colors.blue.shade700,
      surfaceTintColor: Colors.transparent,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF4A6CF7), Color(0xFF3B5BDB)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              Stack(
                children: [
                  CircleAvatar(
                    radius: 46,
                    backgroundColor: Colors.white.withOpacity(0.2),
                    child: Text(
                      profile.userName.isNotEmpty
                          ? profile.userName.substring(0, 1).toUpperCase()
                          : '?',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.camera_alt,
                        size: 14,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                profile.userName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Verified',
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final GetMyProfileEntity profile;
  const _InfoCard({required this.profile});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Account Info',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
          ),
          const Divider(height: 24),
          _InfoRow(
            icon: Icons.person_outline,
            label: 'Full Name',
            value: profile.userName,
          ),
          const SizedBox(height: 14),
          _InfoRow(
            icon: Icons.email_outlined,
            label: 'Email',
            value: profile.userName,
          ),
          const SizedBox(height: 14),
          _InfoRow(
            icon: Icons.shield_outlined,
            label: 'Account Status',
            value: 'Active',
            valueColor: AppColors.success,
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color? valueColor;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.08),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, size: 18, color: Colors.blue),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(fontSize: 11, color: Colors.grey.shade500),
              ),
              Text(
                value,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: valueColor ?? AppColors.textPrimary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _QuickActionsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Settings',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
          ),
          const Divider(height: 24),
          _ActionTile(
            icon: Icons.edit_outlined,
            label: 'Edit Profile',
            onTap: () {
              // Navigate to edit profile
            },
          ),
          _ActionTile(
            icon: Icons.credit_card_outlined,
            label: 'Payment Methods',
            onTap: () => context.push(AppRoutes.cardsManagement),
          ),
          _ActionTile(
            icon: Icons.request_page_outlined,
            label: 'Money Requests',
            onTap: () => context.push(AppRoutes.moneyRequests),
          ),
          _ActionTile(
            icon: Icons.verified_user_outlined,
            label: 'Identity Verification',
            onTap: () {
              // Navigate to KYC
            },
          ),
          _ActionTile(
            icon: Icons.lock_outline,
            label: 'Change PIN',
            onTap: () {},
          ),
          _ActionTile(
            icon: Icons.notifications_outlined,
            label: 'Notifications',
            onTap: () {},
            showDivider: false,
          ),
        ],
      ),
    );
  }
}

class _ActionTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool showDivider;

  const _ActionTile({
    required this.icon,
    required this.label,
    required this.onTap,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(icon, size: 18, color: Colors.grey.shade700),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Text(
                    label,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  color: Colors.grey.shade400,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
        if (showDivider) Divider(height: 1, color: Colors.grey.shade100),
      ],
    );
  }
}

class _DangerZone extends StatelessWidget {
  final WidgetRef ref;
  final BuildContext context;
  const _DangerZone({required this.ref, required this.context});

  @override
  Widget build(BuildContext _) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Account',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
          ),
          const Divider(height: 24),
          InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () async {
              await ref.read(localStorageProvider).clearAll();
              context.go(AppRoutes.signIn);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.logout,
                      size: 18,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(width: 14),
                  const Text(
                    'Sign Out',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
