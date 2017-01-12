import UIKit

/*
 You have volunteered to be the coordinator for your town’s youth soccer league. As part of your job you need to divide the 18 children who have signed up for the league into three even teams — Dragons, Sharks, and Raptors. In years past, the teams have been unevenly matched, so this year you are doing your best to fix that. For each child, you will have the following information: Name, height (in inches), whether or not they have played soccer before, and their guardians’ names.
 
 The project has three major parts. For each part, choose ONLY from the tools we have covered in the courses so far.
 
 Native types and collections to store data (Dictionaries, Arrays, Ints, Strings, etc...) Accessing, appending and counting Arrays Accessing Dictionaries and Arrays Creating control flow Use of comparison operators String Interpolation Use of comments
 
 Please don’t employ more advanced tools we haven’t covered yet, even if they are right for the job. (Yes, that means no classes, structs or filters on Project 1.)
 
 ** Part 1: ** We have provided information for the 18 players in the Player Info spreadsheet. Please choose an appropriate data type to store the information for each player. In addition, create an empty collection variable to hold all the players’ data. Once you have decided on what tools to use, manually enter the player data so it can be used in Part 2.
 
 ** Part 2: ** Create logic to iterate through all 18 players and assign them to teams such that the number of experienced players on each team are the same. Store each team’s players in its own new collection variable for use in Part 3. (Please note: your logic should work correctly regardless of the initial ordering of the players and should work, if we theoretically had more or less than 18 players, so NO MAGIC NUMBERS!)
 
 Also, if you would like to attain an “exceeds expectations” rating for this project, add logic to ensure that each team's average height is within 1.5 inches of the others.
 
 ** Part 3: ** Create logic that iterates through all three teams of players and generates a personalized letter to the guardians, letting them know which team the child has been placed on and when they should attend their first team team practice. As long as you provide the necessary information (player name, team name, guardian names, practice date/time), feel free to have fun with the content of the letter. The team practice dates/times are as follows:
 
 Dragons - March 17, 1pm
 Sharks - March 17, 3pm
 Raptors - March 18, 1pm
 When your complete code is run in a playground the letters should be stored in a collection variable named 'letters'. When the code is run, the letters should be visible in the console.
 
 As always, meaningful and concise code comments are expected. Your code should be written and refined in an Xcode playground. Be sure to upload it to GitHub, as per the instructions provided in the Soccer Coordinator Video Instruction (see the link below). Please also note the specific naming requirements for variables in the detailed instructions below as these are REQUIRED for your project to pass.
 
 Good luck, and happy Coding!
 */

 //SoccerCoordinator

 //Create a collaction for all the data. Use the name as the key and the rest as values.

let players: [String: (height: Int, experience: String, parents: String)] = [
    "Joe Smith": (42, "YES", "Jim and Jan Smith"),
    "Jill Tanner": (36,"YES","Clara Tanner"),
    "Bill Bon": (43,"YES","Sara and Jenny Bon"),
    "Eva Gordon": (45,"NO","Wendy and Mike Gordon"),
    "Matt Gill": (40,"NO","Charles and Sylvia Gill"),
    "Kimmy Stein": (41,"NO","Bill and Hillary Stein"),
    "Sammy Adams": (45,"NO","Jeff Adams"),
    "Karl Saygan": (42,"YES","Heather Bledsoe"),
    "Suzane Greenberg": (44,"YES","Henrietta Dumas"),
    "Sal Dali": (41,"NO","Gala Dali"),
    "Joe Kavalier": (39,"NO","Sam and Elaine Kavalier"),
    "Ben Finkelstein": (44,"NO","Aaron and Jill Finkelstein"),
    "Diego Soto": (41,"YES","Robin and Sarika Soto"),
    "Chloe Alaska": (47,"NO","David and Jamie Alaska"),
    "Arnold Willis": (43,"NO","Claire Willis"),
    "Phillip Helm": (44,"YES","Thomas Helm and Eva Jones"),
    "Les Clay": (42,"YES","Wynonna Brown"),
    "Herschel Krustofski": (45,"YES","Hyman and Rachel Krustofski")
]

// counting the players
players.count

// Categorize each player in 2 groups: experienced & inexperienced
var experiencedPlayers: [String] = []
var inexperiencedPlayers: [String] = []

// Iterate through all players to divide them in 2 groups depending on experience
for player in players {
    if players[player.key]?.experience == "YES" {
        experiencedPlayers.append(player.key)
    } else {
        inexperiencedPlayers.append(player.key)
    }
}

// count the groups
experiencedPlayers.count
inexperiencedPlayers.count

// Create a collection for each team: 'teamSharks', 'teamDragons', and 'teamRaptors'.
var teamSharks: [String] = []
var teamDragons: [String] = []
var teamRaptors: [String] = []

// function to add players
func addPlayers(group: [String]) {
    for player in group {
        if teamSharks.count <= teamDragons.count && teamSharks.count <= teamRaptors.count {
            teamSharks.append(player)
        }
        else if teamDragons.count <= teamSharks.count && teamDragons.count <= teamRaptors.count {
            teamDragons.append(player)
        }
        else {
            teamRaptors.append(player)
        }
    }
}

// add players to the teams
addPlayers(group: experiencedPlayers)
addPlayers(group: inexperiencedPlayers)


// Letter for each kid
var letters: [String: String] = [:]

// Team meeting & team name
let meetingTeamSharks = "March 17, 3pm"
let nameTeamSharks = "Team Sharks"
let meetingTeamDragon = "March 17, 1pm"
let nameTeamDragon = "Team Dragon"
let meetingTeamRaptors = "March 18, 1pm"
let nameTeamRaptors = "Team Raptors"


// Updating letters function
func updateLetters(group: [String], teamName: String, meetingTime: String) {
    for player in group {
        letters.updateValue(("Hi \((players[player]?.parents)!)! \(player) has been placed on \(teamName) and your first team meeting is on \(meetingTime). See you there!"), forKey: player)
    }
}

// Updating letters for each team
updateLetters(group: teamSharks, teamName: nameTeamSharks, meetingTime: meetingTeamSharks)
updateLetters(group: teamRaptors, teamName: nameTeamRaptors, meetingTime: meetingTeamRaptors)
updateLetters(group: teamDragons, teamName: nameTeamDragon, meetingTime: meetingTeamDragon)


// Print letter for each player
for player in players {
    print(letters[player.key]!)
}


