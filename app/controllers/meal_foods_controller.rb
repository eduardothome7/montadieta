class MealFoodsController < ApplicationController
  before_action :set_meal_food, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  # GET /meal_foods
  # GET /meal_foods.json
  def index
    @meal_foods = MealFood.all
  end

  # GET /meal_foods/1
  # GET /meal_foods/1.json
  def show
  end

  # GET /meal_foods/new
  def new
    @meal_food = MealFood.new
  end

  # GET /meal_foods/1/edit
  def edit
  end

  # POST /meal_foods
  # POST /meal_foods.json
  def create
    @meal_food = MealFood.new(meal_food_params)

    respond_to do |format|
      if @meal_food.save
        format.html { redirect_to @meal_food, notice: 'Meal food was successfully created.' }
        format.json { render :show, status: :created, location: @meal_food }
      else
        format.html { render :new }
        format.json { render json: @meal_food.errors, status: :unprocessable_entity }
      end
    end
  end

  def add
    @meal_food = MealFood.new(meal_id:params[:meal_id], food_id:params[:food_id] ,weight:params[:weight])

    @meal_food.save
    respond_to :js

  end

  # PATCH/PUT /meal_foods/1
  # PATCH/PUT /meal_foods/1.json
  def update
    respond_to do |format|
      if @meal_food.update(meal_food_params)
        format.html { redirect_to @meal_food, notice: 'Meal food was successfully updated.' }
        format.json { render :show, status: :ok, location: @meal_food }
      else
        format.html { render :edit }
        format.json { render json: @meal_food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meal_foods/1
  # DELETE /meal_foods/1.json
  def destroy
    @meal_food.destroy
    respond_to do |format|
      format.html { redirect_to meal_foods_url, notice: 'Meal food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meal_food
      @meal_food = MealFood.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meal_food_params
      params.require(:meal_food).permit(:meal_id, :food_id, :weight)
    end
end
