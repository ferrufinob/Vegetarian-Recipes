class VegetarianRecipes::Scraper
    def self.scrape_courses
        page = Nokogiri::HTML(open("https://cookieandkate.com"))
        courses = page.css("#menu-item-17041 ul.sub-menu li")
        courses.each do |m|
            name = m.text
            VegetarianRecipes::Course.new(name)
        end

        # binding.pry
    end





end




#     def self.scrape_courses
#         # dropdown that containt the courses
#         courses = Nokogiri::HTML(open(BASE_PATH)).css("#menu-item-17041 ul.sub-menu")
        
#         courses.each do |recipe|
#             recipe_url = recipe.css("a").attr("href").value
    
#     end
# end