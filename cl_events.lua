-- @Date:   2017-06-12T16:47:02+02:00
-- @Project: FiveM Tools
-- @Last modified time: 2017-06-12T18:27:19+02:00
-- @License: GNU General Public License v3.0

RegisterNetEvent('ft_animation:AnimAction')
AddEventHandler('ft_animation:AnimAction', function(data)
  AnimAction(data)
end)

RegisterNetEvent('ft_animation:AnimActionScenario')
AddEventHandler('ft_animation:AnimActionScenario', function(data)
  AnimActionScenario(data)
end)

RegisterNetEvent('ft_animation:AnimStop')
AddEventHandler('ft_animation:AnimStop', function()
  AnimStop()
end)

RegisterNetEvent('ft_animation:AnimForceStop')
AddEventHandler('ft_animation:AnimForceStop', function()
  AnimForceStop()
end)
