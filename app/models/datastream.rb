class Datastream
  include MongoMapper::Document

  key :metricID,	String		#mapping to metricID in devicetype
  key :name,		String		#alias name of the metric in this device type
  key :lastUpdate,  Time
  key :dataPoints,  Array		#store of data points belong to this datastream
  
  
	def my_update(newDataPoints)
		dataPoints.push_all(newDataPoints)
		lastUpdate = Time.now
	end
	
end
