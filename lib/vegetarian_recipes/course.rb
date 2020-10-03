class VegetarianRecipes::Course
    attr_accessor :name
    @@all = []
    
    def initialize(name)
        @name = name
        save
    end

    def save
        @@all << self
    end 

    def self.all
        VegetarianRecipes::Scraper.scrape_courses if @@all.empty?
        @@all
    end


end