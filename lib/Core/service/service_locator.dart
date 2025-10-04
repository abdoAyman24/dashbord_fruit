import 'package:dashbord_fruit/Core/Repo/add_product_repo/add_product_repo.dart';
import 'package:dashbord_fruit/Core/Repo/add_product_repo/add_product_repo_impl.dart';
import 'package:dashbord_fruit/Core/Repo/image_repo/image_repo.dart';
import 'package:dashbord_fruit/Core/Repo/image_repo/image_repo_impl.dart';
import 'package:dashbord_fruit/Core/service/data_base_service.dart';
import 'package:dashbord_fruit/Core/service/fire_store_service.dart';
import 'package:dashbord_fruit/Core/service/storage_service.dart';
import 'package:dashbord_fruit/Core/service/supabase_storgae_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<StorageService>(SupabaseStorgaeService());
  getIt.registerSingleton<DataBaseService>(FireStoreService());


  getIt.registerSingleton<ImageRepo>(
    ImageRepoImpl(storageService: getIt.get<StorageService>()),
  );
  getIt.registerSingleton<AddProductRepo>(AddProductRepoImpl(dataBaseService: getIt.get<DataBaseService>()));

}
