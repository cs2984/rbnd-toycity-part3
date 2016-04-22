class Transaction
	attr_reader :id, :customer, :product

	@@count = 1
	@@transactions = []

	def initialize (customer, product)
		@id = @@count
		@customer = customer
		@product = product
		add_to_transactions
		@@count += 1

	end

	def self.all 
		@@transactions
	end

	private

	def self.find(id)
		@@transactions.find { |product| product.id == id}
	end 

	def add_to_transactions
		if @product.stock < 1
			raise OutOfStockError, " '#{product.title}' is out of stock."
		else
			@product.reduce_stock
			@@transactions << self
		end
	end 
end
