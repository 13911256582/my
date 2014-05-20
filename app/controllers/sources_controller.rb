class SourcesController < ApplicationController
  # GET /sources
  # GET /sources.json
  def index
    @sources = Source.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sources }
    end
  end

  # GET /sources/1
  # GET /sources/1.json
  def show
    @source = Source.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @source }
    end
  end

  # GET /sources/1/write
  def write
    @source = Source.new

    respond_to do |format|
      format.html # write.html.erb
  #    format.json { render json: @source }
    end
  end

  # GET /sources/1/edit
  #def edit
  #  @source = Source.find(params[:id])
  #end

  # POST /sources
  # POST /sources.json
  #def create
  #  @source = Source.new(params[:source])

  #  respond_to do |format|
  #    if @source.save
  #      format.html { redirect_to @source, notice: 'Source was successfully created.' }
  #      format.json { render json: @source, status: :created, location: @source}
  #    else
  #      format.html { render action: "new" }
  #      format.json { render json: @source.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end

  # PUT /sources/[source id]
  # PUT /sources/[source id].json
  # update data from source 
  def update
    @source = Source.find(params[:id])
	
	dataStreams = params[:datastreams]
	logger.debug("<<<params datastreams>>>")
	logger.debug (dataStreams)
	
	dataStreams.each do |ds|
		#if data points use name instead of id		
		#if(ds[:name])
		#	if(@source.dataStreamsName.include?(ds[:name]))
				logger.debug("<<<start to write data stream>>>")
				dataStream = Datastream.find_by_name(ds[:name])
				logger.debug(ds[:datapoints])
				ds[:datapoints].each do |ds|
					dataStream.dataPoints.push(ds)
				end
				dataStream.update_attributes(:lastUpdate => Time.now)
				#dataStream.lastUpdate = Time.now
				#dataStream.save
		#	end
		#end
		
		#if data points use id
		#if(@source.dataStreams.include?(dataStream[:id]))
		#	dataStream = Datastream.find(dataStream[:id])
		#	dataStream.my_update(dataStream[:datapoints])
		#end

	end
	
	@source.update_attributes(:lastUpdate => Time.now)
	
    respond_to do |format|
        #format.html { redirect_to @source, notice: 'Source was successfully updated.' }
		#format.json { render json: @source.errors, status: :unprocessable_entity }
        #format.html { render action: "edit" }
		format.json { head :no_content }
    end
  end

  # DELETE /sources/1
  # DELETE /sources/1.json
  def destroy
    @source = Source.find(params[:id])
    @source.destroy

    respond_to do |format|
      format.html { redirect_to sources_url }
      format.json { head :no_content }
    end
  end
end
