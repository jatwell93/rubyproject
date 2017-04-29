# This file should contain all the record creation needed to seed the database with its default values.

# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


##### Horribly inefficient but gets it done for now #####



def userTester()
    @hold = Hash.new
    @hold = { email: "tester@test.com", username: "MTest",
        first_name: "Matt", last_name: "Test", password: "tester" }
    @result = User.first_or_create!(@hold)
end

def recipeMaker(counter, maker)
    @hold = Hash.new
    # counter = counter + Recipe.count
    for x in 0..counter do
        @hold = { name: "Name#{x}", summary: "Summary ##{x}", description: "Description ##{x}", user_id: maker.id}
        @result = Recipe.new(@hold)
        @result.save(validate: false)
        fillRecipeAssoc(@result)
    end
end

def tableCount(aTable)
    aTable.count
end


# stick in table to fill relationships & relationship to fill
# @assoc_list = aTable.reflect_on_all_associations(:has_many)

def fillRecipeAssoc(a_recipe)
    # Setup for more automation w/faker gem later
    ingredients_name = "A thing to put in it"
    direction_step = "Do this thing..."
    # Do the thing
    a_recipe.ingredients.build(name: ingredients_name).save(validate: false)
    a_recipe.directions.build(step: direction_step).save(validate: false)
end

# Run user sign in
@user = userTester

recipeMaker(20, @user)

puts "Table size: #{tableCount(User)}"
puts "Recipe count: #{tableCount(Recipe)}"
