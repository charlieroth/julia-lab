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

# ╔═╡ d220ed48-52dd-11eb-2f4e-4bcbf38be82c
md"
### Assignment Form
"

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
### Unicode for functions names
"

# ╔═╡ e054b0bc-502f-11eb-1e27-27b400013ccf
σ(x,y) = x * y

# ╔═╡ ebff9f8a-502f-11eb-200e-83b154be9ef2
σ(2, 3)

# ╔═╡ f193b604-502f-11eb-3ed3-516e1d4cd02d
σ("Charlie ", "Roth")

# ╔═╡ cf94269e-5030-11eb-22d6-cf58095aac0a
md"
### Explict Return Type
"

# ╔═╡ d974c5a6-5030-11eb-3c4f-e530b39aa61c
function h(x,y)::Int8
	return x + y
end

# ╔═╡ e547070e-5030-11eb-02f4-7dd73d7d2062
typeof(h(1,2))

# ╔═╡ f1e22200-5030-11eb-279e-212637ded707
md"
### Return Type: nothing

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

# ╔═╡ 00416054-52de-11eb-268e-85b4db91e60e
md"
### Tuples

Closely related to function arguments and return values. Fixed length container that can hold any value, immutable.
"

# ╔═╡ 0472f548-52de-11eb-0c4c-69babaae6df9
a_tup = (1, 1+1)

# ╔═╡ 34940e2e-52de-11eb-0438-f12ae1c9c964
b_tup = (1,)

# ╔═╡ 3ec587a6-52de-11eb-3583-49dc021bd1d8
a_tup[2]; a_tup[1]

# ╔═╡ 4e7132ae-52de-11eb-088e-cd50652654ff
c_tup = (a=1, b=2*7)

# ╔═╡ 59a78eca-52de-11eb-1587-838962c6a17b
c_tup.b

# ╔═╡ 5ff17522-52de-11eb-1877-7b232c7f4b8c
md"
### Multiple Return Values

Return a tuple of values to simluate returning multiple values. Tuples can be created and destructured without needing paratheses.
"

# ╔═╡ 6644132e-52de-11eb-0033-b995cf33c85b
function mult_ret(a,b)
	a+b, a*b
end

# ╔═╡ 8f16c2c4-52de-11eb-1795-cb56e547d47a
mult_ret(1, 2)

# ╔═╡ 9853aa64-52de-11eb-1dea-2fbcccd1b493
begin
	retx, rety = mult_ret(4, 5)
	"retx: $retx, rety: $rety"
end	

# ╔═╡ d23b5114-52de-11eb-34da-3f5832367ae0
md"
### Varargs Functions

Functions with an arbitrary number of arguments
"

# ╔═╡ e41862c8-52de-11eb-04ad-4798169ba731
varargs_fun(a, b, x...) = (a,b,x)

# ╔═╡ f458f19a-52de-11eb-2873-359230f38331
varargs_fun(2, 3, 4, 5, 6, 7, 8)

# ╔═╡ fecdc284-52de-11eb-26ae-33704a8c7448
md"
### Optional Arguments

In the example below `m` and `d` are optional arguments with a default value of 1
"

# ╔═╡ 122d11ac-52df-11eb-346b-e576fa287c82
function CustomDate(y::Int64, m::Int64=1, d::Int64=1)
	err = validargs(Date, y, m, d)
    err === nothing || throw(err)
	return Date(UTD(totaldays(y,m,d)))
end

# ╔═╡ 83b7fd3e-52df-11eb-2bd4-b1bd421ff6f8
md"
### Keyword Arguments

Convenient for functions to have named args for functions with many args
"

# ╔═╡ 9d85d04a-52df-11eb-39d7-99ece733593a
begin
function plot(x, y; style="solid", width=1, color="black")
	### do something
end

# Called either way
# plot(2, 3, width=2) or plot(2, 3; width=3)
end

# ╔═╡ de3de228-52df-11eb-1838-91484b6d2598
md"
### Function composition and piping

Composition operator `∘` to compose the functions, so `(f ∘ g)(args...)` is the same as `f(g(args...))`

Function chaining, sometimes called `piping` is when you apply a function to the previous function's ouput
"

# ╔═╡ a4c1a874-52e0-11eb-18d9-b35c14f422a4
(sqrt ∘ +)(3, 6)

# ╔═╡ b98c83d4-52e0-11eb-2dc2-1733c83988de
map(first ∘ reverse ∘ uppercase, split("you can compose functions like this"))

# ╔═╡ f25848f6-52e0-11eb-1909-7701d5de051a
1:10 |> sum |> sqrt === (sqrt ∘ sum)(1:10)

# ╔═╡ 110d530e-52e1-11eb-0a72-8bc7948b35a1
md"
### Dot Syntax for Vectorizing Functions

It is common to have \"vectorized\" versions of functions, which simply apply a given function `f(x)` to each element of an array `A` to yeild a new array via `f(A)`
"

# ╔═╡ 48bffb42-52e1-11eb-3761-d10a01643578
A = [1.0, 2.0, 3.0]

# ╔═╡ 51c493da-52e1-11eb-1cc5-5908aa0a0744
sin.(A)

# ╔═╡ 6295a5b4-52e1-11eb-12bc-8d5fdc9069e6
sum_fun(x,y) = 2x + 2y

# ╔═╡ 6c1fb93a-52e1-11eb-30f9-3fc245bec3f0
B = [4.0, 5.0, 6.0]

# ╔═╡ 742119b0-52e1-11eb-0fbb-719f1d98cdd0
sum_fun.(pi, B)

# ╔═╡ 7a05fc4e-52e1-11eb-0d34-d59294bfd21c
sum_fun.(pi, A)

# ╔═╡ Cell order:
# ╟─df40a82c-502d-11eb-1b64-bb6030038e9e
# ╠═fd3e69c2-502d-11eb-038f-f7f58b80bba1
# ╟─d220ed48-52dd-11eb-2f4e-4bcbf38be82c
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
# ╟─00416054-52de-11eb-268e-85b4db91e60e
# ╠═0472f548-52de-11eb-0c4c-69babaae6df9
# ╠═34940e2e-52de-11eb-0438-f12ae1c9c964
# ╠═3ec587a6-52de-11eb-3583-49dc021bd1d8
# ╠═4e7132ae-52de-11eb-088e-cd50652654ff
# ╠═59a78eca-52de-11eb-1587-838962c6a17b
# ╠═5ff17522-52de-11eb-1877-7b232c7f4b8c
# ╠═6644132e-52de-11eb-0033-b995cf33c85b
# ╠═8f16c2c4-52de-11eb-1795-cb56e547d47a
# ╠═9853aa64-52de-11eb-1dea-2fbcccd1b493
# ╟─d23b5114-52de-11eb-34da-3f5832367ae0
# ╠═e41862c8-52de-11eb-04ad-4798169ba731
# ╠═f458f19a-52de-11eb-2873-359230f38331
# ╠═fecdc284-52de-11eb-26ae-33704a8c7448
# ╠═122d11ac-52df-11eb-346b-e576fa287c82
# ╟─83b7fd3e-52df-11eb-2bd4-b1bd421ff6f8
# ╠═9d85d04a-52df-11eb-39d7-99ece733593a
# ╟─de3de228-52df-11eb-1838-91484b6d2598
# ╠═a4c1a874-52e0-11eb-18d9-b35c14f422a4
# ╠═b98c83d4-52e0-11eb-2dc2-1733c83988de
# ╠═f25848f6-52e0-11eb-1909-7701d5de051a
# ╠═110d530e-52e1-11eb-0a72-8bc7948b35a1
# ╠═48bffb42-52e1-11eb-3761-d10a01643578
# ╠═51c493da-52e1-11eb-1cc5-5908aa0a0744
# ╠═6295a5b4-52e1-11eb-12bc-8d5fdc9069e6
# ╠═6c1fb93a-52e1-11eb-30f9-3fc245bec3f0
# ╠═742119b0-52e1-11eb-0fbb-719f1d98cdd0
# ╠═7a05fc4e-52e1-11eb-0d34-d59294bfd21c
