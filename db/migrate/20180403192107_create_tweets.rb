class CreateTweets < ActiveRecord::Migration[5.1]
  def change
    create_table :tweets do |t|
    	t.text :text
    	t.string :profile_image
    	t.string :source
    	t.string :twitter_id
      t.timestamps
    end
  end
end
