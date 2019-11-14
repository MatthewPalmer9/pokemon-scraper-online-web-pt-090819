class Pokemon
  attr_accessor :name, :type, :db
  attr_reader :id

  def initialize(id: nil, name:, type:, db:)
    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM pokemon[0][0]")
    @name = name
    @type = type
    @db = db
  end

  def self.save
    new_pokemon = self.new(name:, type:, db:)
    new_pokemon
  end
end
