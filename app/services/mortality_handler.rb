class MortalityHandler
  attr_reader :deaths, :house_id

  @@total_death ||= 0

  def initialize(deaths, house_id)
    @deaths = deaths
    @house_id = house_id
  end

  def remove_dead_birds!
    house = House.find_by(id: house_id)
    return false if house.nil?
    house.population -= deaths
    house.user = User.find_by(id: house.user_id)
    if house.save
      @@total_death += deaths
      return true
    end

    false
  end

  class << self
    def total_death_count
      @@total_death
    end
  end
end
