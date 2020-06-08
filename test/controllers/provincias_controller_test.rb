require 'test_helper'

class ProvinciasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @provincia = provincias(:one)
  end

  test "should get index" do
    get provincias_url
    assert_response :success
  end

  test "should get new" do
    get new_provincia_url
    assert_response :success
  end

  test "should create provincia" do
    assert_difference('Provincia.count') do
      post provincias_url, params: { provincia: { nome: @provincia.nome, pais_id: @provincia.pais_id } }
    end

    assert_redirected_to provincia_url(Provincia.last)
  end

  test "should show provincia" do
    get provincia_url(@provincia)
    assert_response :success
  end

  test "should get edit" do
    get edit_provincia_url(@provincia)
    assert_response :success
  end

  test "should update provincia" do
    patch provincia_url(@provincia), params: { provincia: { nome: @provincia.nome, pais_id: @provincia.pais_id } }
    assert_redirected_to provincia_url(@provincia)
  end

  test "should destroy provincia" do
    assert_difference('Provincia.count', -1) do
      delete provincia_url(@provincia)
    end

    assert_redirected_to provincias_url
  end
end
