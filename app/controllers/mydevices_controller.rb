class MydevicesController < ApplicationController
  # GET /mydevices
  # GET /mydevices.json
  def index
  #  @mydevices = Mydevice.all
	@user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mydevices }
    end
  end

  # GET /mydevices/1
  # GET /mydevices/1.json
  def show
    # @mydevice = Mydevice.find(params[:id])
	@user = User.find(params[:id])
	
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mydevice }
    end
  end

  # GET /mydevices/new
  # GET /mydevices/new.json
  def new
    @mydevice = Mydevice.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mydevice }
    end
  end

  # GET /mydevices/1/edit
  def edit
    #@mydevice = Mydevice.find(params[:id])
	@user = User.find(params[:id])
	@devices = Device.all
  end

  # POST /mydevices
  # POST /mydevices.json
  def create
    @mydevice = Mydevice.new(params[:mydevice])

    respond_to do |format|
      if @mydevice.save
        format.html { redirect_to @mydevice, notice: 'Mydevice was successfully created.' }
        format.json { render json: @mydevice, status: :created, location: @mydevice }
      else
        format.html { render action: "new" }
        format.json { render json: @mydevice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mydevices/1
  # PUT /mydevices/1.json
  def update
    @mydevice = Mydevice.find(params[:id])

    respond_to do |format|
      if @mydevice.update_attributes(params[:mydevice])
        format.html { redirect_to @mydevice, notice: 'Mydevice was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mydevice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mydevices/1
  # DELETE /mydevices/1.json
  def destroy
    @mydevice = Mydevice.find(params[:id])
    @mydevice.destroy

    respond_to do |format|
      format.html { redirect_to mydevices_url }
      format.json { head :no_content }
    end
  end
end
