-- Namespace Variables
local addonName, addonTbl = ...;

-- Event Registrations
local eventFrame = CreateFrame("Frame");
eventFrame:RegisterEvent("MERCHANT_SHOW");

eventFrame:SetScript("OnEvent", function(self, event, ...)
	if event == "MERCHANT_SHOW" then
		if CanMerchantRepair() then -- The current merchant is able to repair items.
			local repairAllCost, canRepair = GetRepairAllCost();
			if canRepair then -- The player has items that can be repaired.
				local money = GetMoney();
				if money > repairAllCost then -- The player has more money than the repair cost.
					RepairAllItems(); -- Repair items using the player's money.
				end
			end
		end
	end
end);