class Product

	attr_reader :title, :price, :stock

	@@products = []

	def initialize (options={})
		@title = options[ :title]
		@price = options [ :price]
		@stock = options [ :stock]

		#after we collect information throw it into products
		add_to_products
	end

	def self.all
		@@products
	end

	def self.in_stock
		@@products.select { |products| products.in_stock?}
	end

	def in_stock?
		@stock > 0
	end

	def self.list
		@@products.sort_by(&:title)
	end

	def reduce_stock
		@stock -= 1 
	end

	

	private

	def self.find_by_title (title)
		@@products.find { |product| product.title == title}
	end

	def add_to_products
		product = self.class.find_by_title(@title)
		if product 
			raise DuplicateProductError, "#{title} already exists"
		else
			@@products << self 
		end
	end
end

