// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_simple_arch/data/models/dashboard_summary.dart';
// import '../../data/services/dashboard_service.dart';

// class DashboardState {
//   final DashboardSummary? summary;
//   final bool loading;
//   final String? error;

//   DashboardState({this.summary, this.loading = false, this.error});

//   DashboardState copyWith({
//     DashboardSummary? summary,
//     bool? loading,
//     String? error,
//   }) {
//     return DashboardState(
//       summary: summary ?? this.summary,
//       loading: loading ?? this.loading,
//       error: error,
//     );
//   }
// }

// class DashboardCubit extends Cubit<DashboardState> {
//   final DashboardService service;

//   DashboardCubit(this.service) : super(DashboardState());

//   Future<void> loadSummary() async {
//     emit(state.copyWith(loading: true, error: null));
//     try {
//       final summary = await service.getSummary();
//       emit(state.copyWith(summary: summary, loading: false));
//     } catch (e) {
//       emit(state.copyWith(error: e.toString(), loading: false));
//     }
//   }
// }
