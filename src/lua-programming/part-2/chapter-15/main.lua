local authors = {}
function Book(b) authors[b.author] = true end

dofile("bookData")
for name in pairs(authors) do print(name) end
