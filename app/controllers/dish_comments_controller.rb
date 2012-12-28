class DishCommentsController < ApplicationController
  # GET /dish_comments
  # GET /dish_comments.json
  def index
    @dish_comments = DishComment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @dish_comments }
    end
  end

  # GET /dish_comments/1
  # GET /dish_comments/1.json
  def show
    @dish_comment = DishComment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @dish_comment }
    end
  end

  # GET /dish_comments/new
  # GET /dish_comments/new.json
  def new
    @dish_comment = DishComment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @dish_comment }
    end
  end

  # GET /dish_comments/1/edit
  def edit
    @dish_comment = DishComment.find(params[:id])
  end

  # POST /dish_comments
  # POST /dish_comments.json
  def create
    @dish_comment = DishComment.new(params[:dish_comment])

    respond_to do |format|
      if @dish_comment.save
        format.html { redirect_to @dish_comment, notice: 'Dish comment was successfully created.' }
        format.json { render json: @dish_comment, status: :created, location: @dish_comment }
      else
        format.html { render action: "new" }
        format.json { render json: @dish_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /dish_comments/1
  # PUT /dish_comments/1.json
  def update
    @dish_comment = DishComment.find(params[:id])

    respond_to do |format|
      if @dish_comment.update_attributes(params[:dish_comment])
        format.html { redirect_to @dish_comment, notice: 'Dish comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @dish_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dish_comments/1
  # DELETE /dish_comments/1.json
  def destroy
    @dish_comment = DishComment.find(params[:id])
    @dish_comment.destroy

    respond_to do |format|
      format.html { redirect_to dish_comments_url }
      format.json { head :no_content }
    end
  end
end
