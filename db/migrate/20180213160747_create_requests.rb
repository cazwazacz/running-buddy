class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.integer :user_1
      t.integer :user_2
      t.string :status

      t.timestamps
    end
  end
end
