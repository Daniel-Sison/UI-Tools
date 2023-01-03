local module = {}

local TweenService = game:GetService("TweenService")
local camera = workspace.CurrentCamera

local lighting = game:GetService("Lighting")

local blur = Instance.new("BlurEffect")
blur.Size = 15



----------- Public Functions -----------



-- Snappy way to toggle blur in and out
function module:ToggleBlur(value, size)
	if size then
		blur.Size = size
	end
	
	if value then
		blur.Parent = lighting
	else
		blur.Parent = nil
	end
end


-- Will tween the camera to part
-- If part is not provided, then will return a warning
function module:CameraToPart(part, duration, easingStyle, easingDirection)
	
	local goal = {}
	
	if part then
		goal.CFrame = part.CFrame
	else
		warn("No target part given for the camera to tween to.")
		return
	end
	
	if not duration then
		duration = 1
	end
	
	if not easingStyle then
		easingStyle = Enum.EasingStyle.Quad
	end
	
	if not easingDirection then
		easingDirection = Enum.EasingDirection.Out
	end

	local tweenInfo = TweenInfo.new(
		duration,
		easingStyle,
		easingDirection
	)

	local tween = TweenService:Create(camera, tweenInfo, goal)
	tween:Play()
	
	return tween
end



return module
