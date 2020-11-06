require 'terminal-table'

def display_exchange_table(data_list, title = 'EURO CURRENCY EXCHANGE RATES')
  table_header = ['Currency', 'Currency Name', 'Exchange Rate = 1 Euro']
  rows = []
  rows << data_list
  Terminal::Table.new title: title.upcase, headings: table_header, rows: rows
end
