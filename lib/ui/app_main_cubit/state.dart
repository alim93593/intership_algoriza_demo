abstract class AppStates{}

class AppIntialState extends AppStates{}

class AppChangeBottomNavBar extends AppStates{}

class CreateDatabaseState extends AppStates{}

class InserttoDatabaseState extends AppStates{}

class GetDatafromDatabaseState extends AppStates{}

class AppChangeBottomSheetState extends AppStates{}

class GetDatafromDatabaseLoadinstate extends AppStates{}

class UpdateDataBaseState extends AppStates{}

class DeleteDataBaseState extends AppStates{}

class AppChangeModeState extends AppStates{}

class CustomContainerColorState extends AppStates{}
class ChangeDateTimeState extends AppStates{}

class ChangeStartTimeState extends AppStates{}
class ChangeEndTimeState extends AppStates{}


class TaskatyLoadingGetUserState extends AppStates{}
class TaskatySuccessGetUserState extends AppStates{}
class TaskatyErrorGetUserState extends AppStates{
  final String error;
  TaskatyErrorGetUserState(this.error);
}

class TaskatyChangeBottomNavState extends AppStates{}
class TaskatyNewPostState extends AppStates{}

class TaskatyProfileImagePickedSuccessState extends AppStates{}
class TaskatyProfileImagePickedErrorState extends AppStates{}

class TaskatyCoverImagePickedSuccessState extends AppStates{}
class TaskatyCoverImagePickedErrorState extends AppStates{}


class TaskatyUploadProfileImageSuccessState extends AppStates{}
class TaskatyUploadProfileImageErrorState extends AppStates{}


class TaskatyUploadCoverImageSuccessState extends AppStates{}
class TaskatyUploadCoverImageErrorState extends AppStates{}

class TaskatyUserUpdateErrorState extends AppStates{}
class TaskatyUserLoadingUpdateState extends AppStates{}

////show change password ui
class TaskatyChangePasswordLoadingState extends AppStates{}
class TaskatyChangePasswordErrorState extends AppStates{}
class TaskatyChangePasswordSuccessState extends AppStates{}
class TaskatyChangePasswordisibiltyState extends AppStates{}


//// sign up with google
class TaskatyUserLoginWithGoogleSuccessState extends AppStates{}
class TaskatyUserLoginWithGoogleErrorState extends AppStates{
  final String error;
  TaskatyUserLoginWithGoogleErrorState(this.error);
}


/// terms and conditions
 class LoadingTermsSuccessState extends AppStates{}
class ChangeAgreementSuccessState extends AppStates{}