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
    new_pokemon = self.new(pokemon)
    binding.pry
    new_pokemon. = pokemon[1][0]
    new_pokemon
  end
end
