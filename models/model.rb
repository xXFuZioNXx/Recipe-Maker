require'json'
require'unirest'
require'rubygems'


def get_recipe(search)
  new_search=search.gsub(" ", "+")
  response = Unirest.get "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/findByIngredients?fillIngredients=true&ingredients=#{new_search}&limitLicense=true&number=1&ranking=1",
  headers:{
    "X-Mashape-Key" => "W0NS4PSsXXmshO7U0ZcZw0So1b5Qp1yWkLwjsnUdFgyieB93tz",
    "Accept" => "application/json"
  }
  array=response.body 
 title=array.sample["title"]
 image=array.sample["image"]
 number_of_missing_ingredients=array.sample["missedIngredientCount"]
number_of_search_ingredients=array.sample["usedIngredientCount"]
[title,image,number_of_search_ingredients,number_of_missing_ingredients]
  #pulls out one recipe hash from the array
   recipe=array.sample
#   #pulls out the array of missing ingredients
   missing_ingredients=recipe["missedIngredients"]
 
# #iterates over the array of missing ingredients, and pulls out the name of each ingredient
   ingredient_names=[]
   missing_ingredients.each do |ingredients|
     ingredient_names.push(ingredients["name"])
   end
  return ingredient_names
end

#puts get_recipe("honey")