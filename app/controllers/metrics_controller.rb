class MetricsController < ApplicationController
  # GET /metrics
  # GET /metrics.json
  def index
    @metrics = Metric.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @metrics }
    end
  end

  # GET /metrics/1
  # GET /metrics/1.json
  def show
    @metric = Metric.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @metric }
    end
  end

  # GET /metrics/search/name
  # GET /metrics/search/name.json
  def search
    @metrics = Metric.all(:name=> params[:id])		#search by the name of data item, the return might be an array

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @metrics }
    end
  end
  
  
  # GET /metrics/new
  # GET /metrics/new.json
  def new
    @metric = Metric.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @metric }
    end
  end

  # GET /metrics/1/edit
  def edit
    @metric = Metric.find(params[:id])
  end

  # POST /metrics
  # POST /metrics.json
  def create
    @metric = Metric.new(params[:metric])

    respond_to do |format|
      if @metric.save
        format.html { redirect_to @metric, notice: 'Metric was successfully created.' }
        format.json { render json: @metric, status: :created, location: @metric }
      else
        format.html { render action: "new" }
        format.json { render json: @metric.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /metrics/1
  # PUT /metrics/1.json
  def update
    @metric = Metric.find(params[:id])

    respond_to do |format|
      if @metric.update_attributes(params[:metric])
        format.html { redirect_to @metric, notice: 'Metric was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @metric.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /metrics/1
  # DELETE /metrics/1.json
  def destroy
    @metric = Metric.find(params[:id])
    @metric.destroy

    respond_to do |format|
      format.html { redirect_to metrics_url }
      format.json { head :no_content }
    end
  end
end
