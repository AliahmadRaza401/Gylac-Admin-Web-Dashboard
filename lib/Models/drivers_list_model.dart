class DriversListModel {
  String fullname = '';
  bool approved = false;
  String profileImage = '';
  String email = '';
  String id = '';
  num level = 0;
  String mobile = '';
  String password = '';
  num rating = 5;
  String vehichleImage = '';
  String chassiNumber = '';
  String company='';
  String design='';
  String vehicleNumber='';
  String vehRegistrationNUmber='';
  

  DriversListModel(
   this.fullname,
   this.email,
   this.mobile,
   this.profileImage,
   this.id,
   this.level,
   this.approved,
   this.password,
   this.rating,
   this.vehichleImage,
   this.company,
   this.chassiNumber,
   this.design,
   this.vehRegistrationNUmber,
   this.vehicleNumber
  );

}
