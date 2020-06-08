require "application_system_test_case"

class EmpreiteirosTest < ApplicationSystemTestCase
  setup do
    @empreiteiro = empreiteiros(:one)
  end

  test "visiting the index" do
    visit empreiteiros_url
    assert_selector "h1", text: "Empreiteiros"
  end

  test "creating a Empreiteiro" do
    visit empreiteiros_url
    click_on "New Empreiteiro"

    fill_in "Email", with: @empreiteiro.email
    fill_in "Nome", with: @empreiteiro.nome
    fill_in "Telefone", with: @empreiteiro.telefone
    fill_in "Telemovel", with: @empreiteiro.telemovel
    click_on "Create Empreiteiro"

    assert_text "Empreiteiro was successfully created"
    click_on "Back"
  end

  test "updating a Empreiteiro" do
    visit empreiteiros_url
    click_on "Edit", match: :first

    fill_in "Email", with: @empreiteiro.email
    fill_in "Nome", with: @empreiteiro.nome
    fill_in "Telefone", with: @empreiteiro.telefone
    fill_in "Telemovel", with: @empreiteiro.telemovel
    click_on "Update Empreiteiro"

    assert_text "Empreiteiro was successfully updated"
    click_on "Back"
  end

  test "destroying a Empreiteiro" do
    visit empreiteiros_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Empreiteiro was successfully destroyed"
  end
end
