require "application_system_test_case"

class MunicipiosTest < ApplicationSystemTestCase
  setup do
    @municipio = municipios(:one)
  end

  test "visiting the index" do
    visit municipios_url
    assert_selector "h1", text: "Municipios"
  end

  test "creating a Municipio" do
    visit municipios_url
    click_on "New Municipio"

    fill_in "Nome", with: @municipio.nome
    fill_in "Provincia", with: @municipio.provincia_id
    click_on "Create Municipio"

    assert_text "Municipio was successfully created"
    click_on "Back"
  end

  test "updating a Municipio" do
    visit municipios_url
    click_on "Edit", match: :first

    fill_in "Nome", with: @municipio.nome
    fill_in "Provincia", with: @municipio.provincia_id
    click_on "Update Municipio"

    assert_text "Municipio was successfully updated"
    click_on "Back"
  end

  test "destroying a Municipio" do
    visit municipios_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Municipio was successfully destroyed"
  end
end
