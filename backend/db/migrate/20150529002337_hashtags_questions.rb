class HashtagsQuestions < ActiveRecord::Migration
  def change
    create_table :hashtags_questions, :id => false do |t|
      t.references :hashtag, :null => false
      t.references :question, :null => false
    end
  end
end
