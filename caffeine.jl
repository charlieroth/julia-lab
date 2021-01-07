### A Pluto.jl notebook ###
# v0.12.18

using Markdown
using InteractiveUtils

# ╔═╡ 2e329564-5036-11eb-1229-f1ca9e861b62
begin
	import Pkg
	Pkg.add("Plots")
	using Plots
	plotly()
end

# ╔═╡ 5898532c-5034-11eb-0de3-236f5acb59e1
md"
## Caffeine.jl

The half life of caffeine in the body is 5 hours. This program use a simple exponential decay model for determining how much (roughly) caffeine will be in my body given how much caffeine consumed.
"

# ╔═╡ 4a0109fa-5078-11eb-3bfb-45106a108263
# half life of caffeine in the body is 5 hours
half_life = 5

# ╔═╡ bca499b6-5034-11eb-2708-bfa1a282783c
function caffeine_present_at(time::Int64, amount_drank::Int64)
	amount_drank * (2^(-(time / half_life)))
end

# ╔═╡ 1550150e-5035-11eb-1482-df12f54a808b
function caffeine_presence_plot(amount_drank::Int64, hrs::UnitRange{Int64})
	amounts = []
	for hr in hrs
		amount_present = caffeine_present_at(hr, amount_drank)
		push!(amounts, trunc(Int64, amount_present))
	end
	plot(hrs, amounts, title = "Caffeine Presence Decay", label = ["Decay"], lw = 3)
	xlabel!("Hours after consumption")
	ylabel!("Caffeine present (mg)")
end

# ╔═╡ 1120f69e-5065-11eb-0ac9-57657c20fb4c
caffeine_presence_plot(96, 1:24)

# ╔═╡ Cell order:
# ╟─2e329564-5036-11eb-1229-f1ca9e861b62
# ╟─5898532c-5034-11eb-0de3-236f5acb59e1
# ╟─4a0109fa-5078-11eb-3bfb-45106a108263
# ╟─bca499b6-5034-11eb-2708-bfa1a282783c
# ╟─1550150e-5035-11eb-1482-df12f54a808b
# ╠═1120f69e-5065-11eb-0ac9-57657c20fb4c
