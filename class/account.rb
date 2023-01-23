ACCOUNTS = []

class Account
  attr_reader :name, :balance, :number, :password

  def initialize(name, password)
    @name = name
    @number = generate_number
    @balance = 0.0
    @password = password 
    
  end
  
  def deposit(value)
    @balance = @balance + value
  end

  def withdraw(value)
    @balance = @balance - value
    
  end

  def save
    ACCOUNTS << self

    self
  end

  def generate_number
    return ACCOUNTS.last.number + 1 if ACCOUNTS.any?

    1
  end

  def transfer_value_for(account_recipient, value)
    if self.balance >= value 
      self.withdraw(value) 
      account_recipient.deposit(value)
      puts "Valor adicionado "
      puts "$#{value}"
    else 
      puts "Valor indisponível"
    end
  end

  def self.all 
    ACCOUNTS
  end

  def self.find_by_number(number) 
    ACCOUNTS.each do |account|
      return account if account.number == number 
    end

    nil 
  end



  def information
    puts "Algumas informações sobre sua conta"
    puts "-------------------"
    puts "Nome: #{@name}"
    puts "-------------------"
    puts "Numero da conta:"
    puts "#{@number}"
    puts "-------------------"
    puts "Saldo disponível: #{@balance}" 
    
  end
end
