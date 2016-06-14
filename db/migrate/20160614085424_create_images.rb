class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.belongs_to :person, index: true, foreign_key: true
      t.integer :partition_id
      t.string :url

      t.timestamps null: false
    end

    partitions = 32

	partitions.times do |i|
	  execute "CREATE TABLE images_p#{i} (
	      CHECK ( partition_id = #{i} )
	      ) INHERITS (images)"
	end
	tbl = 'images'
	execute "CREATE OR REPLACE FUNCTION #{tbl}_insert_trigger()
               RETURNS TRIGGER AS
               $$
               DECLARE
                  _tablename text;
               BEGIN
                   _tablename := '#{tbl}_p' || NEW.\"partition_id\";

                   EXECUTE 'INSERT INTO ' || quote_ident(_tablename) || ' SELECT ($1).*'
                   USING NEW;
                   RETURN NEW;
               END;
               $$
               LANGUAGE plpgsql;"

      execute "CREATE TRIGGER insert_#{tbl}_trigger
               BEFORE INSERT ON #{tbl}
               FOR EACH ROW EXECUTE PROCEDURE #{tbl}_insert_trigger();"

      execute "CREATE OR REPLACE FUNCTION #{tbl}_delete_master()
               RETURNS trigger
               AS $$
               DECLARE
                   r #{tbl}%rowtype;
               BEGIN
                   DELETE FROM ONLY #{tbl} where id = NEW.id returning * into r;
                   RETURN r;
               END;
               $$
               LANGUAGE plpgsql;"

      execute "create trigger after_insert_#{tbl}_trigger
               after insert on #{tbl}
               for each row
                   execute procedure #{tbl}_delete_master();
               end;"
  end
end
