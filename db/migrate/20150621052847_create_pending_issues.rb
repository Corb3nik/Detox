class CreatePendingIssues < ActiveRecord::Migration
  def change
    create_table :pending_issues do |t|
      t.references :issue, index: true, foreign_key: true, null: false
      t.references :comic_vine_series, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
