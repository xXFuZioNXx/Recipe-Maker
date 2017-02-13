require 'bundler'
Bundler.require
require_relative 'models/model.rb'
class MyApp < Sinatra::Base

  get '/' do
    erb :index
  end
post '/ingredient' do
  recipe =params[:items]
  @result= get_recipe(recipe)
   @title=@result[0]
   @image=@result[1] 
  @number_of_missing_ingredients=@result[2]
  @number_of_search_ingredients=@result[3]
  @missing_ingredients=@result[4]
  erb :results
  
  end
end