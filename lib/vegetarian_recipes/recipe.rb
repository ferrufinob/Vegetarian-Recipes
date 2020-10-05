class VegetarianRecipes::Recipe

    attr_accessor :name, :course, :url, :info, :instructions

    @@all = []

    def initialize(name, course, url)
        @name = name
        @course = course
        @url = url
        @info = []
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

    def get_recipe_details
        VegetarianRecipes::Scraper.scrape_key_info(self) if @info.empty?
       
      end 

      def get_instructions
        VegetarianRecipes::Scraper.scrape_instructions(self) if @instructions.empty?
      end


    def save 
        @@all << self
    end

   

   

end