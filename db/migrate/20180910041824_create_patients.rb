class CreatePatients < ActiveRecord::Migration[5.1]
  def change
    create_table :patients do |t|
      t.string :name
      t.date :birth_date
      t.string :image_loc
      t.string :medical_report_loc
      t.integer :age
      t.string :gender
      t.timestamps
    end
  end
end
