function writeDac(addr, value) -- 0.25V(300) > 1.3V (1610)
  value2 = BitAND(value, 255) -- "mascara" para primeira metade
  value1 = rshift(value, 8)

  -- init_I2C(sda, scl)
  
  i2c.start(bus)
  i2c.address(bus, addr, i2c.TRANSMITTER)
  i2c.write(bus, value1)
  i2c.write(bus, value2)
   i2c.stop(bus)

end

function Dec2Hex(nValue)
     -- if type(nValue) == "string" then
     --     nValue = String.ToNumber(nValue)
     -- end
     nHexVal = string.format("%X", nValue)  -- %X returns uppercase hex, %x gives lowercase letters
     -- sHexVal = nHexVal..""
     nHexVal = tonumber(nHexVal, 16)
     return nHexVal
     -- print(sHexVal)
end


function BitAND(a,b)--Bitwise and
    local p,c=1,0
    while a>0 and b>0 do
        local ra,rb=a%2,b%2
        if ra+rb>1 then c=c+p end
        a,b,p=(a-ra)/2,(b-rb)/2,p*2
    end
    return c
end


function rshift(x, by) -- rshift(val,8)
  return math.floor(x / 2 ^ by)
end