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

  # def actors_by_show
  #   grouped = Hash.new { |hash, key| hash[key] = []}
  #   shows.each do |show|
  #     show.characters.each do |character|
  #     grouped[show] << character.actor
  #     end
  #   end
  #   grouped
  # end

  def actors_by_show
    actors_by_show = {}
    @shows.each do |show|
      actors_by_show[show] = show.actors  
    end
    actors_by_show
  end

  def shows_by_actor
    shows_by_actor = {}
    @shows.each do |show|
      show.actors.each do |actor|
        shows_by_actor[actor] ||= []
        shows_by_actor[actor] << show 
      end
    end
    shows_by_actor
  end

  def prolific_actors
    shows_by_actor.select do |actor, shows|
      shows.length > 1 
    end.keys
  end
end