class CreateClones < ActiveRecord::Migration
  def change
    create_table :clones, id: :uuid do |t|
      t.belongs_to :person, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
