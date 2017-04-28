
class CashRegister

  def initialize(discount=nil)
    @discount = discount
    @total = 0
    @items = []
    @last_transactions = nil
  end

  attr_reader :discount, :items
  attr_accessor :total

  def add_item(title,price, quantity = 1)
    @total += price*quantity
    quantity.times {@items << title}
    @last_transaction = {title:title, price:price, quantity:quantity}
  end

  def apply_discount
    if @discount
      @total = (@total*(100-discount)/100)
      "After the discount, the total comes to $#{@total}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    @total -= @last_transaction[:price]*@last_transaction[:quantity]
  end


end
