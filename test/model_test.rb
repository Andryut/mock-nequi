puts 'conecting to database...'
require File.join(__dir__, '../connection', 'connection.rb')
puts 'loading packages...'
require File.join(__dir__, '../model', 'user.rb')
require File.join(__dir__, '../model', 'account.rb')
require File.join(__dir__, '../model', 'general_account.rb')
require File.join(__dir__, '../model', 'pocket_account.rb')
require File.join(__dir__, '../model', 'movement.rb')
require File.join(__dir__, '../model', 'transfer_movement.rb')
require File.join(__dir__, '../model', 'transaction_movement.rb')
require File.join(__dir__, '../model', 'transaction.rb')
require File.join(__dir__, '../model', 'transfer.rb')
require File.join(__dir__, '../model', 'coffer.rb')
require File.join(__dir__, '../model', 'mattress_coffer.rb')
require File.join(__dir__, '../model', 'goal_coffer.rb')
require File.join(__dir__, '../model', 'goal.rb')
puts 'done'
current_user = nil
#REGISTRO
puts 'registrando..'
begin
    current_user = User.create(name:'usuario', email: 'usuario@gmail.com', password:'1234')
    puts 'registro correcto'
rescue RuntimeError => e
    puts e.message
end
#LOGIN
puts 'iniciando sesión..'
begin 
    current_user = User.login(email:'usuario@gmail.com', password:'1234')
    puts 'Bienvenido, ' + current_user.name
rescue RuntimeError => e
    puts e.message
end
#DEPOSITAR DINERO CUENTA
puts 'depositando 100 USD en tu cuenta..'
begin
    current_user.general_account.deposit_money(amount: 100)
    puts 'se han depositado 100 USD en tu cuenta'
rescue RuntimeError => e
    puts e.message
end
#DEPOSITAR DINERO COLCHÓN
puts 'moviendo 10 USD a tu colchón..'
begin
    current_user.mattress.deposit_money(amount: 10)
    puts 'se han movido 10 USD a tu colchón'
rescue RuntimeError => e
    puts e.message
end
#CREAR BOLSILLO
puts 'creando el bolsillo "ceveza" en tu cuenta..'
begin
    current_user.add_pocket(name: 'cerveza')
    puts 'se ha creado el bolsillo "ceveza" en tu cuenta'
rescue RuntimeError => e
    puts e.message
end
#AÑADIR DINERO BOLSILLO
puts 'añadiendo 100USD al bolsillo "ceveza"..'
begin
    current_user.pockets[0].deposit_money(amount: 100)
    puts 'se han añadido 100USD al bolsillo "ceveza"'
rescue RuntimeError => e
    puts e.message
end
