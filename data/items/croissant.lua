local item = ...

function item:on_obtaining(variant, savegame_variable)

  self:get_game():get_item("croissants_counter"):add_amount(1)
end

