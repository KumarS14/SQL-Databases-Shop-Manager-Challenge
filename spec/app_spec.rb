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
end
