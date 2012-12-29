local item = ...

function item:on_created()

  self:set_shadow("small")
  self:set_can_disappear(true)
  self:set_brandish_when_picked(false)
end

function item:on_started()

  -- Disable pickable magic jars if the player has no magic bar.
  -- We cannot do this from on_created() because we don't know if the magic bar
  -- is already created there.
  local magic_bar = self:get_game():get_item("magic_bar")
  self:set_obtainable(magic_bar:has_variant())
end

function item:on_obtaining(variant, savegame_variable)

  local amounts = {6, 42}
  local amount = amounts[variant]
  if amount == nil then
    error("Invalid variant '" .. variant .. "' for item 'rupee'")
  end
  self:get_game():add_magic(amount)
end

