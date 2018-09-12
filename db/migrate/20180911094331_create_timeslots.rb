class CreateTimeslots < ActiveRecord::Migration[5.1]
  def change
    create_table :timeslots do |t|
    	t.belongs_to :doctor, index: true
    	t.integer :time_9_10
    	t.integer :time_10_11
    	t.integer :time_11_12
    	t.integer :time_12_13
    	t.integer :time_13_14
    	t.integer :time_14_15
    	t.integer :time_15_16
    	t.integer :time_16_17
    	t.integer :time_17_18
    	t.integer :time_18_19
    	t.integer :time_19_20

        t.timestamps
    end
  end
end
