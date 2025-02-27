import 'package:get/get.dart';
import '../../../domain/entity/other/mock_customer_model.dart';

class HomeController extends GetxController {
  // Daftar customer
  var customers = <Customer>[].obs;
  // Customer yang dipilih
  var selectedCustomer = Customer('').obs;

  var filteredCustomers = <Customer>[].obs;
  // Jumlah galon yang dipesan
  var jumlahGalon = 0.obs;

  var searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    // Inisialisasi data customer
    customers.addAll([
      Customer('Customer A'),
      Customer('Customer B'),
      Customer('Customer C'),
      Customer('Customer D'),
      Customer('Customer E'),
      Customer('Customer F'),
      Customer('Customer G'),
      Customer('Customer H'),
      Customer('Customer I'),
      Customer('Customer J'),
      Customer('Customer K'),
      Customer('Customer L'),
      Customer('Customer M'),
      Customer('Customer N'),
    ]);

    filteredCustomers.assignAll(customers);
  }

  // Fungsi untuk memilih customer
  void selectCustomer(Customer customer) {
    selectedCustomer.value = customer;
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
}
