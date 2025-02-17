function string.starts(String,Start)
    return string.sub(String,1,string.len(Start))==Start
end

string.StartsWith = function(self, str) 
    return self:find('^' .. str) ~= nil
end

string.IsNullOrEmpty = function(self)
    return self == nil or self == '' or not not tostring(self):find("^%s*$") 
end
function string.IsNullOrEmpty(s)
    return s == nil or s == '' or not not tostring(s):find("^%s*$") 
 end
   
string.Insert = function(self, pos, str2)
    return self:sub(1,pos)..str2..self:sub(pos+1)
end

-- Return the first index with the given value (or -1 if not found).
function IndexOf(array, value)
    for i, v in ipairs(array) do
        if v == value then
            return i
        end
    end
    return -1
end

-- Return a key with the given value (or nil if not found).  If there are
-- multiple keys with that value, the particular key returned is arbitrary.
function keyOf(tbl, value)
    for k, v in pairs(tbl) do
        if v == value then
            return k
        end
    end
    return nil
end

function math.round(num, numDecimalPlaces)
	return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", num))
end

function tobool(input)
	if input == "true" or tonumber(input) == 1 or input == true then
		return true
	else
		return false
	end
end

function string.split(inputstr, sep)
	if sep == nil then
		sep = "%s"
	end
	local t, i = {}, 1
	for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
		t[i] = str
		i = i + 1
	end

	return t
end

function split(pString, pPattern)
    local Table = {}  -- NOTE: use {n = 0} in Lua-5.0
    local fpat = "(.-)" .. pPattern
    local last_end = 1
    local s, e, cap = pString:find(fpat, 1)
    while s do
       if s ~= 1 or cap ~= "" then
      Table[#Table + 1] = cap
       end
       last_end = e+1
       s, e, cap = pString:find(fpat, last_end)
    end
    if last_end <= #pString then
       cap = pString:sub(last_end)
       Table[#Table + 1] = cap
    end
    return Table
end

function ResolutionMaintainRatio()
    local screenw,screenh = GetActiveScreenResolution()
    local ratio = screenw / screenh
    local width = 1080 * ratio
    return width, 1080
end

function SafezoneBounds()
    local t = GetSafeZoneSize();
    local  g = math.round(t, 2);
    g = (g * 100) - 90;
    g = 10 - g;

    local screenw = 720 * GetScreenAspectRatio(false)
    local screenh = 720
    local ratio = screenw / screenh;
    local wmp = ratio * 5.4

    return math.round(g * wmp), math.round(g * 5.4)
end

function FormatXWYH(Value, Value2)
    local w,h = ResolutionMaintainRatio()
    return Value/w, Value2/h
end