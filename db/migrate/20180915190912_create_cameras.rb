class CreateCameras < ActiveRecord::Migration[5.2]
  def change
    create_table :cameras do |t|
      t.string :name
      t.integer :number_bands
      t.integer :number_channels
      t.jsonb :wave_length
      t.jsonb :dimension
      t.integer :bandwidth
      t.integer :year
      t.string :description

      t.timestamps
    end
  end
end
