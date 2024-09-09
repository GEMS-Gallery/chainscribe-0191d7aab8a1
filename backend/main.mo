import Char "mo:base/Char";
import Hash "mo:base/Hash";

import Array "mo:base/Array";
import Time "mo:base/Time";
import Result "mo:base/Result";
import Int "mo:base/Int";
import Text "mo:base/Text";
import HashMap "mo:base/HashMap";
import Iter "mo:base/Iter";

actor {
  type Game = {
    date: Text;
    time: Text;
    away: Text;
    home: Text;
  };

  type Schedule = [Game];

  let teams = [
    "Arizona Cardinals", "Atlanta Falcons", "Baltimore Ravens", "Buffalo Bills",
    "Carolina Panthers", "Chicago Bears", "Cincinnati Bengals", "Cleveland Browns",
    "Dallas Cowboys", "Denver Broncos", "Detroit Lions", "Green Bay Packers",
    "Houston Texans", "Indianapolis Colts", "Jacksonville Jaguars", "Kansas City Chiefs",
    "Las Vegas Raiders", "Los Angeles Chargers", "Los Angeles Rams", "Miami Dolphins",
    "Minnesota Vikings", "New England Patriots", "New Orleans Saints", "New York Giants",
    "New York Jets", "Philadelphia Eagles", "Pittsburgh Steelers", "San Francisco 49ers",
    "Seattle Seahawks", "Tampa Bay Buccaneers", "Tennessee Titans", "Washington Commanders"
  ];

  var schedules = HashMap.HashMap<Text, Schedule>(32, Text.equal, Text.hash);

  func initializeSchedules() {
    for (team in teams.vals()) {
      let schedule : Schedule = [
        { date = "2024-09-08"; time = "13:00"; away = team; home = "Opponent 1" },
        { date = "2024-09-15"; time = "16:25"; away = "Opponent 2"; home = team }
      ];
      schedules.put(team, schedule);
    };
  };

  public query func getTeams() : async [Text] {
    return teams;
  };

  public query func getScheduleForTeam(team: Text) : async Result.Result<Schedule, Text> {
    switch (schedules.get(team)) {
      case (null) { #err("Team not found") };
      case (?schedule) { #ok(schedule) };
    };
  };

  // System functions for canister lifecycle management
  stable var initialized = false;

  system func preupgrade() {
    // Save any necessary state before upgrade
  };

  system func postupgrade() {
    if (not initialized) {
      initializeSchedules();
      initialized := true;
    };
  };
}
