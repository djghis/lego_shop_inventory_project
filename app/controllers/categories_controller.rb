require( 'sinatra' )
require( 'sinatra/contrib/all' )
require('pry')
require_relative('../models/category.rb')
also_reload( '../models/*' )

# READ (GET) #
get '/categories' do
  @categories = Category.all()
  erb( :"category/index" )
end

# CREATE - NEW (GET) #
get '/categories/new' do
  erb( :"category/new")
end

# CREATE - CREATE (POST) #
post '/categories' do
  @category = Category.new(params)
  @category.save()
  redirect to '/categories'
end

# READ - one/show (by id) (GET) #

# UPDATE - (find by id (GET)) & (update (POST)) #
get '/categories/:id/edit' do
  @category = Category.find(params[:id])
  erb( :"category/edit")
end

post '/categories/:id' do
  @category = Category.new(params)
  @category.update()
  redirect to '/categories'
end

# DELETE #
post '/categories/:id/delete' do
  @category = Category.find(params[:id])
  @category.delete()
  redirect to '/categories'
end
