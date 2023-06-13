local level = Global.level_data and Global.level_data.level_id or ""
if level ~= "pal" or Network:is_client() then return end

core:module('CoreMissionManager')
local el_list = {}

Hooks:PreHook(MissionManager, "_add_script", "pre_u201_counterfeit_add_script", function(self, data)
  for id, element in pairs(data.elements) do
    if element.id == 102644 then
      for exec_id, exec_el in pairs(element.values.on_executed) do
        if exec_el.id == 103353 or exec_el.id == 103354 or exec_el.id == 100031 then
          table.insert(el_list, exec_id)
        end
      end
      table.sort(el_list)
      for i = #el_list, 1, -1 do
        table.remove(element.values.on_executed, el_list[i])
      end
      break
    end
  end
end)