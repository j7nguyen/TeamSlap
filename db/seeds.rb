# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([
  { email: 'joseph@teamslap.com', first_name: 'Joseph', last_name: 'Nguyen', 
    gender: 'Male', password: 'foobar'},
  { email: 'joe@teamslap.com', first_name: 'Joe', last_name: 'Nygen', 
    gender: 'Male', password: 'foobar'},
  { email: 'laurel@gmail.com', first_name: 'Laurel', last_name: 'Hoffman', 
    gender: 'Female', password: 'foobar'},
  { email: 'ulysses@ymal.com', first_name: 'Ulysses', last_name: "D'Souza", 
    gender: 'Male', password: 'foobar'},
  { email: 'mystique@gmail.com', first_name: 'Sally', last_name: 'Thompson', 
    gender: 'Other', password: 'foobar'},
  { email: 'brian_masters@yahoo.com', first_name: 'Brian', last_name: 'Masters', 
    gender: 'Male', password: 'foobar'},
  { email: 'melissa@work.com', first_name: 'Melissa', last_name: 'Williams', 
    gender: 'Female', password: 'foobar'},
  { email: 'Scott_Wilson@gmail.com', first_name: 'Scott', last_name: 'Wilson', 
    gender: 'Male', password: 'foobar'},
  { email: 'big_dog@earthlink.net', first_name: 'Chad', last_name: 'Bryson', 
    gender: 'Male', password: 'foobar'},
  { email: 'gobruins8224@gmail.com', first_name: 'Veronica', last_name: 'Chang', 
    gender: 'Female', password: 'foobar'},
  { email: 'jennyslater@gmail.com', first_name: 'Jenny', last_name: 'Slater', 
    gender: 'Female', password: 'foobar'},
  { email: 'tiger_fan@yahoo.com', first_name: 'Jeff', last_name: 'Mason', 
    gender: 'Male', password: 'foobar'},
  { email: 'bigup@yahoo.com', first_name: 'Robert', last_name: 'Julius', 
    gender: 'Male', password: 'foobar'},
  { email: 'dogluvr@earthlink.net', first_name: 'Maury', last_name: 'Argento', 
    gender: 'Female', password: 'foobar'}
    
  ])
  
sports = Sport.create([
  { name: 'Soccer' }, 
  { name: 'Basketball' }, 
  { name: 'Baseball' }, 
  { name: 'Softball' }, 
  { name: 'Ultimate Frisbee' }, 
  { name: 'Ice Hockey' }, 
  { name: 'Jai Alai' } 
  ])
  
locations = Location.create([
  { name: 'Franklin Square', description: 'Turf field', address1: '2500 17th St',
    city: 'San Francisco', state: 'CA', zip: 94110, sport_id: 1 },
  { name: 'Silver Terrace', description: 'Turf field', address1: '1778 Silver Ave',
    city: 'San Francisco', state: 'CA', zip: 94124, sport_id: 1 },
  { name: 'Burton High School', description: 'Turf field', address1: '400 Mansell St',
    city: 'San Francisco', state: 'CA', zip: 94134, sport_id: 1 },
  { name: 'Beach Chalet', description: 'Grass field, in GG Park', 
    address1: '1500 John F Kenney Dr', city: 'San Francisco', 
    state: 'CA', zip: 94121, sport_id: 1 },
  { name: 'Crocker Amazon', description: 'Turf field, corner of Geneva and Mosco', 
    address1: '1539 Geneva Ave', city: 'San Francisco', state: 'CA', zip: 94112, sport_id: 1 },
  { name: 'Washington High School', description: 'Turf field, enter on 30th', 
    address1: '600 32nd Ave', city: 'San Francisco', state: 'CA', zip: 94121, sport_id: 1 }
  ])
  
leagues = League.create([
  {sport_id: 1, league_manager_id: 1, name: "Sunday 11v11 Coed"},
  {sport_id: 1, league_manager_id: 2, name: "Wednesday 7v7 Mens"},
  {sport_id: 1, league_manager_id: 1, name: "Thursday 5v5 Womens"},
  {sport_id: 2, league_manager_id: 4, name: "Tuesday Coed Bball"},
  {sport_id: 2, league_manager_id: 4, name: "Saturday Mens Hoops"},    
  {sport_id: 4, league_manager_id: 3, name: "Saturday Coed Slow-Pitch"}
])

teams = Team.create([
  { name: "Bayern Eunuch", manager_id: 1, sport_id: 1 },
  { name: "Farcelona", manager_id: 2, sport_id: 1 },
  { name: "Winchester United", manager_id: 3, sport_id: 1 },
  { name: "Liverfool", manager_id: 4, sport_id: 1 },
  { name: "Schmelsea", manager_id: 5, sport_id: 1 },
  { name: "Earthquakers", manager_id: 6, sport_id: 1 },
  { name: "Underdogs", manager_id: 14, sport_id: 1 },
  { name: "Jewventus", manager_id: 8, sport_id: 1 },

  { name: "Fakers", manager_id: 1, sport_id: 2 },
  { name: "Dizzlies", manager_id: 3, sport_id: 2 },
  { name: "Warriors", manager_id: 5, sport_id: 2 },
  { name: "Pistoffs", manager_id: 7, sport_id: 2 },
  { name: "Rawks", manager_id: 8, sport_id: 2 },
  { name: "Captors", manager_id: 9, sport_id: 2 },
])

roster_adds = RosterAdd.create([
  { team_id: 1, player_id: 1 }, { team_id: 1, player_id: 2 },
  { team_id: 1, player_id: 3 }, { team_id: 1, player_id: 4 },
  { team_id: 1, player_id: 5 }, { team_id: 1, player_id: 6 },
  { team_id: 1, player_id: 7 }, { team_id: 1, player_id: 8 },
  { team_id: 1, player_id: 9 }, { team_id: 1, player_id: 10 },
  { team_id: 1, player_id: 11 }, { team_id: 1, player_id: 12 },
  { team_id: 9, player_id: 5 }, { team_id: 9, player_id: 6 },
  { team_id: 9, player_id: 7 }, { team_id: 9, player_id: 8 },
  { team_id: 9, player_id: 1 }, { team_id: 9, player_id: 9 },
  { team_id: 9, player_id: 10 }, { team_id: 9, player_id: 11 },

])

team_adds = TeamAdd.create([
  { team_id: 1, league_id: 1}, { team_id: 2, league_id: 1},
  { team_id: 3, league_id: 1}, { team_id: 4, league_id: 1},
  { team_id: 5, league_id: 1}, { team_id: 6, league_id: 1},
  { team_id: 7, league_id: 1}, { team_id: 8, league_id: 1},
  
  { team_id: 9, league_id: 4}, { team_id: 12, league_id: 4},
  { team_id: 10, league_id: 4}, { team_id: 13, league_id: 4},
  { team_id: 11, league_id: 4}, { team_id: 14, league_id: 4}
])