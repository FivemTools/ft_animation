-- @Date:   2017-06-12T16:44:10+02:00
-- @Project: FiveM Tools
-- @Last modified time: 2017-06-12T20:59:22+02:00
-- @License: GNU General Public License v3.0

local playAnim = false

function AnimAction(data)
  Citizen.CreateThread(function()

    if not playAnim then

      local playerPed = GetPlayerPed(-1);

      -- Play Animation
      RequestAnimDict( data.lib )
      while not HasAnimDictLoaded( data.lib ) do
        Citizen.Wait(0)
      end
      if HasAnimDictLoaded( data.lib ) then
        TaskPlayAnim( playerPed, data.lib , data.anim , 8.0, -8.0, -1, 0, 0, false, false, false )
        playAnim = true
      end

      -- Wait end annimation
      while true do

        Citizen.Wait(0)
        if not IsEntityPlayingAnim(playerPed, data.lib, data.anim, 3) then
          playAnim = false
          TriggerEvent('ft_animation:Finish')
          break
        end

      end

    else
      TriggerEvent('ft_animation:Pending')
    end

  end)
end

function AnimActionScenario(data)
  Citizen.CreateThread(function()

    if not playAnim then

      local playerPed = GetPlayerPed(-1);
      if playerPed then
        TaskStartScenarioInPlace( playerPed, data.anim, 0, false )
        playAnimation = true
      end

    else
      TriggerEvent('ft_animation:Pending')
    end

  end)
end

function AnimStop()
  Citizen.CreateThread(function()

    if playAnimation then

      local playerPed = GetPlayerPed(-1);
      if playerPed then
        ClearPedTasks(playerPed)
        playAnimation = false
        TriggerEvent('ft_animation:Stopped')
      end

    end

  end)
end

function AnimForceStop()
  Citizen.CreateThread(function()

    if playAnimation then

      local playerPed = GetPlayerPed(-1);
      if playerPed then
        ClearPedTasksImmediately(playerPed)
        playAnimation = false
        TriggerEvent('ft_animation:Stopped')
      end

    end

  end)
end
