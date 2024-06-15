local lasagna = {}

-- add a 'oven_time' field to the lasagna table
lasagna.oven_time = 40

-- returns the remaining minutes based on the actual minutes in the oven
function lasagna.remaining_oven_time(actual_minutes_in_oven)
  if type(actual_minutes_in_oven) ~= "number" then
    return error("argument must be number")
  elseif actual_minutes_in_oven < 0 then
    return error("argument must be greater than 0")
  end

  return lasagna.oven_time - actual_minutes_in_oven
end

-- calculates and returns the time needed to prepare the lasagna on the amount
-- of layers
function lasagna.preparation_time(number_of_layers)
  if type(number_of_layers) ~= "number" then
    return error("argument must be number")
  end

  local time_of_each_layer = 2
  return number_of_layers * time_of_each_layer
end

-- calculates the time elapsed cooking the lasagna - including preparation time
-- and baking time.
function lasagna.elapsed_time(number_of_layers, actual_minutes_in_oven)
  if type(number_of_layers) ~= "number" then
    return error("number_of_layers argument must be number")
  elseif type(actual_minutes_in_oven) ~= "number" then
    return error("actual_minutes_in_oven argument must be number")
  end

  return lasagna.preparation_time(number_of_layers) + actual_minutes_in_oven
end

return lasagna
