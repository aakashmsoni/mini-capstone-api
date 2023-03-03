require "http"
require "tty-table"

response = HTTP.post("http://localhost:3000/products.json", :form => { name: "Yeti Mug" })

data = response.parse(:json)

pp data
# table = TTY::Table.new([])
