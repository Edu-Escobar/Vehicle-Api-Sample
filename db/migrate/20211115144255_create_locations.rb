class CreateLocations < ActiveRecord::Migration[6.1]
  
  # Declares the locations migration file.
  def change
    create_table :locations, {:id => false} do |t|		# id => False creates a database table that contains no :id column in ActiveRecord.
    	t.string :id
     t.decimal :lat, :precision => 10, :scale => 6		# Precision and scale of the decimal type are set here.
     t.decimal :lng, :precision => 10, :scale => 6
     t.datetime :at

     t.timestamps

   end
   
   execute "ALTER TABLE locations ADD CONSTRAINT fk_id FOREIGN KEY(id) REFERENCES vehicles(id) ON DELETE CASCADE;"

   # We use ON DELETE CASCADE to properly delete vehicles from the database.

 end
end