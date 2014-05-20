class UsersController < ApplicationController

  
  # GET /users
  # GET /users.json
  def index
  
	user_id = session[:user_id]
	
	#if  !(user_id)
	#	redirect_to "/users/login", :notice => "fail"
	#	return
	#end

	#if !(user = User.find(user_id))
	#	redirect_to "/users/login", :notice => "fail"
	#	return
	#end
	
	#if (user.type != "admin")
	#	redirect_to "/users/login", :notice => "fail"
	#	return
	#end
	
	@users = User.all
		
	respond_to do |format|
		format.html # index.html.erb
		format.json { render json: @users }
	end
  end

  # GET /users/1
  # GET /users/1.json
  def show
  
	user_id = session[:user_id]
	
	#if  !(user_id)
	#	redirect_to :controller=>"users", :action=>"new" , :notice => "fail"
	#	return
	#end

	
	#if !(user = User.find(user_id))
		#redirect_to "/users/dealfail", :notice => "fail"
	#	redirect_to :controller=>"users", :action=>"new" , :notice => "fail"
	#	return
	#end
	
	@user = User.find(user_id)
	respond_to do |format|
		format.html # show.html.erb
		format.json { render json: @user }
	end
	
  end

  # GET /users/new
  # GET /users/new.json
  def new
    
	@user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    
	@user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
  
	@user = User.new(params[:user])
    respond_to do |format|
     if @user.save
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
  
  #login
  def login1
	
		uname=params[:user][:name]
		upass=params[:user][:pass]
	
		@user=User.find_by_name_and_pass(uname, upass)
	
		if @user
			if @user.type === "admin"
				#admin
				session[:user_id] = @user._id
				redirect_to "/users/index", :notice => "success"
			else
				#normal user
				session[:user_id] = @user._id
				redirect_to "/users/#{@user._id}", :notice => "success"
			end
		else
			redirect_to "/users/dealfail", :notice => "fail"
		end
  end
  
  
  def dealfail
#	respond_to do |format|
#		format.html # dealfail.html.erb
#	end
  end
  
  def login
  end
end
