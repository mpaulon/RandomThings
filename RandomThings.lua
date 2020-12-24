local _, RandomThings = ...;

local function DropChanceTooltip(tooltip)
    local itemName, itemLink = tooltip:GetItem()
    if not itemLink then return; end
    local itemID = GetItemInfoInstant(itemLink)
    if not itemID then return; end
    itemExpansion = select(15, GetItemInfo(itemID))
    tooltip:AddLine(string.format("Expansion: %s", RandomThings.expansions[itemExpansion]))
    itemDropRate = RandomThings.items[itemID]
    if not itemDropRate then return; end
    tooltip:AddLine(string.format("Drop rate: %.2f %%", itemDropRate))
end

GameTooltip:HookScript("OnTooltipSetItem", DropChanceTooltip)
