class EnableHstoreExtension < ActiveRecord::Migration
	using(:master, :indonesia, :japan)
  def change
  	enable_extension 'hstore'
  end
end
