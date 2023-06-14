# file: app.rb
require_relative './lib/database_connection'
require_relative './lib/item_repository'
require_relative './lib/order_repository'

class Application
  def initialize(database_name, io, item_repository, order_repository)
    DatabaseConnection.connect(database_name)
    @io = io
    @item_repository = item_repository
    @order_repository = order_repository
  end

  def run
    # "Runs" the terminal application
    # so it can ask the item to enter some input
    # and then decide to run the appropriate action
    # or behaviour.
    @io.puts "What would you like to do?
    1 - List all items
    2 - List all orders"
    table = @io.gets.chomp.to_i
   @item_repository.all.each{|i| @io.puts "item_name: #{i.item_name}  unit_price: #{i.unit_price} quantity: #{i.quantity} order_id #{i.order_id} "} if table === 1
   @order_repository.all.each{|i| @io.puts "title: #{i.title}  content: #{i.content} views: #{i.views}"} if table === 2
   
   # Use `@io.puts` or `@io.gets` to
    # write output and ask for item input.
  end
end

# Don't worry too much about this if statement. It is basically saying "only
# run the following code if this is the main file being run, instead of having
# been required or loaded by another file.
# If you want to learn more about __FILE__ and $0, see here: https://en.wikibooks.org/wiki/Ruby_Programming/Syntax/Variables_and_Constants#Pre-defined_Variables
if __FILE__ == $0
 app = Application.new('order_items_test', Kernel, ItemRepository.new, OrderRepository.new )
 app.run
end