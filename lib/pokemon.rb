# # Ditch the gsub in prepare_for_insert and...
# db  = SQLite3::Database.new('/Users/michael/catalog.db')
# ins = db.prepare('insert into catalog (column_name) values (?)')
# string.each { |s| ins.execute(s) }
# You should replace column_name with the real column name of course; you don't have to specify the column names in an INSERT but you should always do it anyway. If you need to insert more columns then add more placeholders and arguments to ins.execute.

# db.execute( "INSERT INTO Products ( stockID, Name ) VALUES ( ?, ? )", [id, name])
require 'pry'

class Pokemon

  attr_accessor :name, :id, :type, :db

  def initialize(name)
    @name = name
  end

  def self.save(name, type, db)
    values = [name, type]
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", values)
  end

  def self.find(id, db)

    query = "SELECT * FROM pokemon WHERE id = #{id}"
    return_value = db.execute(query)
    # binding.pry
    return_value.map do |array|
      pokemon = Pokemon.new(array[1])
      pokemon.id = array[0]
      pokemon.type = array[2]
      # binding.pry
      pokemon
    end.first
  end

end
