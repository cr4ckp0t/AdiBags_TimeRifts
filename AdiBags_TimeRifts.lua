-------------------------------------------------------------------------------
-- AdiBags - Time Rifts By Crackpot (US, Illidan)
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- AdiBags - Zaralek Cavern By Crackpot (US, Illidan)
-------------------------------------------------------------------------------
local addonName, addon = ...
local AdiBags = LibStub("AceAddon-3.0"):GetAddon("AdiBags")

local tonumber = _G.tonumber
local L = addon.L

local riftFilter = AdiBags:RegisterFilter("Time Rifts", 98, "ABEvent-1.0")
riftFilter.uiName = L["Time Rifts"]
riftFilter.uiDesc = L["Items from Time Rifts, added in patch 10.1.5."] 

function riftFilter:OnInitialize()
    self.rift = {
        [206475] = true, -- Paracausal Fragment of Seschenal
        [206673] = true, -- Horn of the White War Wolf
        [206674] = true, -- Reins of the Ravenous Black Gryphon
        [206675] = true, -- Gold-Toed Albatross
        [206676] = true, -- Felstorm Dragon
        [206678] = true, -- Sulfur Hound's Leash
        [206679] = true, -- Perfected Juggernaut
        [206680] = true, -- Reins of the Scourgebound Vanquisher
        [206764] = true, -- Fel-Infused Polearm
        [206765] = true, -- Its Focused Gaze
        [206766] = true, -- Jagged Treason
        [206767] = true, -- Valhalas Peacekeeper
        [206768] = true, -- Serrated Parasite
        [206769] = true, -- Unknown Horror's Arm
        [206770] = true, -- Consuming Claws
        [206776] = true, -- Heretical Gavel
        [206777] = true, -- Energy Projection Regulator
        [206778] = true, -- Northern Ballista
        [206779] = true, -- Steel-Lined Locking System
        [206780] = true, -- Overclocked Hand Cannon
        [206781] = true, -- Demonic Bone-Crusher
        [206782] = true, -- Titanic Hourglass
        [206783] = true, -- Bonegale Greataxe
        [206784] = true, -- Blighted Greatbow
        [206785] = true, -- Defect Retirement Tool
        [206786] = true, -- Scourge Victorious Tabard
        [206788] = true, -- Utopian Tabard
        [206789] = true, -- Heart-Slicer
        [206790] = true, -- Fel-Ridden Divider
        [206791] = true, -- Branded Greatmaul
        [206792] = true, -- Subjugator's Shield
        [206793] = true, -- Upraised Headstone
        [206794] = true, -- Hand of Order
        [206795] = true, -- Titan Watcher's Shortblade
        [206796] = true, -- Energetic Power Knife
        [206797] = true, -- Frostspire
        [206798] = true, -- Valhalas Heartstriker
        [206799] = true, -- Pauldrons of the Fire Lord
        [206801] = true, -- Inferna Rod
        [206802] = true, -- Plague-Touched Stave
        [206803] = true, -- Cursed Blade of the Scourge
        [206804] = true, -- Clockwork Mallet
        [206807] = true, -- Order-Powered Mechblade
        [206808] = true, -- Warmonger's Robe
        [206809] = true, -- Warmonger's Wristwraps
        [206812] = true, -- Warmonger's Epaulettes
        [206814] = true, -- Warmonger's Leggings
        [206816] = true, -- Warmonger's Skullcap
        [206817] = true, -- Warmonger's Mitts
        [206818] = true, -- Warmonger's Treads
        [206819] = true, -- Warmonger's Shroud
        [206821] = true, -- Jingoist's Robe
        [206822] = true, -- Jingoist's Wristwraps
        [206823] = true, -- Jingoist's Cord
        [206824] = true, -- Jingoist's Epaulettes
        [206825] = true, -- Jingoist's Leggings
        [206826] = true, -- Jingoist's Hood
        [206827] = true, -- Jingoist's Mitts
        [206828] = true, -- Jingoist's Treads
        [206829] = true, -- Jingoist's Shroud
        [206831] = true, -- Jingoist's Cloak
        [206832] = true, -- Jingoist's Boots
        [206833] = true, -- Jingoist's Gloves
        [206834] = true, -- Jingoist's Headcover
        [206835] = true, -- Jingoist's Pantaloons
        [206836] = true, -- Jingoist's Spaulders
        [206837] = true, -- Jingoist's Belt
        [206839] = true, -- Jingoist's Cuirass
        [206840] = true, -- Warmonger's Cuirass
        [206841] = true, -- Warmonger's Bracers
        [206842] = true, -- Warmonger's Belt
        [206843] = true, -- Warmonger's Spaulders
        [206845] = true, -- Warmonger's Pantaloons
        [206846] = true, -- Warmonger's Headcover
        [206847] = true, -- Warmonger's Gloves
        [206848] = true, -- Warmonger's Boots
        [206849] = true, -- Warmonger's Cloak
        [206850] = true, -- Warmonger's Drape
        [206851] = true, -- Warmonger's Footpads
        [206852] = true, -- Warmonger's Grips
        [206853] = true, -- Warmonger's Casque
        [206854] = true, -- Warmonger's Legguards
        [206855] = true, -- Warmonger's Mantle
        [206856] = true, -- Warmonger's Clasp
        [206857] = true, -- Warmonger's Bonds
        [206858] = true, -- Warmonger's Chainmail
        [206860] = true, -- Jingoist's Chainmail
        [206861] = true, -- Jingoist's Bonds
        [206862] = true, -- Jingoist's Clasp
        [206863] = true, -- Jingoist's Mantle
        [206864] = true, -- Jingoist's Legguards
        [206865] = true, -- Jingoist's Casque
        [206866] = true, -- Jingoist's Grips
        [206867] = true, -- Jingoist's Footpads
        [206868] = true, -- Jingoist's Drape
        [206870] = true, -- Jingoist's Cape
        [206871] = true, -- Jingoist's Warboots
        [206872] = true, -- Jingoist's Gauntlets
        [206873] = true, -- Jingoist's Greathelm
        [206874] = true, -- Jingoist's Legplates
        [206875] = true, -- Jingoist's Pauldrons
        [206876] = true, -- Jingoist's Girdle
        [206877] = true, -- Jingoist's Vambraces
        [206878] = true, -- Jingoist's Breastplate
        [206879] = true, -- Warmonger's Breastplate
        [206880] = true, -- Warmonger's Vambraces
        [206881] = true, -- Warmonger's Girdle
        [206882] = true, -- Warmonger's Pauldrons
        [206883] = true, -- Warmonger's Legplates
        [206884] = true, -- Warmonger's Greathelm
        [206885] = true, -- Warmonger's Gauntlets
        [206886] = true, -- Warmonger's Warboots
        [206887] = true, -- Warmonger's Cape
        [206956] = true, -- Paracausal Fragment of Sulfuras
        [206958] = true, -- Paracausal Fragment of Val'anyr
        [206964] = true, -- Paracausal Fragment of Doomhammer
        [206972] = true, -- Paracausal Fragment of Azzinoth
        [206983] = true, -- Paracausal Fragment of Frostmourne
        [207002] = true, -- Encapsulated Destiny
        [207014] = true, -- Jingoist's Slicer
        [207015] = true, -- Warmonger's Ripper
        [207024] = true, -- Paracausal Fragment of Shalamayne
        [207030] = true, -- Dilated Time Capsule
        [207050] = true, -- Warmonger's Plate Gear Bag
        [207051] = true, -- Warmonger's Plate Equipment Bag
        [207052] = true, -- Jingoist's Plate Equipment Bag
        [207053] = true, -- Jingoist's Plate Gear Bag
        [207063] = true, -- Jingoist's Mail Equipment Bag
        [207064] = true, -- Jingoist's Mail Gear Bag
        [207065] = true, -- Warmonger's Mail Gear Bag
        [207066] = true, -- Warmonger's Mail Equipment Bag
        [207067] = true, -- Jingoist's Leather Gear Bag
        [207068] = true, -- Jingoist's Leather Equipment Bag
        [207069] = true, -- Warmonger's Leather Equipment Bag
        [207070] = true, -- Warmonger's Leather Gear Bag
        [207071] = true, -- Jingoist's Cloth Gear Bag
        [207072] = true, -- Jingoist's Cloth Equipment Bag
        [207073] = true, -- Warmonger's Cloth Equipment Bag
        [207074] = true, -- Warmonger's Cloth Gear Bag
        [207075] = true, -- Jingoist's Plate Armor Bag
        [207076] = true, -- Warmonger's Plate Armor Bag
        [207077] = true, -- Warmonger's Mail Armor Bag
        [207078] = true, -- Jingoist's Mail Armor Bag
        [207079] = true, -- Warmonger's Leather Armor Bag
        [207080] = true, -- Jingoist's Leather Armor Bag
        [207081] = true, -- Warmonger's Cloth Armor Bag
        [207082] = true, -- Jingoist's Cloth Armor Bag
        [207582] = true, -- Box of Tampered Reality
        [207583] = true, -- Box of Collapsed Reality
        [207584] = true, -- Box of Volatile Reality
        [207595] = true, -- Anachronistic Robes
        [207596] = true, -- Anachronistic Slippers
        [207597] = true, -- Anachronistic Mitts
        [207598] = true, -- Anachronistic Hood
        [207599] = true, -- Anachronistic Breeches
        [207600] = true, -- Anachronistic Mantle
        [207601] = true, -- Anachronistic Sash
        [207602] = true, -- Anachronistic Bindings
        [207603] = true, -- Raiment of Discontinuity
        [207604] = true, -- Treads of Discontinuity
        [207605] = true, -- Gloves of Discontinuity
        [207606] = true, -- Mask of Discontinuity
        [207607] = true, -- Leggings of Discontinuity
        [207608] = true, -- Epaulets of Discontinuity
        [207609] = true, -- Cincture of Discontinuity
        [207610] = true, -- Wristbands of Discontinuity
        [207611] = true, -- Paradoxical Chainmail
        [207612] = true, -- Infinite Soldier's Striders
        [207613] = true, -- Paradoxical Gauntlets
        [207614] = true, -- Paradoxical Cowl
        [207615] = true, -- Paradoxical Tassets
        [207616] = true, -- Paradoxical Spaulders
        [207617] = true, -- Paradoxical Cinch
        [207618] = true, -- Paradoxical Bracers
        [207619] = true, -- Anomalous Chestplate
        [207620] = true, -- Anomalous Stompers
        [207621] = true, -- Anomalous Crushers
        [207622] = true, -- Anomalous Greathelm
        [207623] = true, -- Anomalous Greaves
        [207624] = true, -- Anomalous Pauldrons
        [207625] = true, -- Anomalous Girdle
        [207626] = true, -- Anomalous Vambraces
        [207627] = true, -- Anachronistic Wrap
        [207628] = true, -- Anomalous Cape
        [207629] = true, -- Paradoxical Drape
        [207630] = true, -- Cloak of Discontinuity
        [207976] = true, -- Chroniton Wand
        [207977] = true, -- Rift Render
        [207979] = true, -- Timespan Scepter
        [207980] = true, -- Inevitable Claymore
        [207981] = true, -- Time Slicer
        [207982] = true, -- Timeless Bulwark
        [207985] = true, -- Ever-Repeating Rifle
        [207988] = true, -- Time Keeper's Polearm
        [207989] = true, -- Chronospire
        [207990] = true, -- Temporal Battle Staff
        [207993] = true, -- Spacetime Cleaver
        [207998] = true, -- Hoursteel Mace
        [208008] = true, -- Doomrubble
        [208009] = true, -- Gill'dan
        [208010] = true, -- Jeepers
        [208011] = true, -- Obsidian Warwhelp
        [208012] = true, -- Briarhorn Hatchling
        [208042] = true, -- Edge of Tomorrow
        [208043] = true, -- Bronzegift Mallet
        [208090] = true, -- Contained Paracausality
        [208132] = true, -- Stormwind Insignia
        [208133] = true, -- Orgrimmar Insignia
        [208134] = true, -- Rustbolt Resistance Insignia
        [208138] = true, -- N'Ruby
    }
end

function riftFilter:Update()
    self:SendMessage("AdiBags_FiltersChanged")
end

function riftFilter:OnEnable()
    AdiBags:UpdateFilters()
end

function riftFilter:OnDisable()
    AdiBags:UpdateFilters()
end

function riftFilter:Filter(slotData)
    if self.rift[tonumber(slotData.itemId)] then
        return L["Time Rifts"]
    end
end