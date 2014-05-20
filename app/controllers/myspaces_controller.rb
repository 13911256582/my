class MyspacesController < ApplicationController
  # GET /myspaces
  # GET /myspaces.json
  def index
    @myspaces = Myspace.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @myspaces }
    end
  end

  # GET /myspaces/1
  # GET /myspaces/1.json
  def show
    @myspace = Myspace.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @myspace }
    end
  end

  # GET /myspaces/new
  # GET /myspaces/new.json
  def new
    @myspace = Myspace.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @myspace }
    end
  end

  # GET /myspaces/1/edit
  def edit
    @myspace = Myspace.find(params[:id])
  end

  # POST /myspaces
  # POST /myspaces.json
  def create
    @myspace = Myspace.new(params[:myspace])

    respond_to do |format|
      if @myspace.save
        format.html { redirect_to @myspace, notice: 'Myspace was successfully created.' }
        format.json { render json: @myspace, status: :created, location: @myspace }
      else
        format.html { render action: "new" }
        format.json { render json: @myspace.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /myspaces/1
  # PUT /myspaces/1.json
  def update
    @myspace = Myspace.find(params[:id])

    respond_to do |format|
      if @myspace.update_attributes(params[:myspace])
        format.html { redirect_to @myspace, notice: 'Myspace was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @myspace.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /myspaces/1
  # DELETE /myspaces/1.json
  def destroy
    @myspace = Myspace.find(params[:id])
    @myspace.destroy

    respond_to do |format|
      format.html { redirect_to myspaces_url }
      format.json { head :no_content }
    end
  end
end
