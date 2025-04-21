import 'dart:async';
import 'dart:math';

import 'package:get/get.dart';

import '../../../domain/entity/other/keranjng_produk.dart';
import '../../../domain/entity/other/mock_customer_model.dart';

class QuickPosController extends GetxController {
  RxList<Produk> produkDibeli = <Produk>[].obs;

  // Daftar customer
  var customers = <Customer>[].obs;
  // Customer yang dipilih
  var selectedCustomer = Customer('Belum ada customer', '-', 0).obs;

  var filteredCustomers = <Customer>[].obs;

  var randomString = ''.obs;
  // Jumlah galon yang dipesan
  var jumlahGalon = 0.obs;

  var searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    updateTime();
    Timer.periodic(Duration(seconds: 1), (timer) {
      updateTime();
    });
    // Inisialisasi data customer
    customers.addAll([
      Customer('Customer A', '+6281243779612', 11),
      Customer('Customer B', '+6281243779613', 9),
      Customer('Customer C', '+6281243779614', 7),
      Customer('Customer D', '+6281243779615', 6),
      Customer('Customer E', '+6281243779616', 2),
      Customer('Customer F', '+6281243779617', 3),
      Customer('Customer G', '+6281243779618', 5),
      Customer('Customer H', '+6281243779619', 8),
      Customer('Customer I', '+6281243779610', 1),
      Customer('Customer J', '+6281243779611', 2),
      Customer('Customer K', '+6281243779610', 3),
      Customer('Customer L', '+6281243779609', 3),
      Customer('Customer M', '+6281243779608', 6),
      Customer('Customer N', '+6281243779607', 4),
    ]);

    filteredCustomers.assignAll(customers);
  }

  void updateTime() {
    final now = DateTime.now();
    currentTime.value =
        now.toIso8601String(); // Format yang benar untuk DateTime.parse()
  }

  // Fungsi untuk memilih customer
  void selectCustomer(Customer customer) {
    selectedCustomer.value = customer;
    randomString.value = generateRandomString(20);
  }

  void searchCustomer(String query) {
    searchQuery.value = query;
    if (query.isEmpty) {
      // Jika query kosong, tampilkan semua customer
      filteredCustomers.assignAll(customers);
    } else {
      // Filter customer berdasarkan query
      filteredCustomers.assignAll(
        customers.where((customer) =>
            customer.name.toLowerCase().contains(query.toLowerCase())),
      );
    }
  }

  // Fungsi untuk melakukan pemesanan
  void placeOrder() {
    if (selectedCustomer.value.name.isNotEmpty && jumlahGalon.value > 0) {
      Get.snackbar(
        'Pesanan Berhasil',
        '${jumlahGalon.value} galon dipesan untuk ${selectedCustomer.value.name}',
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      Get.snackbar(
        'Error',
        'Pilih customer dan masukkan jumlah galon yang valid',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  String generateRandomString(int length) {
    const characters =
        'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    final random = Random();
    return List.generate(
            length, (index) => characters[random.nextInt(characters.length)])
        .join();
  }

  var currentTime = ''.obs;

  var count = 0.obs;

  void increment() => count++;
  void decrement() {
    if (count > 0) count--;
  }

  void setValue(String value) {
    int? newValue = int.tryParse(value);
    if (newValue != null) {
      count.value = newValue;
    }
  }

  var isChecked = false.obs;
  void toggleCheckbox() => isChecked.value = !isChecked.value;
}
