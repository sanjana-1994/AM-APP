class AddDoctorimageToDoctors < ActiveRecord::Migration[5.1]
  def change
    add_column :doctors, :doctor_image, :string
  end
end
