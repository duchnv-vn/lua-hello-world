local cars = {}

-- returns the amount of working cars produced by the assembly line every hour
function cars.calculate_working_cars_per_hour(production_rate, success_rate)
  if type(production_rate) ~= "number" then
    return error("production_rate argument must be number")
  elseif type(success_rate) ~= "number" then
    return error("production_rate argument must be number")
  elseif production_rate < 0 then
    return error("production_rate must be greater or equal 0")
  elseif success_rate < 0 or success_rate > 100 then
    return error("success_rate must be in range of 0 - 100")
  end

  return (production_rate * success_rate) / 100
end

-- returns the amount of working cars produced by the assembly line every minute
function cars.calculate_working_cars_per_minute(production_rate, success_rate)
  return math.floor(cars.calculate_working_cars_per_hour(production_rate, success_rate) / 60)
end

-- returns the cost of producing the given number of cars
function cars.calculate_cost(cars_count)
  if type(cars_count) ~= "number" then
    return error("argument must be number")
  end

  local car_cost = 10000
  local group_10_desc_percent = 5
  local int, fraction = math.modf(cars_count / 10)
  local group_10_count = int * 10
  local individual_count = fraction * 10

  local group_10_total_cost = group_10_count * (car_cost * (100 - group_10_desc_percent) / 100)
  local individual_total_cost = individual_count * car_cost

  return group_10_total_cost + individual_total_cost
end

return cars
