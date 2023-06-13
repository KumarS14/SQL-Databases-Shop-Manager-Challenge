require 'order.rb'
require 'order_repository.rb'
def reset_orders_table
    seed_sql = File.read('spec/seeds_orders.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'order_items_test' })
    connection.exec(seed_sql)
  end
  
  describe OrderRepository do
    before(:each) do 
      reset_orders_table
    end
  
    repo = OrderRepository.new

    orders = repo.all

    expect(orders.length).to eq(4)

    (orders[0].id).to eq(1)
    (orders[0].customer_name).to eq("Customer_nam1")
    (orders[0].date_ordered).to eq("2013-04-06")

    (orders[1].id).to eq(2)
    (orders[1].customer_name).to eq("Customer_name2")
    (orders[1].date_ordered).to eq('2006-07-14')
end