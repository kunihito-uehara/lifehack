require "application_system_test_case"

class RequestThemesTest < ApplicationSystemTestCase
  setup do
    @request_theme = request_themes(:one)
  end

  test "visiting the index" do
    visit request_themes_url
    assert_selector "h1", text: "Request Themes"
  end

  test "creating a Request theme" do
    visit request_themes_url
    click_on "New Request Theme"

    fill_in "Name", with: @request_theme.name
    fill_in "Title", with: @request_theme.title
    click_on "Create Request theme"

    assert_text "Request theme was successfully created"
    click_on "Back"
  end

  test "updating a Request theme" do
    visit request_themes_url
    click_on "Edit", match: :first

    fill_in "Name", with: @request_theme.name
    fill_in "Title", with: @request_theme.title
    click_on "Update Request theme"

    assert_text "Request theme was successfully updated"
    click_on "Back"
  end

  test "destroying a Request theme" do
    visit request_themes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Request theme was successfully destroyed"
  end
end
