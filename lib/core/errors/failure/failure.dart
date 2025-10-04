abstract class Failure {
  final String errorMessage;
  Failure({required this.errorMessage});
}

// ==========================================================
// ==         Failures for File Analysis Feature         ==
// ==========================================================

/// يحدث عند فشل عملية التحليل المنطقية في السيرفر
class AnalysisFailure extends Failure {
  AnalysisFailure({required super.errorMessage});
}

/// يحدث عند وجود مشكلة في رفع الملف نفسه (مثل الحجم الكبير أو انقطاع الاتصال أثناء الرفع)
class FileUploadFailure extends Failure {
  FileUploadFailure({required super.errorMessage});
}

/// يحدث عند وجود مشكلة في قراءة الملف أو معالجته على جهاز المستخدم قبل رفعه
class FileProcessingFailure extends Failure {
  FileProcessingFailure({required super.errorMessage});
}


// ==========================================================
// ==            General & Server Failures             ==
// ==========================================================

/// يحدث عند وجود خطأ عام في السيرفر (مثل Status Code 500)
class ServerFailure extends Failure {
  ServerFailure({required super.errorMessage});
}

/// يحدث عند وجود مشكلة في الشبكة (مثل عدم وجود اتصال بالإنترنت)
class NetworkFailure extends Failure {
  NetworkFailure({required super.errorMessage});
}


// ==========================================================
// ==        User Authentication & Profile Failures      ==
// ==========================================================

class LoginFailure extends Failure {
  LoginFailure({required super.errorMessage});
}

class SingUpFailure extends Failure {
  SingUpFailure({required super.errorMessage});
}

class ResetPasswordFailure extends Failure {
  ResetPasswordFailure({required super.errorMessage});
}

class GetProfileFailure extends Failure {
  GetProfileFailure({required super.errorMessage});
}

class UpdateProfileFailure extends Failure {
  UpdateProfileFailure({required super.errorMessage});
}

class LogoutFailure extends Failure {
  LogoutFailure({required super.errorMessage});
}