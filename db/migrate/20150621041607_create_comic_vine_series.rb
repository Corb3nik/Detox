class CreateComicVineSeries < ActiveRecord::Migration
  def change
    create_table :comic_vine_series do |t|
      t.string :name, null: false
      t.string :year, null: false
      t.string :publisher
      t.string :status, null: false
      t.timestamps null: false
    end
  end
end
