### A Pluto.jl notebook ###
# v0.12.18

using Markdown
using InteractiveUtils

# ╔═╡ df40a82c-502d-11eb-1b64-bb6030038e9e
md"
# Functions
"

# ╔═╡ fd3e69c2-502d-11eb-038f-f7f58b80bba1
# regular form
# function f(x, y)
# 	x + y
# end

# ╔═╡ 0824608a-502e-11eb-3a70-1de9a1986638
# assignment form
f(x,y) = x + y

# ╔═╡ b8a6048a-502f-11eb-0436-9318b6b3ba4b
g = f

# ╔═╡ bc87a824-502f-11eb-2467-1f4b0467c9d5
f(3, 2)

# ╔═╡ c0e0105a-502f-11eb-0d95-fd6648a308a0
g(3, 2)

# ╔═╡ cc63bc56-502f-11eb-2a2f-8554b8f6e5ae
md"
Unicode can be used for functions names as well
"

# ╔═╡ e054b0bc-502f-11eb-1e27-27b400013ccf
σ(x,y) = x * y

# ╔═╡ ebff9f8a-502f-11eb-200e-83b154be9ef2
σ(2, 3)

# ╔═╡ f193b604-502f-11eb-3ed3-516e1d4cd02d
σ("Charlie ", "Roth")

# ╔═╡ cf94269e-5030-11eb-22d6-cf58095aac0a
md"
### Return Type
"

# ╔═╡ d974c5a6-5030-11eb-3c4f-e530b39aa61c
function h(x,y)::Int8
	return x + y
end

# ╔═╡ e547070e-5030-11eb-02f4-7dd73d7d2062
typeof(h(1,2))

# ╔═╡ f1e22200-5030-11eb-279e-212637ded707
md"
### Return Nothing

Functions can return `nothing` for functions that are used for side effects
"

# ╔═╡ fabe82f6-5030-11eb-0400-65be30a5aaaf
function printx(x)
	println("x = $x")
	return nothing
end

# ╔═╡ 9ab7dc16-5032-11eb-1970-bf94df609ebb
md"
### Anonymous Functions
"

# ╔═╡ a2d74844-5032-11eb-0c18-3b3702dc6110
result = map(x -> x^2 + 3, [1,2,3])

# ╔═╡ e5a5159a-5032-11eb-2a43-c1d729c2a501
some_func(x,y,z) = x * y + z

# ╔═╡ Cell order:
# ╟─df40a82c-502d-11eb-1b64-bb6030038e9e
# ╠═fd3e69c2-502d-11eb-038f-f7f58b80bba1
# ╠═0824608a-502e-11eb-3a70-1de9a1986638
# ╠═b8a6048a-502f-11eb-0436-9318b6b3ba4b
# ╠═bc87a824-502f-11eb-2467-1f4b0467c9d5
# ╠═c0e0105a-502f-11eb-0d95-fd6648a308a0
# ╟─cc63bc56-502f-11eb-2a2f-8554b8f6e5ae
# ╠═e054b0bc-502f-11eb-1e27-27b400013ccf
# ╠═ebff9f8a-502f-11eb-200e-83b154be9ef2
# ╠═f193b604-502f-11eb-3ed3-516e1d4cd02d
# ╟─cf94269e-5030-11eb-22d6-cf58095aac0a
# ╠═d974c5a6-5030-11eb-3c4f-e530b39aa61c
# ╠═e547070e-5030-11eb-02f4-7dd73d7d2062
# ╟─f1e22200-5030-11eb-279e-212637ded707
# ╠═fabe82f6-5030-11eb-0400-65be30a5aaaf
# ╟─9ab7dc16-5032-11eb-1970-bf94df609ebb
# ╠═a2d74844-5032-11eb-0c18-3b3702dc6110
# ╠═e5a5159a-5032-11eb-2a43-c1d729c2a501
