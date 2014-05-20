class Metric
  include MongoMapper::Document

  key :name, String		#data name, e.g. temperature 
  key :unit, String		#unit of metric, e.g. degree
  key :type, String		#type of metric, e.g. ID, integer, float, text, time, location 
  key :precision, String
end
