require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'spellbee.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  word = Word.new
  word.name = row['name']
  word.difficulty = row['difficulty']
  word.url = word.getAudio
  word.definition = word.getDefinition
  word.save if word.url != "" && word.definition != ""
end