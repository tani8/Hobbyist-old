class CreateUserHobbies < ActiveRecord::Migration
  def change
    create_join_table :users, :hobbies do |t|
      t.timestamps
    end
  end
end
