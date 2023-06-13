require 'order.rb'
class OrderRepository
    def all 
        sql = 'SELECT id, customer_name, date_ordered FROM orders;'
     result_set = DatabaseConnection.exec_params(sql,[])
     orders = []
    result_set.each do |row|
        a_order = Order.new 
        a_order.id = row['id'].to_i 
        a_order.customer_name = row['customer_name'] 
        a_order.date_ordered = row['date_ordered'] 
        orders << a_order
    end
    return orders
    end

    def find(id)
        sql = 'SELECT id, customer_name, date_ordered FROM orders WHERE id = $1;'
        param = [id]
        result_set = DatabaseConnection.exec_params(sql,param)
        result = result_set[0]
        order = Order.new
        order.id = result['id'].to_i
        order.customer_name = result['customer_name']
        order.date_ordered = result['date_ordered'].to_i
        return order 

    end
    


end