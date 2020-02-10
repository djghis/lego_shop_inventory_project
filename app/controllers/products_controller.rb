require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../models/product.rb')
require_relative('../models/stock.rb')
also_reload( '../models/*' )

# READ (GET) #
get '/products' do
  @products = Product.all()
  # @stock = Stock.all()
  # @suppliers = Supplier.all()
  # @categories = Category.all()
  erb( :"product/index" )
end

# CREATE - NEW (GET) #

# CREATE - CREATE (POST) #

# READ - one/show (by id) (GET) #
get '/products/:id' do
  @product = Product.find(params[:id])
  erb( :"product/show" )
end

# UPDATE - (find by id (GET)) & (update (POST)) #

# DELETE #
