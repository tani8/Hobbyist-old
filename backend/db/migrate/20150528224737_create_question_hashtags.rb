class CreateQuestionHashtags < ActiveRecord::Migration
  def change
    create_join_table :questions, :hashtags do |t|
      t.timestamps
    end
  end
end
