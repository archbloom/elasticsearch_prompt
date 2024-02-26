require "application_system_test_case"

class UserPromptsTest < ApplicationSystemTestCase
  setup do
    @user_prompt = user_prompts(:one)
  end

  test "visiting the index" do
    visit user_prompts_url
    assert_selector "h1", text: "User prompts"
  end

  test "should create user prompt" do
    visit user_prompts_url
    click_on "New user prompt"

    fill_in "Text", with: @user_prompt.text
    click_on "Create User prompt"

    assert_text "User prompt was successfully created"
    click_on "Back"
  end

  test "should update User prompt" do
    visit user_prompt_url(@user_prompt)
    click_on "Edit this user prompt", match: :first

    fill_in "Text", with: @user_prompt.text
    click_on "Update User prompt"

    assert_text "User prompt was successfully updated"
    click_on "Back"
  end

  test "should destroy User prompt" do
    visit user_prompt_url(@user_prompt)
    click_on "Destroy this user prompt", match: :first

    assert_text "User prompt was successfully destroyed"
  end
end
