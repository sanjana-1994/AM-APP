class CreateDoctors < ActiveRecord::Migration[5.1]
  #def up
    #drop_table :doctors
  #end
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :doctor_type
      t.string :specialization
      t.string :qualification
      t.integer :years_of_exp
      t.integer :rating
      t.integer :total_ratings 
      t.timestamps
    end
  end
end
