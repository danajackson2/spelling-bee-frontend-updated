csv_text = File.read(Rails.root.join('project_backend', 'app', 'assets', 'word_list', 'spellbee.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Word.new
  t.name = row['name']
  t.difficulty = row['difficulty']
  t.audio = Word.getAudio(row['name'])
  t.definition = Word.getDefinition(row['name'])
  t.save if t.audio && t.definition
end