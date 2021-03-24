## Parsing player projections provided by Blake S.
require 'csv'

Projection.destroy_all

CSV.foreach(Rails.root.join('lib/seeds/projections.csv'), headers: true, header_converters: :symbol, encoding: 'ISO-8859-1') do |row|
  data = row.to_hash
  
  Projection.create(
    player: data[:player],
    age: data[:age],
    pos: data[:pos],
    team: data[:team],
    toi_org_es: data[:toi_org_es]
  )
end
puts "Projections Created"

