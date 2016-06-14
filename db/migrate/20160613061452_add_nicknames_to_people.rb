class AddNicknamesToPeople < ActiveRecord::Migration
  def change
    add_column :people, :nicknames, :text, array: true, default: []
  end
end
