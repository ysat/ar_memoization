ActiveRecord::Base.establish_connection(
  adapter:  'sqlite3',
  database: ':memory:'
)

class CreateAllTables < ActiveRecord::Migration[5.0]
  def self.up
    create_table(:prefectures) do |t|
      t.string :name
    end

    create_table(:shops) do |t|
      t.belongs_to :prefecture
      t.string :name
    end
  end
end

ActiveRecord::Migration.verbose = false
CreateAllTables.up
