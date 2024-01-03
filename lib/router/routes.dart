import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:image_search_app_mvvm/ui/view/detail_page.dart';
import 'package:image_search_app_mvvm/ui/view/detail_screen.dart';
import 'package:image_search_app_mvvm/ui/view/main_screen.dart';
import 'package:image_search_app_mvvm/view_model/main_view_model.dart';
import 'package:provider/provider.dart';

final router = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    builder: (context, state) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: GetIt.instance<MainViewModel>()),
        ],
        child: const MainScreen(),
      );
    },
  ),
  GoRoute(
      path: '/detailScreen',
      builder: (context, state) {
        /// 일반 파라메터 전달
        final uri = Uri.parse(state.uri.toString());
        final queryParams = uri.queryParameters;
        final String id = queryParams['id'] ?? '';
        return ChangeNotifierProvider.value(
          value: GetIt.instance<MainViewModel>(),
          child: DetailScreen(
            id: id,
          ),
        );
      })
]);
