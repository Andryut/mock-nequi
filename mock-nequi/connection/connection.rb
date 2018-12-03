require 'sequel'
require 'tiny_tds'

db_connection_params = {
  :adapter => 'tinytds',
  :host => 'mock-nequi-server.database.windows.net', # IP or hostname 
  :port => '1433', # Required when using other that 1433 (default)
  :database => 'mock-nequi',
  :user => 'nequi-database-administrator@mock-nequi-server',
  :password => '@20181120DBpass',
  :azure => true
}
begin
  DB = Sequel.connect(db_connection_params)
rescue
  puts 'ERROR'
  puts 'This project works with a database hosted in azure cloud, to connect to it from your computer, you must request access to the email jtorresf@unal.edu.co, attaching in the body of the message your IP address, which you can know in this link: http://www.cualesmiip.com/'
  exit!
end