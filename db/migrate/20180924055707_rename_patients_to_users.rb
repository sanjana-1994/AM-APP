class RenamePatientsToUsers < ActiveRecord::Migration[5.1]
  def self.up
    rename_table :patients, :users
  end

  def self.down
    rename_table :users, :patients
  end
end