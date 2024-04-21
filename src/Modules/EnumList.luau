-- bubba_biga
-- EnumList.lua
-- 17 January 2022

--[[
    EnumList.new(name: string, enumTable: table {[string]: any}) --> Enum
	EnumList.IsA(self: any) --> boolean
	EnumList.GetEnums() --> table
	[EnumList instance only]:
	EnumList:IsEnumItem(enumItem: any) --> boolean
	EnumList:GetEnumItems() --> table {[string]: any}
	EnumList:Destroy() --> void
]]

local EnumList = { _enums = {} }

function EnumList._createEnumItems(self, enumsTable)
	local enumItems = {}

	for enumItem, value in pairs(enumsTable) do
		enumItems[enumItem] = {
			Name = enumItem,
			Value = value,
			Enum = self,
		}
	end

	return enumItems
end

function EnumList.new(name, enumsTable)
	local self = setmetatable({
		Name = name,
		_index = #EnumList._enums + 1,
	}, EnumList)

	self._enumItems = EnumList._createEnumItems(self, enumsTable)
	table.insert(EnumList._enums, self._index)
	return self
end

function EnumList.IsA(self)
	return getmetatable(self) == EnumList
end

function EnumList.GetEnums()
	return EnumList._enums
end

function EnumList:IsEnumItem(enumItem)
	return typeof(enumItem) == "table" and enumItem.Enum == self
end

function EnumList:GetEnumItems()
	return self._enumItems
end

function EnumList:Destroy()
	table.remove(EnumList._enums, self._index)
	setmetatable(self, nil)
end

function EnumList:__index(key)
	if EnumList[key] then
		return EnumList[key]
	end

	local value = self._enumItems[key]

	if value then
		return value.Value
	else
		error(("\"%s\" is not a valid EnumItem of Enum \"%s\""):format(tostring(key), self.Name))
	end
end

return EnumList
