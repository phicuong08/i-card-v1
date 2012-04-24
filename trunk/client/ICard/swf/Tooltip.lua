

-- 颜色
local WHITE = "#ffffff"			-- 白
local RED = "#ff0000"			-- 红
local GREEN = "#00ff00"			-- 绿
local BLUE = "#0000ff"			-- 蓝--不建议
local SKYBLUE = "#0080ff"		-- 淡蓝，天空蓝--不建议
local PURPLE = "#7600ec"		-- 紫--不建议
local JACINTH = "#ffa042"		-- 桔红
local YELLOW = "#ffff00"		-- 黄
local DARKYELLOW = "#d5d500"	-- 暗黄--不建议
local GREY = "#999999"		--灰

-- 字体大小
local FONTSIZE_1 = 24	-- 大号
local FONTSIZE_2 = 19	-- 偏大号
local FONTSIZE_3 = 15	-- 中号
local FONTSIZE_4 = 10	-- 偏小号
local FONTSIZE_5 = 7	-- 小号

--默认字体大小
local defaultFontSize = FONTSIZE_3
--默认字体颜色
local defaultFontColor = WHITE

--换行
local newLineSign = "<br>"

--tab
local tabSign = "<tab>"

--Html标签包装
local function HtmlWraper(str)
	return "<html><body>" .. str .. "</body></html>"
end

--粗体字标签包装
local function BlodWraper(str)
	return "<b>" .. str .. "</b>"
end

--斜体字标签包装
local function ItalicWraper(str)
	return "<i>" .. str .. "</i>"
end

--段落标记包装
local function ParagraphWraper(str)
	return "<p>" .. str .. "</p>"
end

--list标签包装
local function ListWraper(str)
	return "<li>" .. str .. "</li>"
end

--字体标签包装
local function FontWraper(str, size, color)
	if (not size) then
		size = defaultFontSize
	end
	if (not color) then
		color = defaultFontColor
	end
	
	return "<font size='" .. size .. "' color='" .. color .. "'>" .. str .. "</font>"
end

--字体标签一个功能更强的包装
local function FontExWraper(str, size, color, face, alpha, letterspacing, kerning)
	if (not size) then
		size = defaultFontSize
	end
	if (not color) then
		color = defaultFontColor
	end

	local result = "<font size='" .. size .. "' color='" .. color .. "'"

	if (face) then
		result = result .. " face='" .. face .. "'"
	end

	if (alpha) then
		result = result .. " alpha='" .. alpha .. "'"
	end

	if (letterspacing) then
		result = result .. " letterspacing='" .. letterspacing .. "'"
	end

	if (kerning) then
		result = result .. " kerning='" .. kerning .. "'"
	end

	return result .. ">" .. str .. "</font>"
end

--自定义图片标签封装
local function CustomImageWraper(str, width, height, vspace, hspace)
	local result = "<img src='subimage://" .. str .. "'"

	if (width) then
		result = result .. " width='" .. width .. "'"
	end

	if (height) then
		result = result .. " height='" .. height .. "'"
	end

	if (vspace) then
		result = result .. " vspace='" .. vspace .. "'"
	end

	if (hspace) then
		result = result .. " hspace='" .. hspace .. "'"
	end

	return result .. "/>"
end

local function TextFormatWraper(str, indent, blockindent, leading, leftmargin, rightmargin, tabstops)
	local result = "<textformat"

	if (indent) then
		result = result .. " indent='" .. indent .. "'"
	end
	if (blockindent) then
		result = result .. " blockindent='" .. blockindent .. "'"
	end
	if (leading) then
		result = result .. " leading='" .. leading .. "'"
	end
	if (leftmargin) then
		result = result .. " leftmargin='" .. leftmargin .. "'"
	end
	if (rightmargin) then
		result = result .. " rightmargin='" .. rightmargin .. "'"
	end
	if (tabstops) then
		result = result .. " tabstops='" .. tabstops .. "'"
	end

	return result .. ">" .. str .. "</textformat>"
end

tbTooltips = {
	--通用的技能tooltip
	CommonSkillTip = function (char, skill)
		--注意: char可能为空
		local result
		defaultFontSize = FONTSIZE_3
		defaultFontColor = WHITE

		local icon = skill:GetIcon()
		result = CustomImageWraper(icon)
		local name = skill:GetName()
		result = result.. BlodWraper(FontWraper(name, FONTSIZE_2, YELLOW)) .. newLineSign
		local word
		local color
		local prepareTime = skill:GetPrepareTime(char)
		local shootTime = skill:GetShootTime(char)
		local channelTime = skill:GetChannelTime(char)

		if prepareTime == 0 and channelTime == 0 then
			word = "瞬发"
			color = YELLOW
		elseif channelTime ~= 0 then
			word = "引导" .. channelTime / 1000 .. "秒"
			color = PURPLE
		elseif prepareTime ~= 0 then
			word = "吟唱" .. prepareTime / 1000 .. "秒"
			color = BLUE
		end
			result = result.. FontWraper(word.."        ", nil, color) --.. newLineSign		
		

		local newLine
		local id = skill.m_id		
		result = result.. FontWraper(id, FONTSIZE_3, WHITE) .. newLineSign
		
		local distance = skill:GetDistance(char)
		if distance and distance~=0 then
			distance = string.format("%.1f", distance)
			result =result ..FontWraper("距离: ", FONTSIZE_3, GREEN)..FontWraper(distance.."米    ", FONTSIZE_3, WHITE)
			newLine=true
		end
		local baseCD = skill:GetCDTime(char)/1000
		if baseCD and baseCD~=0 then
			baseCD=string.format("%.1f",baseCD)
			result = result ..FontWraper("调息: ", FONTSIZE_3, GREEN)..FontWraper(baseCD.."秒    ", FONTSIZE_3, WHITE)
			newLine=true
		end
		

		local cost = skill.m_cost
		local cstParam1 = skill:GetCostParam1(char)
		local cstParam2 = skill:GetCostParam2(char)
		local analyzer = KTooltipAnalyzer()
		local description = KTooltipAnalyzer():AnalyzeAsSkill(skill:GetDescription(), char, skill)

		
--		if skill.m_flags and 256 then
--			result = result ..FontWraper("右键设置为自动施放",nil,DARKYELLOW).. newLineSign
--		end if
		
		local costStr = ""
		if cost == 0 then
			if cstParam1 ~= 0 or cstParam2 ~= 0 then
				costStr = FontWraper("消耗: ", FONTSIZE_3, GREEN) .. FontWraper(cstParam1, nil, WHITE)
			end
		end
		if cstParam1==0 and cstParam2==0 then
		else
			result = result.. costStr .. newLineSign
			newLine=true
		end
		if newLine then result = result .. newLineSign end
			result = result.. description			

		return HtmlWraper(result)
	end,
	
--宠物技能tooltip
	PetSkillTip = function (char, skill)
		--注意: char可能为空
		local name = skill:GetName()
		defaultFontSize = FONTSIZE_3
		defaultFontColor = WHITE

		local icon = skill:GetIcon()
		local id = skill.m_id
		local distance = skill:GetDistance(char)
		local baseCD = skill:GetCDTime(char)
		local analyzer = KTooltipAnalyzer()
		local description = KTooltipAnalyzer():AnalyzeAsSkill(skill:GetDescription(), char, skill)

		-- 设置默认参数
		--Creater:SetDefaultParams(FONTSIZE_3, WHITE)
		
		local result = HtmlWraper(
			CustomImageWraper(icon) .. newLineSign
			..BlodWraper(FontWraper(name, FONTSIZE_2, YELLOW)) .. newLineSign
			.. FontWraper(id, FONTSIZE_3, WHITE) .. newLineSign
			.. description			
		)

		return result
	end,
	
	--通用的物品tooltip
	CommonItemTip = function (char, DBItem_CanUse, CreateInfo_Item)
		--注意: char、DBItem_CanUse可能为空
		local name = CreateInfo_Item:GetName()
		local icon = CreateInfo_Item:GetIcon()
		local description = CreateInfo_Item:GetDescription()
		local level = CreateInfo_Item.s_nLevel
		local id = CreateInfo_Item.s_nItemID
		local quality = CreateInfo_Item.s_byQuality
		local itemType = CreateInfo_Item.s_byItemType
		--local skillDescription = CreateInfo_Item:GetSkillDescription()
		local price = CreateInfo_Item:GetPrice()

		--名称颜色由品质决定
		local name_tag		
		do
			local Color
			if Quality == 1 then
				Color = WHITE
			elseif Quality == 2 then
				Color = GREEN
			elseif Quality == 3 then
				Color = BLUE
			elseif Quality == 4 then
				Color = PURPLE
			elseif Quality == 5 then
				Color = YELLOW
			end

			name_tag = BlodWraper(FontWraper(name, FONTSIZE_1, Color))
		end

		-- 图标
		local icon_tag = CustomImageWraper(icon)

		-- 正式版要隐藏ID显示
		local id_tag = FontWraper(id, FONTSIZE_4, WHITE)

		-- 等级
		local level_tag = FontWraper("等级: ", FONTSIZE_4, GREEN) .. FontWraper(level, FONTSIZE_4, YELLOW)

		-- 物品类型
		local itemType_tag
		do
			local Word
			local Color
			if itemType ~= 0 then
				if itemType == 1 then
					Word ="武器"	Color = YELLOW
				elseif itemType == 2 then
					Word = "装备"	Color = GREEN
				elseif itemType == 3 then
					Word = "材料"	Color = WHITE
				elseif itemType == 4 then
					Word = "任务"	Color = SKYBLUE
				end

				itemType_tag = FontWraper(Word, FONTSIZE_3, Color)
			end
		end

		-- 物品描述
		local desc_tag = FontWraper(description, nil, WHITE)

		-- 关联技能描述
		--local skillDesc_tag = FontWraper(skillDescription, nil, YELLOW)

		-- 价格
		local price_tag = FontWraper("售出: ", nil, JACINTH) .. FontWraper(price, FONTSIZE_4, WHITE)

		-- 组织内容
		local result = ""
		do
			if name_tag		then result = result .. name_tag		.. newLineSign	end
			if icon_tag		then result = result .. icon_tag		.. newLineSign	end
			if id_tag		then result = result .. id_tag			.. newLineSign	end
			if level_tag	then result = result .. level_tag		.. newLineSign	end
			if itemType_tag then result = result .. itemType_tag	.. newLineSign	end
			if desc_tag		then result = result .. desc_tag						end
		end

		return HtmlWraper(result)
	end,

	--通用的装备tooltip
	CommonGearTip = function (char, DBItem_CanEquip, CreateInfo_Equip)
		--注意: char、DBItem_CanEquip可能为空
		local name = CreateInfo_Equip:GetName()
		local icon = CreateInfo_Equip:GetIcon()
		local description = CreateInfo_Equip:GetDescription()
		local level = CreateInfo_Equip.s_nLevel
		local repairCost = CreateInfo_Equip.s_nRepairCost
		local classRestrict = CreateInfo_Equip.s_byClassReq
		local id = CreateInfo_Equip.s_nItemID
		local quality = CreateInfo_Equip.s_byQuality
		local itemType = CreateInfo_Equip.s_byItemType
		--local skillDescription = CreateInfo_Equip:GetSkillDescription()
		local price = CreateInfo_Equip:GetPrice()

		--名称颜色由品质决定
		local name_tag		
		do
			local Color
			if Quality == 1 then
				Color = WHITE
			elseif Quality == 2 then
				Color = GREEN
			elseif Quality == 3 then
				Color = BLUE
			elseif Quality == 4 then
				Color = PURPLE
			elseif Quality == 5 then
				Color = YELLOW
			end

			name_tag = BlodWraper(FontWraper(name, FONTSIZE_1, Color))
		end

		-- 图标
		local icon_tag = CustomImageWraper(icon)

		-- 正式版要隐藏ID显示
		local id_tag = FontWraper(id, FONTSIZE_4, WHITE)

		-- 等级
		local level_tag = FontWraper("等级: ", FONTSIZE_4, GREEN) .. FontWraper(level, FONTSIZE_4, YELLOW)

		-- 物品类型
		local itemType_tag
		do
			local Word
			local Color
			if itemType ~= 0 then
				if itemType == 1 then
					Word ="武器"	Color = YELLOW
				elseif itemType == 2 then
					Word = "装备"	Color = GREEN
				elseif itemType == 3 then
					Word = "材料"	Color = WHITE
				elseif itemType == 4 then
					Word = "任务"	Color = SKYBLUE
				end

				itemType_tag = FontWraper(Word, FONTSIZE_3, Color)
			end
		end

		-- 物品描述
		local desc_tag = FontWraper(description, nil, WHITE)

		-- 关联技能描述
		--local skillDesc_tag = FontWraper(skillDescription, nil, YELLOW)

		-- 价格
		local price_tag = FontWraper("售出: ", nil, JACINTH) .. FontWraper(price, FONTSIZE_4, WHITE)

		-- 组织内容
		local result = ""
		do
			if name_tag		then result = result .. name_tag		.. newLineSign	end
			if icon_tag		then result = result .. icon_tag		.. newLineSign	end
			if id_tag		then result = result .. id_tag			.. newLineSign	end
			if level_tag	then result = result .. level_tag		.. newLineSign	end
			if itemType_tag then result = result .. itemType_tag	.. newLineSign	end
			if desc_tag		then result = result .. desc_tag						end
		end

		return HtmlWraper(result)
	end,

	-- Buff's tooltip
	CommonBuffTip = function(char, BuffInst)
		
		local BM = BuffInst.m_pBSD
		local name = FontWraper(CPP.stringMgr:GetStringByID(BM.m_nameID),FONTSIZE_2,YELLOW)..newLineSign
		local id = FontWraper(BM.m_id,FONTSIZE_4,WHITE)..newLineSign
	  local description =FontWraper(CPP.stringMgr:GetStringByID(BM.m_descriptionID),nil,WHITE)..newLineSign
    local result =  HtmlWraper(
    name
    ..id
    ..description
    )
    return result

	end,

	-- 技能学习面板上的技能描述
	SkillLearningDesc = function(char, skillID)
	--注意: char可能为空
		
		local skill=CPP.skillDataMgr:Get(skillID)
		local name = skill:GetName()
		--print(name)
		defaultFontSize = FONTSIZE_3
		defaultFontColor = WHITE

		local icon = skill:GetIcon()
		local id = skill.m_id
		local distance = skill:GetDistance(char)
		local baseCD = skill:GetCDTime(char)
		local prepareTime = skill:GetPrepareTime(char)
		local shootTime = skill:GetShootTime(char)
		local channelTime = skill:GetChannelTime(char)
		local cost = skill.m_cost
		local cstParam1 = skill:GetCostParam1(char)
		local cstParam2 = skill:GetCostParam2(char)
		local analyzer = KTooltipAnalyzer()
		local description = KTooltipAnalyzer():AnalyzeAsSkill(skill:GetDescription(), char, skill)..newLineSign
		local castway
		local color

--		if prepareTime == 0 and channelTime == 0 then
--			castway = "瞬发"
--			color = YELLOW
--		elseif channelTime ~= 0 then
--			castway = "引导" .. channelTime / 1000 .. "秒"
--			color = PURPLE
--		elseif prepareTime ~= 0 then
--			castway = "吟唱" .. prepareTime / 1000 .. "秒"
--			color = BLUE
--		end
		

--		local costStr = ""
--		if cost == 0 then
--			if cstParam ~= 0 then
--				costStr = "消耗能量: " .. FontWraper(cstParam1, nil, BLUE)..newLineSign
--			end
--		end
--		
--		local nextLevel = FontWraper("下一级:",nil,GREEN)..newLineSign

		-- 设置默认参数
		--Creater:SetDefaultParams(FONTSIZE_3, WHITE)
		
		local result = HtmlWraper(
			FontWraper(id, FONTSIZE_3, WHITE) .. newLineSign
			--.. FontWraper(castway, nil, color) .. newLineSign
			.. description
			--.. costStr
			--.. nextLevel
		)


		return result
	end,
}