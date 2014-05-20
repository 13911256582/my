class Device
  include MongoMapper::Document

  key :serial, 			String		#serial number, unique to each device type, but not unique globally
  key :name,			String		#device name, for search purpose
  key :description, 	String
  key :activateCode,	String

  key :deviceTypeID, 	String		#devicetype id
  key :timeCreated, 	Time		#set by system

  key :APIKey,			String		#key for this device to access APIs
  key :timeActivated,	Time		#set by system
  key :sourceID,		String		#data source ID, created when Device being activated, created by system
  key :status,			String		#null, registered, activated, 
  
  key :ownerID, 		String 		#user id, when device being activated, owner ID should be bind, or a default user should be bind. This will be decided by device activation process
  
    def doActivate
		#create a new data source, and bind to this device
		@source = Source.new
		@source.doCreate(self.deviceTypeID, self._id)
		@source.save

		self.sourceID = @source._id
		self.APIKey = self._id			#should be replaced by UUID in the future
		self.timeActivated = Time.now
		self.status = :activated
	end
	
	def doCreate (deviceTypeID, key, serial)
		self.serial = serial
		self.deviceTypeID = deviceTypeID
		#self.activateCode = Base64.encode64(OpenSSL::HMAC.digest('sha1', key , serial))
		self.activateCode = "1234567890"
		self.timeCreated = Time.now
		self.status = :registered
	end  
	
end
