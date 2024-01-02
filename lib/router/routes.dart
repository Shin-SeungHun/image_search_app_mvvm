import 'package:go_router/go_router.dart';
import 'package:image_search_app_mvvm/ui/view/detail_page.dart';
import 'package:image_search_app_mvvm/ui/view/main_screen.dart';

final router = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const MainScreen(),
  ),
  GoRoute(path: '/detail',
  builder: (context, state){

    return DetailPage();
  })
]);
