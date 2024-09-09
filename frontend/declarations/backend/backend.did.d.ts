import type { Principal } from '@dfinity/principal';
import type { ActorMethod } from '@dfinity/agent';
import type { IDL } from '@dfinity/candid';

export interface Game {
  'away' : string,
  'date' : string,
  'home' : string,
  'time' : string,
}
export type Result = { 'ok' : Schedule } |
  { 'err' : string };
export type Schedule = Array<Game>;
export interface _SERVICE {
  'getScheduleForTeam' : ActorMethod<[string], Result>,
  'getTeams' : ActorMethod<[], Array<string>>,
  'initializeSchedules' : ActorMethod<[], undefined>,
}
export declare const idlFactory: IDL.InterfaceFactory;
export declare const init: (args: { IDL: typeof IDL }) => IDL.Type[];
