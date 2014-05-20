require 'rubygems'
require 'uuidtools'

class DevicetypesController < ApplicationController
  # GET /devicetypes
  # GET /devicetypes.json
  def index
    @devicetypes = Devicetype.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @devicetypes }
    end
  end

  # GET /devicetypes/1
  # GET /devicetypes/1.json
  def show
    @devicetype = Devicetype.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @devicetype }
    end
  end

  # GET /devicetypes/[device_type_name]/search
  # GET /devicetypes/[device_type_name]/search.json
  def search
    @devicetype = Devicetype.all(:name => params[:dtName])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @devicetype }
    end
  end
  
  
  # GET /devicetypes/new
  # GET /devicetypes/new.json
  def new
    @devicetype = Devicetype.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @devicetype }
    end
  end

  # GET /devicetypes/1/edit
  def edit
    @devicetype = Devicetype.find(params[:id])
  end

  # POST /devicetypes
  # POST /devicetypes.json
  def create
	@devicetype = Devicetype.new
	@devicetype.name = params[:devTypeName]
	
	metrics = params[:metrics]
	metrics.each do |i, metric|
		@devicetype.metrics << metric[:metricID]
	end

	#@devicetype.secret = UUIDTools::UUID.timestamp_create().to_s.gsub('-','')
	@devicetype.secret = "1234567890"
	
	logger.debug (@devicetype)
	
    respond_to do |format|
      if @devicetype.save
        format.html { redirect_to @devicetype, notice: 'Devicetype was successfully created.' }
        format.json { render json: @devicetype, status: :created, location: @devicetype }
      else
        format.html { render action: "new" }
        format.json { render json: @devicetype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /devicetypes/1
  # PUT /devicetypes/1.json
  def update
    @devicetype = Devicetype.find(params[:id])

    respond_to do |format|
      if @devicetype.update_attributes(params[:devicetype])
        format.html { redirect_to @devicetype, notice: 'Devicetype was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @devicetype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /devicetypes/1
  # DELETE /devicetypes/1.json
  def destroy
    @devicetype = Devicetype.find(params[:id])
    @devicetype.destroy

    respond_to do |format|
      format.html { redirect_to devicetypes_url }
      format.json { head :no_content }
    end
  end
end
