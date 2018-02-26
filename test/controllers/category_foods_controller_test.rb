require 'test_helper'

class CategoryFoodsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category_food = category_foods(:one)
  end

  test "should get index" do
    get category_foods_url
    assert_response :success
  end

  test "should get new" do
    get new_category_food_url
    assert_response :success
  end

  test "should create category_food" do
    assert_difference('CategoryFood.count') do
      post category_foods_url, params: { category_food: { description: @category_food.description, icon: @category_food.icon, name: @category_food.name } }
    end

    assert_redirected_to category_food_url(CategoryFood.last)
  end

  test "should show category_food" do
    get category_food_url(@category_food)
    assert_response :success
  end

  test "should get edit" do
    get edit_category_food_url(@category_food)
    assert_response :success
  end

  test "should update category_food" do
    patch category_food_url(@category_food), params: { category_food: { description: @category_food.description, icon: @category_food.icon, name: @category_food.name } }
    assert_redirected_to category_food_url(@category_food)
  end

  test "should destroy category_food" do
    assert_difference('CategoryFood.count', -1) do
      delete category_food_url(@category_food)
    end

    assert_redirected_to category_foods_url
  end
end
