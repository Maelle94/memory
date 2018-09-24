class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :name
      t.integer :number_bands
      t.jsonb :spectrum
      t.integer :bandwidth
      t.integer :year
      t.string :description

      t.timestamps
    end
  end
end
