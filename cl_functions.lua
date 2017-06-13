-- @Date:   2017-06-12T16:44:10+02:00
-- @Project: FiveM Tools
-- @Last modified time: 2017-06-13T17:36:23+02:00
-- @License: GNU General Public License v3.0

local playAnim = false
local dataAnim = {}

function AnimAction(data)
  Citizen.CreateThread(function()

    if not playAnim then

      local playerPed = GetPlayerPed(-1);
      if DoesEntityExist(playerPed) then -- Ckeck if ped exist

        dataAnim = data

        -- Play Animation
        RequestAnimDict(data.lib)
        while not HasAnimDictLoaded(data.lib) do
          Citizen.Wait(0)
        end
        if HasAnimDictLoaded(data.lib) then

          local flag = 0
          if data.loop ~= nil and data.loop then
            flag = 1
          elseif data.move ~= nil and data.move then
            flag = 49
          end

          TaskPlayAnim(playerPed, data.lib, data.anim, 8.0, -8.0, -1, flag, 0, 0, 0, 0)
          playAnimation = true
        end

        -- Wait end annimation
        while true do

          Citizen.Wait(0)
          if not IsEntityPlayingAnim(playerPed, data.lib, data.anim, 3) then
            playAnim = false
            TriggerEvent('ft_animation:ClFinish')
            break
          end

        end

      end -- end ped exist

    else
      TriggerEvent('ft_animation:ClPending')
    end

  end)
end

function AnimActionScenario(data)
  Citizen.CreateThread(function()

    if not playAnim then

      local playerPed = GetPlayerPed(-1);
      if DoesEntityExist(playerPed) then

        TaskStartScenarioInPlace(playerPed, data.anim, 0, false)

        dataAnim = data
        playAnimation = true
      end

    else
      TriggerEvent('ft_animation:ClPending')
    end

  end)
end

function AnimStop()
  Citizen.CreateThread(function()
    if playAnimation then
      local playerPed = GetPlayerPed(-1);
      if DoesEntityExist(playerPed) then

        if dataAnim.lib ~= nil then
          StopEntityAnim(playerPed, dataAnim.anim, dataAnim.lib, 3)
        end

        ClearPedTasks(playerPed)
        ClearPedSecondaryTask(playerPed)

        playAnimation = false
        dataAnim = {}

        TriggerEvent('ft_animation:ClStopped')

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
        TriggerEvent('ft_animation:ClStopped')

        playAnimation = false
      end

    end

  end)
end
