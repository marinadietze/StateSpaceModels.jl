var documenterSearchIndex = {"docs": [

{
    "location": "#",
    "page": "Home",
    "title": "Home",
    "category": "page",
    "text": ""
},

{
    "location": "#StateSpaceModels.jl-Documentation-1",
    "page": "Home",
    "title": "StateSpaceModels.jl Documentation",
    "category": "section",
    "text": ""
},

{
    "location": "#Installation-1",
    "page": "Home",
    "title": "Installation",
    "category": "section",
    "text": "This package is unregistered so you will need to Pkg.add it as follows:Pkg.add(\"https://github.com/LAMPSPUC/StateSpaceModels.jl.git\")"
},

{
    "location": "#Notes-1",
    "page": "Home",
    "title": "Notes",
    "category": "section",
    "text": "StateSpaceModels.jl is a package for modeling, forecasting and simulating time series in a state space framework. Implementations were made based on the book Time series analysis by state space methods: J. Durbin and S.J. Koopman."
},

{
    "location": "#Features-1",
    "page": "Home",
    "title": "Features",
    "category": "section",
    "text": "Current features:Basic structural model (level, slope, seasonal)\nExogenous variables\nSquare-root Kalman Filter and smoother\nBig Kappa initialization\nMonte Carlo simulation\nParallel MLE estimation\nMultivariate modelingFuture features (work in progress):User-defined model\nCycles\nForecasting and confidence intervals\nCompletion of missing values\nDifferent models for each variable in multivariate case\nStructural break\nExact initialization"
},

{
    "location": "manual/#",
    "page": "Manual",
    "title": "Manual",
    "category": "page",
    "text": ""
},

{
    "location": "manual/#Manual-1",
    "page": "Manual",
    "title": "Manual",
    "category": "section",
    "text": ""
},

{
    "location": "manual/#Estimation-1",
    "page": "Manual",
    "title": "Estimation",
    "category": "section",
    "text": "The model estimation is made using the function statespace(y, s; X, nseeds). It receives as argument the timeseries and the desired seasonality s.The user can input explanatory variables in an Array{Float64, 2} variable X and specify the desired number of seeds to perform the estimation nseeds.ss = statespace(y, s; X = X, nseeds = nseeds)"
},

{
    "location": "manual/#Simulation-1",
    "page": "Manual",
    "title": "Simulation",
    "category": "section",
    "text": "Simulation is made using the function simulate. It receives as argument a StateSpace object, the number of steps ahead N and the number of scenarios to simulate S.simulation = simulate(ss, N, S)"
},

{
    "location": "manual/#Example-1",
    "page": "Manual",
    "title": "Example",
    "category": "section",
    "text": ""
},

]}
