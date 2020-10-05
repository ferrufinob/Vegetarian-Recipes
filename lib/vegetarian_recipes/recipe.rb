class VegetarianRecipes::Recipe

    attr_accessor :name, :course, :url, :ingredients, :instructions

    @@all = []

    def initialize(name, course, url)
        @name = name
        @course = course
        @url = url
        @ingredients = []
        @instructions = []
        
        # notify about the recipe
        # add_to_course
       add_to_course
        save
    end

    def self.all
        @@all
    end

    def add_to_course
        @course.recipes << self unless @course.recipes.include?(self)
    end

    def get_ingredients
        VegetarianRecipes::Scraper.scrape_ingredients(self) if @ingredients.empty?
       
      end 

      def get_instructions
        VegetarianRecipes::Scraper.scrape_instructions(self) if @instructions.empty?
      end


    def save 
        @@all << self
    end

   

   

end