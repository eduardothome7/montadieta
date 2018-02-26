require 'test_helper'

class MealFoodsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @meal_food = meal_foods(:one)
  end

  test "should get index" do
    get meal_foods_url
    assert_response :success
  end

  test "should get new" do
    get new_meal_food_url
    assert_response :success
  end

  test "should create meal_food" do
    assert_difference('MealFood.count') do
      post meal_foods_url, params: { meal_food: { food_id: @meal_food.food_id, meal_id: @meal_food.meal_id, weight: @meal_food.weight } }
    end

    assert_redirected_to meal_food_url(MealFood.last)
  end

  test "should show meal_food" do
    get meal_food_url(@meal_food)
    assert_response :success
  end

  test "should get edit" do
    get edit_meal_food_url(@meal_food)
    assert_response :success
  end

  test "should update meal_food" do
    patch meal_food_url(@meal_food), params: { meal_food: { food_id: @meal_food.food_id, meal_id: @meal_food.meal_id, weight: @meal_food.weight } }
    assert_redirected_to meal_food_url(@meal_food)
  end

  test "should destroy meal_food" do
    assert_difference('MealFood.count', -1) do
      delete meal_food_url(@meal_food)
    end

    assert_redirected_to meal_foods_url
  end
end
