class VegetarianRecipes::Recipe

    attr_accessor :name, :url, :category, :ingredients, :instructions

    @@all = []

    def initialize
        @@all << self
    end

    def self.all
        @@all
    end

    def self.reset
        self.all.clear
    end

end