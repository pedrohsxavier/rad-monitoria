require 'test_helper'

class CandidaciesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @candidacy = candidacies(:one)
  end

  test "should get index" do
    get candidacies_url
    assert_response :success
  end

  test "should get new" do
    get new_candidacy_url
    assert_response :success
  end

  test "should create candidacy" do
    assert_difference('Candidacy.count') do
      post candidacies_url, params: { candidacy: { cre: @candidacy.cre, data: @candidacy.data, nota: @candidacy.nota, notice_id: @candidacy.notice_id, resultado: @candidacy.resultado, status: @candidacy.status, subject_id: @candidacy.subject_id, user_id: @candidacy.user_id } }
    end

    assert_redirected_to candidacy_url(Candidacy.last)
  end

  test "should show candidacy" do
    get candidacy_url(@candidacy)
    assert_response :success
  end

  test "should get edit" do
    get edit_candidacy_url(@candidacy)
    assert_response :success
  end

  test "should update candidacy" do
    patch candidacy_url(@candidacy), params: { candidacy: { cre: @candidacy.cre, data: @candidacy.data, nota: @candidacy.nota, notice_id: @candidacy.notice_id, resultado: @candidacy.resultado, status: @candidacy.status, subject_id: @candidacy.subject_id, user_id: @candidacy.user_id } }
    assert_redirected_to candidacy_url(@candidacy)
  end

  test "should destroy candidacy" do
    assert_difference('Candidacy.count', -1) do
      delete candidacy_url(@candidacy)
    end

    assert_redirected_to candidacies_url
  end
end
