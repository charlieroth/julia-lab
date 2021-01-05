first = "Charlie"
middle = "Thomas"
last = "Roth"
suffix = "III"

# concatenation
full = first * " " * middle * " " * last * " " * suffix
println(full)

# interpolation
full = "$first $middle $last $suffix"
println(full)

# expressions can be used with interpolation
println("1 + 2 = $(1 + 2)")
