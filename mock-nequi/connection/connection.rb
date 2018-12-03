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

DB = Sequel.connect(db_connection_params)