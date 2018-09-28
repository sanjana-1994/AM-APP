class RemoveAgeFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :age, :integer
  end
end
