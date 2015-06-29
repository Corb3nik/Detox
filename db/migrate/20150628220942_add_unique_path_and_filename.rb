class AddUniquePathAndFilename < ActiveRecord::Migration
  def change
    add_index :issues, [:path, :filename], unique: true
  end
end
