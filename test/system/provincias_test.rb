require "application_system_test_case"

class ProvinciasTest < ApplicationSystemTestCase
  setup do
    @provincia = provincias(:one)
  end

  test "visiting the index" do
    visit provincias_url
    assert_selector "h1", text: "Provincias"
  end

  test "creating a Provincia" do
    visit provincias_url
    click_on "New Provincia"

    fill_in "Nome", with: @provincia.nome
    fill_in "Pais", with: @provincia.pais_id
    click_on "Create Provincia"

    assert_text "Provincia was successfully created"
    click_on "Back"
  end

  test "updating a Provincia" do
    visit provincias_url
    click_on "Edit", match: :first

    fill_in "Nome", with: @provincia.nome
    fill_in "Pais", with: @provincia.pais_id
    click_on "Update Provincia"

    assert_text "Provincia was successfully updated"
    click_on "Back"
  end

  test "destroying a Provincia" do
    visit provincias_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Provincia was successfully destroyed"
  end
end
