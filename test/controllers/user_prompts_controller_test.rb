require "test_helper"

class UserPromptsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_prompt = user_prompts(:one)
  end

  test "should get index" do
    get user_prompts_url
    assert_response :success
  end

  test "should get new" do
    get new_user_prompt_url
    assert_response :success
  end

  test "should create user_prompt" do
    assert_difference("UserPrompt.count") do
      post user_prompts_url, params: { user_prompt: { text: @user_prompt.text } }
    end

    assert_redirected_to user_prompt_url(UserPrompt.last)
  end

  test "should show user_prompt" do
    get user_prompt_url(@user_prompt)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_prompt_url(@user_prompt)
    assert_response :success
  end

  test "should update user_prompt" do
    patch user_prompt_url(@user_prompt), params: { user_prompt: { text: @user_prompt.text } }
    assert_redirected_to user_prompt_url(@user_prompt)
  end

  test "should destroy user_prompt" do
    assert_difference("UserPrompt.count", -1) do
      delete user_prompt_url(@user_prompt)
    end

    assert_redirected_to user_prompts_url
  end
end
