class CreateWords < ActiveRecord::Migration[4.2]
  def change
  	create_table :words do |t|
  		t.string :english, null:false
  		t.timestamps
  	end
  end
end
