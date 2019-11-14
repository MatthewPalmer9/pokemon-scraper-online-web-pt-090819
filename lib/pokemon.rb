class Pokemon
  attr_accessor :name, :type, :db
  attr_reader :id

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save
    new_pokemon = self.new(name, type, db)
    new_pokemon.name = name
    new_pokemon.type = type
    new_pokemon.db = db
    new_pokemon.id = DB[:conn].execute("SELECT last_insert_rowid() FROM pokemon[0][0]")
    new_pokemon
  end
end
