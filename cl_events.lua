-- @Date:   2017-06-12T16:47:02+02:00
-- @Project: FiveM Tools
-- @Last modified time: 2017-06-13T11:14:47+02:00
-- @License: GNU General Public License v3.0

RegisterNetEvent('ft_animation:ClAnimAction')
AddEventHandler('ft_animation:ClAnimAction', function(data)
  AnimAction(data)
end)

RegisterNetEvent('ft_animation:ClAnimActionScenario')
AddEventHandler('ft_animation:ClAnimActionScenario', function(data)
  AnimActionScenario(data)
end)

RegisterNetEvent('ft_animation:ClAnimStop')
AddEventHandler('ft_animation:ClAnimStop', function()
  AnimStop()
end)

RegisterNetEvent('ft_animation:ClAnimForceStop')
AddEventHandler('ft_animation:ClAnimForceStop', function()
  AnimForceStop()
end)
