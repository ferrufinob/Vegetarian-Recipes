
class VegetarianRecipes::Scraper
    def self.scrape_courses
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
           url =  "https://www.skinnytaste.com/#{recipe.url}"
           doc = Nokogiri::HTML(open(url))
           recipe_ingredients = doc.css(".wprm-recipe-ingredients-container wprm-block-text-normal").text.strip
           recipe_instructions = doc.css(".wprm-recipe-instructions").text.strip
           recipe.key_info <<  recipe_ingredients
           recipe.key_info << recipe_instructions
           binding.pry
        end
        
        end

        
    

