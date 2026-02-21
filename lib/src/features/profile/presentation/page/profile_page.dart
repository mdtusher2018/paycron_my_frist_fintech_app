import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/di/dependency_injection.dart';
import 'package:template/src/features/profile/presentation/notifiers/profile_notifier.dart';
import 'package:template/src/features/profile/domain/entities/user_profile_entity.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileState = ref.watch(profileNotifierProvider);
    ref.listen<ProfileState>(profileNotifierProvider, (previous, next) {
      if (next is ProfileError && next.profile != null) {
        ref
            .read(snackBarServiceProvider)
            .showError(next.error.toString(), context: context);
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.watch(localStorageProvider).clearAll();
            },
          ),
        ],
      ),
      body: profileState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (profile) => _buildProfile(profile, ref),
        error: (message, _, profile) {
          if (profile == null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error, color: Colors.red, size: 40),
                  const SizedBox(height: 10),
                  Text(
                    'Error: $message',
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.red, fontSize: 18),
                  ),
                ],
              ),
            );
          } else {
            return _buildProfile(profile, ref);
          }
        },
        refetching: (profile) => _buildProfile(profile, ref),
      ),
    );
  }

  Widget _buildProfile(UserProfileEntity profile, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: RefreshIndicator(
        onRefresh: () async {
          ref.read(profileNotifierProvider.notifier).refetch();
        },
        child: ListView(
          children: [
            const SizedBox(height: 20),
            Text(
              'Name: ${profile.userName}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Email: ${profile.userName}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Bio: ${profile.userName}',
              style: const TextStyle(fontSize: 16),
            ),
            // Add more profile details here as needed
          ],
        ),
      ),
    );
  }
}
