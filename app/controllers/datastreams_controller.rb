class DatastreamsController < ApplicationController
  # GET /datastreams
  # GET /datastreams.json
  def index
    @datastreams = Datastream.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @datastreams }
    end
  end

  # GET /datastreams/1
  # GET /datastreams/1.json
  def show
    @datastream = Datastream.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @datastream }
    end
  end

  # GET /datastreams/new
  # GET /datastreams/new.json
  def new
    @datastream = Datastream.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @datastream }
    end
  end

  # GET /datastreams/1/edit
  def edit
    @datastream = Datastream.find(params[:id])
  end

  # POST /datastreams
  # POST /datastreams.json
  def create
    @datastream = Datastream.new(params[:datastream])

    respond_to do |format|
      if @datastream.save
        format.html { redirect_to @datastream, notice: 'Datastream was successfully created.' }
        format.json { render json: @datastream, status: :created, location: @datastream }
      else
        format.html { render action: "new" }
        format.json { render json: @datastream.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /datastreams/1
  # PUT /datastreams/1.json
  def update
    @datastream = Datastream.find(params[:id])

    respond_to do |format|
      if @datastream.update_attributes(params[:datastream])
        format.html { redirect_to @datastream, notice: 'Datastream was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @datastream.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /datastreams/1
  # DELETE /datastreams/1.json
  def destroy
    @datastream = Datastream.find(params[:id])
    @datastream.destroy

    respond_to do |format|
      format.html { redirect_to datastreams_url }
      format.json { head :no_content }
    end
  end
end
