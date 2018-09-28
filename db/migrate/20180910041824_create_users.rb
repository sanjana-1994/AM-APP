class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
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
