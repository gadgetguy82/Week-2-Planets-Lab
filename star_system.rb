class StarSystem

  def initialize(name, planets)
    @name = name
    @planets = planets
  end

  attr_reader(:name, :planets)

  def planet_names
    @planets.map do |planet|
      planet.name
    end
  end

  def get_planet_by_name(name)
    @planets.find do |planet|
      planet.name == name
    end
  end

    def get_largest_planet
      diameters = @planets.map do |planet|
        planet.diameter
      end
      @planets.find {|planet| planet.diameter == diameters.max}
    end

    def get_smallest_planet
      diameters = @planets.map do |planet|
        planet.diameter
      end
      @planets.find {|planet| planet.diameter == diameters.min}
    end

  def get_planets_with_no_moons
    @planets.find_all do |planet|
      planet.number_of_moons == 0
    end
  end

    def get_planets_with_more_moons(number)
      list = @planets.find_all do |planet|
        planet.number_of_moons > number
      end
      list.map {|item| item.name}
    end

    def get_number_of_planets_closer_than(distance)
      close = @planets.find_all do |planet|
        planet.distance_from_sun < distance
      end
      close.length
    end

    def get_total_number_of_moons
      @planets.reduce(0) do |total, planet|
        total + planet.number_of_moons
      end
    end

    def get_planet_names_sorted_by_increasing_distance_from_sun
      names = @planets.sort_by do |planet|
        planet.distance_from_sun
      end
      names.map {|name| name.name}
    end

    def get_planet_names_sorted_by_size_decreasing
      sizes = @planets.sort_by do |planet|
        planet.diameter
      end
      sizes.reverse!
      sizes.map {|size| size.name}
    end

end
