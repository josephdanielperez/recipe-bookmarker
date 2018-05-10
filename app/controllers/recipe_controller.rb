require './config/environment'

class RecipeController < ApplicationController
  get '/recipes' do
    @user = Helpers.current_user(session)
    @recipes = Recipe.all
    erb :'recipes/index'
  end

  get '/recipes/new' do
    @creator = Helpers.current_user(session)
    erb :'recipes/new'
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :'recipes/show'
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :'recipes/edit'
  end

  post '/recipes' do
    #TODO: Add validations to Recipe model to ensure good data.
    #QUESTION: What is considered good data for that model?
    raise params.inspect
  end
end
