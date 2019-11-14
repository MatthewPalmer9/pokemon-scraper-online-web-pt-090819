class Pokemon
  attr_accessor :name, :type, :db
  attr_reader :id

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id_numb, db)
    pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id_numb)
    binding.pry
    new_pokemon = self.new(pokemon)
    new_pokemon.name = pokemon[1][0]
    new_pokemon
  end
end
