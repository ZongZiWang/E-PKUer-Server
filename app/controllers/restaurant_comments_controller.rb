class RestaurantCommentsController < ApplicationController
  # GET /restaurant_comments
  # GET /restaurant_comments.json
  def index
    @restaurant_comments = RestaurantComment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @restaurant_comments }
    end
  end

  # GET /restaurant_comments/1
  # GET /restaurant_comments/1.json
  def show
    @restaurant_comment = RestaurantComment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @restaurant_comment }
    end
  end

  # GET /restaurants/1/comments
  def of_restaurant
	start = params[:start].to_i

	@restaurant_comments = Restaurant.find(params[:id]).restaurant_comments[start..start+9]
	@restaurant_comments.each do |comment|
		comment[:user_name] = comment.user.name
	end
	
	respond_to do |format|
	  format.html # of_restaurant.html.erb
	  format.json { render json: @restaurant_comments }
	end
  end

  # GET /restaurant_comments/new
  # GET /restaurant_comments/new.json
  def new
    @restaurant_comment = RestaurantComment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @restaurant_comment }
    end
  end

  # GET /restaurant_comments/1/edit
  def edit
    @restaurant_comment = RestaurantComment.find(params[:id])
  end

  # POST /restaurant_comments
  # POST /restaurant_comments.json
  def create
    @restaurant_comment = RestaurantComment.new(params[:restaurant_comment])

    respond_to do |format|
      if @restaurant_comment.save
        format.html { redirect_to @restaurant_comment, notice: 'Restaurant comment was successfully created.' }
        format.json { render json: @restaurant_comment, status: :created, location: @restaurant_comment }
      else
        format.html { render action: "new" }
        format.json { render json: @restaurant_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /restaurant_comments/1
  # PUT /restaurant_comments/1.json
  def update
    @restaurant_comment = RestaurantComment.find(params[:id])

    respond_to do |format|
      if @restaurant_comment.update_attributes(params[:restaurant_comment])
        format.html { redirect_to @restaurant_comment, notice: 'Restaurant comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @restaurant_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurant_comments/1
  # DELETE /restaurant_comments/1.json
  def destroy
    @restaurant_comment = RestaurantComment.find(params[:id])
    @restaurant_comment.destroy

    respond_to do |format|
      format.html { redirect_to restaurant_comments_url }
      format.json { head :no_content }
    end
  end
end
