local component = require "component"
local gpu = component.gpu
local bigchars = {}
local letters = {}
letters["A"] =	{
	" * ",
	"* *",
	"***",
	"* *",
	"* *"
}
letters["B"] =	{
	"** ",
	"* *",
	"** ",
	"* *",
	"** "
}
letters["C"] =	{
	" * ",
	"* *",
	"*  ",
	"* *",
	" * "
}
letters["D"] =	{
	"** ",
	"* *",
	"* *",
	"* *",
	"** "
}
letters["E"] =	{
	"***",
	"*  ",
	"** ",
	"*  ",
	"***"
}
letters["F"] =	{
	"***",
	"*  ",
	"** ",
	"*  ",
	"*  "
}
letters["G"] =	{
	" *  ",
	"* * ",
	"*   ",
	"* **",
	" *  "
}
letters["H"] =	{
	"* *",
	"* *",
	"***",
	"* *",
	"* *"
}
letters["I"] =	{
	"***",
	" * ",
	" * ",
	" * ",
	"***"
}
letters["J"] =	{
	"***",
	"  *",
	"  *",
	"* *",
	" * "
}
letters["K"] =	{
	"* *",
	"** ",
	"*  ",
	"** ",
	"* *"
}
letters["L"] =	{
	"*  ",
	"*  ",
	"*  ",
	"*  ",
	"***"
}
letters["M"] =	{
	"*   *",
	"** **",
	"* * *",
	"*   *",
	"*   *"
}
letters["N"] =	{
	"*   *",
	"**  *",
	"* * *",
	"*  **",
	"*   *"
}
letters["O"] =	{
	" * ",
	"* *",
	"* *",
	"* *",
	" * "
}
letters["P"] =	{
	"** ",
	"* *",
	"** ",
	"*  ",
	"*  "
}
letters["Q"] =	{
	" *  ",
	"* * ",
	"* * ",
	"* * ",
	" * *"
}
letters["R"] =	{
	"** ",
	"* *",
	"** ",
	"* *",
	"* *"
}
letters["S"] =	{
	" **",
	"*  ",
	" * ",
	"  *",
	"** "
}
letters["T"] =	{
	"***",
	" * ",
	" * ",
	" * ",
	" * "
}
letters["U"] =	{
	"* * ",
	"* * ",
	"* * ",
	"* * ",
	" * *"
}
letters["V"] =	{
	"* *",
	"* *",
	"* *",
	"* *",
	" * "
}
letters["W"] =	{
	"*   *",
	"*   *",
	"* * *",
	"** **",
	"*   *"
}
letters["X"] =	{
	"* *",
	"* *",
	" * ",
	"* *",
	"* *"
}
letters["Y"] =	{
	"* *",
	"* *",
	" * ",
	" * ",
	" * "
}
letters["Z"] =	{
	"***",
	"  *",
	" * ",
	"*  ",
	"***"
}
letters["a"] =	{
	"   ",
	" **",
	"* *",
	"* *",
	" **"
}
letters["b"] =	{
	"*  ",
	"** ",
	"* *",
	"* *",
	"** "
}
letters["c"] =	{
	"   ",
	" **",
	"*  ",
	"*  ",
	" **"
}
letters["d"] =	{
	"  *",
	" **",
	"* *",
	"* *",
	" **"
}
letters["e"] =	{
	"   ",
	" * ",
	"***",
	"*  ",
	" **"
}
letters["f"] =	{
	" **",
	" * ",
	"***",
	" * ",
	" * "
}
letters["g"] =	{
	" **",
	"* *",
	" **",
	"  *",
	" * "
}
letters["h"] =	{
	"*  ",
	"*  ",
	"***",
	"* *",
	"* *"
}
letters["i"] =	{
	"*",
	" ",
	"*",
	"*",
	"*"
}
letters["j"] =	{
	"  *",
	"   ",
	"  *",
	"* *",
	" * "
}
letters["k"] =	{
	"*  ",
	"* *",
	"** ",
	"* *",
	"* *"
}
letters["l"] =	{
	"*",
	"*",
	"*",
	"*",
	"*"
}
letters["m"] =	{
	"     ",
	"** * ",
	"* * *",
	"*   *",
	"*   *"
}
letters["n"] =	{
	"     ",
	"* * ",
	"** *",
	"*  *",
	"*  *"
}
letters["o"] =	{
	"   ",
	" * ",
	"* *",
	"* *",
	" * "
}
letters["p"] =	{
	"   ",
	"** ",
	"* *",
	"** ",
	"*  "
}
letters["q"] =	{
	"   ",
	" **",
	"* *",
	" **",
	"  *"
}
letters["r"] =	{
	"   ",
	"* *",
	"** ",
	"*  ",
	"*  "
}
letters["s"] =	{
	"  ",
	"**",
	"* ",
	" *",
	"**"
}
letters["t"] =	{
	" * ",
	"***",
	" * ",
	" * ",
	" * "
}
letters["u"] =	{
	"    ",
	"* * ",
	"* * ",
	"* * ",
	" * *"
}
letters["v"] =	{
	"   ",
	"* *",
	"* *",
	"* *",
	" * "
}
letters["w"] =	{
	"     ",
	"*   *",
	"* * *",
	"** **",
	"*   *"
}
letters["x"] =	{
	"   ",
	"* *",
	" * ",
	" * ",
	"* *"
}
letters["y"] =	{
	"   ",
	"* *",
	" **",
	"  *",
	"** "
}
letters["z"] =	{
	"  ",
	"**",
	" *",
	"* ",
	"**"
}
letters["0"] =	{
	"***",
	"* *",
	"* *",
	"* *",
	"***"
}
letters["1"] =	{
	" * ",
	"** ",
	" * ",
	" * ",
	"***"
}
letters["2"] =	{
	"***",
	"  *",
	"***",
	"*  ",
	"***"
}
letters["3"] =	{
	"***",
	"  *",
	" **",
	"  *",
	"***"
}
letters["4"] =	{
	"* *",
	"* *",
	"***",
	"  *",
	"  *"
}
letters["5"] =	{
	"***",
	"*  ",
	"***",
	"  *",
	"***"
}
letters["6"] =	{
	"***",
	"*  ",
	"***",
	"* *",
	"***"
}
letters["7"] =	{
	"***",
	"  *",
	"  *",
	"  *",
	"  *"
}
letters["8"] =	{
	"***",
	"* *",
	"***",
	"* *",
	"***"
}
letters["9"] =	{
	"***",
	"* *",
	"***",
	"  *",
	"***"
}
letters[" "] =	{
	"  ",
	"  ",
	"  ",
	"  ",
	"  "
}
letters["."] =	{
	" ",
	" ",
	" ",
	" ",
	"*"
}
letters[","] =	{
	"  ",
	"  ",
	"  ",
	" *",
	"* "
}
letters["!"] =	{
	"*",
	"*",
	"*",
	" ",
	"*"
}
letters["?"] =	{
	" ** ",
	"*  *",
	"  * ",
	"    ",
	"  * "
}
letters["/"] =	{
	"    *",
	"   * ",
	"  *  ",
	" *   ",
	"*    "
}
letters[":"] =	{
	" ",
	"*",
	" ",
	"*",
	" "
}

--chr should be an array of string rows.
function bigchars.printChr(x, y, chr, extendBg, transparentBg, doubleWidth)
	local pxWidth = 1
	if doubleWidth then
		pxWidth = 2
	end
	local fcolor, fpalette = gpu.getForeground()
	local bcolor, bpalette = gpu.getBackground()
	local charWidth = #(chr[1])
	if not transparentBg then
		if not extendBg then
			gpu.fill(x, y, charWidth * pxWidth, 5, " ")
		else
			gpu.fill(x, y, charWidth * pxWidth + 1, 5, " ")
		end
	end
	gpu.setBackground(fcolor, fpalette)
	for r = 1, #chr do
		local row = chr[r]
		for cr = 1, #row do
			if row:sub(cr, cr) == "*" then
				gpu.fill(x + (cr - 1) * pxWidth, y + r - 1, pxWidth, 1, " ")
			end
		end
	end
	gpu.setBackground(bcolor, bpalette)
	return x + charWidth + 1
end

function bigchars.print(x, y, message, transparentBg)
	message = "" .. message
	local cursor = x
	for i = 1, #message do
		local c = message:sub(i,i)
		local bigletter = letters[c]
		
		cursor = bigchars.printChr(cursor, y, bigletter, i ~= #message, transparentBg)
	end
	return cursor
end

return bigchars