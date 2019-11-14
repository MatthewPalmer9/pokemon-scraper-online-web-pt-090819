class Pokemon
  attr_accessor :name, :type, :db
  attr_reader :id

  def initialize(id:, name:, type:)
    @id = id
    @name = name
    @type = type
  end

  def self.save(name, type, db)
    @db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(num, db)
    pokemon = @db.execute("SELECT * FROM pokemon WHERE id = ?", num)
    binding.pry
    new_pokemon = self.new(pokemon[0])
    new_pokemon.id = pokemon[0][0]
    new_pokemon.name = pokemon[0][1]
    new_pokemon.type = pokemon[0][2]
    new_pokemon
  end
end
