require_relative 'item.rb'
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
    def find(id)
        sql = 'SELECT id, item_name, unit_price, quantity, order_id from items WHERE id = $1;'
        result_set =  DatabaseConnection.exec_params(sql,[id])
        result = result_set[0]
        item = Item.new
        item.id = result['id'].to_i
        item.item_name = result['item_name']
        item.unit_price = result['unit_price'].to_f
        item.quantity = result['quantity'].to_i
        item.order_id = result['order_id'].to_i
        return item
    end



end