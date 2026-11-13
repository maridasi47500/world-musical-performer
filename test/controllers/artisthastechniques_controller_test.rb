require "test_helper"

class ArtisthastechniquesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @artisthastechnique = artisthastechniques(:one)
  end

  test "should get index" do
    get artisthastechniques_url
    assert_response :success
  end

  test "should get new" do
    get new_artisthastechnique_url
    assert_response :success
  end

  test "should create artisthastechnique" do
    assert_difference("Artisthastechnique.count") do
      post artisthastechniques_url, params: { artisthastechnique: { artist_id: @artisthastechnique.artist_id, difficulty: @artisthastechnique.difficulty, technique_name: @artisthastechnique.technique_name } }
    end

    assert_redirected_to artisthastechnique_url(Artisthastechnique.last)
  end

  test "should show artisthastechnique" do
    get artisthastechnique_url(@artisthastechnique)
    assert_response :success
  end

  test "should get edit" do
    get edit_artisthastechnique_url(@artisthastechnique)
    assert_response :success
  end

  test "should update artisthastechnique" do
    patch artisthastechnique_url(@artisthastechnique), params: { artisthastechnique: { artist_id: @artisthastechnique.artist_id, difficulty: @artisthastechnique.difficulty, technique_name: @artisthastechnique.technique_name } }
    assert_redirected_to artisthastechnique_url(@artisthastechnique)
  end

  test "should destroy artisthastechnique" do
    assert_difference("Artisthastechnique.count", -1) do
      delete artisthastechnique_url(@artisthastechnique)
    end

    assert_redirected_to artisthastechniques_url
  end
end
