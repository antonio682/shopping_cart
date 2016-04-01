class ShoppingCart
  def initialize
    @items = []
  end
end

class Item 

  attr_reader :name, :price
  def initialize(name, price)
      @name = name
      @price = price
  end

  def price
      #Your beautiful code goes here
      #sin descuento
      return @price
  end
end

class Houseware < Item
  def price
      #Hmmm maybe this changes somehow..
      #5% discount if price upper 100 euros
        if @price > 100
        	return @price * 0.95
        else
          return @price
        end
  end
end

class Fruit < Item
  def price
      #Something special may go here too...
      # 10% discount on weekends
      date = Time.now
puts date
      if date.saturday? || date.sunday?
        return @price * 0.9
      else
        return @price
      end
  end
end

class Shop

 def initialize
 	@items_for_sale = []
 end
 def add_product(product)
		@items_for_sale.push(product)
 end

 def checkout_product_list
  @items_for_sale.each do |product|
 	
 	puts product.name
 	puts product.price
 	end
 end
end

class ShoppingCart

  attr_accessor(:items)
  def initialize
    @items = []
  end

  def add_item(item)
    @items.push(item)
  end

  
  def checkout
    total = @items.reduce(0) do |sum, item|
     sum + item.price
    end

    if @items.size > 5
      puts total * 0.9
    else
      puts total
    end
  end
end

#creo los productos
banana = Fruit.new("Banana", 10)
oj= Item.new("orange juice", 10)
rice = Item.new("rice", 1)
vacuum_cleaner = Houseware.new("vacumm cleaner", 150)
anchovies = Item.new("anchovies", 2)

#creo la tienda y cargo los productos
tienda= Shop.new

tienda.add_product(banana)
tienda.add_product(oj)
tienda.add_product(rice)
tienda.add_product(vacuum_cleaner)
tienda.add_product(anchovies)

joshs_cart = ShoppingCart.new

joshs_cart.add_item(oj)
joshs_cart.add_item(rice)
joshs_cart.checkout
# Your total today is $11. Have a nice day!