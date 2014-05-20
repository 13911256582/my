require 'base64'
require 'cgi'
require 'openssl'

class DevicesController < ApplicationController
  # GET /devices
  # GET /devices.json
  def index
    
    @devices = Device.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @devices }
    end
  end

  # GET /devices/1
  # GET /devices/1.json
  def show
    @device = Device.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @device }
    end
  end

  
  # GET /devices/[activate code]/activate
  # GET /devices/[activate code]/activate.json
  def activate
    #@device = Device.find_by_activateCode(params[:id])		#:id is the activate code
	@device = Device.find_by_serial(params[:id])

	@device.doActivate()
	@device.save
	
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @device }
    end
  end
  
  
  # GET /devices/new
  # GET /devices/new.json
  def new
    @device = Device.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @device }
    end
  end

  # GET /devices/1/edit
  def edit
    @device = Device.find(params[:id])
  end

  # POST /devices
  # POST /devices.json
  # create a new device based on its device type
  # currently, only support create one device at one time, future can support batch create
  def create
	devicetype = params[:devicetype]				#find by name
	device = params[:device]
	
	@dt = Devicetype.find_by_name(devicetype)		#find by name
	@device = Device.new
	@device.doCreate(@dt._id, @dt.secret, device[:serial])
	@device.save
	logger.debug(@device)
	
	#	devices.each do |device|			
	#		@device = Device.new()
	#		@device.create(devicetypeID, @dt.secret, device[:serial])
	#		@device.save
	#		logger.debug(@device)
	#	end
	
    respond_to do |format|
        format.html { redirect_to @device, notice: 'Device was successfully created.' }
        format.json { render status: :created, location: @device }
    end
  end

  # PUT /devices/1
  # PUT /devices/1.json
  def update
    @device = Device.find(params[:id])

    respond_to do |format|
      if @device.update_attributes(params[:device])
        format.html { redirect_to @device, notice: 'Device was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /devices/1
  # DELETE /devices/1.json
  def destroy
    @device = Device.find(params[:id])
    @device.destroy

    respond_to do |format|
      format.html { redirect_to devices_url }
      format.json { head :no_content }
    end
  end
  
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
