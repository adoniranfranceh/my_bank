require './class/account.rb'

loop do
  puts ' ->->->-> BEM VINDO ->->->->'
  puts "|Escolha uma opção          |"
  puts "|-------------------------- |"
  puts "|1 |criar conta             |"
  puts "|2 |Acessar conta           |"
  puts "|0 | Sair                   |"
  puts "----------------------------"
  puts '> INFORME A SUA OPÇÃO -------:'
  option = gets.chomp.to_i

  system'clear'

  case option 
  when 1
    puts "Digite seu nome"
    name = gets.chomp
    puts "Digite uma senha!"
    password = gets.chomp.to_i

    if name == "" or password == 0
      puts "Bloco vazio!" 
    else
       account = Account.new(name, password).save
       system'clear'

      def gretting(account)
        puts "Olá #{account.name}!"
        account.information 
      end

      gretting(account)
    end
    
  when 2
    puts "Digite o número da conta"
    number = gets.chomp.to_i
    puts "Digite a senha"
    password = gets.chomp.to_i

    system'clear'

    account = Account.find_by_number(number)
    if account != nil && account.password == password
      loop do 
        puts "Olá #{account.name}\n"
        puts ' ->->->-> MENU DA CONTA ->->->->'
        puts "|Escolha uma opção              |"
        puts "|-------------------------------|"
        puts "|1 |Depositar                   |"
        puts "|2 |Transferir                  |"
        puts "|3 |Sacar                       |"
        puts "|4 |Saldo                       |"
        puts "|0 | Sair                       |"
        puts "--------------------------------"
        puts '> INFORME A SUA OPÇÃO -------:'
        option = gets.chomp.to_i

        system'clear'
        accounts = Account.all

        case option
        when 1 
          puts "Digite o valor"
          value = gets.chomp.to_i

          account.deposit(value) 
          puts "Valor adicionado: $#{value}\n"
          puts "Valor total:" 
          puts "$#{account.balance}"

        when 2
          puts "Digite o número da conta destino\n"
          recipient = gets.chomp.to_i
          puts "Digite o valor que deseja enviar\n"
          value = gets.chomp.to_i
          system'clear'
          accounts = Account.all

          account_recipient = Account.find_by_number(recipient)

          account.transfer_value_for(account_recipient, value)
        when 3 
          puts "Quanto deseja sacar?"
          value = gets.chomp.to_i
          account.withdraw(value)

          puts "Valor retirado: $#{value} \n"
          puts "Valor total:" 
          puts "$#{account.balance}"
        when 4
          puts "Seu saldo"
          puts "#{account.balance}"
        when 0
          break
        end
      end
    else 
      puts "Conta ou senha incorreta!\n"
    end
    
  when 0 
    puts "Até logo"
    break

  else 
    puts "opcão inválida"
  end
end
