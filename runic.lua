--CONFIG
local sides = require("sides")
local chest1 = sides.west --Side of the transposer facing the chest that stores all the input items.
local chest2 = sides.east --Side of the transposer facing the chest that feeds into the runic alter.
local chestTemp = sides.up --Side of the transposer facing the buffer chest.
local rsRunicComparator = sides.north --Side of the redsone IO DIRECTLY against the comparator reading the alter.
local rsActivateWand = sides.east --Side of the redstone IO aiming for the dispenser equipped with forrest wand.
local pipelength = "3" --The time in seconds to pipe items into the runic alter.

local component = require("component")
local transposer = component.transposer--require("transposer")
local gpu = component.gpu--require("gpu")
local term = require("term")
local event = require("event")
local bc = require "bigchars"
local screenWidth, screenHeight = gpu.getResolution()
local colspacing = 20
local redstone = component.redstone

local col1 = 2
local col2 = col1 + 17
local col3 = col2 + 21
local col4 = col3 + 21
local col5 = col4 + 19
local row1 = 2
local row2 = row1 + 6
local row3 = row2 + 6
local row4 = row3 + 6
local row5 = row4 + 6

term.clear()
--xxx = 0
function bcprint(c, r, w, l)
	gpu.setBackground(14, true)
	gpu.fill(c-1, r-1, w+2, 7, " ")
	gpu.setBackground(7, true)
	gpu.fill(c, r, w, 5, " ")
	bc.print(c, r, l)
	--xxx = xxx + 1
end

function updateDisplay()
	term.clear()
	--gpu.setForeground(15, true)
	--gpu.fill(1, 1, screenWidth, screenHeight, " ")
	--local lineNumb = 2
	--local colNumb = 2
	--local allSlots = transposer.getAllStacks(chest1)
	--local skipped = 0
	--gpu.fill(1, 1, screenWidth, screenHeight, " ")
	bcprint(col1, row1, col2 - col1, "Air")
	bcprint(col1, row2, col2 - col1, "Erth")
	bcprint(col1, row3, col2 - col1, "Fire")
	bcprint(col1, row4, col2 - col1, "Wtr")
	bcprint(col2, row1, col3 - col2, "Autm")
	bcprint(col2, row2, col3 - col2, "Sprg")
	bcprint(col2, row3, col3 - col2, "Sumr")
	bcprint(col2, row4, col3 - col2, "Wntr")
	bcprint(col3, row1, col4 - col3, "Mana")
	bcprint(col3, row2, col4 - col3, "Envy")
	bcprint(col3, row3, col4 - col3, "Gtny")
	bcprint(col3, row4, col4 - col3, "Gred")
	bcprint(col4, row1, col5 - col4, "Lust")
	bcprint(col4, row2, col5 - col4, "Prde")
	bcprint(col4, row3, col5 - col4, "Slth")
	bcprint(col4, row4, col5 - col4, "Wrth")
	--for i=1, allSlots.count() do
	--	local slot = allSlots[i]
	--	if slot ~= nil and slot.name ~= "minecraft:air" then
	--		--local mod, itemname = slot.name:match("([^,]+):([^,]+)")
	--		local itemname = slot.label
	--		gpu.fill(colNumb, lineNumb, colspacing-3, 1, " ")
	--		gpu.setForeground(0, true)
	--		gpu.set(colNumb, lineNumb, itemname)
	--		gpu.setForeground(1, true)
	--		gpu.set(colNumb + colspacing - 6, lineNumb, "x" .. slot.size)
	--		lineNumb = lineNumb + 2
	--		if lineNumb + 1 >= screenHeight then
	--			lineNumb = 2
	--			colNumb = colNumb + colspacing
	--		end
	--	else
	--		skipped = skipped + 1
	--	end
	--end

	--Erase any empty slots.
	gpu.setBackground(15, true)
	--gpu.setForeground(0, true)
	--for i=1, skipped do
	--	gpu.fill(colNumb, lineNumb, colspacing-3, 1, " ")
	--	lineNumb = lineNumb + 2
	--	if lineNumb + 1 >= screenHeight then
	--		lineNumb = 2
	--		colNumb = colNumb + colspacing
	--	end
	--end
end

function stash(source, destination, slots, label)
	for i=1, slots.count() do
		if slots[i].label == label and slots[i].size > 0 then
			transposer.transferItem(source, destination, 1, i)
			slots[i].size = slots[i].size - 1
			return true
		end
	end
	return false
end

function moveAll(source, destination)
	local slots = transposer.getAllStacks(source)
	for i=1, slots.count() do
		transposer.transferItem(source, destination, slots[i].size, i)
	end
end

local runes = {}
runes.Air = {
	"  ** *  ",
	" *  * * ",
	"*     * ",
	" *   *  ",
	"*    * *",
	"* *  * *",
	" *    * ",
	"        "
}
runes.Earth = {
	"    *   ",
	"     *  ",
	"    * * ",
	"*   * * ",
	" * *  * ",
	" * *   *",
	" * *  * ",
	"  *     "
}
runes.Fire = {
	"    *   ",
	"   * *  ",
	"   * * *",
	"*  *  * ",
	" ** *   ",
	"     *  ",
	"      * ",
	"     *  "
}
runes.Water = {
	"  **    ",
	" *      ",
	"  *     ",
	" *  *   ",
	" * * *  ",
	"*  * ** ",
	"* *     ",
	" *      "
}
runes.Autumn = {
	"  **    ",
	" *      ",
	"  *  ** ",
	" *  * * ",
	"  ** *  ",
	" *    * ",
	"      * ",
	"     *  "
}
runes.Spring = {
	"    *   ",
	"   *    ",
	"    *   ",
	"  **  * ",
	" *   *  ",
	"  ** *  ",
	"    *   ",
	"     *  "
}
runes.Summer = {
	"   **   ",
	" ** *   ",
	"    *   ",
	"   * *  ",
	"  *  *  ",
	" *   *  ",
	" *    * ",
	"  *  *  "
}
runes.Winter = {
	"    *   ",
	"     *  ",
	"    *   ",
	" *** *  ",
	"*    *  ",
	" *  *   ",
	"    *   ",
	"     *  "
}
runes.Mana = {
	"    *   ",
	"     *  ",
	"     *  ",
	"  ** *  ",
	" *  *   ",
	"*  *   *",
	"    *** ",
	"        "
}
runes.Envy = {
	"        ",
	"*     * ",
	" *   *  ",
	"  *  *  ",
	"  * *   ",
	"   *    ",
	"   *    ",
	"    *   "
}
runes.Gluttony = {
	"   *    ",
	"  * **  ",
	" *    * ",
	"*      *",
	"*    * *",
	"*     * ",
	" *      ",
	"        "
}
runes.Greed = {
	"     *  ",
	"    *   ",
	"    *   ",
	"  ** *  ",
	" *    * ",
	"      * ",
	"   *  * ",
	"    **  "
}
runes.Lust = {
	"   *    ",
	"    *   ",
	"    *   ",
	"    *   ",
	"   *    ",
	"   *    ",
	"  *     ",
	"   **   "
}
runes.Pride = {
	"   *    ",
	"  *  *  ",
	"  *   * ",
	"   * *  ",
	"    *   ",
	"    *   ",
	"    *   ",
	"   *    "
}
runes.Sloth = {
	"        ",
	"      * ",
	"       *",
	" **** * ",
	"*    *  ",
	"      **",
	"        ",
	"        "
}
runes.Wrath = {
	" *      ",
	"*     * ",
	" **    *",
	"   ** * ",
	"  *  *  ",
	" *    * ",
	" *    * ",
	"  *   * "
}

local runeColors = {}
runeColors.Air = 3
runeColors.Earth = 5
runeColors.Fire = 14
runeColors.Water = 9
runeColors.Autumn = 1
runeColors.Spring = 6
runeColors.Summer = 3
runeColors.Winter = 0
runeColors.Mana = 10
runeColors.Envy = 10
runeColors.Gluttony = 7
runeColors.Greed = 13
runeColors.Lust = 6
runeColors.Pride = 15
runeColors.Sloth = 12
runeColors.Wrath = 14

function drawDecor(x, y, rune)
	gpu.setForeground(7, true)
	bc.printChr(x, y, {
		"    ******    ",
		"   *      *   ",
		"  *        *  ",
		" *          * ",
		"*            *",
		"*            *",
		"*            *",
		"*            *",
		"*            *",
		"*            *",
		" *          * ",
		"  *        *  ",
		"   *      *   ",
		"    ******    "
	}, false, false, true)
	gpu.setForeground(8, true)
	bc.printChr(x+2, y+1, {
		"   ******   ",
		"  ********  ",
		" ********** ",
		"************",
		"************",
		"************",
		"************",
		"************",
		"************",
		" ********** ",
		"  ********  ",
		"   ******   "
	}, false, true, true)
	x = x + 6
	y = y + 3
	gpu.setForeground(7, true)
	bc.printChr(x-1, y, runes[rune], false, true, true)
	gpu.setForeground(runeColors[rune], true)
	bc.printChr(x, y, runes[rune], false, true, true)
	gpu.setForeground(0, true)
end

function startRecipe(name, recipe)
	local slots = transposer.getAllStacks(chest1)
	term.clear()
	local cursor = 2
	cursor = bc.print(cursor, 2, "Please wait")
	--bc.print(2, 8, name)
	for i=1, #recipe do
		local item = recipe[i]
		if not stash(chest1, chestTemp, slots, item) then
			term.clear()
			gpu.setBackground(15, true)
			gpu.setForeground(14, true)
			bc.print(2, 2, "MISSING ITEM")
			gpu.setBackground(14, true)
			gpu.setForeground(0, true)
			gpu.fill(2, 8, 53, 1, " ")
			gpu.setBackground(15, true)
			gpu.set(3, 10, "The following item is missing: ")
			gpu.set(4, 11, "-" .. item)
			moveAll(chestTemp, chest1)
			event.pull("touch")
			updateDisplay()
			return false
		else
			cursor = bc.print(cursor, 2, ".")
		end
	end
	moveAll(chestTemp, chest2)

	term.clear()
	bc.print(15, 2, "NOW MAKING:")
	drawDecor(10, 8, name)
	local fgToUse = runeColors[name]
	local shadowToUse = 7
	if fgToUse == 15 then
		fgToUse = 7
	end
	if fgToUse == 7 then
		shadowToUse = 15
	end
	gpu.setForeground(shadowToUse, true)
	bc.print(40, 12, name)
	gpu.setForeground(fgToUse, true)
	bc.print(41, 12, name, true)
	gpu.setForeground(0, true)
	gpu.set(37, 19, "Please stand by.")

	waitForRecipe()
	updateDisplay()
end

function handleEvent(eventID, adress, x, y)
	if (eventID == "touch") then -- can be nil if no event was pulled for some time
		if x >= col1 and x < col2 - 1 then
			if y >= row1 and y < row2 - 1 then
				startRecipe("Air", {"String", "Feather", "White Carpet", "Manasteel Ingot", "Mana Powder"})
			elseif y >= row2 and y < row3 - 1 then
				startRecipe("Earth", {"Mushroom", "Block of Coal", "Stone", "Manasteel Ingot", "Mana Powder"})
			elseif y >= row3 and y < row4 - 1 then
				startRecipe("Fire", {"Nether Wart", "Gunpowder", "Nether Brick", "Manasteel Ingot", "Mana Powder"})
			elseif y >= row4 and y < row5 - 1 then
				startRecipe("Water", {"Fishing Rod", "Sugar Canes", "Bone Meal", "Manasteel Ingot", "Mana Powder"})
			end
		elseif x >= col2 and x < col3 - 1 then
			if y >= row1 and y < row2 - 1 then
				startRecipe("Autumn", {"Spider Eye", "Oak Leaves", "Oak Leaves", "Oak Leaves", "Rune of Fire", "Rune of Air"})
			elseif y >= row2 and y < row3 - 1 then
				startRecipe("Spring", {"Wheat", "Oak Sapling", "Oak Sapling", "Oak Sapling", "Rune of Water", "Rune of Fire"})
			elseif y >= row3 and y < row4 - 1 then
				startRecipe("Summer", {"Melon", "Slimeball", "Sand", "Sand", "Rune of Air", "Rune of Earth"})
			elseif y >= row4 and y < row5 - 1 then
				startRecipe("Winter", {"Cake", "White Wool", "Snow", "Snow", "Rune of Earth", "Rune of Water"})
			end
		elseif x >= col3 and x < col4 - 1 then
			if y >= row1 and y < row2 - 1 then
				startRecipe("Mana", {"Mana Pearl", "Manasteel Ingot", "Manasteel Ingot", "Manasteel Ingot", "Manasteel Ingot", "Manasteel Ingot"})
			elseif y >= row2 and y < row3 - 1 then
				startRecipe("Envy", {"Rune of Water", "Rune of Winter", "Mana Diamond", "Mana Diamond"})
			elseif y >= row3 and y < row4 - 1 then
				startRecipe("Gluttony", {"Rune of Fire", "Rune of Winter", "Mana Diamond", "Mana Diamond"})
			elseif y >= row4 and y < row5 - 1 then
				startRecipe("Greed", {"Rune of Water", "Rune of Spring", "Mana Diamond", "Mana Diamond"})
			end
		elseif x >= col4 and x < col5 - 1 then
			if y >= row1 and y < row2 - 1 then
				startRecipe("Lust", {"Rune of Air", "Rune of Summer", "Mana Diamond", "Mana Diamond"})
			elseif y >= row2 and y < row3 - 1 then
				startRecipe("Pride", {"Rune of Fire", "Rune of Summer", "Mana Diamond", "Mana Diamond"})
			elseif y >= row3 and y < row4 - 1 then
				startRecipe("Sloth", {"Rune of Air", "Rune of Autumn", "Mana Diamond", "Mana Diamond"})
			elseif y >= row4 and y < row5 - 1 then
				startRecipe("Wrath", {"Rune of Earth", "Rune of Winter", "Mana Diamond", "Mana Diamond"})
			end
		end
	end
  end

function waitForRecipe()
	while true do
		local cInput = redstone.getInput(rsRunicComparator)
		if cInput == 1 then
			os.execute("sleep 1")
		elseif cInput == 2 then
			-- redstone.setOutput(rsDropLivingStone, 15)
			-- os.execute("sleep 1")
			-- redstone.setOutput(rsDropLivingStone, 0)
			local slots = transposer.getAllStacks(chest1)
			local livingrockAvailable = stash(chest1, chest2, slots, "Livingrock")
			if livingrockAvailable then
				os.execute("sleep " .. pipelength)
				redstone.setOutput(rsActivateWand, 15)
				os.execute("sleep 1")
				redstone.setOutput(rsActivateWand, 0)
			else
				term.clear()
				gpu.setBackground(15, true)
				gpu.setForeground(14, true)
				bc.print(2, 2, "OUT OF LIVINGROCK")
				gpu.setBackground(14, true)
				gpu.setForeground(0, true)
				gpu.fill(2, 8, 69, 1, " ")
				gpu.setBackground(15, true)
				gpu.set(3, 10, "Please finish the enchantment manually, and restock livingrock.")
				event.pull("touch")
			end
			break
		elseif cInput == 0 then
			--Something broke? Recipe cancelled? Long pipes? Check again after 3 seconds.
			os.execute("sleep " .. pipelength)
			cInput = redstone.getInput(rsRunicComparator)
			if cInput == 0 then
				break
			end
		else 
			print("Fatal error. Runic compaator should be between 0 and 2, not " .. cInput)
		end
	end
end

local cInput = redstone.getInput(rsRunicComparator)
if cInput ~= 0 then
	print("Waiting for current recipe to finish.")
	waitForRecipe()
end
updateDisplay()
while true do
	handleEvent(event.pull("touch"))
end