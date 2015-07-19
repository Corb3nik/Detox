class CreateConfigsTable < ActiveRecord::Migration
  def change
    create_table :configs do |t|
      t.string :var
      t.string :value
    end
  end
end
