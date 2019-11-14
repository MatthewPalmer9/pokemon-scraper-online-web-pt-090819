class Pokemon
  attr_accessor :name, :type, :db
  attr_reader :id

  def initialize(id:, name:, type:, db:)
    @id = db.execute("SELECT last_insert_rowid() FROM pokemon")
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id_numb, db)
    pokemon = db.execute("SELECT name, type FROM pokemon WHERE id = ?", id_numb).flatten
    #binding.pry
    name = pokemon[1]
    type = pokemon[2]
    binding.pry
    new_pokemon = self.new(id: id, name: name, type: type, db: db)
  end
end
