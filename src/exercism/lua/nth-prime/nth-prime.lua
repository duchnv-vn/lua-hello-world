local function sieve(n)
    local primes = {}
    local is_prime = {}

    for i = 2, n do
        is_prime[i] = true
    end

    for i = 2, math.sqrt(n) do
        if is_prime[i] then
            for j = i * i, n, i do
                is_prime[j] = false
            end
        end
    end

    for i = 2, n do
        if is_prime[i] then
            table.insert(primes, i)
        end
    end

    return primes
end


local function check_is_prime(check_prime_number)
    local is_prime = true

    for i = 2, check_prime_number - 1 do
        local is_divisible = check_prime_number % i == 0

        if is_divisible then
            is_prime = false
            break
        end
    end

    return is_prime
end

local function find_prime(n)
    local prime_count = 0
    local latest_prime
    local check_prime_number = 2

    while prime_count < n do
        local is_prime = check_is_prime(check_prime_number)

        if is_prime then
            prime_count = prime_count + 1
            latest_prime = check_prime_number
        end

        check_prime_number = check_prime_number + 1
    end

    return latest_prime
end

return function(n)
    if n == 1 then
        return 2
    end

    local prime = find_prime(n)

    return prime
end
