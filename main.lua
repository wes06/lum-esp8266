require("dac121c085") -- DAC handling
-- usage:
-- writeDac(i2c address, val: 0~4095) 

bus = 0           -- I2C bus
sda, scl = 2, 1   -- Used pins for SDA and SCL

function init_I2C(sda, scl)
    i2c.setup(bus, sda, scl, i2c.SLOW)
end 



-- i2c adresses for DACs
channel = {     0x09,   --  ADR1  gnd   ADR0    gnd
                0x0a,   --  ADR1  gnd   ADR0    Va
                0x0c,   --  ADR1  Va    ADR0    gnd
                0x0d    --  ADR1  Va    ADR0    Va    
                }

currVal = {0,0,0,0}
tarVal = {0,0,0,0}
-- oldVal = {0,0,0,0}
valChange = 10



function goTo(canal, brightness)
   tarVal[canal] = brightness
   if currVal[canal] < tarVal[canal] then
      currVal[canal] = currVal[canal] + valChange
      if currVal[canal] > tarVal[canal] then
        currVal[canal] = tarVal[canal]
      end
   elseif currVal[canal] > tarVal[canal] then
      currVal[canal] = currVal[canal] - valChange
      if currVal[canal] < tarVal[canal] then
        currVal[canal] = tarVal[canal]
      end      
   end
            print(channel[canal])
            print(currVal[canal])
            print(tarVal[canal])
            print(math.floor(((currVal[canal]/1024)^3)*1230 + 370))
  --writeDac(channel[canal],math.floor(currVal[canal]/1024^2.8*1230 + 0.5 + 370))
  writeDac(channel[canal],currVal[canal]*4)
end



init_I2C(sda, scl)