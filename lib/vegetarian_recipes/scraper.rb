
class VegetarianRecipes::Scraper
    def self.scrape_courses
#         url = "https://www.skinnytaste.com/recipes/"
 
#    webpage = Nokogiri::HTML(open(url))
#    section = webpage.css ("li.categories ul li")
#    array_of_links = section.css("li.cat-item a")
#    array_of_links.map do |link|
#     VegetarianRecipes::Course.new(link.text, link.attributes["href"].value)
#    end
#     # return value will be an array of objects
#    end
        doc = Nokogiri::HTML(open("https://www.skinnytaste.com/recipes/"))
        scraping_block = doc.css(".categories ul li")
        scraping_block.each do |course|
            name = course.text
            ref = course.css("a").attr("href").value
            VegetarianRecipes::Course.new(name, ref) 
        end
    end


        def self.scrape_recipes(course)
           url = "#{course.ref}"
           doc = Nokogiri::HTML(open(url))
           recipes = doc.css(".archives .archive-post") 
             recipes.each do |recipe|
               name = recipe.css("a h4").text
               url = recipe.css("a").attr("href").value
             VegetarianRecipes::Recipe.new(name, course, url)
           end   
        end

        def self.scrape_key_info(recipe)
           self.scrape_recipes.each do  |doc|
        #    doc = Nokogiri::HTML(open(url))
           recipe_ingredients = doc.css(".wprm-recipe-ingredients-container").text.strip
           recipe_instructions = doc.css(".wprm-recipe-instructions").text.strip
           

           binding.pry
        end
    end
        
        end

        
    

