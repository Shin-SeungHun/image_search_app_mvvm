import 'package:get_it/get_it.dart';
import 'package:image_search_app_mvvm/data/repository/image_item_repository_impl.dart';
import 'package:image_search_app_mvvm/data/repository/interface/image_item_repository.dart';
import 'package:image_search_app_mvvm/view_model/main_view_model.dart';


final GetIt getIt = GetIt.instance;

void diSetup() {
  getIt.registerSingleton<ImageItemRepository>(ImageItemRepositoryImpl());

  getIt.registerFactory<MainViewModel>(
      () => MainViewModel(repository: getIt<ImageItemRepository>()));
}
