require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
    test "list action" do 
        get '/years'
        assert_response :success, 'action failed'
    end
  # test "the truth" do
  #   assert true
  # end
end
