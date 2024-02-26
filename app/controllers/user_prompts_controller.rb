class UserPromptsController < ApplicationController

  def search
    if params[:text]
      @prompts = UserPrompt.search(params[:text])
      # UserPrompt.create!(text: params[:text])
    end
    @searches = UserPrompt.order(created_at: :desc).limit(5)
  end
end
