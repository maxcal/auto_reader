require 'test_helper'

class CarTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
    @car = cars(:one)
  end

  test "should attach creport" do
    assert @car.respond_to?(:creport)
  end
end
