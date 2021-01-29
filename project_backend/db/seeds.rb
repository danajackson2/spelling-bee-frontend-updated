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
Word.create(name: 'insouciance', difficulty: 3, url: "", definition: "Heedless indifference or unconcern; carelessness of feeling or manner.")
Word.create(name: 'hermeneutics', difficulty: 3, url: "", definition: "The theory and methodology of interpretation, especially of scriptural text.")
Word.create(name: 'laboratory', difficulty: 2, definition: 'A room or building equipped for scientific experiments, research, or teaching, or for the manufacture of drugs or chemicals.', url: "")
Word.create(name: 'dream', difficulty:1, definition: "A series of thoughts, images, and sensations occurring in a person's mind during sleep",url: "")
Word.create(name: 'least', difficulty:1, definition: "Smallest in amount, extent, or significance",url: "")
Word.create(name: 'bottle', difficulty:1, definition: "A container, typically made of glass or plastic and with a narrow neck, used for storing drinks or other liquids", url: "")
Word.create(name: 'either', difficulty:1, definition: "Used before the first of two (or occasionally more) alternatives that are being specified (the other being introduced by “or”)",url: "")
Word.create(name: 'ventriloquy', difficulty:2, definition: "The art or practice of making one's voice appear to come from somewhere else, typically a dummy of a person or animal",url: "")
Word.create(name: 'demographics', difficulty:2, definition: "Statistical data relating to the population and particular groups within it",url: "")
Word.create(name: 'peripheral', difficulty:2, definition: "Relating to or situated on the edge of something",url: "")
Word.create(name: 'tangerine', difficulty:2, definition: "A small citrus fruit with a loose skin, especially one of a variety with deep orange-red skin",url: "")
Word.create(name: 'haphazard', difficulty:2, definition: "Lacking any obvious principle of organization",url: "")
Word.create(name: 'vaccary', difficulty:3, definition: "Cause to pour out",url: "")
Word.create(name: 'valetudinary', difficulty:3, definition: "Suffering from poor health",url: "")
Word.create(name: 'binturong', difficulty: 3, definition: 'A tree-dwelling Asian civet with a coarse blackish coat and a muscular prehensile tail.', url: "")
Word.create(name: 'propinquity', difficulty: 2, definition: 'The state of being close to someone or something; proximity', url: "")
Word.create(name: 'deciduous', difficulty: 2, definition: '(Of a tree or shrub) shedding its leaves annually', url: "")
Word.create(name: 'baleen', difficulty: 2, definition: 'Whalebone', url: "")
Word.create(name: 'egress', difficulty: 2, definition: 'The action of going out of or leaving a place', url: "")
Word.create(name: 'integument', difficulty: 2, definition: 'A tough outer protective layer, especially that of an animal or plant', url: "")
Word.create(name: 'whelp', difficulty: 1, definition: 'A puppy', url: "")
Word.create(name: 'shield', difficulty: 1, definition: 'A broad piece of metal or another suitable material, held by straps or a handle attached on one side, used as a protection against blows or missiles', url: "")
Word.create(name: 'mildew', difficulty: 1, definition: 'A thin whitish coating consisting of minute fungal hyphae, growing on plants or damp organic material such as paper or leather', url: "")
Word.create(name: 'outrageous', difficulty: 1, definition: 'Shockingly bad or excessive', url: "")
Word.create(name: 'bombard', difficulty: 1, definition: 'Attack (a place or person) continuously with bombs, shells, or other missiles', url: "")
Word.create(name: 'catalepsy', difficulty: 2, definition: 'A medical condition characterized by a trance or seizure with a loss of sensation and consciousness accompanied by rigidity of the body', url: "")
Word.create(name: 'friend', difficulty: 1, definition: 'A person whom one knows and with whom one has a bond of mutual affection', url: "")
Word.create(name: 'clothes', difficulty: 1, definition: 'Items worn to cover the body', url: "")
Word.create(name: 'fortune', difficulty: 1, definition: 'Chance or luck as an external, arbitrary force affecting human affairs', url: "")
Word.create(name: 'frontier', difficulty: 2, definition: 'A line or border separating two countries', url: "")
Word.create(name: 'hiatus', difficulty: 2, definition: 'A pause or gap in a sequence, series, or process', url: "")
Word.create(name: 'endorphin', difficulty: 2, definition: 'Any of a group of hormones secreted within the brain and nervous system and having a number of physiological functions', url: "")
Word.create(name: 'kerchief', difficulty: 2, definition: 'A piece of fabric used to cover the head, or worn tied around the neck', url: "")
Word.create(name: 'unsullied', difficulty: 3, definition: 'Not spoiled or made impure', url: "")
Word.create(name: 'marquee', difficulty: 3, definition: 'A canopy projecting over the entrance to a theater, hotel, or other building', url: "")
Word.create(name: 'heliacal', difficulty: 3, definition: 'Relating to or near the sun', url: "")
Word.create(name: 'sidekick', difficulty: 1, definition: "A person's assistant or close associate, especially one who has less authority than that person", url: "")
Word.create(name: 'theater', difficulty: 1, definition: 'A building or outdoor area in which plays and other dramatic performances are given', url: "")
Word.create(name: 'muscular', difficulty: 1, definition: 'Vigorously robust', url: "")
Word.create(name: 'astute', difficulty: 1, definition: "Having or showing an ability to accurately assess situations or people and turn this to one's advantage", url: "")
Word.create(name: 'levity', difficulty: 1, definition: "Humor or frivolity, especially the treatment of a serious matter with humor or in a manner lacking due respect", url: "")
Word.create(name: 'cowlick', difficulty: 1, definition: 'A lock of hair that grows in a direction different from the rest and that resists being combed flat', url: "")
Word.create(name: 'fascinator', difficulty: 2, definition: "A woman's light, decorative headpiece consisting of feathers, flowers, beads, etc. attached to a comb or hair clip", url: "")
Word.create(name: 'seismology', difficulty: 2, definition: 'The branch of science concerned with earthquakes and related phenomena', url: "")
Word.create(name: 'keratitis', difficulty: 2, definition: 'Inflammation of the cornea of the eye', url: "")
Word.create(name: 'annihilate', difficulty: 2, definition: 'Destroy utterly; obliterate', url: "")
Word.create(name: 'philharmonic', difficulty: 2, definition: 'Devoted to music (chiefly used in the names of orchestras', url: "")
Word.create(name: 'contrabassoon', difficulty: 2, definition: 'The lowest member of the woodwind family in the orchestra', url: "")
Word.create(name: 'jacquard', difficulty: 3, definition: 'An apparatus with perforated cards, fitted to a loom to facilitate the weaving of figured and brocaded fabrics', url: "")
Word.create(name: 'sorghum', difficulty: 3, definition: 'A widely cultivated cereal native to warm regions of the Old World. It is a major source of grain and of feed for livestock', url: "")
Word.create(name: 'appurtenance', difficulty: 3, definition: 'An accessory or other item associated with a particular activity or style of living', url: "")
Word.create(name: 'fanfaronade', difficulty: 3, definition: 'Arrogant or boastful talk', url: "")
Word.create(name: 'olecranon', difficulty: 3, definition: 'The bony prominence of the elbow, on the upper end of the ulna', url: "")
Word.create(name: 'escritoire', difficulty: 3, definition: 'A small writing desk with drawers and compartments', url: "")
Word.create(name: 'jicama', difficulty: 3, definition: "The crisp, white-fleshed, edible tuber of a Central American climbing plant of the pea family", url: "")
Word.create(name: 'catachresis', difficulty: 3, definition: 'The use of a word in a way that is not correct, for example, the use of mitigate for militate', url: "")
puts "seeding done"