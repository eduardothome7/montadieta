class CategoryFoodsController < ApplicationController
  before_action :set_category_food, only: [:show, :edit, :update, :destroy]

  # GET /category_foods
  # GET /category_foods.json
  def index
    @category_foods = CategoryFood.all
  end

  # GET /category_foods/1
  # GET /category_foods/1.json
  def show
  end

  # GET /category_foods/new
  def new
    @category_food = CategoryFood.new
  end

  # GET /category_foods/1/edit
  def edit
  end

  # POST /category_foods
  # POST /category_foods.json
  def create
    @category_food = CategoryFood.new(category_food_params)

    respond_to do |format|
      if @category_food.save
        format.html { redirect_to @category_food, notice: 'Category food was successfully created.' }
        format.json { render :show, status: :created, location: @category_food }
      else
        format.html { render :new }
        format.json { render json: @category_food.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /category_foods/1
  # PATCH/PUT /category_foods/1.json
  def update
    respond_to do |format|
      if @category_food.update(category_food_params)
        format.html { redirect_to @category_food, notice: 'Category food was successfully updated.' }
        format.json { render :show, status: :ok, location: @category_food }
      else
        format.html { render :edit }
        format.json { render json: @category_food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /category_foods/1
  # DELETE /category_foods/1.json
  def destroy
    @category_food.destroy
    respond_to do |format|
      format.html { redirect_to category_foods_url, notice: 'Category food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category_food
      @category_food = CategoryFood.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_food_params
      params.require(:category_food).permit(:name, :description, :icon)
    end
end
