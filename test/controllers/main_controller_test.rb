require 'test_helper'

class MainControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get main_index_url
    assert_response :success
  end

  test "should get formacion" do
    get main_formacion_url
    assert_response :success
  end

  test "should get evangelicion" do
    get main_evangelicion_url
    assert_response :success
  end

  test "should get rccho" do
    get main_rccho_url
    assert_response :success
  end

end
