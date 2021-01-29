# require 'csv'

# csv_text = File.read(Rails.root.join('lib', 'seeds', 'spellbee.csv'))
# csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
# csv.each do |row|
#   word = Word.new
#   word.name = row['name']
#   word.difficulty = row['difficulty']
#   word.url = word.getAudio
#   word.definition = word.getDefinition
#   word.save if word.url != "" && word.definition != ""
# end
Word.destroy_all
User.destroy_all
Session.destroy_all
Game.destroy_all

a = User.create(name: "Boogie Bill")
b = User.create(name: "Dan the Man")
c = User.create(name: "Lilly the Lioness")
d = User.create(name: "Bag o' Bones")

e = Game.create(winner: "")
f = Game.create(winner: "")
g = Game.create(winner: "")
h = Game.create(winner: "")

Session.create(user_id: a.id, score: 45, game_id: e.id)
Session.create(user_id: b.id, score: 19, game_id: f.id)
Session.create(user_id: c.id, score: 3, game_id: g.id)
Session.create(user_id: d.id, score: 100, game_id: h.id)

Word.create(name: 'movie', difficulty: 1, url: '', definition: "A recorded sequence of film or video images displayed on a screen with sufficient rapidity as to create the illusion of motion and continuity.")
Word.create(name: 'whine', difficulty: 1, url: '', definition: "To complain or protest in a childish or annoying fashion.")
Word.create(name: 'piper', difficulty: 1, url: '', definition: "One who plays on a metal wind instrument.")
Word.create(name: 'golden', difficulty: 1, url: '', definition: "Having the color of yellow metal.")
Word.create(name: 'sarcophagus', difficulty: 2, url: '', definition: "A species of stone used among the Greeks for making coffins. It was called by the Romans lapis Assius, from being found at Assos, a city of the Troad.")
Word.create(name: 'paisley', difficulty: 2, url: "", definition: "Having a colorful swirled pattern of abstract curved shapes. Used especially of fabric.")
Word.create(name: 'arpeggio', difficulty: 2, url: "", definition: "The sounding of the tones of a chord in rapid succession rather than simultaneously.")
Word.create(name: 'dumbwaiter', difficulty: 2, url: "", definition: "A small elevator used to convey food or other goods from one floor of a building to another.")
Word.create(name: 'arthralgia', difficulty: 3, url: "", definition: "Pain in a joint; specifically, neuralgia in a joint.")
Word.create(name: 'sedulous', difficulty: 3, url: "", definition: "Persevering and constant in effort or application; assiduous.")
Word.create(name: 'insouciance', difficulty: 3, url: "", definition: "heedless indifference or unconcern; carelessness of feeling or manner.")
Word.create(name: 'hermeneutics', difficulty: 3, url: "", definition: "The theory and methodology of interpretation, especially of scriptural text.")
Word.create(name: 'laboratory', difficulty: 2, definition: 'a room or building equipped for scientific experiments, research, or teaching, or for the manufacture of drugs or chemicals.', url: "")
Word.create(name: 'dream', difficulty:1, definition: "a series of thoughts, images, and sensations occurring in a person's mind during sleep",url: "")
Word.create(name: 'least', difficulty:1, definition: "smallest in amount, extent, or significance",url: "")
Word.create(name: 'bottle', difficulty:1, definition: "a container, typically made of glass or plastic and with a narrow neck, used for storing drinks or other liquids", url: "")
Word.create(name: 'either', difficulty:1, definition: "used before the first of two (or occasionally more) alternatives that are being specified (the other being introduced by “or”)",url: "")
Word.create(name: 'ventriloquy', difficulty:2, definition: "the art or practice of making one's voice appear to come from somewhere else, typically a dummy of a person or animal",url: "")
Word.create(name: 'demographics', difficulty:2, definition: "statistical data relating to the population and particular groups within it",url: "")
Word.create(name: 'peripheral', difficulty:2, definition: "relating to or situated on the edge of something",url: "")
Word.create(name: 'tangerine', difficulty:2, definition: "a small citrus fruit with a loose skin, especially one of a variety with deep orange-red skin",url: "")
Word.create(name: 'haphazard', difficulty:2, definition: "lacking any obvious principle of organization",url: "")
Word.create(name: 'vaccary', difficulty:3, definition: "cause to pour out",url: "")
Word.create(name: 'valetudinary', difficulty:3, definition: "suffering from poor health",url: "")
Word.create(name: 'binturong', difficulty: 3, definition: 'a tree-dwelling Asian civet with a coarse blackish coat and a muscular prehensile tail.', url: "")
Word.create(name: 'propinquity', difficulty: 2, definition: 'the state of being close to someone or something; proximity', url: "")
Word.create(name: 'deciduous', difficulty: 2, definition: '(of a tree or shrub) shedding its leaves annually', url: "")
Word.create(name: 'baleen', difficulty: 2, definition: 'whalebone', url: "")
Word.create(name: 'egress', difficulty: 2, definition: 'the action of going out of or leaving a place', url: "")
Word.create(name: 'integument', difficulty: 2, definition: 'a tough outer protective layer, especially that of an animal or plant', url: "")
Word.create(name: 'whelp', difficulty: 1, definition: 'a puppy.', url: "")
Word.create(name: 'shield', difficulty: 1, definition: 'a broad piece of metal or another suitable material, held by straps or a handle attached on one side, used as a protection against blows or missiles', url: "")
Word.create(name: 'mildew', difficulty: 1, definition: 'a thin whitish coating consisting of minute fungal hyphae, growing on plants or damp organic material such as paper or leather', url: "")
Word.create(name: 'outrageous', difficulty: 1, definition: 'shockingly bad or excessive', url: "")
Word.create(name: 'bombard', difficulty: 1, definition: 'attack (a place or person) continuously with bombs, shells, or other missiles', url: "")
Word.create(name: 'catalepsy', difficulty: 2, definition: 'a medical condition characterized by a trance or seizure with a loss of sensation and consciousness accompanied by rigidity of the body', url: "")
Word.create(name: 'friend', difficulty: 1, definition: 'a person whom one knows and with whom one has a bond of mutual affection', url: "")
Word.create(name: 'clothes', difficulty: 1, definition: 'items worn to cover the body', url: "")
Word.create(name: 'fortune', difficulty: 1, definition: 'chance or luck as an external, arbitrary force affecting human affairs', url: "")
Word.create(name: 'frontier', difficulty: 2, definition: 'a line or border separating two countries', url: "")
Word.create(name: 'hiatus', difficulty: 2, definition: 'a pause or gap in a sequence, series, or process', url: "")
Word.create(name: 'endorphin', difficulty: 2, definition: 'any of a group of hormones secreted within the brain and nervous system and having a number of physiological functions', url: "")
Word.create(name: 'kerchief', difficulty: 2, definition: 'a piece of fabric used to cover the head, or worn tied around the neck', url: "")
Word.create(name: 'unsullied', difficulty: 3, definition: 'not spoiled or made impure', url: "")
Word.create(name: 'marquee', difficulty: 3, definition: 'a canopy projecting over the entrance to a theater, hotel, or other building', url: "")
Word.create(name: 'heliacal', difficulty: 3, definition: 'relating to or near the sun', url: "")
puts "seeding done"