class ComplaintsController < ApplicationController

  before_filter :load_restaurant

  # GET /complaints
  # GET /complaints.json
  def index
    @complaints = @restaurant.complaints.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @complaints[((params[:start]).to_i)..((params[:start]).to_i+9)].to_json(methods: :user_name) }
    end
  end

  # GET /complaints/1
  # GET /complaints/1.json
  def show
    @complaint = @restaurant.complaints.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @complaint.to_json(methods: :user_name) }
    end
  end

  # GET /complaints/new
  # GET /complaints/new.json
  def new
    @complaint = @restaurant.complaints.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @complaint }
    end
  end

  # GET /complaints/1/edit
  def edit
    @complaint = @restaurant.complaints.find(params[:id])
  end

  # POST /complaints
  # POST /complaints.json
  def create
    @complaint = @restaurant.complaints.new(params[:complaint])

    respond_to do |format|
      if @complaint.save
        format.html { redirect_to restaurant_complaint_path(@restaurant, @complaint), notice: '@restaurant.complaints was successfully created.' }
        format.json { render json: @complaint, status: :created, location: restaurant_complaint_path(@restaurant, @complaint) }
      else
        format.html { render action: "new" }
        format.json { render json: @complaint.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /complaints/upload.json
  def upload
    @complaint = @restaurant.complaints.new(params.except(:action, :controller, :format))

    respond_to do |format|
      if @complaint.save
        format.html { redirect_to restaurant_complaint_path(@restaurant, @complaint), notice: '@restaurant.complaints was successfully created.' }
        format.json { render json: @complaint, status: :created, location: restaurant_complaint_path(@restaurant, @complaint) }
      else
        format.html { render action: "new" }
        format.json { render json: @complaint.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /complaints/1
  # PUT /complaints/1.json
  def update
    @complaint = @restaurant.complaints.find(params[:id])

    respond_to do |format|
      if @complaint.update_attributes(params[:complaint])
        format.html { redirect_to restaurant_complaint_path(@restaurant, @complaint), notice: '@restaurant.complaints was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @complaint.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /complaints/1
  # DELETE /complaints/1.json
  def destroy
    @complaint = @restaurant.complaints.find(params[:id])
    @complaint.destroy

    respond_to do |format|
      format.html { redirect_to restaurant_complaints_url(@restaurant) }
      format.json { head :no_content }
    end
  end

  private

  def load_restaurant
	  @restaurant = Restaurant.find(params[:restaurant_id])
  end

end
