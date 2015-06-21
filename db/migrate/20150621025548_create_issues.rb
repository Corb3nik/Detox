class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :path, null: false
      t.string :filename, null: false
      t.string :name, null: false
      t.string :year
      t.integer :number
      t.timestamps null: false
    end
  end
end
