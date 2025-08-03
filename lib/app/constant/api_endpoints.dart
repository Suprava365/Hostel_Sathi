class ApiEndpoints {
  ApiEndpoints._();

  // Timeouts
  static const connectionTimeout = Duration(seconds: 1000);
  static const receiveTimeout = Duration(seconds: 1000);

  // For Android Emulator
  static const String serverAddress = "http://172.26.0.44:3000";
  // For iOS Simulator
  //static const String serverAddress = "http://localhost:3000";

  // For iPhone (uncomment if needed)
  static const String baseUrl = "$serverAddress/";
  static const String imageUrl = "$baseUrl/uploads/";

  // Auth
  static const String login = "auth/login";
  static const String register = "auth/register";
  static const String getAllStudent = "auth/getAllStudents";
  static const String getStudentsByBatch = "auth/getStudentsByBatch/";
  static const String getStudentsByCourse = "auth/getStudentsByCourse/";
  static const String updateStudent = "auth/updateStudent/";
  static const String deleteStudent = "auth/deleteStudent/";
  static const String uploadImage = "auth/uploadImage";

  static const String createHostel = "api/hostels/";
  static const String getAllHostels = "api/hostels/";
  static const String updateHostel = "api/hostels/id";
  static const String deleteHostels = "api/hostels/id";


  static const String createBooking = "api/hostels/";
  static const String updatestatus = "api/hostels/bookingId/status";
  static const String markaspaid = "api/bookingId/paid'";
  static const String getbookings = "api/hostels";
  static const String getBookingById = "api/hostels/bookingId";
  static const String updateBooking = "api/hostels/bookingId'";
  static const String deleteBooking = "api/hostels/bookingId'";

  

  static const String generateInvoice= "api/hostels/invoice";
  static const String recordPayment = "api/hostels/feeId/pay";
  static const String applyLateFee = "api/bookingId/feeId/fine";
  static const String getFeeHistory = "api/hostels/history/:studentId";
  static const String getAllFees = "api/hostels/feeId";
  static const String updateFee = "api/hostels/feeId";
  static const String deleteFee = "api/hostels/feeId";
  static const String getFeeById = "api/hostels/";

  static const String createNotice= "api/hostels/invoice";
  static const String getNotices = "api/hostels/feeId/pay";
  static const String markAsRead = "api/bookingId/feeId/fine";
  static const String getNoticeById = "api/hostels/history/:studentId";
  static const String updateNotice = "api/hostels/feeId";
  static const String deleteNotice = "api/hostels/feeId";

}
