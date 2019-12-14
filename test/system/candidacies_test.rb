require "application_system_test_case"

class CandidaciesTest < ApplicationSystemTestCase
  setup do
    @candidacy = candidacies(:one)
  end

  test "visiting the index" do
    visit candidacies_url
    assert_selector "h1", text: "Candidacies"
  end

  test "creating a Candidacy" do
    visit candidacies_url
    click_on "New Candidacy"

    fill_in "Cre", with: @candidacy.cre
    fill_in "Data", with: @candidacy.data
    fill_in "Media", with: @candidacy.media
    fill_in "Nota", with: @candidacy.nota
    fill_in "Notice", with: @candidacy.notice_id
    fill_in "Resultado", with: @candidacy.resultado
    check "Status" if @candidacy.status
    fill_in "Subject", with: @candidacy.subject_id
    fill_in "User", with: @candidacy.user_id
    click_on "Create Candidacy"

    assert_text "Candidacy was successfully created"
    click_on "Back"
  end

  test "updating a Candidacy" do
    visit candidacies_url
    click_on "Edit", match: :first

    fill_in "Cre", with: @candidacy.cre
    fill_in "Data", with: @candidacy.data
    fill_in "Media", with: @candidacy.media
    fill_in "Nota", with: @candidacy.nota
    fill_in "Notice", with: @candidacy.notice_id
    fill_in "Resultado", with: @candidacy.resultado
    check "Status" if @candidacy.status
    fill_in "Subject", with: @candidacy.subject_id
    fill_in "User", with: @candidacy.user_id
    click_on "Update Candidacy"

    assert_text "Candidacy was successfully updated"
    click_on "Back"
  end

  test "destroying a Candidacy" do
    visit candidacies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Candidacy was successfully destroyed"
  end
end
