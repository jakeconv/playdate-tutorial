local gfx <const> = playdate.graphics

local spriteTitle = gfx.sprite.new()
local spriteButton = gfx.sprite.spriteWithText("Press A to start!", 400, 240)

local imageSpriteTitle = gfx.image.new(200,120) -- Make this a little smaller since we're scaling it

-- Use the system bold font for the title
gfx.setFontFamily(gfx.getFont(gfx.font.kVariantBold))

-- Make an image for the title text
gfx.pushContext(imageSpriteTitle)
gfx.drawTextAligned("Spaceship!", 100, 60, kTextAlignment.center)
gfx.popContext()

-- Scale our title text image to make it larger
spriteTitle:setImage(imageSpriteTitle:scaledImage(2))

spriteTitle:moveTo(200, 100)
spriteButton:moveTo(200, 170)

function showMenu()
    spriteTitle:add()
    spriteButton:add()
end

function hideMenu()
    spriteTitle:remove()
    spriteButton:remove()
end