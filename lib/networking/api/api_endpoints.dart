abstract class ApiEndpoints {
  ApiEndpoints._();

  //User
  static const isEmailExist = 'user/auth/isEmailExist/';
  static const login = 'api/login';
  static const signUp = 'api/register';
  static const sendOtp = 'user/auth/sendOtp';
  static const verifyOtp = 'user/auth/verifyOtp';

  static const resetPassword = 'user/auth/resetPassword';
  static const changePassword = 'user/auth/changePassword';

  static const updateInterests = 'user/auth/updateInterests';
  static const updateRoles = 'user/auth/updateRoles';
  static const updatePurposes = 'user/auth/updatePurposes';

  static const fetchHomeScreenData = 'user/auth/fetchHomeScreenData';
  static const fetchCourseChapters = 'user/auth/fetchCourseChapters';
}
