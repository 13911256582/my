class Photo
  include MongoMapper::Document

  key :title,			String		#title of photo
  key :description, 	String		#detailed description of photo
  key :imageURL,		String		#URL to image

end
