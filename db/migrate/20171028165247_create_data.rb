class CreateData < ActiveRecord::Migration[5.1]
  def change
    create_table :data do |t|
      t.datetime :timestamp
     
      t.string :alias
      t.float :voltage
      t.float :percentage
    end
  end
end
