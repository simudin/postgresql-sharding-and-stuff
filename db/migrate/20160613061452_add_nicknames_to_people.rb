class AddNicknamesToPeople < ActiveRecord::Migration
	using(:master, :indonesia, :japan)
  def change
    add_column :people, :nicknames, :text, array: true, default: []
  end
end
