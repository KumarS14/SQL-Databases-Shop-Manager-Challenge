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


end