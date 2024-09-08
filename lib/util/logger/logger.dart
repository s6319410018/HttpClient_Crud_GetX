import 'package:logger/logger.dart';

class CallLog {
  // การตั้งค่า Logger ด้วยการกำหนดค่าเริ่มต้น
  static final Logger _logger = Logger(
    filter: null, // สามารถกำหนดตัวกรองได้ หรือใช้ null หากไม่ต้องการกรอง
    level: Level
        .debug, // กำหนดระดับต่ำสุดที่ต้องการบันทึก เช่น Level.debug จะบันทึกทุกระดับ
    output:
        ConsoleOutput(), // กำหนดที่จัดเก็บล็อก เช่น ConsoleOutput() สำหรับแสดงในคอนโซล
    printer: PrettyPrinter(), // กำหนดรูปแบบของข้อความล็อก
  );

  /// บันทึกข้อความระดับ Debug
  static void callLogDebug(dynamic message) {
    _logger.d(message);
  }

  /// บันทึกข้อความระดับ Error
  static void callLogError(dynamic message) {
    _logger.e(message);
  }

  /// บันทึกข้อความระดับ Warning
  static void callLogWarning(dynamic message) {
    _logger.w(message);
  }

  /// บันทึกข้อความระดับ Info
  static void callLogInfo(dynamic message) {
    _logger.i(message);
  }

  /// บันทึกข้อความระดับ Verbose
  static void callLogVerbose(dynamic message) {
    _logger.v(message);
  }
}
