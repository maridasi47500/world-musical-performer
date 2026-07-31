require "application_system_test_case"

class MusicalPiecesTest < ApplicationSystemTestCase
  setup do
    @musical_piece = musical_pieces(:one)
  end

  test "visiting the index" do
    visit musical_pieces_url
    assert_selector "h1", text: "Musical pieces"
  end

  test "should create musical piece" do
    visit musical_pieces_url
    click_on "New musical piece"

    fill_in "Name", with: @musical_piece.name
    click_on "Create Musical piece"

    assert_text "Musical piece was successfully created"
    click_on "Back"
  end

  test "should update Musical piece" do
    visit musical_piece_url(@musical_piece)
    click_on "Edit this musical piece", match: :first

    fill_in "Name", with: @musical_piece.name
    click_on "Update Musical piece"

    assert_text "Musical piece was successfully updated"
    click_on "Back"
  end

  test "should destroy Musical piece" do
    visit musical_piece_url(@musical_piece)
    click_on "Destroy this musical piece", match: :first

    assert_text "Musical piece was successfully destroyed"
  end
end
