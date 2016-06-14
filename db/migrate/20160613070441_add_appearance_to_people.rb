class AddAppearanceToPeople < ActiveRecord::Migration
  def change
    add_column :people, :appearance, :hstore
  end
end
