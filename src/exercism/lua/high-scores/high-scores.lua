return function(scores)
    local score_methods = {}

    function score_methods.scores()
        return scores
    end

    function score_methods.latest()
        return scores[#scores]
    end

    function score_methods.personal_best()
        local clone_scores = { table.unpack(scores) }
        table.sort(clone_scores, function(a, b) return a > b end)
        return clone_scores[1]
    end

    function score_methods.personal_top_three()
        local clone_scores = { table.unpack(scores) }
        table.sort(clone_scores, function(a, b) return a > b end)
        return { table.unpack(clone_scores, 1, 3) }
    end

    return score_methods
end
