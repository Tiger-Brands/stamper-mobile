// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:omnisense/src/features/auth/auth.dart';

// extension AuthCubitX on BuildContext {
//   OmnisenseUser? get user =>
//       BlocProvider.of<OmnisenseAuthCubit>(this).state.mapOrNull(
//             authenticated: (state) => state.user,
//           );
//   OmnisenseAuthState get authState =>
//       BlocProvider.of<OmnisenseAuthCubit>(this).state;

//   bool get isUserLoggedIn =>
//       BlocProvider.of<OmnisenseAuthCubit>(this).state.maybeMap(
//             authenticated: (state) => true,
//             orElse: () => false,
//           );
// }
