require 'pry'
class VegetarianRecipes::CLI

def start
    colorizer = Lolize::Colorizer.new
    
    colorizer.write "\n-------------------------------------------------------------------------\n"
    
    colorizer.write "                            Welcome!!                                        \n "
    puts " "
   
    colorizer.write "\  Please use the arrow keys to select from the list of categories below: \n"
    puts " "
    
    colorizer.write "\-------------------------------------------------------------------------\n"
    puts ""
    
    get_courses
    list_courses
    get_user_course
    
    # get_recipes_for(course)
    # list_recipe 
end 

def get_courses
    # to be scraped instead
    
    @courses = VegetarianRecipes::Course.all
end

def list_courses
    # list courses
    puts "choose a course to see recipe"
    @courses.each.with_index(1) do |course, index|
        puts "#{index}. #{course.name}"   
    end
end

def get_user_course
    # check if valid course
    chosen_course = gets.strip.to_i
    show_recipes_for(chosen_course) if valid_input(chosen_course.to_i, @courses)
end

def valid_input(input, data)
  input.to_i <= data.length && input.to_i > 0
end

def show_recipes_for(chosen_course)
    course = @courses[chosen_course - 1]
    puts "Here are recipes for #{course.name}"
    # VegetarianRecipes::Recipe.all.each.with_index(1) do |recipe|
    #  puts recipe.name
    # end
    # get_user_recipe
end
end