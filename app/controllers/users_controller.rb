class UsersController < ApplicationController
	skip_before_filter :authorize, :only => [:new, :create, :signup]

  # GET /users
  # GET /users.json
  def index
    @users = User.order(:name)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users.to_json(only: [:id, :name]) }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user.to_json(only: [:id, :name]) }
    end
  end

  # GET /users/:id/recommentdation_restaurants.json
  def recommendation_restaurants
	  @user = User.find(params[:id])

	  respond_to do |format|
		  format.json { render json: @user.recommendation_restaurants.to_json(only: [ :id, :name, :image_url, :evaluation, :average_cost ], methods: [ :busy, :partial_recommendations ]) }
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

	_save
  end

  # POST /signup.json
  def signup
    @user = User.new({ name: params[:name], password: params[:password], password_confirmation: params[:password] })

	_save
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(users_url, notice: "User #{@user.name} was successfully updated.") }
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

  private

  def _save
    respond_to do |format|
      if @user.save
        format.html { redirect_to(users_url, notice: "User #{@user.name} was successfully created.") }
        format.json { render json: @user.to_json(only: [:id, :name]), status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

end
