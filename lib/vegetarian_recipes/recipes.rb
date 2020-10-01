class VegetarianRecipes::Recipes

    attr_accessor :name, :link, :category, :ingredients, :preparation

    @@all = []

    def initialize(name, link, category)
        @name = name
        @link = link
        @category = category
        @@all << self
    end

    def self.all
        @@all
    end

end