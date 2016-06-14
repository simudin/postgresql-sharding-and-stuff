class CreateTherapists < ActiveRecord::Migration
  def change
    create_table :therapists do |t|
      t.string :name
      t.uuid :clone_id, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
