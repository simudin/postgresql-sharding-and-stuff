class EnableUuid < ActiveRecord::Migration
  using(:master, :indonesia, :japan)
  def change
  	enable_extension 'uuid-ossp'
  end
end
