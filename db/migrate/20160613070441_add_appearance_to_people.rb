class AddAppearanceToPeople < ActiveRecord::Migration
	using(:master, :indonesia, :japan)
  def change
    add_column :people, :appearance, :hstore
  end
end
