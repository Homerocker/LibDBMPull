function DBM:Pull(timer)
  if DBM:GetRaidRank() == 0 then
    return DBM:AddMsg(DBM_ERROR_NO_PERMISSION)
  end
  local channel = ((GetNumRaidMembers() == 0) and "PARTY") or "RAID_WARNING"
  DBM:CreatePizzaTimer(timer, DBM_CORE_TIMER_PULL, true)
  SendChatMessage(DBM_CORE_ANNOUNCE_PULL:format(timer), channel)
  if timer > 7 then DBM:Schedule(timer - 7, SendChatMessage, DBM_CORE_ANNOUNCE_PULL:format(7), channel) end
  if timer > 5 then DBM:Schedule(timer - 5, SendChatMessage, DBM_CORE_ANNOUNCE_PULL:format(5), channel) end
  if timer > 3 then DBM:Schedule(timer - 3, SendChatMessage, DBM_CORE_ANNOUNCE_PULL:format(3), channel) end
  if timer > 2 then DBM:Schedule(timer - 2, SendChatMessage, DBM_CORE_ANNOUNCE_PULL:format(2), channel) end
  if timer > 1 then DBM:Schedule(timer - 1, SendChatMessage, DBM_CORE_ANNOUNCE_PULL:format(1), channel) end
  DBM:Schedule(timer, SendChatMessage, DBM_CORE_ANNOUNCE_PULL_NOW, channel)
end