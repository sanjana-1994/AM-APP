class AddRoleToPatients < ActiveRecord::Migration[5.1]
  def change
    add_column :patients, :role, :string
  end
end
