
class LocaleDioExceptions {
  static String getLocaleMessage(int code) {
    switch (code) {
      case 1001:
        return "تم إلغاء الطلب إلى بالخادم";
      case 1002:
        return "انتهت مهلة الاتصال بالخادم";
      case 1003:
        return "تلقي المهلة فيما يتعلق بخادم";
      case 1004:
        return "اقتراح غير جيد";
      case 1005:
        return "غير مصرح";
      case 1006:
        return "ممنوع";
      case 1008:
        return "خطأ في الخادم الداخلي";
      case 1009:
        return "مدخل خاطئ";
      case 1010:
        return "شيء ما حدث بشكل خاطئ";
      case 1011:
        return "انتهت المهلة فيما يتعلق بخادم API";
      case 1012:
        return "غير متصل بالانترنت";
      case 1013:
        return "حدث خطأ غير متوقع";
      case 1014:
        return "هنالك خطأ ما";
      case 1015:
        return "خطأ غير معروف";
      default:
        return "خطأ غير معروف";
    }
  }
}