require "test_helper"

class MusicalPiecesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @musical_piece = musical_pieces(:one)
  end

  test "should get index" do
    get musical_pieces_url
    assert_response :success
  end

  test "should get new" do
    get new_musical_piece_url
    assert_response :success
  end

  test "should create musical_piece" do
    assert_difference("MusicalPiece.count") do
      post musical_pieces_url, params: { musical_piece: { name: @musical_piece.name } }
    end

    assert_redirected_to musical_piece_url(MusicalPiece.last)
  end

  test "should show musical_piece" do
    get musical_piece_url(@musical_piece)
    assert_response :success
  end

  test "should get edit" do
    get edit_musical_piece_url(@musical_piece)
    assert_response :success
  end

  test "should update musical_piece" do
    patch musical_piece_url(@musical_piece), params: { musical_piece: { name: @musical_piece.name } }
    assert_redirected_to musical_piece_url(@musical_piece)
  end

  test "should destroy musical_piece" do
    assert_difference("MusicalPiece.count", -1) do
      delete musical_piece_url(@musical_piece)
    end

    assert_redirected_to musical_pieces_url
  end
end
