class CreateAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :appointments do |t|
      t.belongs_to :doctor, index: true
      t.belongs_to :user, index: true
      t.datetime :appointment_date
      t.string :status
      t.string :user_image_loc

      t.timestamps
    end
  end
end
