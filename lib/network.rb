class Network
  attr_reader :name,
              :shows
  def initialize(name)
    @name = name
    @shows = []
  end

  def add_show(show) 
    @shows << show
  end

  def all_characters
    shows.flat_map do |show|
      show.characters
    end
  end

  def main_characters
    all_characters.find_all do |character| 
      character.salary > 500000 && character.name == character.name.upcase
    end
  end

  def actors_by_show
    grouped = Hash.new { |hash, key| hash[key] = []}
    shows.each do |show|
      grouped[show.characters] << characters.actor
    end
    grouped
  end
end