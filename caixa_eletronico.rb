def menu
    system("cls")
    puts
    puts '========================================='
    puts '             BANCO DO MILHÃO             '
    puts '========================================='
    puts
    puts 'Bem Vindo ao Terminal do Banco do Milhão!'
    puts
    puts 'Selecione uma opção para prosseguir:'
    puts
    puts ' [1] - Verificar Saldo '
    puts ' [2] - Depositar '
    puts ' [3] - Sacar '
    puts ' [4] - Extrato  '
    puts ' [5] - Sair '
    puts
    print 'Digite a opção desejada: '
    return gets.chomp.to_i
    puts
end

def verifica_saldo saldo1, limite1, total1
    system("cls")
    puts
    puts '========================================='
    puts '             VERIFICAR SALDO             '
    puts '========================================='
    puts
    puts "O Saldo da sua conta é de R$#{saldo1} reais"
    puts "O limite da sua conta é de R$#{limite1} reais"
    puts "O valor disponivel para saque é de R$#{total1} reais"
    puts
end

def verifica_depositar saldo2, total2, deposito2
    system("cls")
    puts
    puts '========================================='
    puts '                DEPOSITAR                '
    puts '========================================='
    puts
    print "Digite o valor que deseja depositar: R$"
    deposito2 = gets.chomp.to_f
    if deposito2 <= 0
        puts
        puts 'Valor inválido. Digite um valor maior que zero para efetuar o depósito.'
        sleep(2)
        puts
        verifica_depositar saldo2, total2, deposito2
    else
        puts
        puts 'Depósito realizado com sucesso!'
        puts
        return deposito2
    end
end

def verifica_sacar saldo3, total3, saque3
    system("cls")
    puts
    puts '========================================='
    puts '                  SACAR                  '
    puts '========================================='
    puts
    print "Digite o valor que deseja sacar: R$"
    saque3 = gets.chomp.to_f
    if saque3 <= 0
        puts
        puts 'Valor inválido. Digite um valor maior que zero para efetuar o saque.'
        sleep(2)
        puts
        verifica_sacar saldo3, total3, saque3
    elsif saque3 > total3
        puts
        puts 'Limite de saque não disponível!'
        puts
        puts "O seu limite de saque é de R$#{total3} reais"
        sleep(2)
        puts
        verifica_sacar saldo3, total3, saque3
        elsif saldo3 == 0
            verifica_sair
    else
        puts
        puts 'Saque realizado com sucesso!'
        puts
        return saque3
    end
end

def verifica_extrato extrato1,total4
    system("cls")
    puts
    puts '========================================='
    puts '                 EXTRATO                 '
    puts '========================================='
    puts
    puts extrato1 
    puts
    puts "Saldo após as movimentações é de R$#{total4}"
    puts
end

def verifica_sair
    print 'Para voltar ao menu de opções digite [1] ou digite [2] para sair: '
    sair = gets.chomp.to_i
    if sair == 1 
        return
    elsif sair == 2
        system("cls")
        puts
        puts '========================================='
        puts '             BANCO DO MILHÃO             '
        puts '========================================='
        puts
        puts 'Muito Obrigado por utilizar o Terminal do Milhão. Volte sempre!'
        puts
        exit
    else
        puts
        puts 'Opção inválida'
        puts
        verifica_sair
    end
end    

saldo = 10000.00
limite = 5000.00
total = saldo + limite
deposito = 0
saque = 0
extrato = ["Saldo inicial é de R$#{total}", puts]

opcao = menu
while opcao != 5
    case opcao
        when 1
            verifica_saldo saldo, limite, total
            verifica_sair
            system("cls")
        when 2
            deposito2 = verifica_depositar saldo, total, deposito
            verifica_sair
            saldo = saldo + deposito2
            puts saldo
            total = saldo + limite
            extrato << "Depósito R$#{deposito2.to_f}"
        when 3
            saque3 = verifica_sacar saldo, total, saque
            verifica_sair
            saldo = saldo - saque3
            total = saldo + limite
            extrato << "Saque R$#{saque3.to_f}"
        when 4
            puts verifica_extrato extrato, total
            verifica_sair
        else
            puts
            puts 'Opção inválida'
            sleep(2)
    end
    opcao = menu
end
puts
puts 'Muito Obrigado por utilizar o Terminal do Milhão. Volte sempre!'
puts