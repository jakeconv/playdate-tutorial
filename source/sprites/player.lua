local gfx <const> = playdate.graphics

class("Player").extends(gfx.sprite)

local imageSpritePlayer = gfx.image.new("assets/ship")

local velocity = 0

function Player:init()
    Player.super.init(self, imageSpritePlayer)
    self:moveTo(300, 160) -- Off to the side while the menu is visible
    velocity = 0
end

function Player:update()
    Player.super.update(self)

    local crankPosition = playdate.getCrankPosition()

    print(crankPosition)
    self:setRotation(crankPosition)

    if playdate.buttonIsPressed(playdate.kButtonA) then
        velocity = 5
    else
        velocity = 0
    end

    local crankPositionRadians = math.rad(crankPosition)
    local vX, vY = velocity * math.cos(crankPositionRadians), velocity * math.sin(crankPositionRadians)

    self:moveBy(vX, vY)

    -- Logic to keep the sprite on the screen
    if self.x < -10 then
        -- Sprite went off the left side of the screen
        self:moveTo(410, self.y)
    elseif self.x > 410 then
        -- Sprite went off the right side of the screen
        self:moveTo(-10, self.y)
    end

    if self.y < -10 then
        -- Sprite went off the top of the screen
        self:moveTo(self.x, 250)
    elseif self.y > 250 then
        -- Sprite went off the bottom of the screen
        self:moveTo(self.x, -10)
    end
end
