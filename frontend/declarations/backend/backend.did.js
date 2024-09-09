export const idlFactory = ({ IDL }) => {
  const Game = IDL.Record({
    'away' : IDL.Text,
    'date' : IDL.Text,
    'home' : IDL.Text,
    'time' : IDL.Text,
  });
  const Schedule = IDL.Vec(Game);
  const Result = IDL.Variant({ 'ok' : Schedule, 'err' : IDL.Text });
  return IDL.Service({
    'getScheduleForTeam' : IDL.Func([IDL.Text], [Result], ['query']),
    'getTeams' : IDL.Func([], [IDL.Vec(IDL.Text)], ['query']),
  });
};
export const init = ({ IDL }) => { return []; };
