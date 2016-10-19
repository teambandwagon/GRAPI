function [Y,Xf,Af] = myNeuralNetworkFunction(X,~,~)
%MYNEURALNETWORKFUNCTION neural network simulation function.
%
% Generated by Neural Network Toolbox function genFunction, 18-Oct-2016 16:56:25.
%
% [Y] = myNeuralNetworkFunction(X,~,~) takes these arguments:
%
%   X = 1xTS cell, 1 inputs over TS timesteps
%   Each X{1,ts} = Qx60 matrix, input #1 at timestep ts.
%
% and returns:
%   Y = 1xTS cell of 1 outputs over TS timesteps.
%   Each Y{1,ts} = Qx9 matrix, output #1 at timestep ts.
%
% where Q is number of samples (or series) and TS is the number of timesteps.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1.xoffset = [0.1875;-84.8125;-179;-12.64;-10.77;-10.33;0.6875;-84.3125;-179.3125;-14.03;-15.75;-15.48;0;-86;-179.9375;-25.58;-30.52;-35.66;0.0625;-86.75;-179.375;-21.97;-25.86;-42.33;0.0625;-87.625;-179.4375;-16.06;-23.64;-44.65;0.125;-89.5625;-179.875;-17.05;-25.72;-42.46;0;-87.9375;-178.875;-14.29;-28.91;-43.54;0;-88.6875;-178.6875;-13.09;-19.96;-35.77;0.1875;-87.875;-179.6875;-10.51;-17.61;-25.88;-2.0625;-87.625;-178.1875;-5.94;-8.34;-18.4];
x1_step1.gain = [0.00556134862704206;0.0129764801297648;0.00558171986743415;0.0812017864393017;0.0854335753951303;0.0662251655629139;0.00557006092254134;0.0128102481985588;0.00558561703613196;0.0472813238770686;0.0571102227298687;0.0428540818512963;0.00556038227628149;0.012573673870334;0.00557491289198606;0.0336530371866061;0.0390625;0.0303536196691455;0.00556231531374935;0.0125293657008614;0.00558464223385689;0.04;0.0440431622990531;0.0274687542919929;0.00555941626129256;0.0125097732603597;0.00557394182198223;0.0374181478016838;0.0364564345607;0.0259437021662991;0.00556424969570509;0.0123934934159566;0.00556424969570509;0.0337325012649688;0.0415282392026578;0.00828938233739858;0.00556134862704206;0.0125441003528028;0.00557588430040077;0.0351246926589392;0.0355808574986657;0.00826523127150252;0.00557006092254134;0.0124513618677043;0.00557880055788006;0.0382409177820268;0.0459453250631748;0.00874479411475356;0.00555941626129256;0.0125097732603597;0.00557977332170881;0.0363438124659277;0.0485201358563804;0.00938394407169333;0.00553729018861395;0.0106312292358804;0.00558561703613196;0.0438692695766616;0.0906207521522429;0.00950570342205323];
x1_step1.ymin = -1;

% Layer 1
b1 = [-1.0669598824524869;0.81443303594971739;-1.432326814019854;-0.17458710744996064;-0.40301240309421643;-0.90480828249444067;0.63198656560322253;1.1729245451523316;0.40047704486253932;-0.56883555031272093;0.43942510465427137;0.087380921270065984;-0.13681966051072797;0.030705097841098226;0.41688566833334145;-0.42146699994274522;-0.79781630973571493;2.3600623896069362;1.0509246761001114;1.7484524310787792];
IW1_1 = [0.65504619205064885 0.20807918305399248 0.19314894112156245 0.34520689078887584 -0.29116239556981782 -0.57444386950007686 0.006427627933021306 0.1008517086342515 0.40115674336142731 0.25808799531500254 -0.68162364468259851 -0.065230901013288503 0.24893405237914426 0.40835818224078491 0.31769955078846313 0.28170624313367909 -0.67953955533595722 0.56555849919376078 0.27717114431699957 0.32120765387313971 0.19702906661553471 0.072154694135152284 -0.55426627644216553 0.25140921851149661 0.31821715460278427 0.12756340372676567 -0.37865721687019743 0.43700101032470284 -0.16877742868986981 -0.22303753223309219 0.61914258778143683 -0.22806416323786 -0.096733106661194557 -0.37322485317001025 0.14890692074176795 -0.58173993094731502 0.2514904177428397 0.4680222451288879 -0.15344965318728099 0.047923866402365768 0.099295890354551844 -0.47954426899833541 0.59337660911419854 0.44793677642810387 -0.78515632634626742 -0.031196495164030884 0.17948223611965777 -0.13206889245391354 0.74522850821762354 0.474743136745436 -0.25668483036473366 0.073914462180938237 -0.031052205702900994 -0.17069407531883474 0.80046250646619288 0.30386277860357558 -0.26180646266848578 0.27631198776111299 -0.27424131990500411 -0.34660313882512234;-0.68960864288333057 -0.61558480714668928 -0.97941812378661586 -0.87535212253554495 0.037668808901462916 0.39715526399395928 -0.8502760571555803 -0.26794767206903164 0.16339235553125928 -2.2173322733067939 -0.077296988006636216 1.1753057625615269 -0.18541583331479922 -0.2068594730345921 -0.43980282868022613 -1.8504940336218663 -0.44759566005018214 0.8510323456997485 0.49007196135856212 -0.18551389300647375 0.65231232574036135 -2.1608302332410343 -0.2428549796569841 0.5602821691829305 0.26015443204925309 0.70646271193125243 0.30138662562679752 -1.8437036136873768 0.29972397011461033 -0.16316666788594869 0.66176030289038579 0.46249420926073809 0.86850010630504471 -0.82140101659647202 0.98620913124070664 -0.064976469775581566 -0.39416181624459257 0.62957234851952859 0.34422636820948171 -0.78345971033845685 0.6809011129283169 0.43427485249662956 0.27310323421176808 0.38339227064809278 -0.15369424051567371 0.086012678236372625 1.4239029495530395 0.39483545422764565 0.27705125488187321 -0.039180648391709851 0.12609095946342877 0.76635687913327066 1.5034889834241196 0.55337637618263924 -0.10909031761809541 0.047462906052710821 0.24636650743160707 0.22291895272476633 0.76023163794410242 0.60968229819979913;0.078774787273712732 -0.31567869323976311 -0.96994097751732722 1.1661403725030892 -0.92164357420398546 -0.82438795328270786 -0.5348632630492649 -0.7338609766100288 -0.77479737665817594 1.1741348502729494 -0.3271351812021096 -1.4640967983122599 -0.042827351334624744 -0.82108669592209382 -0.73536042990295281 0.66350623778718643 -0.29394907123094743 -1.3303952407916748 0.13741079497073644 -0.92604796517211585 -0.68439593373902341 0.51312187190677516 -0.56236286813277203 -0.70026594691678545 0.17436352510741668 -0.76156890555081314 0.72754449411070388 -0.19563288648126889 -0.14880595094918089 -0.70323496167167898 -0.16252588524921177 0.35313851307244642 0.78581871772825318 -0.85236184206711962 -0.083869632287307497 0.64408004701187127 -0.32146594714768123 0.50541926024080197 1.2328407083610502 -0.62743935118760696 0.25039330160918533 0.51725457276587505 -0.10693237119329929 0.88067319082305673 0.79273140090136662 -0.95335257702211118 0.43873911662331944 0.49045950416896084 -0.31915881071203211 0.66310497272404012 0.76932575102680323 -0.57275425427788262 -0.3018536244689794 0.27488766302863005 0.48367078024812438 1.0634867762403701 0.99489230649342597 -0.39810170072976797 -0.74027433190958036 0.27022147611079589;-0.35371252044513235 0.29289291167347326 1.018614718847789 -1.8991371849250498 -0.17935073472703844 -0.023034849452656207 0.21552942146931434 -0.17528755288817166 0.43068030122099016 -2.7729529617908097 0.22048131297213544 -0.2488399937678481 0.39187971233748958 -0.1242226307025021 0.44411865053656924 -0.65410239552317351 0.71066140674282907 -0.35576685282936921 -0.61118162881051441 0.17674029530316487 0.52151633252180096 -0.74738491503441618 0.98542121947620609 -0.77759967472542058 -0.679591653274628 -0.062405034032123961 -0.26512874390676239 -0.056917620797820867 -0.32256175747183818 -0.14102165482214879 -0.70304596102131889 0.089403737379699894 -0.52543012280846557 1.1234145994462565 -1.2322513018815182 -0.69991632014912164 -0.41578829284500551 0.49400355767878307 -0.56115474420436839 2.2780636325493084 -0.67860468316137768 -0.27375164695951348 0.68714070375424752 0.50541992567055816 -0.15990133782217425 2.5273389279232714 -1.0724792994328474 -0.69175905749287991 0.74902285049792028 0.97210822421737131 -0.57338260495407189 1.368328775489523 -0.39301046159526404 -0.9888395679019264 0.86595968890529618 0.7607085356856691 -0.03073155270783879 0.44797464089851158 0.41275639376518897 -0.6758963603118272;0.40901903006375423 -0.27818089345708091 -0.86672113274868978 -0.016868015821810276 -0.054073180900592745 -0.020958261089021719 -0.072671930777488472 -0.015290007528688275 -0.54779565610726111 -0.41522404665528323 0.96611371107177579 -0.78339053347606225 -0.26903127996451748 0.11217632561651993 -0.31331346823301826 -0.21404894004800248 0.43655814131616361 -0.076111002733679253 0.0057402956681702755 0.65057753062615642 -0.66374108576479696 -0.30275782027914716 0.25671521104552097 -0.52014351827830518 -0.20522031018489423 0.47042279773220946 -0.1218130902492688 -0.16821040444002205 0.065963654917530881 0.12516554289301229 -0.21667690658842723 0.57223250425461158 -0.17390711437905179 -0.18773919625245056 -0.36267622679635747 -0.016500915897971282 -0.28038595173956449 0.42382673648326508 -0.48874802277358603 -0.33124504882379718 -0.287168178712015 -0.51555570638348858 0.17046893007888173 0.63652824476763659 -0.5622089774862542 -0.54822954528378276 -0.8172885489163868 -0.58583922785364828 -0.22740726184789514 0.73101007216308656 -0.33479183531761608 -0.22753761071036288 -0.98904402621056453 -0.62226865069814341 0.48087304797297958 0.58681062600383105 -0.61598420590621084 -0.34658690201190911 -0.59126579457581452 -0.0032293928521569615;-0.10342607897073308 -1.0327201162783661 0.13527750361558794 -1.9847336872534596 1.2066524462759372 0.70187310949901049 0.1964227454396916 -1.2881834496346793 0.21768169954377406 -2.4939111139313663 2.2893989371874048 -0.6308753406329336 0.013373009072525036 -0.9475291816492355 0.1173922588013712 -0.99767149735630667 1.6757245216730059 0.19668839174555186 0.66857850408357822 -0.4463161632104698 0.116669298237387 -1.3531165355267465 1.0051281708932442 0.05518982359461231 0.27058079619767356 -0.76559952288216582 -0.19324396869790636 -0.9350101408423187 0.25689476978423498 -0.19017572115332995 -0.39866478171677067 -0.67846863790428114 -1.0866867528628466 -0.59975368413142338 -0.86961469987078066 0.036223089367551267 0.23475299951723577 0.069801615036047912 -0.15072258738002225 0.35127827917995191 -0.505686139093806 0.43290839962650718 -0.088507594102516421 0.20418477878751273 -0.37536684729861808 -0.077875440037582733 -0.85392227136503873 0.091443204148110288 -0.048683818982163958 -0.11276318381229047 -0.37830651064932841 0.014404767750983184 -1.996229267226868 0.38362045984431015 0.33331913390612794 0.12508329222177314 -0.68669183771522535 -0.049526674697070325 -0.85278680011045827 0.30774994951042206;-0.53759120768235946 0.40796390310309688 -1.3667375572576757 0.31278955093760913 0.96197803405586324 0.57381216530096801 0.48874511631807271 0.69568802918789796 -1.002071777960158 0.4222935649139436 2.2803815565815597 0.16413685282129836 0.055030581283525087 0.85799329237093014 -0.2457717932840072 0.85412125886385237 0.74859407798214761 0.73131506389686807 0.14155243528441308 0.82694438414700544 0.76525671158195729 0.82270954288498677 0.28759501134831023 0.26859931323597636 -0.048952418384346032 -0.10326551789224574 0.88990150115906619 0.57292530674754627 0.24883882741190072 -0.26350514624646643 -0.38893026648910367 -0.24523305713733437 1.7893975011343459 1.62733516465115 -0.62530874289099236 0.17733051323081833 0.10471584876980558 -0.73192707995977557 1.6529684600000918 1.0121153979161901 -0.62251741599828736 -0.34443718622070657 0.082918502122771645 -0.82643696510389808 1.4684631277538791 0.83814413628235551 -1.2810048172381816 -0.043097531072421688 -0.11002529730113365 -0.6787642844534203 1.2775255010193542 0.26430116540273274 -0.87349824727028058 0.21700687532460458 -0.010975936981531004 -0.74304877890698928 1.3630935772865793 -0.017528619704111435 -0.27465250871681202 -0.22554141808793074;-1.1298734852605423 0.45292986366812299 0.12809246174397435 -0.39978309157748765 0.18050475928646653 -0.5413686004381324 -1.5102914900866689 0.037440959257675849 -0.40709870942030352 0.047357462631743612 0.97466551003176205 -0.56728093712498939 -0.43193114553199863 -0.5210529624174377 0.10222837365546882 0.64357128565301736 0.14165174120309096 -0.66079063458128351 0.35496848733692166 -0.41711566014486623 -0.97269825146245548 0.45891393267164782 -0.6980354348911556 -0.70334738701504673 0.45026811355788771 -0.15103224631314838 1.0062191304244286 0.26640040250018904 -0.65666823919183126 0.52075676912394819 0.91387149470400841 0.54477948010702026 0.61017996352719395 1.1422736986283835 -0.92247468081407957 -0.48120133713158447 0.75803589261710469 -0.0854729348744242 0.83450730616994362 1.7102489674471582 -0.030478728740779577 -0.34790995127438873 0.39592788913630639 0.14592606972507063 0.25040436835910485 1.8149119850214102 -0.7692398587743291 -0.38756870516038205 0.28883106317757762 0.4229680074347284 -0.15215554325837782 1.4137139650331347 -0.62492504353204781 -0.77509498371089425 0.036340599712797191 0.75806304534548707 -0.12266855085674776 0.79926104440968615 0.48567863933371236 -0.47136974711746499;-0.32068307640566607 -0.50074567436164807 1.2983763704048383 -1.7345686609101829 -1.1802757703932523 -1.0784909480992428 -0.043366389344340367 -0.05272096937611441 1.3455516968273087 -1.9581031722321747 -1.1937093738354554 -0.77060183467657584 -0.010294804903874076 0.0050375595632793108 1.3789190357891823 -1.0107989582249899 -0.54467977762899056 -1.0027793320228977 0.43457723633265422 0.013629451518811217 0.74474176826125438 -0.86922785271026182 -0.11041720892476409 -0.073789843968559921 -0.3598521962510372 0.14839764380177878 -0.9055891035441157 -0.71337207457321472 -0.065514463518887123 0.32941428956799612 -0.068463911980195677 0.42417793294418682 -1.023052374291358 0.37851923920229452 0.36726661610028383 -0.35639728862063536 0.24499825201155007 0.54325691168648882 -0.94241054197739826 1.0490926767853106 0.33331294581633136 -0.03673358837078234 0.1098418936949047 -0.11168781390969904 -0.38095436571547586 1.4342508021031264 0.76962899663045248 0.094207652381181117 0.090133814133947193 0.084909280448006288 -0.26008322321048727 1.151014457010834 0.6917452177376493 -0.35675922616910455 0.1082578671106916 0.016377457892423199 0.016563873665097421 0.79566072485240391 1.0236871677843526 -0.28914511730570341;-0.51734250992270681 -0.62970627318966255 0.56860081127324313 1.2397152020528182 -0.037640969452984431 0.1797104242192788 -0.26898919094741747 -0.63704960983985182 0.71427405108510122 1.2046440757910046 -0.18139295473423853 -0.55096369541996948 -0.22498066633975583 -0.15100911825572938 0.57429813777165672 0.33119007575418075 0.22469022116356752 0.13171244949651809 0.05657029247764922 0.3929766715937637 -0.072768086546196611 0.32407867405062007 0.87496407915699204 -0.057058713524779633 0.089232748743742096 -0.13412497279492344 -0.00044837911751879206 -0.19329126704482089 0.26452185474894135 -0.15925541266263776 0.53615768049311763 -0.38525833831600675 0.13718499330542958 -0.6967147801630541 0.31565881935194329 0.14432784578183108 0.17634854659690327 -0.10100638316450797 -0.6376117081260444 -1.2056757087572281 -0.16910772370686775 0.46363816692083587 -0.13368040789571661 -0.11367111664545422 -0.55193577970126295 -1.6066400142437831 -0.079046593523915229 0.27325987969841892 -0.16026772213660129 -0.15185852546631762 -0.29471427905556363 -0.74636402740020813 -0.24364460742837712 0.74337001972677053 0.19559793685323856 -0.61638274345264688 -0.24136179987883546 -0.12222631646280779 -0.045431234225521804 0.38462302996150433;-0.76031260275866108 0.21827967965715439 0.22190795775503744 -0.3339009285244306 -0.51925173058051277 -0.4170249534055418 -0.65139979908136236 0.25359985782802191 -0.52234811239230783 -0.66410954827469881 -0.32126503634478126 -0.52748211715049997 -0.42579421413244284 -0.5147954036411434 -0.64521678404342531 -0.53696063437236419 0.032786632357693669 -0.54102082186863376 0.086050672329709754 -0.77212399834326095 -0.85104043401351037 -0.055682412360275449 -0.0014296231601094154 -0.24586004753753959 0.326825810510395 -0.34618967336262246 -0.23425024516245585 0.0006027511302893905 0.16822680777548429 -0.28264219781466116 -0.046206258707720681 -0.2584382331836772 -0.037393025142830529 -0.010903732173563071 -0.67334604986912883 -0.13803524215140489 0.04493943635237721 -0.080543886263215653 0.18825431593020955 0.1074891437082047 -0.1974525660804595 -0.027227735166460456 0.91452641026229964 -0.19203646824897921 0.2308792142568413 0.11501359923042098 0.50005328929435711 -0.35335826061167513 0.43419299339871781 0.31635999038332563 0.4148679487803642 0.37342444536522285 0.35729659499985944 -0.70133808725867153 0.59403459725955732 0.086981423892956808 0.59644204742698703 -0.013074790817189836 0.27476589847625355 -0.33572500392473525;0.48899663550835237 -0.82761527922382205 -0.13904880348769971 -0.75122862410612634 0.27040595330385325 1.1830687686234393 0.57219866448343548 -0.59354935742048587 -0.031691370840005173 -1.7287181131236624 0.12786184080419852 1.7232336404261894 -0.32061246112369302 -0.65877677486974129 0.83376625535232873 -0.26738813231944297 0.39939836989724004 1.1233655077996443 -1.0201802560032069 -0.54850841009332019 0.55712110552311356 -0.6851804727927393 0.5274819693618592 0.51046305529683422 -0.23112939396205881 -0.23551590934018404 -0.66659726827638377 0.076524499794670534 0.26956576347074512 -0.10602886581934734 0.13337327114207029 0.073851176988717807 -0.31503132783318233 0.58224137398407261 -0.0422070544500237 0.19263720364766324 0.21333206845060071 -0.0032253935735600528 -0.13345576781675536 0.49048593499913706 0.25230541061033412 -0.32676107957327327 -0.23038643212758877 -0.045378473951042379 0.71931460035317651 0.48235208560835641 -0.046919568003806818 -0.0023321263334632799 0.17117886542621846 -0.28399716449586737 0.13944033026693173 -0.033150083949415092 0.85969360563507902 -0.045179385173580083 -0.0032991705948832561 -1.02196075425444 0.16231521441215743 -0.86426049794322957 0.47460218338103288 -0.39320486642742752;-0.93658521481643731 0.66935964000245041 -0.22232538275052557 -0.0089610583347178186 -0.27722937395687924 -0.28880633518856008 -0.66681567255261776 0.33101468974549958 -0.49278896149815749 -0.2896092773836943 -0.24514913869273275 -0.39171929010348155 -0.70211520967214891 0.33054040911899085 -1.0162842504772325 -0.385950869228189 0.15239591573840139 -0.36238401701137346 -0.23825591732426218 -0.17523912683603707 -1.0585984036562353 0.18695673124756929 -0.22909643648947936 -0.46090961485988896 -0.25905792627687935 -0.091264047815036289 -0.6904784026712254 0.12439101433376851 -0.47155897019827753 -0.068882261160423411 0.51018746754354294 0.14216763544784541 -0.1962173612794724 0.029091696191348663 -0.42524021366631543 0.039238441394755082 0.17920740562864354 0.42953049579033103 -0.059871024861670487 0.3163033546396421 -0.25290985867182814 -0.043444273742256706 0.94518360088402076 0.44045174746960547 -0.32548467806999076 -0.14459608684078337 0.26681525810437662 -0.24154981926807792 0.96432953405161281 0.65793601437680482 0.0075242777514638688 0.38889295284309855 -0.10321264950394006 -0.37360444589053071 0.59078564013390023 0.73294077402038538 -0.25014805963962516 0.23342963391130855 -0.56006126930711952 -0.36265616985252863;-0.051857887403448558 0.31637594359579119 -0.83410272813342934 -0.17327156398345611 0.87214598797501985 0.65576875330240569 -0.11094587847834946 -0.085679005301370403 0.20342251977242262 -0.0028584332518112295 0.22266230075715315 1.1477460979654861 -0.30489931057216957 0.33517344309196151 -0.31452697138425556 -0.059018827524234894 0.23826282070834262 0.92456348459275361 -0.044099500104461058 0.17876055705237848 0.043903244865797247 -0.36125436556095147 0.44846897384229295 0.61920824312903244 0.32223184177428249 0.29426388880353588 0.92026532398326022 -0.16374630249491695 0.29529051562341596 0.45572929966673215 -0.029117519334804342 -0.17431843495273699 1.5807851092444245 0.11412922520127955 -0.064353026738544414 -0.26848889419425365 0.27251759021748723 -0.62492301752304624 0.43662594306331948 0.048359161291920041 -0.54716702929779526 -0.38799627092189604 0.049840208604225618 -0.97865417134664212 0.73656671371194082 -0.31573240470970698 -0.81604337820950323 -0.26022490161150746 0.072046003497030803 -1.2273064137302083 0.51234140774959358 -0.46739887068284713 -0.28782534060275505 -0.19718886616257464 0.37279140274657568 -1.1475622173383566 0.73446009044655047 -0.3860963984530783 0.17030231180803282 -0.60710553170745274;0.36422149756624844 -0.040385030408777653 0.47127934699709406 0.97670475415221836 -0.38750446270198513 -1.1582612959559253 -0.20267504275429693 -0.44956502794290659 0.025528554703803441 1.4197265691527994 -0.80206624343942778 0.71149411951600317 0.15831335040353628 -1.2350763562482383 0.28970079705883806 2.1380268207561883 -0.89298445754969902 0.38449894514158828 0.073653767908950799 -1.1011304459122018 -0.048960116635939764 2.6102577166214722 -0.75076793838316758 0.80630420569938721 -0.55120198406740517 -0.55514794003704182 -0.039794081386134238 1.8426811808507793 0.12882362128406477 0.58597010441258324 -0.28594878287854647 0.024318501721304297 0.15171296551471961 1.163945822390491 0.63276326007487049 -0.75022213236104518 -0.11436539678896929 -0.31624712285677314 0.32970051770261116 1.1308490688309902 0.45128532777831254 -0.33057267120258571 0.016560829384154555 -0.32384377592402253 0.047495408805005218 0.42162874087303187 0.71011820969076245 -1.125531906966331 0.2088008103600979 0.17961152741277278 -0.23302425666483878 0.044254022343447177 0.56510877048949681 -0.64055571641662667 0.24580190354639544 0.15024413287027497 -0.24460476466515632 0.2964996627545855 0.75415212536642051 -0.72828315695209078;-0.031750414803887198 -0.063450019929391088 0.87445883815925085 -0.046495844078007151 -2.0583622223926361 1.0487169837225636 0.076284765811235139 0.11625684193273354 0.96307072728051768 -0.14439201125045367 -2.2725714205171292 1.1510708882636007 0.065334661383310455 0.16009112550405893 1.4987962935558956 0.43273689072756694 -1.0338036945044209 1.5700493975779102 -0.053452846272700964 -0.2063203458754084 0.51033584329226833 0.23584301012691142 -0.68488394628366955 0.76201034454599792 -0.23066995519739358 0.3174582846153301 -0.51748063343419437 -0.004561412074446396 -0.10169976213703801 -0.46832825110490384 0.12206161549378938 -0.12531632719083702 -1.7528212985144125 0.74633247162533511 0.62512584558275441 -0.79186282759936466 -0.15229413184584301 -0.79397649778553436 -1.6362903919541698 0.58571954195841258 0.71989733019000568 -0.68368560644003507 -0.029627575884039782 -0.69785851732524784 -1.1683492435665404 0.9544496696390059 0.7445669108181473 -0.66903387167895401 0.370618075343708 -0.68669514154847622 -1.4409396505772185 0.38006639675439635 1.5097736258747672 -0.27282779236351906 -0.099196623823745375 -0.58446327109810525 -0.92020629427156508 -0.22129362050132731 1.0224868949711876 -0.35622181460349489;0.22577281481020142 0.66211831068508431 -0.33438404842971592 -1.1063969574512988 -0.037053366875071311 0.69525353602836448 0.29450315093240648 0.45103303768168834 -0.22060961633020082 -1.940713771724573 -0.13196204305786449 0.068308236933923641 -0.40495904523163567 0.11652064831611997 0.17704107041734421 -1.3582881173566739 0.02721858845756522 0.12393027626263471 -0.3802321614559156 0.57850217489208355 -0.27703305501002223 -1.4855100570790924 -0.29130869762464318 0.33184548312161949 -0.098971550627977148 0.187151883242763 -0.15027051763337226 -0.64189501913765823 -0.42950499717202639 0.6871454189004621 0.69078508806584493 -0.018045860885674087 0.20229280028892052 -0.35724516788489552 0.9275514009648812 -0.1231008954841374 0.73307527521689586 -0.82015651018172619 0.16861931295111882 -0.23526382278544652 0.74506162324692993 -0.31598382216567739 0.33625334654379285 -1.5477555672783514 0.1917037234796268 0.21969225970588457 0.29395336031086389 -0.69771386176094663 -0.24224531800508514 -1.3276761009447919 0.15697333288471346 0.20208219707431066 0.39574086688499016 -0.20454389613889581 -0.1157724016577493 -1.5521289461345635 -0.22834578040527218 0.12198335664326798 1.198609885996019 -0.42841572569121783;0.61866631500165037 0.48427019968275298 -0.80447954404636302 -1.5777381313407774 -1.1434436977740681 -2.2674618255808356 0.10347660359172772 -0.1640586372339434 -0.34352978473286339 -1.78053504915955 -1.7668400569920932 -1.8664198189224661 0.6179829316705403 -1.4779475184350661 -1.4433645144312723 -0.68606825290420304 -1.6419698891615202 -2.3187155698993127 0.052170624960779122 -1.7371743442692227 -0.66329338715488306 -0.29614463228610455 -0.49949326824479717 -1.5449531765097155 0.89219695168233593 -0.77829841683655698 1.9214329045363256 0.21223218532587415 0.021593695146914785 -0.57858700828348053 0.21767233001832009 -0.16733880649582358 0.77483678532575828 0.89999255384997712 -0.37821412358969025 -0.34652820216686459 -1.0014939924622051 0.228280126643855 1.0183519370968841 2.1401756431262315 0.58924988903897224 -0.26866037757579342 -0.92717915768420767 0.47162306947939919 0.17175673770604305 2.4750830445688359 1.2809905829646386 -0.65728704646830882 -0.64684002988951916 0.50138931430675637 -0.018411519297075369 2.0542394225851557 0.7796922679266326 -0.88427951993866272 0.014061934751142232 1.1408166070864925 -0.10553198877884447 1.584524475362026 0.60525314677222575 -0.35175135403924113;-0.2025846888996663 -0.30703868803650847 -0.30153498964865089 1.1100076672445176 -0.56035359289929143 -1.1735421748860417 -0.030744719061118777 0.34899749092881993 -0.2258553024332581 1.2194235976974259 -0.25187072598393467 -1.4064370299308453 -0.22162788454224075 -0.041117497758478255 -0.39302883287239421 0.6966680691311985 0.060211747387123649 -0.96476769937794926 0.29011589819789313 0.40478775496593777 0.20708577098443354 0.7347714571043229 0.67587797848712428 -0.69954597505837701 -0.063893199474233775 0.58312849328193639 -0.039275865401347983 -0.036789651559485846 -0.23874778549364811 0.12158078158734141 -0.16546794446835134 0.32862872351134814 -0.67565931820612724 -0.74101527873790851 -0.0036450041711604654 0.55745051625444697 0.65985617246044859 0.61909241225285794 0.05006124942912555 -0.67186111017556305 -0.22916494123628089 0.1415738441633419 -0.18103383104483872 1.0856252296688405 0.31948307319085012 -0.22349539712341565 -0.27074047456457656 0.13180396171818839 0.069585781600353044 0.78900418865386956 -0.29156341026949478 0.010018612344511485 0.54412054760446404 -0.094379617900235385 0.087150992226365007 0.52200414172029841 0.31826669114587508 0.062254178142362115 0.57536721204568875 0.44780018697982438;0.5910003822427351 0.29866582383597901 -0.17029674755078836 -0.051906351071257635 0.82118154911151131 -0.78889525373003477 0.013482676584220286 0.15685945196127879 -0.47243841769887168 0.33149011506486081 1.1106432345656905 -1.1038281337510063 -0.38699863712533328 -0.35582100130396066 -0.56161349799705595 0.34431674954033054 0.57562241848299889 -0.91747928193488137 0.50281815736267543 -0.40685474414970663 -1.1974711395991369 0.72821368513835982 -0.24595219819892994 -0.36739447328193897 -0.0089812355862484011 -0.43879498238904996 -0.10779411219091767 0.50826697116632835 0.31579013177987075 0.057506258593131694 -0.055573918974874632 -0.55616629825969166 -0.23482221042802698 0.17791335699732566 -0.34850630137575811 0.036351565269905815 0.12185024388833481 -0.39638230515984718 -0.65079450879656198 0.3046411640320319 -0.50256996670495413 0.0082643601581458472 -0.049660372126411209 -0.2357655449186021 -0.4746248707816037 0.62690211593765932 -0.53164094684753871 -0.040290327625421798 -0.14164423603002363 -0.21628470389918567 -0.76096043277364855 0.28861977864763477 -0.50131914479718742 -0.20097455662297387 -0.098521269699457056 0.33794697560049486 -0.66955597141125878 0.2448176076782495 -0.38155209672705653 0.22691030643910731];

% Layer 2
b2 = [0.60731724270433673;-1.1270284789282787;-0.22966598388098425;-0.61001584406653075;0.54636795891793777;1.4639585953948087;0.28460581375822347;1.3283934117683165;0.19727714560595908];
LW2_1 = [-0.80294905502655556 2.6411610003866954 -1.2590628635132179 -1.1352880932322265 -1.5711821452017962 0.53239100849229049 -2.2953448644481673 -2.2607666581771069 0.14969203553782467 0.54185751131056903 0.8153790127190319 0.07275921560987339 -0.85133994964829718 -0.81299106798530618 -0.21068131446662669 -1.9625921596009746 -0.094586281980462608 -0.73839975099563848 -0.99910026804937024 -0.30157738868575779;-0.44639169907470871 2.3288463832913511 -0.41919852338619185 2.6882183791613201 -0.72587483831624677 2.4555279304965798 -1.267909945904639 0.038565918661755391 2.1529775204317372 -1.0696070891512468 0.1815649862069014 1.351742413392504 0.94984895093459454 -1.349615569690247 -1.044959253978579 0.073972975615819475 1.5889700392591537 3.2545259244491609 -1.1465055316280059 -0.74009175262491433;0.60261255413240045 -1.8732835109365706 1.6438273656823021 -2.6059748934904161 -0.90442920412375694 -0.416307203311096 -2.2087570937706031 -2.3398084186365353 -2.2798589375133274 2.1413646416853274 -1.096913613816346 -1.0765868638151548 -0.34447738927645294 0.015339155925896891 0.3499898419683678 -1.0467028231646092 -1.2685966371304394 -3.4170942420094947 0.90227772540705031 -0.91676832112383122;0.20290179092332342 0.71023287700465099 -0.42461796026358284 -1.0651765880873303 -0.20749196556260174 -3.0689192709582729 -2.5088637909316818 0.76295913685580452 1.0959070437726031 0.086518447185185671 -0.19924702691052373 0.5834300887759849 -0.68144109249471174 0.52292261361780912 2.0346595402815821 2.59820716430748 0.40718320880455749 1.748450163507272 1.7350757644412653 -0.35815476394351475;-0.94755596215655813 -1.6865606638719672 -2.0226782473920637 0.55636190544087727 -0.45337833541668993 1.7522821821109784 1.6385912297433454 1.0819677126883795 -1.0435937142989471 0.33359463684770135 -1.9410455736301486 0.35386981485612889 -1.5100894299248153 1.7654626806417393 0.47405432926450936 -2.2335215988371937 -0.59114314157812597 -2.9550121735008945 0.92092865553283776 1.2896815814576168;1.3701326430903193 -1.4764665465859581 1.3775327066244076 0.77081969872308675 0.0045255891254899535 -1.2750271419706645 -0.4550906498773164 2.3641251166968074 0.84883904741757221 -1.3099080358011164 1.4831431560565647 -2.0481733219618241 1.6457012806811608 -0.99092761673913698 1.2650577624841406 -0.19864317145950186 -2.4087165466056963 3.7420483322609663 -0.10263423545724736 1.7726634582597118;-0.10780812519991151 0.27319233356946016 -2.1456260095145878 -0.59462380820123151 -1.4449921653941769 -0.89972568570001688 -0.12352096888768758 -1.0656910774013117 -0.88074381417009107 -0.76582698355574375 -0.54274478658353464 1.7329014277456651 -0.84122938693057436 1.864797938883793 -1.2166049888601118 1.8686894073422584 1.6042485852285959 -3.6861335262772519 -2.1895194118337309 -1.5899018553349487;-0.20279789155892811 -1.8085413190207293 1.6745629967749298 -0.054092383277759941 0.50897768568710389 0.34603394268395565 3.9992831480594857 -0.43458409967320849 0.99292341439930654 0.36483854199717136 0.85444515139240063 -1.2889425439215014 2.2120823980971425 -2.0588403305112948 -2.4974576106176887 2.8014195702629161 0.56741990780275497 0.50948192047020868 1.5161287711433058 -0.026250086442752653;0.86063134318079781 0.79242943010271594 0.54704918833867644 -0.070348022326907955 2.1834079964048967 0.63646973073070612 1.4111635085807945 -0.28506834121791041 -1.1949346083995671 1.0249861836404695 -0.9145936091327983 0.069467162413756292 -0.24278532033780686 0.37616276029113244 -0.91297463380187227 -0.15793919737249223 0.38950038195797182 1.0325248555667874 -0.065246389097050231 -0.5164002237920049];

% ===== SIMULATION ========

% Format Input Arguments
isCellX = iscell(X);
if ~isCellX, X = {X}; end;

% Dimensions
TS = size(X,2); % timesteps
if ~isempty(X)
    Q = size(X{1},1); % samples/series
else
    Q = 0;
end

% Allocate Outputs
Y = cell(1,TS);

% Time loop
for ts=1:TS
    
    % Input 1
    X{1,ts} = X{1,ts}';
    Xp1 = mapminmax_apply(X{1,ts},x1_step1);
    
    % Layer 1
    a1 = tansig_apply(repmat(b1,1,Q) + IW1_1*Xp1);
    
    % Layer 2
    a2 = softmax_apply(repmat(b2,1,Q) + LW2_1*a1);
    
    % Output 1
    Y{1,ts} = a2;
    Y{1,ts} = Y{1,ts}';
end

% Final Delay States
Xf = cell(1,0);
Af = cell(2,0);

% Format Output Arguments
if ~isCellX, Y = cell2mat(Y); end
end

% ===== MODULE FUNCTIONS ========

% Map Minimum and Maximum Input Processing Function
function y = mapminmax_apply(x,settings)
y = bsxfun(@minus,x,settings.xoffset);
y = bsxfun(@times,y,settings.gain);
y = bsxfun(@plus,y,settings.ymin);
end

% Competitive Soft Transfer Function
function a = softmax_apply(n,~)
if isa(n,'gpuArray')
    a = iSoftmaxApplyGPU(n);
else
    a = iSoftmaxApplyCPU(n);
end
end
function a = iSoftmaxApplyCPU(n)
nmax = max(n,[],1);
n = bsxfun(@minus,n,nmax);
numerator = exp(n);
denominator = sum(numerator,1);
denominator(denominator == 0) = 1;
a = bsxfun(@rdivide,numerator,denominator);
end
function a = iSoftmaxApplyGPU(n)
nmax = max(n,[],1);
numerator = arrayfun(@iSoftmaxApplyGPUHelper1,n,nmax);
denominator = sum(numerator,1);
a = arrayfun(@iSoftmaxApplyGPUHelper2,numerator,denominator);
end
function numerator = iSoftmaxApplyGPUHelper1(n,nmax)
numerator = exp(n - nmax);
end
function a = iSoftmaxApplyGPUHelper2(numerator,denominator)
if (denominator == 0)
    a = numerator;
else
    a = numerator ./ denominator;
end
end

% Sigmoid Symmetric Transfer Function
function a = tansig_apply(n,~)
a = 2 ./ (1 + exp(-2*n)) - 1;
end