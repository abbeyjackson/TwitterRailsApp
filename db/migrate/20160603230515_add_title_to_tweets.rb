class AddTitleToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :title, :string
    rename_column :tweets, :message, :body
  end
end
