class Myspace
  include MongoMapper::Document

	key :userID, String
	key :device, Array
	key :workspace, Array
  
end
