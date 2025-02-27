y = [0.0     # Deterministic local level generated time series
0.1060800997450012
-2.5401166090915286
-1.8804606280020777
-1.1760466475491147
-2.302644876411037
-1.0658447802934041
0.4639172920523311
0.40628911206073653
-2.294750880205647
-1.8222237154201535
1.6968948890508355
-2.0147377659587553
-1.4642883951315382
-3.5683238540604556
-3.5442789131137236
-2.752972307767968
-0.23192114922445106
-0.3214600484149493
1.5162573351849922
2.6518846047392572
2.2417444332887455
0.9708515356948699
0.27228848071160827
0.7425438082902709
-0.48881836270671764
2.5495638206108393
0.15530141553463572
0.45595997950844613
1.1559265463524744
2.9281051218030445
2.5741233177041525
-1.578224474871712
3.9392494058378418
4.558758924497378
3.31576620433291
4.8994597366060155
3.4062673392822456
3.6648378704919815
2.8806251033717016
2.9346605115987
4.392912895435268
5.984077660099412
5.959896318739726
4.212058147675537
5.846984241521112
6.7941580744860515
2.6346161483091097
4.544328866272992
7.737638315437156
8.284796838449122
10.306328547211434
8.051102960454598
9.301461979411684
9.800854584148714
11.830794038188637
11.085276557319398
8.210176206164027
8.706390314364317
8.423086537691404
7.357491206998211
9.425973181788526
7.8850190772152144
6.059357876592554
5.835189130235573
4.714572245525213
6.5343274996088985
5.512329638432742
4.695379215449569
7.5755080655149705
6.5808363273117765
4.488611259446183
5.125313964339308
7.487824973609926
6.813872604744675
5.775579632527657
3.412178243922881
7.6048719240868214
12.397044049062334
11.112669082202453
7.918594582930849
4.8661299238697815
5.490545571943183
5.68057132719288
5.480463462232138
3.8032283719517666
1.5653549668103262
2.303817355129448
3.617161903469177
1.6131423208506337
2.55503552263749
3.6289513965508444
4.583389451084774
3.689503953197618
2.478168513251782
5.578328679231221
2.5430471549459153
7.478209484696003
6.165810835928076
8.366964896750876]

@testset "Local level" begin
    @testset "Local level model with Kalman filter" begin
        unimodel = local_level(y)

        @test isa(unimodel, StateSpaceModel)
        @test unimodel.mode == "time-invariant"
        
        ss1 = statespace(unimodel)
        @test ss1.filter_type <: KalmanFilter
        @test isa(ss1, StateSpace)
        
        ss2 = statespace(unimodel; filter_type = SquareRootFilter{Float64})
        @test ss2.filter_type <: SquareRootFilter
        @test isa(ss2, StateSpace)
        
        ss3 = statespace(unimodel; filter_type = UnivariateKalmanFilter{Float64})
        @test ss3.filter_type <: UnivariateKalmanFilter
        @test isa(ss3, StateSpace)

        @test ss2.smoother.alpha ≈ ss1.smoother.alpha rtol = 1e-3
        @test ss3.smoother.alpha ≈ ss1.smoother.alpha rtol = 1e-3
        @test ss2.filter.a ≈ ss1.filter.a rtol = 1e-3
        @test ss3.filter.a ≈ ss1.filter.a rtol = 1e-3

        unimodel32 = local_level(Float32.(y))
        ss4 = statespace(unimodel32; filter_type = KalmanFilter{Float32})
        @test ss4.filter_type <: KalmanFilter
        @test isa(ss4, StateSpace)
        
        ss5 = statespace(unimodel32; filter_type = SquareRootFilter{Float32})
        @test ss5.filter_type <: SquareRootFilter
        @test isa(ss5, StateSpace)
        
        ss6 = statespace(unimodel32; filter_type = UnivariateKalmanFilter{Float32})
        @test ss6.filter_type <: UnivariateKalmanFilter
        @test isa(ss6, StateSpace)

        @test ss5.smoother.alpha ≈ ss4.smoother.alpha rtol = 1e-2
        @test ss6.smoother.alpha ≈ ss4.smoother.alpha rtol = 1e-2
        @test ss5.filter.a ≈ ss4.filter.a rtol = 1e-2
        @test ss6.filter.a ≈ ss4.filter.a rtol = 1e-2
        @test typeof(ss4.filter.a) == Matrix{Float32}
        @test typeof(ss5.filter.a) == Matrix{Float32}
        @test typeof(ss6.filter.a) == Matrix{Float32}
    end
end