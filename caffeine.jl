### A Pluto.jl notebook ###
# v0.12.18

using Markdown
using InteractiveUtils

# ╔═╡ be52d9a8-5041-11eb-0c6e-030987caeb43
begin
	using Plots
end

# ╔═╡ 2e329564-5036-11eb-1229-f1ca9e861b62
begin
	import Pkg
end

# ╔═╡ 91425a18-5040-11eb-0fb2-e9d01d01418f
begin
	Pkg.add("Plots")
end

# ╔═╡ 5898532c-5034-11eb-0de3-236f5acb59e1
md"
## Caffeine.jl

I like espresso.

This program use a simple exponential decay model for determining how much, roughly, caffeine will be in my system given how much caffeine consumed (mg) and when the caffeine was consumed (date-time)
"

# ╔═╡ bca499b6-5034-11eb-2708-bfa1a282783c
function caffeine_present_at(time::Int64, amount_drank::Int64)
	amount_drank * (2^(-(time / 5)))
end

# ╔═╡ 1550150e-5035-11eb-1482-df12f54a808b
function caffeine_half_life_model(amount_drank::Int64, hrs::UnitRange{Int64})
	plot(hrs)
	for hr in hrs
		amount_present = caffeine_present_at(hr, amount_drank)
		plot!(hr, trunc(floor(amount_present)))
	end
end

# ╔═╡ 1120f69e-5065-11eb-0ac9-57657c20fb4c
caffeine_half_life_model(96, 1:24)

# ╔═╡ 09e5a3b6-5065-11eb-2625-8f8672ce0c92
begin
x = 1:24; y = rand(24); # These are the plotting data
plot(x, y)
end

# ╔═╡ Cell order:
# ╠═2e329564-5036-11eb-1229-f1ca9e861b62
# ╠═91425a18-5040-11eb-0fb2-e9d01d01418f
# ╠═be52d9a8-5041-11eb-0c6e-030987caeb43
# ╠═5898532c-5034-11eb-0de3-236f5acb59e1
# ╠═bca499b6-5034-11eb-2708-bfa1a282783c
# ╠═1550150e-5035-11eb-1482-df12f54a808b
# ╠═1120f69e-5065-11eb-0ac9-57657c20fb4c
# ╠═09e5a3b6-5065-11eb-2625-8f8672ce0c92
