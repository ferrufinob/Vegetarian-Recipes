
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
           link = "#{course.ref}"
           doc = Nokogiri::HTML(open(link))
           recipes = doc.css(".archives .archive-post") 
             recipes.each do |recipe|
               name = recipe.css("a h4").text
               url = recipe.css("a").attr("href").value
             VegetarianRecipes::Recipe.new(name, course, url)

           end   
        end

        
        def self.scrape_key_info(recipe)
            
            doc = Nokogiri::HTML(open("#{recipe.url}"))
            
            ingredients = doc.css("ul.wprm-recipe-ingredients li.wprm-recipe-ingredient")
            ingredients.each do |o|
              inf = o.text.strip
              
            # instructions = m.css("ul.wprm-recipe-instructions li").text.strip
           recipe.info << inf
          
          # doc.css("ul.wprm-recipe-ingredients li.wprm-recipe-ingredient")
          # doc.css(".wprm-recipe-instruction-group ul.wprm-recipe-instructions li")
    
          end 
        end 

        def self.scrape_instructions(recipe)
          doc = Nokogiri::HTML(open("#{recipe.url}"))
          inst = doc.css(".wprm-recipe-instruction-group ul.wprm-recipe-instructions li")
          inst.each do |o|
            instruct = o.text.strip
            recipe.instructions << instruct
          end
        end
           
          
      
        
        end

        
    

