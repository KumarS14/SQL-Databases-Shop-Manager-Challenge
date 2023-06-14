class ItemRepository
    def all
        sql = 'SELECT id, item_name, unit_price, quantity, order_id FROM items;'
        result_set = DatabaseConnection.exec_params(sql,[])
        items = []
        result_set.each do |row|
            item = Item.new
            item.id = row['id'].to_i
            item.item_name = row['item_name']
            item.unit_price = row['unit_price'].to_f
            item.quantity = row['quantity'].to_i
            item.order_id = row['order_id'].to_i
            items << item
        end
        return items

    end


end