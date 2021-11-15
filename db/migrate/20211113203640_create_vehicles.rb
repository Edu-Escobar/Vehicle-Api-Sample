class CreateVehicles < ActiveRecord::Migration[6.1]
  
  # Declares the locations migration file.
  def change
    create_table :vehicles, {:id => false} do |t|		# id => False creates a database table that contains no :id column in ActiveRecord.
      t.string :id 

      t.timestamps
    end

    execute "ALTER TABLE vehicles ADD PRIMARY KEY (id);"	# We set the primary key to 'id' in this MySQL command.
  
  end
end