import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:template/src/config/router/app_router.dart';
import 'package:template/src/core/services/network/api_client.dart';
import 'package:template/src/core/services/network/api_service.dart';
import 'package:template/src/core/services/network/i_api_service.dart';
import 'package:template/src/core/services/snackbar/i_snackbar_service.dart';
import 'package:template/src/core/services/snackbar/snackbar_service.dart';
import 'package:template/src/core/services/storage/i_local_storage_service.dart';
import 'package:template/src/core/services/storage/local_storage_service.dart';
import 'package:template/src/core/utils/api_end_points.dart';
import 'package:template/src/data/repositories/auth_repository.dart';
import 'package:template/src/data/repositories/home_repository.dart';
import 'package:template/src/domain/repositories/i_home_repositoty.dart';
import 'package:template/src/domain/usecase/home_usecase.dart';
import 'package:template/src/domain/usecase/signin_usecase.dart';
import 'package:template/src/domain/usecase/signup_usecase.dart';
import 'package:template/src/data/repositories/profile_repository.dart';

import 'package:template/src/domain/repositories/i_profile_repositoty.dart';
import 'package:template/src/domain/repositories/i_auth_repository.dart';
import 'package:template/src/domain/usecase/email_verified_usecase.dart';

part 'dependency_injection.g.dart';
part 'parts/services.dart';
part 'parts/repository.dart';
part 'parts/usecase.dart';
