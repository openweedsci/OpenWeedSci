library(tidyverse)

stop_program_words <- c("janet", "harrington", "calvin", "don", "thelen", "fitzpatrick",
                            "messersmith", "sharie", "fjell", "kerr", "emerson", "nafziger", 	"vollmer",
                            "kathie", "colby", "baughman", "jennifer", "sij", "kalmowitz",
                            "natalie","crop", "location", "ha", "g", "d",
                            "william", "dept", "knezevic", "adjunct", "assistant",
                            "univ", "ames", "michael", "mark", "dallas", "associate",
                            "david", "manhattan", "urbana", "bernard", "author",
                            "patrick", "marysville", "mike", "dean", "john",
                            "robert", "bryan", "phillip", "jeffrey", "abstract",
                            "gary", "eric", "bob", "carol", "ellen", "rob", "fred",
                            "joanne", "donald", "chris", "lary", "meeting",
                            "director", "loyd", "hartzler", "sprague", "christy", "kent",
                            "masabni", "brian", "olson", "paper", "poster",
                            "brian", "kassim", "khatib", "kurt", "kathleen", "micheal",
                            "agriscience", "usda", "monarchy", "north", "march", "moderator",
                            "extension", "college", "tech", "time", "student", "contest",
                            "break", "station", "basf", "division", "ars", "fort", "guelph",
                            "presenter", "maui", "monday", "tuesday", "wednesday", "thursday",
                            "oral", "poster", "united", "western", "speaker", "science", "lleida",
                            "dakota", "agriculture", "service", "laramie", "forest", "piracicaba",
                            "purdue", "agrilife", "center", "syngenta", "morning", "afternoon",
                            "agri", "ventenata", "center", "east", "food", "tifton", "adelaide",
                            "pullman", "resources", "affiliation", "saskatoon", "saskatchewan",
                            "moscow", "park", "suite", "west", "corteva", "bayer", "frankfurt",
                            "cropscience", "beltsville", "south", "northeast", "northern",
                            "northwest", "platte", "central", "cooperative", "cornell", "phd",
                            "program", "maui", "clemson", "stoneville", "baton", "rouge",
                            "ridgetown", "buenos", "ithaca", "são", "cordoba", "usa", "carbondale",
                            "sur", "river", "system", "johnson", "athens", "city", "usp", "paulo",
                            "pelotas", "aires", "winfield", "llc", "são", "kingdom", "pnw",
                            "lexington", "eastern", "mornings", "brookings", "southern", "federal",
                            "scottsbluff", "ontario", "manitoba", "thorntown", "lexiton",
                            "newport", "macomb", "penn", "institute", "islands", "summit",
                            "shoreview", "ndsu", "collins", "smithville", "europe", "antonio",
                            "winnipeg", "saint", "fmc", "brookston", "southeastern", "protection",
                            "agrosciences", "monsanto", "louis", "campus", "bangkok", "collins",
                            "council", "corporation", "rio", "grande", "harrow", "aac", "aafc",
                            "beach", "aberdeen", "brunswick", "napa", "rutgers", "mills", "falls",
                            "wakefield", "wayne", "proceedings", "ncwss",
                            "valent","society", "starkville", "department", "sheridan", "viçosa",
                            "lonoke", "osmond", "las", "cruces", "makawao", "painter", "lethbridge",
                            "daejeon", "moghu", "bridgestone", "princeton", "lafayette", "hastings",
                            "symposium", "volcano", "colfax", "greeley", "boulder", "seffner", "des",
                            "moines", "amvac", "lees", "crawley", "kyoto", "manoa", "bonham", "posters",
                            "langley", "waipahu", "salinas", "pontotoc", "richelieu", "galena",
                            "beebe", "calgary", "bogor", "jean", "hampshire", "trinity", "triangle",
                            "york", "monticello", "bogotá", "calgary", "albion", "alegre", "arabia",
                            "saudi", "balm", "bay", "brooks", "bury", "committee", "csic", "daniel",
                            "dow", "edmonton", "edmunds", "edwardsville", "eloy", "esalq","goldsboro",
                            "hettinger", "iaa", "korea", "lacombe", "jaboticabal", "keenesburg",
                            "marina", "mcminnville", "maringa", "marrone", "morrisville", "monterey",
                            "nufarm", "oak", "ncsu", "nacional", "ottawa", "pendleton", "pat",
                            "porto", "plc", "stephenville", "steckel", "tokyo", "universitat", "vero",
                            "univ", "wageningen", "wooster", "christi", "corpus", "company", "dryden",
                            "glenn", "nice", "nrcs", "oroville", "susanville", "amworth", "yuba",
                            "hays", "bracknell", "agcenter", "americas", "america", "immokalee", "papers",
                            "harpenden", "rothamsted", "wagga", "county", "hawaiian", "belgrade",
                            "national", "pacific", "adams", "bayer", "dupont", "dow", "johnston",
                            "layfette", "queensland", "gatton", "rochelle",
                            "nebraska", "lincoln", "virtual",
                            "madison", "wisconsin", "unofficial",
                            "crop", "university", "universidad", "universidade", "location",
                            "agriscience", "usda", "monarchy", "north", "march", "moderator",
                            "extension", "college", "tech", "time", "student", "contest",
                            "break", "station", "basf", "division", "ars", "fort", "guelph",
                            "presenter", "maui", "monday", "tuesday", "wednesday", "thursday",
                            "oral", "poster", "united", "western", "speaker", "science", "lleida",
                            "dakota", "agriculture", "service", "laramie", "forest", "piracicaba",
                            "purdue", "agrilife", "center", "syngenta", "morning", "afternoon",
                            "agri", "ventenata", "center", "east", "food", "tifton", "adelaide",
                            "pullman", "resources", "affiliation", "saskatoon", "saskatchewan",
                            "moscow", "park", "suite", "west", "corteva", "bayer", "frankfurt",
                            "cropscience", "beltsville", "south", "northeast", "northern",
                            "northwest", "platte", "central", "cooperative", "cornell", "phd",
                            "program", "maui", "clemson", "stoneville", "baton", "rouge",
                            "ridgetown", "buenos", "ithaca", "são", "cordoba", "usa", "carbondale",
                            "sur", "river", "system", "johnson", "athens", "city", "usp", "paulo",
                            "pelotas", "aires", "winfield", "llc", "são", "kingdom", "pnw",
                            "lexington", "eastern", "mornings", "brookings", "southern", "federal",
                            "scottsbluff", "ontario", "manitoba", "thorntown", "lexiton",
                            "newport", "macomb", "penn", "institute", "islands", "summit",
                            "shoreview", "ndsu", "collins", "smithville", "europe", "antonio",
                            "winnipeg", "saint", "fmc", "brookston", "southeastern", "protection",
                            "agrosciences", "monsanto", "louis", "campus", "bangkok", "collins",
                            "council", "corporation", "rio", "grande", "harrow", "aac", "aafc",
                            "beach", "aberdeen", "brunswick", "napa", "rutgers", "mills", "falls",
                            "wakefield", "wayne", "undergraduate", "graduate", "professor",
                            "valent","society", "starkville", "department", "sheridan", "viçosa",
                            "lonoke", "osmond", "las", "cruces", "makawao", "painter", "lethbridge",
                            "daejeon", "moghu", "bridgestone", "princeton", "lafayette", "hastings",
                            "symposium", "volcano", "colfax", "greeley", "boulder", "seffner", "des",
                            "moines", "amvac", "lees", "crawley", "kyoto", "manoa", "bonham", "posters",
                            "langley", "waipahu", "salinas", "pontotoc", "richelieu", "galena",
                            "beebe", "calgary", "bogor", "jean", "hampshire", "trinity", "triangle",
                            "york", "monticello", "bogotá", "calgary", "albion", "alegre", "arabia",
                            "saudi", "balm", "bay", "brooks", "bury", "committee", "csic", "daniel",
                            "dow", "edmonton", "edmunds", "edwardsville", "eloy", "esalq","goldsboro",
                            "hettinger", "iaa", "korea", "lacombe", "jaboticabal", "keenesburg",
                            "marina", "mcminnville", "maringa", "marrone", "morrisville", "monterey",
                            "nufarm", "oak", "ncsu", "nacional", "ottawa", "pendleton", "pat",
                            "porto", "plc", "stephenville", "steckel", "tokyo", "vero",
                            "univ", "wageningen", "wooster", "christi", "corpus", "company", "dryden",
                            "glenn", "nice", "nrcs", "oroville", "susanville", "amworth", "yuba",
                            "hays", "bracknell", "agcenter", "americas", "america", "immokalee", "papers",
                            "harpenden", "rothamsted", "wagga", "county", "hawaiian", "belgrade",
                            "national", "pacific", "adams", "bayer", "dupont", "dow", "johnston",
                            "layfette", "queensland", "gatton", "rochelle", "todd", "owen", "malcolm",
                            "medlin", "volmmer", "washington", "dc", "co", "ks", "ne", "wi", "corp", "il",
                            "cahokia", "zach", "deeds", "stahlman", "smeda", "reid", "harder", "dana",
                            "ramsdale", "sam", "brad", "ramsdale", "cuphea", "vince", "roskamp",
                            "winthrop", "kantrovich", "	phippen", "stahlman", "kamienski",
                            "kamienski", "christopher", "romina", "stevan", "terry", "renner",
                            "wolf", "kenneth", "karen", "gerard", "harankhedkar", "golus", "w.donald",
                            "bauman", "czapar", "greg", "dahl", "gednalske", "michaeland", "jan", "joe",
                            "gerald", "dinicola", "beverly", "scientist", "addendum", "r1",
                            "durgan", "stoltenberg", "annual", "proc", "symbols", "agronomy",
                            "kansas"
                            )


stop_tibble <- tibble(stop_program_words) %>%
  rename("word" = "stop_program_words")



