class CreatePeople < ActiveRecord::Migration
	using(:master, :indonesia, :japan)
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name

      t.timestamps null: false
    end
  end
end
