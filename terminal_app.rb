require "http"
require "tty-table"

response = HTTP.get("http://localhost:3000/all_products")

data = response.parse(:json)

pp data
table = TTY::Table.new([])
