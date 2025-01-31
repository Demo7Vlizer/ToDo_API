import 'package:get/get.dart';

class LoadingController extends GetxController {
  final RxBool isLoading = false.obs;
  final RxBool isDeleting = false.obs;
  final RxBool isUpdating = false.obs;
  final RxBool isCreating = false.obs;
  final RxBool isFetching = false.obs;

  void startLoading() => isLoading.value = true;
  void stopLoading() => isLoading.value = false;

  void startDeleting() => isDeleting.value = true;
  void stopDeleting() => isDeleting.value = false;

  void startUpdating() => isUpdating.value = true;
  void stopUpdating() => isUpdating.value = false;

  void startCreating() => isCreating.value = true;
  void stopCreating() => isCreating.value = false;

  void startFetching() => isFetching.value = true;
  void stopFetching() => isFetching.value = false;
} 