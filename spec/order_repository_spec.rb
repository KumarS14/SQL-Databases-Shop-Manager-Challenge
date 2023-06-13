require 'order.rb'
require 'order_repository.rb'
def reset_orders_table
    seed_sql = File.read('spec/seeds_order_items.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'order_items_test' })
    connection.exec(seed_sql)
  end
  
  describe OrderRepository do
    before(:each) do 
      reset_orders_table
    end
  it 'should test to see if the all method returns the orders' do
    repo = OrderRepository.new

    orders = repo.all

    expect(orders.length).to eq(4)

    expect(orders[0].id).to eq(1)
    expect(orders[0].customer_name).to eq("Customer_name1")
    expect(orders[0].date_ordered).to eq("2013-04-06")

    expect(orders[1].id).to eq(2)
    expect(orders[1].customer_name).to eq("Customer_name2")
    expect(orders[1].date_ordered).to eq('2006-07-14')
  end
  it 'Should test to see if find method returns a single order' do
    repo = OrderRepository.new
    order = repo.find(3)
    order.id 
    order.customer_name
    order.date_ordered
    expect(order.id).to eq(3)
    expect(order.customer_name).to eq("Customer_name3")


  end
end