require_relative "../app"
describe Application do
    it "mock output options and mock no input which should return nothing" do
      io = double :kernel
      app = Application.new(
        'order_items_test',
        io,
        ItemRepository.new,
        OrderRepository.new
      )
      allow(io).to receive(:puts).and_return("What do you want to do?
        1 = list all shop items
        2 = create a new item
        3 = list all orders
        4 = create a new order")
        expect(io).to receive(:gets).and_return("")
      app.run
    end
    it 'mock user choosing choice 1 which returns all shop items' do
        io = double :kernel
      app = Application.new(
        'order_items_test',
        io,
        ItemRepository.new,
        OrderRepository.new
      )
      allow(io).to receive(:puts).and_return("What do you want to do?
        1 = list all shop items
        2 = create a new item
        3 = list all orders
        4 = create a new order")
        expect(io).to receive(:gets).and_return(1)
        expect(io).to receive(:puts).and_return("item_name: Item_test1  unit_price: 11.56 quantity: 3 order_id 1 
            item_name: Item_test2  unit_price: 12.66 quantity: 2 order_id 2 
            item_name: Item_test3  unit_price: 13.56 quantity: 3 order_id 3 
            item_name: Item_test4  unit_price: 14.66 quantity: 2 order_id 3")
      app.run
    end
    it 'mock user choosing choice 3 which returns all shop orders' do
        io = double :kernel
      app = Application.new(
        'order_items_test',
        io,
        ItemRepository.new,
        OrderRepository.new
      )
      allow(io).to receive(:puts).and_return("What do you want to do?
        1 = list all shop items
        2 = create a new item
        3 = list all orders
        4 = create a new order")
        expect(io).to receive(:gets).and_return(3)
        expect(io).to receive(:puts).and_return("customer name: Customer_name1  date ordered: 2013-04-06
            customer name: Customer_name2  date ordered: 2006-07-14
            customer name: Customer_name3  date ordered: 2015-02-04
            customer name: Customer_name4  date ordered: 2007-04-11
            customer name: New_Customer_name  date ordered: 2023-06-13")
      app.run
    end
    it 'mock user creating new order' do
        io = double :kernel
      app = Application.new(
        'order_items_test',
        io,
        ItemRepository.new,
        OrderRepository.new
      )
      allow(io).to receive(:puts).and_return("What do you want to do?
        1 = list all shop items
        2 = create a new item
        3 = list all orders
        4 = create a new order")
        expect(io).to receive(:gets).and_return(5)
        expect(io).to receive(:puts).and_return("Enter order id: ")
        allow(io).to receive(:gets).with(1)
        allow(io).to receive(:puts).and_return("Enter customer name:")
        allow(io).to receive(:gets).with("Customer Name Test")
        allow(io).to receive(:puts).and_return("Enter order date (YYYY-MM-DD): ")
        allow(io).to receive(:gets).with("2003-09-14")
      app.run
    end
    it 'mock user creating new item' do
        io = double :kernel
      app = Application.new(
        'order_items_test',
        io,
        ItemRepository.new,
        OrderRepository.new
      )
      allow(io).to receive(:puts).and_return("What do you want to do?
        1 = list all shop items
        2 = create a new item
        3 = list all orders
        4 = create a new order")
        expect(io).to receive(:gets).and_return(2)
        allow(io).to receive(:puts).and_return("Enter item id: ")
        allow(io).to receive(:gets).with(55)
        allow(io).to receive(:puts).and_return("Enter item name")
        allow(io).to receive(:gets).with("Item test name")
        allow(io).to receive(:puts).and_return("Enter unit price")
        allow(io).to receive(:gets).with(13.44)
        allow(io).to receive(:puts).and_return("Enter the quantity of the item")
        allow(io).to receive(:gets).with(5)
        allow(io).to receive(:puts).and_return("Enter order identifier")
        allow(io).to receive(:gets).with(3)
        app.run
      end
end
