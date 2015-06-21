class CreateWatchedIssues < ActiveRecord::Migration
  def change
    create_table :watched_issues do |t|
      t.references :comic_vine_series, index: true, foreign_key: true, null: false
      t.references :issue, index: true, foreign_key: true
      t.integer :number, null: false
      t.string :name
      t.date :cover_date
      t.string :status, null: false
      t.timestamps null: false
    end
  end
end
