require 'test_helper'

class EmpreiteirosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @empreiteiro = empreiteiros(:one)
  end

  test "should get index" do
    get empreiteiros_url
    assert_response :success
  end

  test "should get new" do
    get new_empreiteiro_url
    assert_response :success
  end

  test "should create empreiteiro" do
    assert_difference('Empreiteiro.count') do
      post empreiteiros_url, params: { empreiteiro: { email: @empreiteiro.email, nome: @empreiteiro.nome, telefone: @empreiteiro.telefone, telemovel: @empreiteiro.telemovel } }
    end

    assert_redirected_to empreiteiro_url(Empreiteiro.last)
  end

  test "should show empreiteiro" do
    get empreiteiro_url(@empreiteiro)
    assert_response :success
  end

  test "should get edit" do
    get edit_empreiteiro_url(@empreiteiro)
    assert_response :success
  end

  test "should update empreiteiro" do
    patch empreiteiro_url(@empreiteiro), params: { empreiteiro: { email: @empreiteiro.email, nome: @empreiteiro.nome, telefone: @empreiteiro.telefone, telemovel: @empreiteiro.telemovel } }
    assert_redirected_to empreiteiro_url(@empreiteiro)
  end

  test "should destroy empreiteiro" do
    assert_difference('Empreiteiro.count', -1) do
      delete empreiteiro_url(@empreiteiro)
    end

    assert_redirected_to empreiteiros_url
  end
end
