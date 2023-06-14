require 'item.rb'
require 'item_repository.rb'
def reset_items_table
    seed_sql = File.read('spec/seeds_order_items.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'order_items_test' })
    connection.exec(seed_sql)
  end

  describe ItemRepository do
    before(:each) do 
      reset_items_table
    end

    it 'should show all items in the database' do
        repo = ItemRepository.new
        items = repo.all
        expect(items.length).to eq(4)
        expect(items[0].id).to eq(1)
        expect(items[0].item_name).to eq("Item_test1")
        expect(items[0].unit_price).to eq(11.56)
        expect(items[0].quantity).to eq(3)
        expect(items[0].order_id).to eq(1)


    end
    it 'Should find a specific item and return it' do
        repo = ItemRepository.new
        item = repo.find(4)
        expect(item.id).to eq(4)

    end

end