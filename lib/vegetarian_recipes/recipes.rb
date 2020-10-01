class VegetarianRecipes::Recipes

    attr_accessor :name, :link, :category, :ingredients, :preparation

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