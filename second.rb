class BookInStock
	def initialize(isbn, price)
		@isbn = isbn
		@price = Float(price)
	end
end
b1 = BookInStock.new("Asa","10")
p b1

class Account 
	attr_accessor :balance
	def initialize(balance)		
		@balance = balance
	end
end

class Transaction
	def initialize(account_a, account_b)
		@account_a = account_a
		@account_b = account_b
	end
	def debit(account, amount)
		account.balance -= amount
	end
	def credit(account, amount)
		account.balance += amount
	end
	def transfer(amount = 0)
		self.debit(@account_a,amount)
		self.credit(@account_b,amount)
	end
	def to_s
		"I am transaction account_a=#{@account_a.balance} account_b=#{@account_b.balance}"
	end

	# staticka metoda pomocí self
	def self.type
		"Account Transaction"
	end

	# staticka metoda pomoci nazvu tridy
	# logicka nevyhoda je v refactoru tridy 
	# musim prejmenovat vsechny tyhle vyskyty ...
	def Transaction.type
		"..."
	end

	# vnoril jsem se do tridy 
	# a zde definoval metodu type
	# zde se da staticka promenna pouzit pomoci
	# jednoho @ ne dvou ...
	class << self
		def type
			"Account Transaction"
		end
	end
end

tr = Transaction.new(Account.new(10),Account.new(10))
tr.transfer(20)
p tr
p Transaction.type

# instanci tr pridam metodu ahoj ... 
class << tr	# dostanu se dovnitr tr 
	def ahoj
		puts "x"
	end
end

class Accesstest

	def pub
		"Jsem public"
	end

	private 
	def pri
		"Jsem private"
	end
end

# ale pres send muzu zavolat i privat metodu ...

a = Accesstest.new


