require 'test_helper'

class CarsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @car = cars(:one)
    @file = fixture_file_upload(
      Rails.root.join('test', 'fixtures', 'dummy.pdf'), 'application/pdf'
    )
  end

  test "should get index" do
    get cars_url
    assert_response :success
  end

  test "should get new" do
    get new_car_url
    assert_response :success
  end

  test "should create car" do
    assert_difference('Car.count', 1) do
      post cars_url, params: { car: { model: @car.model } }
    end

    assert_redirected_to car_url(Car.last)
  end

  test "should upload attachment" do
    assert_difference('ActiveStorage::Attachment.count', 1) do
	 	  post cars_url, params: { car: { model: @car.model, creport: @file } }
    end
  end

  test "should show car" do
    get car_url(@car)
    assert_response :success
  end

  test "should get edit" do
    get edit_car_url(@car)
    assert_response :success
  end

  test "should update car" do
    patch car_url(@car), params: { car: { model: @car.model } }
    assert_redirected_to car_url(@car)
  end

  test "should destroy car" do
    assert_difference('Car.count', -1) do
      delete car_url(@car)
    end

    assert_redirected_to cars_url
  end
end
