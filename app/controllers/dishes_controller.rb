class DishesController < ApplicationController
	
  before_filter :load_restaurant
	
  # GET /dishes
  # GET /dishes.json
  def index
    @dishes = @restaurant.dishes.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @dishes.to_json(except: [ :created_at, :updated_at ]) }
    end
  end

  # GET /dishes/1
  # GET /dishes/1.json
  def show
    @dish = @restaurant.dishes.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @dish.to_json(except: [ :created_at, :updated_at ]) }
    end
  end

  # GET /dishes/new
  # GET /dishes/new.json
  def new
    @dish = @restaurant.dishes.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @dish }
    end
  end

  # GET /dishes/1/edit
  def edit
    @dish = @restaurant.dishes.find(params[:id])
  end

  # POST /dishes
  # POST /dishes.json
  def create
    @dish = @restaurant.dishes.new(params[:dish])

    respond_to do |format|
      if @dish.save
        format.html { redirect_to [@restaurant, @dish], notice: 'Dish was successfully created.' }
        format.json { render json: @dish, status: :created, location: @dish }
      else
        format.html { render action: "new" }
        format.json { render json: @dish.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /dishes/1
  # PUT /dishes/1.json
  def update
    @dish = @restaurant.dishes.find(params[:id])

    respond_to do |format|
      if @dish.update_attributes(params[:dish])
        format.html { redirect_to [@restaurant, @dish], notice: 'Dish was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @dish.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dishes/1
  # DELETE /dishes/1.json
  def destroy
    @dish = @restaurant.dishes.find(params[:id])
    @dish.destroy

    respond_to do |format|
      format.html { redirect_to restaurant_dishes_url(@restaurant) }
      format.json { head :no_content }
    end
  end

  private
    
  def load_restaurant
	  @restaurant = Restaurant.find(params[:restaurant_id])
  end

end
