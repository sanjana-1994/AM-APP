class AddEmailToPatient < ActiveRecord::Migration[5.1]
  def change
    add_column :patients, :email, :string
    add_index :patients, :email, :unique => true
  end
end
