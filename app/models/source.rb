class Source
  include MongoMapper::Document

  key :deviceID,		String #the device this source refers to
  key :deviceTypeID,	String #the device type this source refers to
  key :createTime,		String #Time this source being created  
  key :lastUpdate,		Time   #the last updated time
  key :dataStreamsID,  	Array  #all data streams (ID) belong to this source
  key :dataStreamsName,	Array  #all data streams (Name) belong to this source
  key :dataPoints,		Array  #store of dataPoints
  
  def doCreate(deviceTypeID, deviceID)
	
	self.deviceTypeID = deviceTypeID
	self.deviceID = deviceID
	self.lastUpdate = nil
	
	
	#create new dataStreams according to the metrics in device type
	devType = Devicetype.find(deviceTypeID)
	
	devType.metrics.each do |metricID|
		dataStream = Datastream.new()
		metric = Metric.find(metricID)
		dataStream.metricID = metricID
		dataStream.name = metric.name
		dataStream.lastUpdate = nil
		dataStream.save
		self.dataStreamsID << dataStream._id	#id of datastream
		self.dataStreamsName << dataStream.name	#name of datastream
	end
	
	self.createTime = Time.now
	
	return self

  end

end
