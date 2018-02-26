class MealsController < ApplicationController
  before_action :set_diet, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  before_action :set_meal, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  # GET /meals
  # GET /meals.json
  def index
    @meals = @diet.meals
  end

  # GET /meals/1
  # GET /meals/1.json
  def show
  end

  # GET /meals/new
  def new
    @meal = @diet.meals.build
  end

  # GET /meals/1/edit
  def edit
  end

  # POST /meals
  # POST /meals.json
  def create
    @meal = @diet.meals.new(meal_params)

    respond_to do |format|
      if @meal.save
        format.html { redirect_to [@meal.diet, @meal], notice: 'Meal was successfully created.' }
        format.json { render :show, status: :created, location: @meal }
        format.js 
      else
        format.html { render :new }
        format.json { render json: @meal.errors, status: :unprocessable_entity }
      end
    end
  end


  def add
    @diet = Diet.find(params[:diet_id])
    @meals_diet = Meal.where('diet_id = ?',@diet.id)
    
    if @meals_diet.any?
      time_at_last_meal = @meals_diet.last.time_at + 2.hours
    else
      time_at_last_meal = Time.now
    end

    @meal = @diet.meals.new(diet_id: @diet.id, name: 'Refeição 01', time_at: time_at_last_meal)
    
    respond_to do |format|
      if @meal.save
        format.js 
      end
    end
  end

  # PATCH/PUT /meals/1
  # PATCH/PUT /meals/1.json
  def update
    respond_to do |format|
      if @meal.update(meal_params)
        format.html { redirect_to @meal, notice: 'Meal was successfully updated.' }
        format.json { render :show, status: :ok, location: @meal }
      else
        format.html { render :edit }
        format.json { render json: @meal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meals/1
  # DELETE /meals/1.json
  def destroy
    @meal.destroy
    respond_to do |format|
      format.html { redirect_to meals_url, notice: 'Meal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meal
      @meal = @diet.meals.find(params[:id])
    end
    
    def set_diet
      @diet = Diet.find(params[:diet_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meal_params
      params.require(:meal).permit(:diet_id, :name, :time_at)
    end
end
