function has(item, amount)
  local obj = Tracker:FindObjectForCode(item)
  if obj.Type == "toggle" then
    if obj.Active then
      return true
    end
  elseif obj.Type == "consumable" then
    if obj.AcquiredCount == amount then
      return true
    end
  elseif obj.Type == "progressive" then
    if obj.CurrentStage == amount then
      return true
    end
  end
end

function has_at_least(item, amount)
  local obj = Tracker:FindObjectForCode(item)
  if obj.Type == "toggle" then
    if obj.Active then
      return true
    end
  elseif obj.Type == "consumable" then
    if obj.AcquiredCount >= amount then
      return true
    end
  elseif obj.Type == "progressive" then
    if obj.CurrentStage >= amount then
      return true
    end
  end
end

function has_all_epitaphs()
  local epitaphtype = Tracker:FindObjectForCode("epitaphtype")
  if epitaphtype.CurrentStage == 0 then
    if has_at_least("epitaph", 9)  then
	  return true
	end
  elseif epitaphtype.CurrentStage == 1 then
    if has_at_least("epitaph", 3) then
	  return true
	end
  else
    if has_at_least("epitaph", 1) then
	  return true
	end
  end
end

function unlocked_act2_bridge()
  if has("camera", 1) and has("meat", 1) then
    return true
  elseif has("epitaph", 9) then
    return true
  end
end

function act2_access()
  local goal = Tracker:FindObjectForCode("goal")
  if goal.CurrentStage == 0  then
    if has("filmroll", 1) then
	  return true
	end
  elseif goal.CurrentStage == 1  then
    return true
  else
    return false
  end
end

function act3_access()
  local goal = Tracker:FindObjectForCode("goal")
  if goal.CurrentStage == 0  then
    if has("filmroll", 1) and has("camera", 1) and has_all_epitaphs() and has("monocle", 1) then
	  return true
	end
  elseif goal.CurrentStage == 1 then
    return true
  else
    return false
  end
end

function update_options()
  local epitaphtype = Tracker:FindObjectForCode("epitaphtype")
  local epitaph = Tracker:FindObjectForCode("epitaph")
  if epitaphtype.CurrentStage == 0 then
    epitaph.MaxCount = 9
  elseif epitaphtype.CurrentStage == 1 then
    if epitaph.AcquiredCount > 3 then
      epitaph.AcquiredCount = 3
    end
    epitaph.MaxCount = 3
  else
    if epitaph.AcquiredCount > 1 then
      epitaph.AcquiredCount = 1
    end
    epitaph.MaxCount = 1
  end
  return true
end