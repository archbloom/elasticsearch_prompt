class CreateUserPrompts < ActiveRecord::Migration[7.1]
  def change
    create_table :user_prompts do |t|
      t.string :text

      t.timestamps
    end
  end
end
