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
    gender: 'Female', password: 'foobar'},
  { email: 'test1@gmail.com', first_name: 'Big', last_name: 'Mike', 
    gender: 'Male', password: 'foobar'},
  { email: 'test2@gmail.com', first_name: 'Little', last_name: 'John', 
    gender: 'Male', password: 'foobar'},
  { email: 'test3@gmail.com', first_name: 'Chris', last_name: 'Johansson', 
    gender: 'Male', password: 'foobar'},
  { email: 'test4@gmail.com', first_name: 'David', last_name: 'Gutierrez', 
    gender: 'Male', password: 'foobar'},
  { email: 'test5@gmail.com', first_name: 'Big', last_name: 'Mike', 
    gender: 'Male', password: 'foobar'},
  { email: 'test6@gmail.com', first_name: 'Cristiano', last_name: 'Ronaldo', 
    gender: 'Male', password: 'foobar'},
  { email: 'test7@gmail.com', first_name: 'Lionel', last_name: 'Messi', 
    gender: 'Male', password: 'foobar'},
  { email: 'test8@gmail.com', first_name: 'Jose', last_name: 'Rodriguez', 
    gender: 'Male', password: 'foobar'},
  { email: 'test9@gmail.com', first_name: 'Michelle', last_name: 'Wikins',
  gender: 'Female', password: 'foobar' },
  { email: 'test9@gmail.com', first_name: 'Jessica', last_name: 'Johns',
    gender: 'Female', password: 'foobar' },
  { email: 'test10@gmail.com', first_name: 'Charlene', last_name: 'Bronson',
    gender: 'Female', password: 'foobar' },
  { email: 'test11@gmail.com', first_name: 'Madeline', last_name: 'Archer',
    gender: 'Female', password: 'foobar' },
  { email: 'test12@gmail.com', first_name: 'Lana', last_name: 'Kane',
    gender: 'Female', password: 'foobar' },
  { email: 'test13@gmail.com', first_name: 'Sherry', last_name: 'Chan',
    gender: 'Female', password: 'foobar' },
  { email: 'test14@gmail.com', first_name: 'Edith', last_name: 'Pham',
    gender: 'Female', password: 'foobar' },
  { email: 'test15@gmail.com', first_name: 'Sydney', last_name: 'Leroux',
    gender: 'Female', password: 'foobar' },
  { email: 'test16@gmail.com', first_name: 'Abby', last_name: 'Wambach',
    gender: 'Female', password: 'foobar' },
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
  { name: "Blazers", manager_id: 20, sport_id: 2 }
])

roster_adds = RosterAdd.create([
  { team_id: 1, player_id: 1 }, { team_id: 1, player_id: 2 },
  { team_id: 1, player_id: 3 }, { team_id: 1, player_id: 4 },
  { team_id: 1, player_id: 5 }, { team_id: 1, player_id: 6 },
  { team_id: 1, player_id: 7 }, { team_id: 1, player_id: 8 },
  { team_id: 1, player_id: 9 }, { team_id: 1, player_id: 10 },
  { team_id: 1, player_id: 11 }, { team_id: 1, player_id: 12 },


  { team_id: 2, player_id: 15}, { team_id: 2, player_id: 21 },
  { team_id: 2, player_id: 16}, { team_id: 2, player_id: 22 },
  { team_id: 2, player_id: 17}, { team_id: 2, player_id: 23 },
  { team_id: 2, player_id: 18}, { team_id: 2, player_id: 24 },
  { team_id: 2, player_id: 19}, { team_id: 2, player_id: 25 },
  { team_id: 2, player_id: 20 }, { team_id:2, player_id:26 },

  { team_id: 3, player_id: 15}, { team_id: 3, player_id: 21 },
  { team_id: 3, player_id: 16}, { team_id: 3, player_id: 22 },
  { team_id: 3, player_id: 17}, { team_id: 3, player_id: 23 },
  { team_id: 3, player_id: 18}, { team_id: 3, player_id: 24 },
  { team_id: 3, player_id: 19}, { team_id: 3, player_id: 25 },
  { team_id: 3, player_id: 20 }, { team_id:3, player_id:26 },
  
  { team_id: 4, player_id: 11}, { team_id: 4, player_id: 26 },
  { team_id: 4, player_id: 12}, { team_id: 4, player_id: 25 },
  { team_id: 4, player_id: 13}, { team_id: 4, player_id: 27 },
  { team_id: 4, player_id: 14}, { team_id: 4, player_id: 28 },
  { team_id: 4, player_id: 15}, { team_id: 4, player_id: 29 },
  { team_id: 4, player_id: 16 }, { team_id:4, player_id: 30 }
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

games = Game.create([
  { league_id: 1, team1_id: 1, team2_id: 2, date: '2014-06-01', time: '8:00', location_id: 1},
  { league_id: 1, team1_id: 3, team2_id: 4, date: '2014-06-01', time: '10:00', location_id: 1},
  { league_id: 1, team1_id: 5, team2_id: 6, date: '2014-06-01', time: '12:00', location_id: 1},
  { league_id: 1, team1_id: 7, team2_id: 8, date: '2014-06-01', time: '14:00', location_id: 1},
  { league_id: 1, team1_id: 1, team2_id: 3, date: '2014-06-08', time: '8:00', location_id: 2},
  { league_id: 1, team1_id: 2, team2_id: 4, date: '2014-06-08', time: '10:00', location_id: 2},
  { league_id: 1, team1_id: 5, team2_id: 7, date: '2014-06-08', time: '13:00', location_id: 2},
  { league_id: 1, team1_id: 6, team2_id: 8, date: '2014-06-08', time: '15:00', location_id: 2},
  { league_id: 1, team1_id: 1, team2_id: 6, date: '2014-06-15', time: '8:00', location_id: 3},
  { league_id: 1, team1_id: 3, team2_id: 8, date: '2014-06-15', time: '10:00', location_id: 3},
  { league_id: 1, team1_id: 5, team2_id: 2, date: '2014-06-15', time: '12:00', location_id: 4},
  { league_id: 1, team1_id: 7, team2_id: 4, date: '2014-06-15', time: '14:00', location_id: 4},
  { league_id: 1, team1_id: 1, team2_id: 5, date: '2014-06-22', time: '8:00', location_id: 5},
  { league_id: 1, team1_id: 2, team2_id: 6, date: '2014-06-22', time: '10:00', location_id: 5},
  { league_id: 1, team1_id: 5, team2_id: 3, date: '2014-06-22', time: '13:00', location_id: 2},
  { league_id: 1, team1_id: 6, team2_id: 4, date: '2014-06-22', time: '15:00', location_id: 3}
])

Availability.generate_random_avails