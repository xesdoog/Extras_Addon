-- Function to create a text element
local function createText(tab, text)
    tab:add_text(text)
end

-- Function to create a tab with buttons and optional text
local function createTab(parentTab, tabName, elements, text)
    local newTab = parentTab:add_tab(tabName)

    for _, element in ipairs(elements) do
        if element.type == "button" then
            newTab:add_button(element.text, element.func)
        end
    end

    if text then
        createText(newTab, text)
    end
end

-- Vehicle Options (Assuming these functions are defined elsewhere in your script)
local function spawnVehicle() end
local function deleteVehicle() end
local function cloneNearestVehicle() end
local function giftVehicle() end
local function oneClickBennys() end
local function oneClickF1s() end
local function maxVehicleMods() end
local function maxVehiclePerformance() end
local function downgradeVehicle() end

-- Player Options (Assuming these functions are defined elsewhere in your script)
local function teleportToLocation() end
local function modifyPlayerMovement(value) end
local function modifyPlayerHealth() end

-- Extras Menu Addon for YimMenu 1.68 by DeadlineEm
local KAOS = gui.get_tab("Extras")
createText(KAOS, "Welcome to the Extras menu, please read the information below before proceeding to use the menu options.")
createText(KAOS, "These options are considered Recovery based options, use them at your own risk!")
createText(KAOS, "YimMenu or Extras Addon does not take responsibility for bans from using these features.")

-- Player Options Tab
local Pla = KAOS:add_tab("Player Options")

-- Movement Tab with Slider for Movement Speed
local Mvmt = Pla:add_tab("Movement")

runSpeed = 0
Mvmt:add_imgui(function()
    runSpeed, used = ImGui.SliderInt("Run Speed", runSpeed, 0, 10)
	out = "Speed set to "..tostring(runSpeed).."x"
    if used then
        PLAYER.SET_RUN_SPRINT_MULTIPLIER_FOR_PLAYER(PLAYER.PLAYER_ID(), runSpeed/7)
		gui.show_message('Run Speed Modified!', out)
    end
end)

swimSpeed = 0
Mvmt:add_imgui(function()
    swimSpeed, used = ImGui.SliderInt("Swim Speed", swimSpeed, 0, 10)
    out = "Speed set to "..tostring(swimSpeed).."x"
    if used then
        PLAYER.SET_SWIM_MULTIPLIER_FOR_PLAYER(PLAYER.PLAYER_ID(), swimSpeed/7)
		gui.show_message('Swim Speed Modified!', out)
    end
end)


-- Health Tab
local Hel = Pla:add_tab("Health")

Hel:add_button("Heal Player", function()
    gui.show_message('Health Modifier', 'Failed! Feature unavailable.')
end)


-- Stat Editor - Alestarov_Menu
local Stats = Pla:add_tab("Stats")

Stats:add_button("Reset Stats", function()
    gui.show_message("Multiplayer Stats Reset", "Stats reset for both Player 1 and Player 2, Change session to apply changes")
    script.run_in_fiber(function (script)
        STATS.STAT_SET_INT(joaat("MPPLY_TOTAL_EVC"), 0, true)
        STATS.STAT_SET_INT(joaat("MPPLY_TOTAL_SVC"), 0, true)
        STATS.STAT_SET_INT(joaat("MP0_MONEY_EARN_BETTING"), 0, true)
        STATS.STAT_SET_INT(joaat("MP0_MONEY_EARN_JOBS"), 0, true)
        STATS.STAT_SET_INT(joaat("MP0_MONEY_EARN_SHARED"), 0, true)
        STATS.STAT_SET_INT(joaat("MP0_MONEY_SPENT_SHARED"), 0, true)
        STATS.STAT_SET_INT(joaat("MP0_MONEY_EARN_JOBSHARED"), 0, true)
        STATS.STAT_SET_INT(joaat("MP0_MONEY_EARN_SELLING_VEH"), 0, true)
        STATS.STAT_SET_INT(joaat("MP0_MONEY_SPENT_WEAPON_ARMOR"), 0, true)
        STATS.STAT_SET_INT(joaat("MP0_MONEY_SPENT_VEH_MAINTENANCE"), 0, true)
        STATS.STAT_SET_INT(joaat("MP0_MONEY_SPENT_STYLE_ENT"), 0, true)
        STATS.STAT_SET_INT(joaat("MP0_MONEY_SPENT_PROPERTY_UTIL"), 0, true)
        STATS.STAT_SET_INT(joaat("MP0_MONEY_SPENT_JOB_ACTIVITY"), 0, true)
        STATS.STAT_SET_INT(joaat("MP0_MONEY_SPENT_BETTING"), 0, true)
        STATS.STAT_SET_INT(joaat("MP0_MONEY_EARN_VEHICLE_EXPORT"), 0, true)
        STATS.STAT_SET_INT(joaat("MP0_MONEY_SPENT_VEHICLE_EXPORT"), 0, true)
        STATS.STAT_SET_INT(joaat("MP0_MONEY_EARN_CLUB_DANCING"), 0, true)
        STATS.STAT_SET_INT(joaat("MP0_CASINO_CHIPS_WON_GD"), 0, true)
        STATS.STAT_SET_INT(joaat("MP0_CASINO_CHIPS_WONTIM"), 0, true)
        STATS.STAT_SET_INT(joaat("MP0_CASINO_GMBLNG_GD"), 0, true)
        STATS.STAT_SET_INT(joaat("MP0_CASINO_BAN_TIME"), 0, true)
        STATS.STAT_SET_INT(joaat("MP0_CASINO_CHIPS_PURTIM"), 0, true)
        STATS.STAT_SET_INT(joaat("MP0_CASINO_CHIPS_PUR_GD"), 0, true)
		-- Player 2 Stats Reset
		STATS.STAT_SET_INT(joaat("MPPLY_TOTAL_EVC"), 0, true)
        STATS.STAT_SET_INT(joaat("MPPLY_TOTAL_SVC"), 0, true)
        STATS.STAT_SET_INT(joaat("MP1_MONEY_EARN_BETTING"), 0, true)
        STATS.STAT_SET_INT(joaat("MP1_MONEY_EARN_JOBS"), 0, true)
        STATS.STAT_SET_INT(joaat("MP1_MONEY_EARN_SHARED"), 0, true)
        STATS.STAT_SET_INT(joaat("MP1_MONEY_SPENT_SHARED"), 0, true)
        STATS.STAT_SET_INT(joaat("MP1_MONEY_EARN_JOBSHARED"), 0, true)
        STATS.STAT_SET_INT(joaat("MP1_MONEY_EARN_SELLING_VEH"), 0, true)
        STATS.STAT_SET_INT(joaat("MP1_MONEY_SPENT_WEAPON_ARMOR"), 0, true)
        STATS.STAT_SET_INT(joaat("MP1_MONEY_SPENT_VEH_MAINTENANCE"), 0, true)
        STATS.STAT_SET_INT(joaat("MP1_MONEY_SPENT_STYLE_ENT"), 0, true)
        STATS.STAT_SET_INT(joaat("MP1_MONEY_SPENT_PROPERTY_UTIL"), 0, true)
        STATS.STAT_SET_INT(joaat("MP1_MONEY_SPENT_JOB_ACTIVITY"), 0, true)
        STATS.STAT_SET_INT(joaat("MP1_MONEY_SPENT_BETTING"), 0, true)
        STATS.STAT_SET_INT(joaat("MP1_MONEY_EARN_VEHICLE_EXPORT"), 0, true)
        STATS.STAT_SET_INT(joaat("MP1_MONEY_SPENT_VEHICLE_EXPORT"), 0, true)
        STATS.STAT_SET_INT(joaat("MP1_MONEY_EARN_CLUB_DANCING"), 0, true)
        STATS.STAT_SET_INT(joaat("MP1_CASINO_CHIPS_WON_GD"), 0, true)
        STATS.STAT_SET_INT(joaat("MP1_CASINO_CHIPS_WONTIM"), 0, true)
        STATS.STAT_SET_INT(joaat("MP1_CASINO_GMBLNG_GD"), 0, true)
        STATS.STAT_SET_INT(joaat("MP1_CASINO_BAN_TIME"), 0, true)
        STATS.STAT_SET_INT(joaat("MP1_CASINO_CHIPS_PURTIM"), 0, true)
        STATS.STAT_SET_INT(joaat("MP1_CASINO_CHIPS_PUR_GD"), 0, true)
    end)
end)
Stats:add_separator()
Stats:add_text("Resets your player stats (Ban time, earned income, sales, etc.)")
Stats:add_text("*This may glitch some owned properties and reset mission progress in freemode*")

-- YimCEO -- Alestarov_Menu
local Money = Pla:add_tab("Money")

cratevalue = 10000
Money:add_imgui(function()
    cratevalue, used = ImGui.SliderInt("Crate Value", cratevalue, 10000, 5000000)
    if used then
        globals.set_int(262145 + 15991, cratevalue)
    end
end)

checkbox = Money:add_checkbox("Enable YimCeo")

Money:add_button("Show computer", function()
    SCRIPT.REQUEST_SCRIPT("apparcadebusinesshub")
    SYSTEM.START_NEW_SCRIPT("apparcadebusinesshub", 8344)
end)

script.register_looped("yimceoloop", function(script)
    cratevalue = globals.get_int(262145 + 15991)
    globals.set_int(262145 + 15756, 0)
    globals.set_int(262145 + 15757, 0)
    script:yield()

    while true do
        script:sleep(1000)  -- Adjust the sleep duration as needed

        if checkbox:is_enabled() == true then
		gui.show_message("YimCEO Enabled!", "Enjoy the bank roll!")
            if locals.get_int("gb_contraband_sell", 2) == 1 then
                locals.set_int("gb_contraband_sell", 543 + 595, 1)
                locals.set_int("gb_contraband_sell", 543 + 55, 0)
                locals.set_int("gb_contraband_sell", 543 + 584, 0)
                locals.set_int("gb_contraband_sell", 543 + 7, 7)
                script:sleep(500)
                locals.set_int("gb_contraband_sell", 543 + 1, 99999)
            end

            if locals.get_int("appsecuroserv", 2) == 1 then
                script:sleep(500)
                locals.set_int("appsecuroserv", 740, 1)
                script:sleep(200)
                locals.set_int("appsecuroserv", 739, 1)
                script:sleep(200)
                locals.set_int("appsecuroserv", 558, 3012)
                script:sleep(1000)
            end

            if locals.get_int("gb_contraband_buy", 2) == 1 then
                locals.set_int("gb_contraband_buy", 601 + 5, 1)
                locals.set_int("gb_contraband_buy", 601 + 1, 111)
                locals.set_int("gb_contraband_buy", 601 + 191, 6)
                locals.set_int("gb_contraband_buy", 601 + 192, 4)
                gui.show_message("Warehouse full!")
            end

            
        end
    end
end)

Money:add_separator()
Money:add_text("Fast CEO Money (How To)")
Money:add_separator()
Money:add_text("1) Click 'Enable YimCeo'")
Money:add_text("2) Select the desired crate value (10k to 5m)")
Money:add_text("3) Click 'Show computer', select 'Special Cargo', click 'Sell Cargo' and wait")
Money:add_text("4) Use the 'Stats' tab to reset your stats and change sessions to apply")
Money:add_separator()
Money:add_text("You need to manually click Special/Sell Cargo each time.")
Money:add_text("You may also get up to 500k more than 5m sometimes.")

-- Autorun Drops
Drops = Money:add_tab("Drops")

local princessBubblegumLoop = false

Drops:add_button("Princess Robot Bubblegum (On/Off)", function()
    princessBubblegumLoop = not princessBubblegumLoop

    script.register_looped("princessbubblegumLoop", function(script)
        local model = joaat("vw_prop_vw_colle_prbubble")
        local pickup = joaat("PICKUP_CUSTOM_SCRIPT")
        local player_id = PLAYER.PLAYER_ID()
        local money_value = 5

        STREAMING.REQUEST_MODEL(model)
        while STREAMING.HAS_MODEL_LOADED(model) == false do
            script:yield()
        end

        if STREAMING.HAS_MODEL_LOADED(model) then
		gui.show_message("RP/Cash Drop Started", "Princess Robot Bubblegum Drops inbound!")
            local coords = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(player_id), true)
            local objectIdSpawned = OBJECT.CREATE_AMBIENT_PICKUP(
                pickup,
                coords.x + 5,
                coords.y - 5,
                coords.z,
                3,
                money_value,
                model,
                true,
                false
            )
			local coords = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(player_id), true)
            local objectIdSpawned = OBJECT.CREATE_AMBIENT_PICKUP(
                pickup,
                coords.x + 5,
                coords.y - 5,
                coords.z,
                3,
                money_value,
                model,
                true,
                false
            )
			local coords = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(player_id), true)
            local objectIdSpawned = OBJECT.CREATE_AMBIENT_PICKUP(
                pickup,
                coords.x + 5,
                coords.y - 5,
                coords.z,
                3,
                money_value,
                model,
                true,
                false
            )

            local net_id = NETWORK.OBJ_TO_NET(objectIdSpawned)
            NETWORK.SET_NETWORK_ID_EXISTS_ON_ALL_MACHINES(objectIdSpawned, true)
        end

        if not princessBubblegumLoop then
            script.unregister_script("princessbubblegumLoop")
        end
    end)
end)

Drops:add_button("Alien (On/Off)", function()
   alienfigurineLoop = not alienfigurineLoop

    script.register_looped("alienfigurineLoop", function(script)
        local model = joaat("vw_prop_vw_colle_alien")
        local pickup = joaat("PICKUP_CUSTOM_SCRIPT")
        local player_id = PLAYER.PLAYER_ID()
        local money_value = 0

        STREAMING.REQUEST_MODEL(model)
        while STREAMING.HAS_MODEL_LOADED(model) == false do
            script:yield()
        end

        if STREAMING.HAS_MODEL_LOADED(model) then
		gui.show_message("RP/Cash Drop Started", "Alien Drops inbound!")
            local coords = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(player_id), true)
            local objectIdSpawned = OBJECT.CREATE_AMBIENT_PICKUP(
                pickup,
                coords.x + 5,
                coords.y - 5,
                coords.z,
                3,
                money_value,
                model,
                true,
                false
            )
			local coords = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(player_id), true)
            local objectIdSpawned = OBJECT.CREATE_AMBIENT_PICKUP(
                pickup,
                coords.x + 5,
                coords.y - 5,
                coords.z,
                3,
                money_value,
                model,
                true,
                false
            )
			local coords = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(player_id), true)
            local objectIdSpawned = OBJECT.CREATE_AMBIENT_PICKUP(
                pickup,
                coords.x + 5,
                coords.y - 5,
                coords.z,
                3,
                money_value,
                model,
                true,
                false
            )

            local net_id = NETWORK.OBJ_TO_NET(objectIdSpawned)
            NETWORK.SET_NETWORK_ID_EXISTS_ON_ALL_MACHINES(objectIdSpawned, true)
        end

        if not alienfigurineLoop then
            script.unregister_script("alienfigurineLoop")
        end
    end)
end)

Drops:add_button("Casino Cards (On/Off)", function()
   casinocardsLoop = not casinocardsLoop

    script.register_looped("casinocardsLoop", function(script)
        local model = joaat("vw_prop_vw_lux_card_01a")
        local pickup = joaat("PICKUP_CUSTOM_SCRIPT")
        local player_id = PLAYER.PLAYER_ID()
        local money_value = 0

        STREAMING.REQUEST_MODEL(model)
        while STREAMING.HAS_MODEL_LOADED(model) == false do
            script:yield()
        end

        if STREAMING.HAS_MODEL_LOADED(model) then
		gui.show_message("RP/Cash Drop Started", "Casino Card Drops inbound!")
            local coords = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(player_id), true)
            local objectIdSpawned = OBJECT.CREATE_AMBIENT_PICKUP(
                pickup,
                coords.x + 5,
                coords.y - 5,
                coords.z,
                3,
                money_value,
                model,
                true,
                false
            )
			local coords = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(player_id), true)
            local objectIdSpawned = OBJECT.CREATE_AMBIENT_PICKUP(
                pickup,
                coords.x + 5,
                coords.y - 5,
                coords.z,
                3,
                money_value,
                model,
                true,
                false
            )
			local coords = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(player_id), true)
            local objectIdSpawned = OBJECT.CREATE_AMBIENT_PICKUP(
                pickup,
                coords.x + 5,
                coords.y - 5,
                coords.z,
                3,
                money_value,
                model,
                true,
                false
            )

            local net_id = NETWORK.OBJ_TO_NET(objectIdSpawned)
            NETWORK.SET_NETWORK_ID_EXISTS_ON_ALL_MACHINES(objectIdSpawned, true)
        end

        if not casinocardsLoop then
            script.unregister_script("casinocardsLoop")
        end
    end)
end)

Drops:add_button("Cash Loop (On/Off)", function()
   kcashLoop = not kcashLoop

    script.register_looped("kcashLoop", function(script)
        local model = joaat("m23_2_prop_m32_cashwrapped_01a")
        local pickup = joaat("PICKUP_CUSTOM_SCRIPT")
        local player_id = PLAYER.PLAYER_ID()
        local money_value = 0

        STREAMING.REQUEST_MODEL(model)
        while STREAMING.HAS_MODEL_LOADED(model) == false do
            script:yield()
        end

        if STREAMING.HAS_MODEL_LOADED(model) then
		gui.show_message("RP/Cash Drop Started", "Fake Cash Drops inbound!")
            local coords = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(player_id), true)
            local objectIdSpawned = OBJECT.CREATE_AMBIENT_PICKUP(
                pickup,
                coords.x + 5,
                coords.y - 5,
                coords.z,
                3,
                money_value,
                model,
                true,
                false
            )

            local net_id = NETWORK.OBJ_TO_NET(objectIdSpawned)
            NETWORK.SET_NETWORK_ID_EXISTS_ON_ALL_MACHINES(objectIdSpawned, true)
        end

        if not kcashLoop then
            script.unregister_script("kcashLoop")
        end
    end)
end)

Drops:add_separator()
Drops:add_text("Cash loop is Fake, it gives nothing on pickup, future plans to get it working.");
Drops:add_text("You CAN run multiple at once (like Robot bubblegum/Alien)")
Drops:add_text("just make sure someone is collecting it or you can lag severely or freeze.");

-- CasinoPacino - gir489returns

casino_gui = Money:add_tab("Casino")

blackjack_cards         = 112
blackjack_table_players = 1772
blackjack_decks         = 846
 
three_card_poker_cards           = blackjack_cards
three_card_poker_table           = 745
three_card_poker_current_deck    = 168
three_card_poker_anti_cheat      = 1034
three_card_poker_anti_cheat_deck = 799
three_card_poker_deck_size       = 55
 
roulette_master_table   = 120
roulette_outcomes_table = 1357
roulette_ball_table     = 153
 
slots_random_results_table = 1344
 
prize_wheel_win_state   = 276
prize_wheel_prize       = 14
prize_wheel_prize_state = 45
 
globals_tuneable        = 262145
 
casino_heist_cut        = 1971696
casino_heist_cut_offset = 1497 + 736 + 92
casino_heist_lester_cut = 28998
casino_heist_gunman_cut = 29024
casino_heist_driver_cut = 29029
casino_heist_hacker_cut = 29035
 
casino_heist_approach      = 0
casino_heist_target        = 0
casino_heist_last_approach = 0
casino_heist_hard          = 0
casino_heist_gunman        = 0
casino_heist_driver        = 0
casino_heist_hacker        = 0
casino_heist_weapons       = 0
casino_heist_cars          = 0
casino_heist_masks         = 0
 
fm_mission_controller_cart_grab       = 10247
fm_mission_controller_cart_grab_speed = 14
fm_mission_controller_cart_autograb   = true

casino_gui:add_text("Slots")
bypass_casino_bans = casino_gui:add_checkbox("Bypass Casino Cooldown")
casino_gui:add_sameline()
rig_slot_machine = casino_gui:add_checkbox("Rig Slot Machines")
casino_gui:add_text("THIS IS DETECTED AND BANNABLE USE IT WITH EXTREME CAUTION!")
casino_gui:add_separator()
 
casino_gui:add_text("Poker") --If his name is Al Pacino and he said, "It's not Al anymore, it's Dunk!", then his name should now be Dunk Pacino.
force_poker_cards = casino_gui:add_checkbox("Force all Players Hands to Royal Flush")
casino_gui:add_sameline()
set_dealers_poker_cards = casino_gui:add_checkbox("Force Dealer's Hand to Bad Beat")
set_dealers_poker_cards:set_enabled(true)
 
function set_poker_cards(player_id, players_current_table, card_one, card_two, card_three)
    locals.set_int("three_card_poker", (three_card_poker_cards) + (three_card_poker_current_deck) + (1 + (players_current_table * three_card_poker_deck_size)) + (2) + (1) + (player_id * 3), card_one)
    locals.set_int("three_card_poker", (three_card_poker_anti_cheat) + (three_card_poker_anti_cheat_deck) + (1) + (1 + (players_current_table * three_card_poker_deck_size)) + (1) + (player_id * 3), card_one)
    locals.set_int("three_card_poker", (three_card_poker_cards) + (three_card_poker_current_deck) + (1 + (players_current_table * three_card_poker_deck_size)) + (2) + (2) + (player_id * 3), card_two)
    locals.set_int("three_card_poker", (three_card_poker_anti_cheat) + (three_card_poker_anti_cheat_deck) + (1) + (1 + (players_current_table * three_card_poker_deck_size)) + (2) + (player_id * 3), card_two)
    locals.set_int("three_card_poker", (three_card_poker_cards) + (three_card_poker_current_deck) + (1 + (players_current_table * three_card_poker_deck_size)) + (2) + (3) + (player_id * 3), card_three)
    locals.set_int("three_card_poker", (three_card_poker_anti_cheat) + (three_card_poker_anti_cheat_deck) + (1) + (1 + (players_current_table * three_card_poker_deck_size)) + (3) + (player_id * 3), card_three)
end
 
function get_cardname_from_index(card_index)
    if card_index == 0 then
        return "Rolling"
    end
 
    local card_number = math.fmod(card_index, 13)
    local cardName = ""
    local cardSuit = ""
 
    if card_number == 1 then
        cardName = "Ace"
    elseif card_number == 11 then
        cardName = "Jack"
    elseif card_number == 12 then
        cardName = "Queen"
    elseif card_number == 13 then
        cardName = "King"
    else
        cardName = tostring(card_number)
    end
 
    if card_index >= 1 and card_index <= 13 then
        cardSuit = "Clubs"
    elseif card_index >= 14 and card_index <= 26 then
        cardSuit = "Diamonds"
    elseif card_index >= 27 and card_index <= 39 then
        cardSuit = "Hearts"
    elseif card_index >= 40 and card_index <= 52 then
        cardSuit = "Spades"
    end
 
    return cardName .. " of " .. cardSuit
end
 
casino_gui:add_separator()
casino_gui:add_text("Blackjack")
casino_gui:add_text("Dealer's face down card: ")
casino_gui:add_sameline()
dealers_card_gui_element = casino_gui:add_input_string("##dealers_card_gui_element")
 
casino_gui:add_button("Set Dealer's Hand To Bust", function()
    script.run_in_fiber(function (script)
        local player_id = PLAYER.PLAYER_ID()
        while NETWORK.NETWORK_GET_HOST_OF_SCRIPT("blackjack", -1, 0) ~= player_id and NETWORK.NETWORK_GET_HOST_OF_SCRIPT("blackjack", 0, 0) ~= player_id and NETWORK.NETWORK_GET_HOST_OF_SCRIPT("blackjack", 1, 0) ~= player_id and NETWORK.NETWORK_GET_HOST_OF_SCRIPT("blackjack", 2, 0) ~= player_id and NETWORK.NETWORK_GET_HOST_OF_SCRIPT("blackjack", 3, 0) ~= player_id do 
            network.force_script_host("blackjack")
            gui.show_message("CasinoPacino", "Taking control of the blackjack script.") --If you see this spammed, someone if fighting you for control.
            script:yield()
        end
        local blackjack_table = locals.get_int("blackjack", blackjack_table_players + 1 + (player_id * 8) + 4) --The Player's current table he is sitting at.
        if blackjack_table ~= -1 then
            locals.set_int("blackjack", blackjack_cards + blackjack_decks + 1 + (blackjack_table * 13) + 1, 11)
            locals.set_int("blackjack", blackjack_cards + blackjack_decks + 1 + (blackjack_table * 13) + 2, 12)
            locals.set_int("blackjack", blackjack_cards + blackjack_decks + 1 + (blackjack_table * 13) + 3, 13)
            locals.set_int("blackjack", blackjack_cards + blackjack_decks + 1 + (blackjack_table * 13) + 12, 3)
        end
    end)
end)
 
casino_gui:add_separator()
casino_gui:add_text("Roulette")
force_roulette_wheel = casino_gui:add_checkbox("Force Roulette Wheel to Land On Red 18")

local player_id = PLAYER.PLAYER_ID()

		casVal = -1
		casino_gui:add_imgui(function()
			casVal, used = ImGui.SliderInt("Betting Number", casVal, -1, 36)
			if used then
				valz = casVal
			end
		end)
		
casino_gui:add_separator()
casino_gui:add_text("Using these options are risky, especially if you use the cooldown bypass")
 
script.register_looped("Casino Pacino Thread", function (script)
    if force_poker_cards:is_enabled() then
        local player_id = PLAYER.PLAYER_ID()
        if SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("three_card_poker")) ~= 0 then
            while NETWORK.NETWORK_GET_HOST_OF_SCRIPT("three_card_poker", -1, 0) ~= player_id and NETWORK.NETWORK_GET_HOST_OF_SCRIPT("three_card_poker", 0, 0) ~= player_id and NETWORK.NETWORK_GET_HOST_OF_SCRIPT("three_card_poker", 1, 0) ~= player_id and NETWORK.NETWORK_GET_HOST_OF_SCRIPT("three_card_poker", 2, 0) ~= player_id and NETWORK.NETWORK_GET_HOST_OF_SCRIPT("three_card_poker", 3, 0) ~= player_id do 
                network.force_script_host("three_card_poker")
                gui.show_message("CasinoPacino", "Taking control of the three_card_poker script.") --If you see this spammed, someone if fighting you for control.
                script:sleep(500)
            end
            local players_current_table = locals.get_int("three_card_poker", three_card_poker_table + 1 + (player_id * 9) + 2) --The Player's current table he is sitting at.
            if (players_current_table ~= -1) then -- If the player is sitting at a poker table
                local player_0_card_1 = locals.get_int("three_card_poker", (three_card_poker_cards) + (three_card_poker_current_deck) + (1 + (players_current_table * three_card_poker_deck_size)) + (2) + (1) + (0 * 3))
                local player_0_card_2 = locals.get_int("three_card_poker", (three_card_poker_cards) + (three_card_poker_current_deck) + (1 + (players_current_table * three_card_poker_deck_size)) + (2) + (2) + (0 * 3))
                local player_0_card_3 = locals.get_int("three_card_poker", (three_card_poker_cards) + (three_card_poker_current_deck) + (1 + (players_current_table * three_card_poker_deck_size)) + (2) + (3) + (0 * 3))
                if player_0_card_1 ~= 50 or player_0_card_2 ~= 51 or player_0_card_3 ~= 52 then --Check if we need to overwrite the deck.
                    local total_players = 0
                    for player_iter = 0, 31, 1 do
                        local player_table = locals.get_int("three_card_poker", three_card_poker_table + 1 + (player_iter * 9) + 2)
                        if player_iter ~= player_id and player_table == players_current_table then --An additional player is sitting at the user's table.
                            total_players = total_players + 1
                        end
                    end
                    for playing_player_iter = 0, total_players, 1 do
                        set_poker_cards(playing_player_iter, players_current_table, 50, 51, 52)
                    end
                    if set_dealers_poker_cards:is_enabled() then
                        set_poker_cards(total_players + 1, players_current_table, 1, 8, 22)
                    end
                end
            end
        end
    end
    if SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("blackjack")) ~= 0 then
        local dealers_card = 0
        local blackjack_table = locals.get_int("blackjack", blackjack_table_players + 1 + (PLAYER.PLAYER_ID() * 8) + 4) --The Player's current table he is sitting at.
        if blackjack_table ~= -1 then
            dealers_card = locals.get_int("blackjack", blackjack_cards + blackjack_decks + 1 + (blackjack_table * 13) + 1) --Dealer's facedown card.
            dealers_card_gui_element:set_value(get_cardname_from_index(dealers_card))
        else
            dealers_card_gui_element:set_value("Not sitting at a Blackjack table.")
        end
    else
        dealers_card_gui_element:set_value("Not in Casino.")
    end
    if force_roulette_wheel:is_enabled() then
		
        if SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("casinoroulette")) ~= 0 then
            while NETWORK.NETWORK_GET_HOST_OF_SCRIPT("casinoroulette", -1, 0) ~= player_id and NETWORK.NETWORK_GET_HOST_OF_SCRIPT("casinoroulette", 0, 0) ~= player_id and NETWORK.NETWORK_GET_HOST_OF_SCRIPT("casinoroulette", 1, 0) ~= player_id and NETWORK.NETWORK_GET_HOST_OF_SCRIPT("casinoroulette", 2, 0) ~= player_id and NETWORK.NETWORK_GET_HOST_OF_SCRIPT("casinoroulette", 3, 0) ~= player_id do 
                network.force_script_host("casinoroulette")
                gui.show_message("CasinoPacino", "Taking control of the casinoroulette script.") --If you see this spammed, someone if fighting you for control.
                script:sleep(500)
            end
            for tabler_iter = 0, 6, 1 do
                locals.set_int("casinoroulette", (roulette_master_table) + (roulette_outcomes_table) + (roulette_ball_table) + (tabler_iter), valz)
				gui.show_message("CasinoPacino Activated!", "Winning Number: "..valz)
            end
        end
    end
    if SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("casino_slots")) ~= 0 then
        local needs_run = false
        if rig_slot_machine:is_enabled() then
            for slots_iter = 3, 195, 1 do
                if slots_iter ~= 67 and slots_iter ~= 132 then
                    if locals.get_int("casino_slots", (slots_random_results_table) + (slots_iter)) ~= 6 then
                        needs_run = true
                    end
                end
            end
        else
            local sum = 0
            for slots_iter = 3, 195, 1 do
                if slots_iter ~= 67 and slots_iter ~= 132 then
                    sum = sum + locals.get_int("casino_slots", (slots_random_results_table) + (slots_iter))
                end
            end
            needs_run = sum == 1146
        end
        if needs_run then
            for slots_iter = 3, 195, 1 do
                if slots_iter ~= 67 and slots_iter ~= 132 then
                    local slot_result = 6
                    if rig_slot_machine:is_enabled() == false then
                        math.randomseed(os.time()+slots_iter)
                        slot_result = math.random(0, 7)
                    end
                    locals.set_int("casino_slots", (slots_random_results_table) + (slots_iter), slot_result)
                end
            end
        end
    end
    if bypass_casino_bans:is_enabled() then
        STATS.STAT_SET_INT(joaat("MPPLY_CASINO_CHIPS_WON_GD"), 0, true)
    end
    if gui.is_open() and casino_gui:is_selected() then
        casino_heist_approach = stats.get_int("MPX_H3OPT_APPROACH")
        casino_heist_target = stats.get_int("MPX_H3OPT_TARGET")
        casino_heist_last_approach = stats.get_int("MPX_H3_LAST_APPROACH")
        casino_heist_hard = stats.get_int("MPX_H3_HARD_APPROACH")
        casino_heist_gunman = stats.get_int("MPX_H3OPT_CREWWEAP")
        casino_heist_driver = stats.get_int("MPX_H3OPT_CREWDRIVER")
        casino_heist_hacker = stats.get_int("MPX_H3OPT_CREWHACKER")
        casino_heist_weapons = stats.get_int("MPX_H3OPT_WEAPS")
        casino_heist_cars = stats.get_int("MPX_H3OPT_VEHS")
        casino_heist_masks = stats.get_int("MPX_H3OPT_MASKS")
    end
    if HUD.IS_PAUSE_MENU_ACTIVE() then
        PAD.DISABLE_CONTROL_ACTION(0, 348, true)
        PAD.DISABLE_CONTROL_ACTION(0, 204, true)
    end
    if fm_mission_controller_cart_autograb then
        if locals.get_int("fm_mission_controller", fm_mission_controller_cart_grab) == 3 then
            locals.set_int("fm_mission_controller", fm_mission_controller_cart_grab, 4)
        elseif locals.get_int("fm_mission_controller", fm_mission_controller_cart_grab) == 4 then
            locals.set_float("fm_mission_controller", fm_mission_controller_cart_grab + fm_mission_controller_cart_grab_speed, 2)
        end
    end
end)

-- Nightclub Loop - L7Neg
local Club = Money:add_tab("Nightclub")

MPX = PI
PI = stats.get_int("MPPLY_LAST_MP_CHAR")
if PI == 0 then
	MPX = "MP0_"
else
	MPX = "MP1_"
end

checkbox2 = Club:add_checkbox("Enable Nitghtclub $250k/15s (Safe AFK)")
script.register_looped("nightclubloop", function(script)
	script:yield()
	if checkbox2:is_enabled() == true then
		gui.show_message("Nightclub Loop Activated!", "250k/second in safe")
		STATS.STAT_SET_INT(joaat(MPX .. "CLUB_POPULARITY"), 1000, true)
		STATS.STAT_SET_INT(joaat(MPX .. "CLUB_PAY_TIME_LEFT"), -1, true)
		gui.show_message("Nightclub Loop Deactivated!", "Enjoy the money!")
		script:sleep(2500)
	end
end)


-- Teleports tab
local Tel = Pla:add_tab("Teleports")

Tel:add_button("Teleport to Location", function()
    gui.show_message('Teleport to Location', 'Failed! Feature unavailable.')
end)

-- Vehicle Options Tab
local Veh = KAOS:add_tab("Vehicle Options")

-- Sub-tab for Vehicle Options

local Spa = Veh:add_tab("Spawn/Delete")

Spa:add_button("Spawn Vehicle", function()
    gui.show_message('Spawn Vehicle', 'Failed! Feature unavailable.')
end)
Spa:add_sameline()
Spa:add_button("Delete Vehicle", function()
    gui.show_message('Delete Vehicle', 'Failed! Feature unavailable.')
end)
Spa:add_button("Clone Vehicle", function()
    gui.show_message('Clone Vehicle', 'Failed! Feature unavailable.')
end)
Spa:add_sameline()
Spa:add_button("Save Vehicle", function()
    gui.show_message('Save Vehicle', 'Failed! Feature unavailable.')
end)

-- Gift Options
local Gif = Veh:add_tab("Gifting")

Gif:add_button("Gift Vehicle", function()
    gui.show_message('Gift Vehicle', 'Failed! Feature unavailable.')
end)

-- Upgrade Options
local Upg = Veh:add_tab("Upgrades")

Upg:add_button("Apply Benny's Wheels", function()
    gui.show_message('1 Click Bennys', 'Failed! Feature unavailable.')
end)
Upg:add_sameline()
Upg:add_button("Apply Formula 1 Wheels", function()
    gui.show_message('1 Click F1s', 'Failed! Feature unavailable.')
end)
Upg:add_button("Downgrade Vehicle", function()
    gui.show_message('Downgrade Vehicle', 'Failed! Feature unavailable.')
end)
Upg:add_button("Max Vehicle Performance", function()
    gui.show_message('Max Performance', 'Failed! Feature unavailable.')
end)
Upg:add_sameline()
Upg:add_button("Max Vehicle Modifications", function()
    gui.show_message('Max Upgrades', 'Failed! Feature unavailable.')
end)

-- Global Player Options

local Global = KAOS:add_tab("Global")

-- Define PRGBGLoop variable outside the function
local PRGBGLoop = false

-- Define the script variable outside the function
local dropScript = nil

-- Add Drop Global RP Button under the Global Tab
Global:add_button("Drop Global RP (On/Off)", function()
    PRGBGLoop = not PRGBGLoop

    if PRGBGLoop then
        dropScript = script.register_looped("PRGBGLoop", function(dropScript)
            local model = joaat("vw_prop_vw_colle_prbubble")
            local pickup = joaat("PICKUP_CUSTOM_SCRIPT")
            local money_value = 0
			gui.show_message("WARNING", "15 or more players may cause lag or RP to not drop.")
            STREAMING.REQUEST_MODEL(model)
            while STREAMING.HAS_MODEL_LOADED(model) == false do
                dropScript:yield()
            end

            if STREAMING.HAS_MODEL_LOADED(model) then
                local localPlayerId = PLAYER.PLAYER_ID()
                local player_count = PLAYER.GET_NUMBER_OF_PLAYERS()
                gui.show_message("Global RP/Cash Drop Started", "Princess Robot Bubblegum Drops to all Players in session: " .. player_count)

                for i = 0, player_count do
				SYSTEM.WAIT(5000)
                    if i ~= localPlayerId then
                        local player_id = i
                        local coords = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(player_id), true)

                        local objectIdSpawned = OBJECT.CREATE_AMBIENT_PICKUP(
                            pickup,
                            coords.x - 0,
                            coords.y + 0,
                            coords.z + 1,
                            3,
                            money_value,
                            model,
                            true,
                            false
                        )
						
						local net_id = NETWORK.OBJ_TO_NET(objectIdSpawned)
						NETWORK.SET_NETWORK_ID_EXISTS_ON_ALL_MACHINES(objectIdSpawned, true)
                        -- Delay for 5 seconds before the next iteration
                        SYSTEM.WAIT(5000)
                    end
                end
            end
            if not PRGBGLoop then
                dropScript.unregister_script("PRGBGLoop")
            end
        end)
		
    else
        -- Unregister the script if PRGBGLoop is false
        dropScript.unregister_script("PRGBGLoop")
    end
end)








