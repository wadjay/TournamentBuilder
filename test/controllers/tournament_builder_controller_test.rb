require 'test_helper'

class TournamentBuilderControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tournament_builder_index_url
    assert_response :success
  end

end
