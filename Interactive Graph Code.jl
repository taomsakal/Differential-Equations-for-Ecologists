
# You might have to add each of the below packages if it is the first time using them. Do this with code like Below
# Pkg.add("DifferentialEquations")

using DifferentialEquations
using Plots
using Interact
using IJulia
using Weave
using Formatting
gr()



#-------------------------
# Exponential growth

theme(:default)

function exponential_growth!(du, u, p, t)
    N, = u  # Names of state variables
    r, = p  # Names of parameters

    # The system of equations
    du[1] = dN = r * N
end

@manipulate for r=-4:0.01:4, N0=100:1000
    u0=[N0]  # Initial Conditions
    tspan = (0., 5)  # Timespan
    p = [r]  # Parameters

    problem = ODEProblem(exponential_growth!, u0, tspan, p)
    solution = solve(problem)

    scale = 1.3
    width = 1.3 * 600
    height = 1.3 * 400
    textx, texty = 4.5, 5000

    plot(solution, linewidth=4, label="Population Size", legend=:none, size=(width, height))
    annotate!(textx, texty, "N₀ = $N0 \n r = $r")
    title!("Exponential Growth")
    xlabel!("Days (t)")
    ylabel!("Number of Bacteria (N)")

    ylims!((0, 10000))
end

#------------

#Logistic
function logistic_growth!(du, u, p, t)
    N, = u  # Names of state variables
    rmax, K = p  # Names of parameters

    # The system of equations
    du[1] = dN = rmax * (1 - N/K) * N
end

@manipulate for r=0:0.01:4, N0=0:10000, K=1:10000
    u0=[N0]  # Initial Conditions
    tspan = (0., 5)  # Timespan
    p = [r, K]  # Parameters

    problem = ODEProblem(logistic_growth!, u0, tspan, p)
    solution = solve(problem)

    scale = 1.3
    width = 1.3 * 600
    height = 1.3 * 400
    textx, texty = 4.5, 5000

    plot(solution, linewidth=4, label="Population Size", legend=:none, size=(width, height))
    annotate!(textx, texty, "N₀ = $N0 \n rₘₐₓ = $r \n K = $K")
    title!("Logistic Growth")
    xlabel!("Days (t)")
    ylabel!("Number of Bacteria (N)")

    ylims!((0, 10000))
end

#---------------

#Lokta Volterra no interaction
function LK_no_interaction!(du, u, p, t)
    N, C = u  # Names of state variables
    rmaxN, rmaxC, KN, KC = p  # Names of parameters

    # The system of equations
    du[1] = dN = rmaxN * (1 - N/KN) * N
    du[2] = dC = rmaxC * (1 - C/KC) * C
end

@manipulate for rmaxN=0:0.01:4, rmaxC=0:0.01:4, N0=0:10000, KN=1:10000, KC=1:10000, C0=0:10000
    u0=[N0, C0]  # Initial Conditions
    tspan = (0., 5)  # Timespan
    p = [rmaxN, rmaxC, KN, KC]  # Parameters

    problem = ODEProblem(LK_no_interaction!, u0, tspan, p)
    solution = solve(problem)

    scale = 1.3
    width = 1.3 * 600
    height = 1.3 * 400
    textx, texty = 4.5, 5000

    plot(solution, linewidth=4, label=["Bacteria" "Cats"], size=(width, height))
    annotate!(textx, texty, "N₀ = $N0 \n C₀ = $C0 \n rₘₐₓN = $rmaxN \n rₘₐₓC = $rmaxC \n KN = $KN \n KC = $KC")
    title!("Logistic Growth (Cats and Bacteria)")
    xlabel!("Days (t)")
    ylabel!("Population Size (N or C)")

    ylims!((0, 10000))
end

#----------
# LK interaction
function LK_Competition!(du, u, p, t)
    N, C = u  # Names of state variables
    rmaxN, rmaxC, KN, KC, αNC, αCN = p  # Names of parameters

    # The system of equations
    du[1] = dN = rmaxN * (1 - N/KN - αNC * C/KN) * N
    du[2] = dC = rmaxC * (1 - C/KC - αCN * N/KC) * C
end

@manipulate for rmaxN=0:0.01:4, rmaxC=0:0.01:4, N0=0:10000, KN=1:10000, KC=1:10000, C0=0:10000, αNC=0:0.01:5, αCN=0:0.01:5
    u0=[N0, C0]  # Initial Conditions
    tspan = (0., 10)  # Timespan
    p = [rmaxN, rmaxC, KN, KC, αNC, αCN]  # Parameters

    problem = ODEProblem(LK_Competition!, u0, tspan, p)
    solution = solve(problem)

    scale = 1.3
    width = 1.3 * 600
    height = 1.3 * 400
    textx, texty = 9, 5000

    plot(solution, linewidth=4, label=["Bacteria" "Cats"], size=(width, height))
    annotate!(textx, texty, "N₀ = $N0 \n C₀ = $C0 \n r_maxN = $rmaxN \n r_maxC = $rmaxC \n KN = $KN \n KC = $KC \n α_NC = $αNC \n αCN =  $αCN")
    title!("Logistic Growth with Competition (Cats and Bacteria)")
    xlabel!("Days (t)")
    ylabel!("Population Size (N or C)")

    ylims!((0, 10000))
end
