class VegetarianRecipes::Recipe

    attr_accessor :name, :course, :url, :ingredients, :instructions

    @@all = []

    def initialize(name, course, url)
        @name = name
        @course = course
        @url = url
        
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


    def save 
        @@all << self
    end

   

   

end