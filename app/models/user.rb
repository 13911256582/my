class User
  include MongoMapper::Document

  key :name, String
  key :pass, String
  key :email, String
  key :mobile, String
  key :type,  String	#type = :normal, :admin
  key :status, String 	#status = :registered, :activated, :invalid etc. 

end
