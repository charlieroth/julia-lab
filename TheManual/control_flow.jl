### A Pluto.jl notebook ###
# v0.12.18

using Markdown
using InteractiveUtils

# ╔═╡ 8dce5ec4-52e1-11eb-10b7-3d0576b3bca8
md"
# Control Flow

- Compound Expressions: `begin` and `;`
- Conditional Evaluation: `if`-`elseif`-`else` and `?:` (ternary operator)
- Short-Circuit Evaluation: `&&`, `||` and chained comparisons
- Repeated Evaluation Loops: `while` and `for`
- Exception Handling: `try`-`catch`, `error` and `throw`
- Tasks (aka Coroutines): `yieldto`
"

# ╔═╡ f2e2bc56-52e1-11eb-2ff0-29b0490679aa
md"
### Compound Expressions
"

# ╔═╡ 1c3a4c08-52e3-11eb-049b-7b0769c30155
z = begin
	x = 1
	y = 2
	x + y
end

# ╔═╡ 2d8b05b0-52e3-11eb-102d-7f4f02e09a98
z2 = (x2 = 1; y2 = 2; x2 + y2)

# ╔═╡ 4c1fd6b8-52e3-11eb-2932-abe1219a76ed
begin x3 = 1; y3 = 2; x3 + y3 end

# ╔═╡ 5bb5864a-52e3-11eb-25b4-0970c42ac693
(x4 = 1; y4 = 2; x4 + y4)

# ╔═╡ f84319de-52e1-11eb-0c63-0f24b5ff95ba
md"
### Conditional Evaluation

Value of a conditional expression must be `true` or `false` no such thing as truthyness in Julia
"

# ╔═╡ 1cf862ec-52e3-11eb-0f5f-ffbad721ca41
(x5 = 3; y5 = 4; 
	if x5 < y5
		"x is less than y"
	elseif x5 > y5
		"x is greater than y"
	else
		"x is equal to y"
	end
) # if, elseif, else

# ╔═╡ e6b1ae04-52e3-11eb-2a70-757ba3b4e76e
4 > 3 ? "4 > 3" : "3 > 4" # ternary operator

# ╔═╡ ffbb30d4-52e1-11eb-0f21-fddc755dcf2f
md"
### Short Circuit Evaluation
"

# ╔═╡ 1e042a84-52e3-11eb-1702-c377d38c8a2a


# ╔═╡ 07839862-52e2-11eb-2c6b-87caf11a4d3a
md"
### Repeated Evaluation Loops
"

# ╔═╡ 1eae3526-52e3-11eb-27ba-d59ffd0816a9
begin
	i = 1;
	while i <= 5
		println(i)
		global i += 1
	end
end

# ╔═╡ 517d8cb0-52e4-11eb-0d17-59907960c8de
for i = 1:6
	println(i)
end

# ╔═╡ 6dab1a26-52e4-11eb-2fb4-3d4663565163
for i in [1,2,3]
	println(i)
end

# ╔═╡ 75b3616a-52e4-11eb-1b61-276836414ebf
for s ∈ ["foo", "baz", "bar"]
	println(s)
end

# ╔═╡ 0e09e72a-52e2-11eb-162f-3d093789b6e5
md"
### Exception Handling
"

# ╔═╡ 1f6bd68a-52e3-11eb-23ba-119a78bc3401
sqrt(-1) # will throw DomainError

# ╔═╡ b1a6e8cc-52e4-11eb-2a09-b939eba10387
struct MyCustomException <: Exception end # define own custom exceptions

# ╔═╡ c1c39e6c-52e4-11eb-1c91-f7e275420574
md"
__The `throw` function__
"

# ╔═╡ cc1b5d8c-52e4-11eb-04d1-f7cfb16cbca4
fun_exp(x) = x >= 0 ? exp(-x) : throw(DomainError(x, "argument must be a non-negative"))

# ╔═╡ ecc45f5a-52e4-11eb-03bb-25f08dde6a94
fun_exp(-40)

# ╔═╡ f3cc29f6-52e4-11eb-11ed-a98e5887b2e8
fun_exp(1)

# ╔═╡ fc3d761c-52e4-11eb-197d-ef3081cce9e2
md"
__Errors__
"

# ╔═╡ 1b798926-52e5-11eb-0abc-cff6f810f890
fussy_sqrt(x) = x >= 0 ? sqrt(x) : error("Negative x not allowed")

# ╔═╡ 38b61446-52e5-11eb-01bf-9f57a6cb71ed
fussy_sqrt(-10)

# ╔═╡ 3d32674a-52e5-11eb-3d78-a9c0828ed258
fussy_sqrt(10)

# ╔═╡ 63bb1378-52e5-11eb-368f-dd4ac2687adf
md"
__The `try/catch` statement__
"

# ╔═╡ 7222fd34-52e5-11eb-0983-27c9ca6b54aa
try
	fussy_sqrt(-10)
catch e
	"You should have entered a positive number"
end

# ╔═╡ 8e21338e-52e5-11eb-1d36-91a2fb279a5d
try
	fussy_sqrt(10)
catch e
	"You should have entered a positive number"
end

# ╔═╡ a12e0a06-52e5-11eb-072d-93191893b26e
md"
__`finally` Clauses__
"

# ╔═╡ Cell order:
# ╟─8dce5ec4-52e1-11eb-10b7-3d0576b3bca8
# ╠═f2e2bc56-52e1-11eb-2ff0-29b0490679aa
# ╠═1c3a4c08-52e3-11eb-049b-7b0769c30155
# ╠═2d8b05b0-52e3-11eb-102d-7f4f02e09a98
# ╠═4c1fd6b8-52e3-11eb-2932-abe1219a76ed
# ╠═5bb5864a-52e3-11eb-25b4-0970c42ac693
# ╟─f84319de-52e1-11eb-0c63-0f24b5ff95ba
# ╠═1cf862ec-52e3-11eb-0f5f-ffbad721ca41
# ╠═e6b1ae04-52e3-11eb-2a70-757ba3b4e76e
# ╠═ffbb30d4-52e1-11eb-0f21-fddc755dcf2f
# ╠═1e042a84-52e3-11eb-1702-c377d38c8a2a
# ╠═07839862-52e2-11eb-2c6b-87caf11a4d3a
# ╠═1eae3526-52e3-11eb-27ba-d59ffd0816a9
# ╠═517d8cb0-52e4-11eb-0d17-59907960c8de
# ╠═6dab1a26-52e4-11eb-2fb4-3d4663565163
# ╠═75b3616a-52e4-11eb-1b61-276836414ebf
# ╠═0e09e72a-52e2-11eb-162f-3d093789b6e5
# ╠═1f6bd68a-52e3-11eb-23ba-119a78bc3401
# ╠═b1a6e8cc-52e4-11eb-2a09-b939eba10387
# ╟─c1c39e6c-52e4-11eb-1c91-f7e275420574
# ╠═cc1b5d8c-52e4-11eb-04d1-f7cfb16cbca4
# ╠═ecc45f5a-52e4-11eb-03bb-25f08dde6a94
# ╠═f3cc29f6-52e4-11eb-11ed-a98e5887b2e8
# ╟─fc3d761c-52e4-11eb-197d-ef3081cce9e2
# ╠═1b798926-52e5-11eb-0abc-cff6f810f890
# ╠═38b61446-52e5-11eb-01bf-9f57a6cb71ed
# ╠═3d32674a-52e5-11eb-3d78-a9c0828ed258
# ╟─63bb1378-52e5-11eb-368f-dd4ac2687adf
# ╠═7222fd34-52e5-11eb-0983-27c9ca6b54aa
# ╠═8e21338e-52e5-11eb-1d36-91a2fb279a5d
# ╠═a12e0a06-52e5-11eb-072d-93191893b26e
