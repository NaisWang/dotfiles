----
---- 位于当前屏幕的左右窗口切换
----
hs.hotkey.bind({"ctrl"}, "tab", function()

    -- 获取主屏幕
    local mainScreen = hs.screen.primaryScreen()
    local mainScreenFrame = mainScreen:frame()

    local mainScreenWidth = mainScreen:frame().w
    -- 获取当前激活的窗口
    local currentWindow = hs.window.frontmostWindow()
    -- 判断当前位于桌面什么地方，1:左边；0:右边
    local currentWindowLoc = 1
    if currentWindow then
        -- 获取窗口的坐标和大小
        local frame = currentWindow:frame()
        if frame.x < (mainScreenWidth / 3) then
            currentWindowLoc = 1
        else
            currentWindowLoc = 0
        end
    else
        return
    end

    local leftOrRightMostWindow = nil


    -- 获取当前桌面的所有窗口
    local currentWindows = hs.window.orderedWindows()
    for _, window in ipairs(currentWindows) do
        -- 获取窗口的位置信息和所在屏幕
        local frame = window:frame()
        local screen = window:screen()

        -- 过滤：只处理当前主屏幕的窗口，并且窗口必须可见
        if screen == mainScreen and window:isVisible() then
            -- 找到最左边的窗口
            if currentWindowLoc == 0 and frame.x < mainScreenWidth / 3 then
                leftOrRightMostWindow = window
                break
            else
                if currentWindowLoc == 1 and frame.x > mainScreenWidth / 3 then
                    leftOrRightMostWindow = window
                    break
                end
            end
        end
    end

    -- 将最左边的窗口靠前
    if leftOrRightMostWindow then
        leftOrRightMostWindow:focus()  -- 聚焦该窗口
    else
    end
end)

----
---- 给定appName激活窗口
----
function activeAppWindow(appName)
    -- 获取指定应用程序 (例如 Safari)
    local app = hs.application.find(appName)

    -- 如果应用程序存在且已经运行
    if app then
        -- 获取该应用程序的所有窗口
        local windows = app:allWindows()

        -- 如果该应用有窗口存在
        if #windows > 0 then
            -- 聚焦最新的窗口
            windows[1]:focus()
        else
            -- 如果应用程序没有窗口，激活应用程序
            app:activate()
        end
    else
        -- 如果应用未启动，则启动应用
        hs.application.launchOrFocus(appName)
    end
end

hs.hotkey.bind({"alt"}, "s", function()
    activeAppWindow("Google Chrome")
end)
