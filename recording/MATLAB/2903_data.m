function [Y,Xf,Af] = myNeuralNetworkFunction(X,~,~)
%MYNEURALNETWORKFUNCTION neural network simulation function.
%
% Generated by Neural Network Toolbox function genFunction, 19-Oct-2016 18:09:34.
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
x1_step1.xoffset = [0.1875;-84.8125;-179.5;-13.73;-15.62;-10.33;0.6875;-88.875;-179.625;-24.89;-15.86;-17.23;0;-86;-179.9375;-25.58;-30.52;-35.66;0.0625;-86.75;-179.375;-22.08;-25.86;-42.33;0.0625;-87.625;-179.4375;-17.01;-27.97;-44.65;0.125;-89.5625;-179.875;-19.82;-25.72;-42.46;0;-87.9375;-179.4375;-20.46;-28.91;-43.54;0;-88.6875;-179.3125;-13.09;-29.9;-35.77;0;-87.875;-179.6875;-10.51;-17.61;-25.88;0.125;-87.625;-179.6875;-5.94;-8.34;-18.4];
x1_step1.gain = [0.00556134862704206;0.0129764801297648;0.00556909154194222;0.0712250712250712;0.0655952771400459;0.0662251655629139;0.00557006092254134;0.0124465188642552;0.00556424969570509;0.0376222723852521;0.0569313976658127;0.0413052457662123;0.00555941626129256;0.012573673870334;0.00556231531374935;0.0336530371866061;0.0390625;0.0303536196691455;0.00556231531374935;0.0125293657008614;0.00558171986743415;0.039912193175015;0.0404122044857547;0.0274687542919929;0.00555941626129256;0.0125097732603597;0.00557394182198223;0.0367647058823529;0.0337894914681534;0.0259437021662991;0.00556424969570509;0.0123934934159566;0.00556424969570509;0.0322268772155978;0.0415282392026578;0.027311211252219;0.00555941626129256;0.0125441003528028;0.00556618542355192;0.0316906987799081;0.0355808574986657;0.0270160745643658;0.00555941626129256;0.0124513618677043;0.00556909154194222;0.0382409177820268;0.0374041518608566;0.0299625468164794;0.00555652022920646;0.0125097732603597;0.00557977332170881;0.0363438124659277;0.0485201358563804;0.0345901072293324;0.00556134862704206;0.0125490196078431;0.00556231531374935;0.0438692695766616;0.0906207521522429;0.0408496732026144];
x1_step1.ymin = -1;

% Layer 1
b1 = [2.1436550364721039;1.3530002027594388;-1.3927565828255886;1.3751856302974188;2.2114102645567559;1.544886298647604;3.4249048544747378;-0.10248017102454687;-1.5767422910210818;0.18849951213290064;0.71407728978539609;-0.8245473726428334;2.6767345015814983;-0.81272468381653107;-2.3430675152738272;-2.2638384724227043;-0.4567211390345427;0.29976074458969421;-0.85112579277476774;1.5508014590117802];
IW1_1 = [0.016608440613270693 -0.33570469728182278 -0.20268315566618086 -0.13126232359178591 -0.060708446904207784 -0.46945049072968331 -0.4847682078697208 -0.35562178184515153 -0.71864678488348266 -0.5752231767475382 0.40584161032700417 -0.22771946565058007 -0.086555942918686846 -0.21775769760506067 -0.34510659353949324 0.62137704152976025 0.052095575737618291 -0.18239413045211422 -1.0380581432015541 -0.52327789967753646 -0.24902455274401442 0.53174604007815729 -0.221856100359478 0.0083219448561216419 0.053503609651882611 0.0482248375683305 0.43502975237234137 0.14240796561302124 -0.36026076152817416 0.045420136713676749 -0.13819025820521147 -0.089311235563512364 0.17130256244331496 0.37601273162458204 -0.59567222660512253 0.29065437169523206 0.70264622524496889 -0.25583940503189051 0.045391625256530004 0.59751041480806688 -0.062997720868464793 0.25764216548632091 0.66991823011611218 0.00271274748016496 -0.012275995362045794 0.65648387024964339 0.21044962603267356 -0.19375630592218696 0.87800607602388536 -0.064848957545727448 -0.20365632789970708 0.36009413330345441 -0.23643949498487141 -0.016046517594864425 -0.035910788268986506 0.47248200509125654 -0.43267314172120974 0.33977659536994248 0.048153379065516949 -0.32559878541454007;0.032646695148501215 -0.53704165067898224 3.7581954117494338 -0.77370086355550771 -0.91803886962544368 1.5518814551204387 0.42637344268007293 0.341652084326585 2.847335866390023 -2.0458473458829487 -0.45722872425130839 1.039986814108383 -0.31310503819616553 0.59822812898695232 0.50091192167412213 -0.65332708184640342 1.3593001117274117 0.35487034415613611 -0.21700137016907747 0.76435170438119104 -0.94112025452910575 -0.62228849641923467 0.62751866137175549 -0.19685348183580562 0.134776208247567 0.38471275355274742 -0.66661810471449834 -0.45955443530271173 0.43588117699756623 -0.36048631842550694 0.12154813021516259 0.052484579684281725 -1.056786570980859 0.038257943302249013 -0.48805264875298832 -0.36604412230066891 0.19469181008391839 -0.058512256318377295 -1.0297382839931457 -0.05898323368599763 -0.20828352573368455 -0.8735985787747903 0.055558505702760566 -0.45321357623947145 -1.4905031570756737 0.48883644303641766 -0.20382644127948146 -0.92297777269763437 -0.43896924585107933 -0.15578566560776891 -1.3851356264053101 1.1951364043482477 -0.4881856590908768 -0.016613138710556807 0.22507560087247611 0.15172772365102266 -1.4992305600848097 1.011753369062439 0.57311705207102515 -0.96030074210577698;-0.26906717247549872 -0.5426286031314147 0.62897120785986615 -1.0334339236010646 0.22394285268508379 1.0487196756088941 -0.10612713564852402 -0.59777105310717804 0.17939213299188569 -1.1074133138764206 0.27728184547091 1.7946165654830724 0.16510278889823143 -0.0047262451420043549 -0.69094145804047225 -0.72746505593971977 0.55951975102564522 1.1784232307242328 0.0023265654260083753 -0.013616015997716812 -0.67206406738347479 -1.451663163844678 0.4150204257541053 0.33387043010987189 0.38546865326701574 0.21570404163520648 -0.54371753545801516 -0.64077991023349823 -0.55349063318204161 -0.23853833338265171 0.75895892743635196 0.19467842422627507 -0.26470316864106413 -0.43209263486061433 0.088181796826697578 -0.61496436895455875 0.3688016866791905 0.076032184577459361 -0.86678836639867551 -0.87407769138135116 -0.18558784146743396 -0.90899288763093966 -0.080428844979331324 -0.021335696760280264 -0.77840889417944092 -1.0065941439478465 0.49224088146612643 -0.44434870589946762 -0.65075604871699355 -0.12491137971182593 -0.4896790906120399 -0.4309429446208638 0.43593091486983543 -0.26356070714487451 -0.5421162709081655 -0.75865534035194759 -0.55360006907872417 -0.63188165124124007 0.10055529935880482 -0.88586211697425554;-0.44538222772664726 0.0019257815914813742 0.96992941094927076 0.93147037434989255 -3.0465085133612857 0.25354252739271993 -0.39902933305489624 0.10234180750920475 0.59763696266615618 -1.4363851112328603 -1.4505743252124963 0.55387593151722747 -0.19417830867205699 -0.10636991827148262 0.72191663164576048 -1.5864547945430794 -1.6059200188111009 -0.59997751362035467 -0.48209786365887741 -0.18612032402415174 0.51530665319622426 -0.41072175023211505 -0.43729598982006274 0.13722130069537902 0.38691937852802472 0.076269433459661015 1.2945481308481039 0.42294207699709846 0.2163932562975768 0.020530684869385842 0.082514567392698163 0.23018146004612541 0.89608405452319606 0.7522294626559799 1.279050722260163 0.36811258182925566 -0.37238526250074883 -0.18462904597633861 0.8879132023127031 0.14410894514588141 0.64850794622582197 -0.75499859049887974 -0.13628522990279998 -0.053339336290771179 0.96342167840248683 0.73824435023230295 1.0852373857633335 -0.11111573979682221 0.22405616326207406 0.52203722038003242 1.2068367347057321 0.23784043753724091 1.0733124557115681 0.3655689591171668 -0.020117214237121567 -0.071078177038379278 1.3592249680478021 0.3312525108342011 0.84959780262849749 -0.98431273714534073;-0.12593817505070501 -0.50616912828610805 -2.0899951305100508 -2.9648029234156188 1.0180894899166737 0.039531547933357988 0.38992880147375336 -0.0095486855752975816 -1.3664184687075998 -2.1149826311758302 0.17996016556380412 -0.45073871229197277 0.15864634187465979 0.38722308468052902 -1.6547427405539612 -1.7032263902174776 0.05114793044980049 0.16178484489366771 0.060561331905860528 0.14173496909313674 0.14518516968124118 -2.1193147343817631 -0.18817673457042899 0.096003577418418334 0.82178470009413285 0.6840916530739708 1.3561404323339581 -1.2200121218702566 0.67589506679402822 -0.041698441924045614 -0.35173820749621182 0.28421117465906182 1.0978255797100194 0.31167112954895493 0.023274934223030092 0.16981082314735813 -0.098099749614481119 -0.84115674174072086 0.64476442175110849 1.5577319945633887 -0.84711380005161163 -0.14178835716442931 0.0040704436471638589 -0.46757816735507507 0.26621697111957887 1.3920180128410926 -0.50473541916227738 0.36605102125017958 -0.39795219573333063 -0.38791411911605944 0.70562495074493692 2.2396070823880443 0.21965788205702091 -0.37592399721869696 -0.16037455680006266 -0.10441593291819971 0.78729105042314396 1.7153356970886373 -0.42579236666598702 -0.27308443609698063;0.39628670003976169 0.31272497977520675 0.42650394787866963 0.22246648044030509 -2.4915262758641967 -0.28605651222224349 0.3839752830801107 1.0210867723008439 0.18697695729060465 -0.48633927319646653 -1.4750326660606552 -0.13963919922510992 0.40815366227694971 0.7597319961208393 0.36901408136891667 0.1150009213827977 -0.60934604363330325 0.033262056655889764 -0.039864373376765294 -0.13638349087664423 -0.7775766047686764 0.060187937090992634 -0.49246075291416391 -0.17610912111524527 0.25659237100815452 0.14680380473901586 -0.61544616826736886 0.090748163119268574 -0.53413455308468727 0.20444723750325267 0.020336343751920893 -0.33096495851615093 -0.92652929983175736 0.49730881720456566 0.41542876016548402 -0.15806420045375555 1.082222500064564 -0.50205811758412966 -0.645255200000308 0.66000998474794403 0.89914990751154711 -0.40419435381552787 -0.2665384769669224 -0.056641215006086675 -1.2164080178972785 1.1673409302780802 1.4795401759738325 0.57436472250941406 0.13692769765340562 -0.20159442944344028 -1.1122852850212799 0.8156783976999995 1.2425349324312056 -0.11406196792953165 -0.044127379849748113 0.10883106792898323 -1.858071336696085 0.30516499402690384 0.93112986836824929 -1.0784224837709946;-0.25346186156533113 -0.467285832238368 -2.2439912923312368 -1.2822934055295079 1.3498554820737296 0.54720233420829778 -0.015588028576980032 0.021398235546507133 -1.9696692042330903 -1.1288825136572853 0.27479126973440277 0.92842891161434704 -0.093421979544741782 0.33829742755684206 -0.13180447656418331 -0.11733523489844758 -0.35690006448977352 1.0245031806810574 -0.23057350652722458 0.095957951779849199 0.14298732797535768 1.2991374142624597 0.34544997043593528 0.30520904502596452 -0.47636317996470134 0.20671848168685869 1.5086935071654128 1.4876450177685137 -0.24398076155501325 0.19648396246773608 0.061515669112599328 0.23861898546176308 0.94184660137540988 1.2181348245288151 -0.02829316172557058 -0.35449004885009766 0.28442417309802764 0.075696394998007996 0.87213136966952887 1.9274421143272449 0.10869991753145158 0.26323156681050425 0.27291633821477085 -0.45215660819933617 0.7474961469718554 2.1951856815154231 0.45411056221214419 0.049366735904919946 0.055500249751613807 -0.26674593856422413 0.53514604411726729 0.092022380182155708 -0.2660039039665284 -0.56380843114042822 0.034321093738318813 -0.52580932184238993 0.12883625494107581 0.56894257374036183 -0.10848981266573964 -1.3550732956823559;-0.95667315570703837 -0.67634616536646253 0.63915274067726724 -2.2800162196114311 0.58016937278682923 0.69514507519227731 0.47658615930500176 -0.40653660883056869 1.608115976377072 -1.8699251456852748 0.87735874081821885 1.3687130266671734 0.1759563562781182 0.20807457909952637 2.1135769992429858 -0.49177940931472491 0.26220549410454647 1.9227981221896242 0.0070012280943246175 -0.001699307429731586 1.674615347774705 -1.0226319285708063 -0.19213643971395497 0.3241371681951784 0.036195810021550923 -0.010508091299337462 0.7774150327953625 -0.20785724379681383 1.2172368213784088 -0.60938792674806486 -0.60188098699905257 -0.29089328048271584 0.51991598746811118 -0.999340201938272 0.64487203902517232 -0.6862858242473926 -0.11225274407374107 -0.31062729938127775 0.96054340236007174 -0.90328095744460868 0.41568340588967428 0.09735168270650553 0.33174250096300556 -0.34154060227792715 0.0077495533759374784 0.063730885899199216 0.70723223044236394 -0.19671993626211415 -0.24572775500077684 -0.61245499161242001 0.46806816994731038 0.74218691118791058 0.50319473770540823 -0.28741020068107359 0.48136614065282912 -0.94978578288257742 0.5048622986785668 0.38955399535215596 -0.45819808970129472 -1.1418563126692443;-0.23860854790928229 0.00046102610927401498 -0.44683507375523907 -1.4307915725656279 0.22024324814307711 0.024828884947612935 -0.11197636186529654 0.49892732064005596 0.40787139148393869 -2.2824157132462348 -0.085721981893580088 -0.64223971206380426 -0.37911223237063202 0.98049557272326693 -0.17430298882655604 -1.560479294031599 0.31785844254196288 -0.58557554705177706 -0.22799529031484714 0.33060940917770876 -0.95819861714829646 -2.3598579002075151 0.60289769513094082 -0.12861100885627472 -0.65161694357489708 -0.5692380004285551 0.83889403034706866 -2.2091346425135692 0.16938901118733976 -0.42294084755704514 0.2360050844523697 -0.37944782453800791 0.17889825278610336 -1.1259308381320545 0.49201280842626066 -1.0783733094578287 0.032767027947196325 0.047296326296234065 0.23046257497220415 -0.1483931106173032 -0.77529883346056472 -0.82888983914596859 0.85432347061915337 -0.28987279645656644 -0.64943238862160091 -0.90778823042936019 0.39689876624267628 -0.76331240335032302 0.25037493491701451 -0.64852834582021901 0.43074802922138161 -1.0809225184154869 0.55159091222432399 -0.000606485449654145 0.59092686295285268 -1.0987002849132301 -0.63725206766172526 0.026506036040968774 0.30556208640874988 0.47596604107297208;0.22769048286183946 -1.6624856423083414 0.68205356770084291 0.18802969782314252 0.17926766743205255 0.5551163617095628 -0.35784609043343713 -1.7243161584246112 0.08300686661299804 -3.3418250583760276 -0.070645517793286372 -0.44892002303000816 -0.081911021648357799 -1.1214526313804194 -0.52288111481663713 -2.8438234308936812 -0.59897042013227075 -0.97925544548727883 -0.0063358159946722507 -0.42997863158975308 0.14259421479911924 -1.7044827702799143 0.14410133595633004 -0.11814821991508394 0.37152868490205038 0.84135326993160731 -0.41015475193653556 -1.2147257575425729 0.093994745533891463 0.48444900950453551 0.054507603256707476 1.5434881846392836 0.2360331639613242 -0.82599213375854619 0.25938654979620801 0.69669641889624923 -0.29705159221690819 1.0215108588390798 0.31268108300406572 -0.28994277314864014 0.40118464297719247 0.66726203815840301 -0.1218503435453339 0.22260169196082144 -0.98466743197434692 -0.23048556993555414 0.36095428769451171 0.28462258261715034 -0.9176949772105677 -0.051058073498360619 0.3640137238385267 1.3407877263296621 -1.2117965070935945 -0.4335322323904568 0.60873777039752019 0.79284115816465606 0.43032857890717913 1.600120709116061 -0.27302606464738655 0.92367032742021049;0.34525503773618993 -0.8051969142718628 0.78080669048062645 -1.9313850589406352 -0.32874507105451323 -1.2761479332738426 0.79236484258543471 -0.96322146643042239 -0.041260947550484942 -1.7882902902969766 -1.5147273135389274 -2.5124821208585137 0.80299484363576079 -0.75572835002336414 1.1761596117761928 0.61527149734585362 -0.15069367885427976 -1.528888538401536 -0.4321748200264241 -0.28244048814963529 -0.19869481663778071 -1.0290578927260898 -1.4445763948621078 -0.49988021794178056 -1.1525352893045411 -0.64824311870476869 -0.79173094210721129 0.71484540099399008 -0.22569049179100778 -0.054172111277698824 0.13156068735197685 0.25179504017351134 -0.66330728296020414 -1.315513148853092 0.40218950889634925 1.0055467676207241 -0.009327229912150032 0.52603777921462846 -0.63080315202626747 -0.18311292590768213 0.37785273249127349 0.73152297625444451 -0.172959614038634 1.0613771266144585 -0.84359071120443896 0.096672589929534744 1.8397662584291421 1.0052785544780229 0.14503620337742149 1.012254942162552 -0.86097946066934661 1.3507579848411444 1.7849086947179116 0.075038608019699818 -0.28518229255856797 1.661209246855875 -1.4611288162900116 1.4714774082703372 0.75809081362915864 0.89631540222395378;-2.8874435432947756 -0.5985389080106962 -3.139748328010894 -0.58389086688430503 1.5212817983920519 0.19281360642661635 -2.0076243428813463 -0.64152870278453655 -3.0952497119685276 -1.3200443945059106 1.0135792826774228 0.052664628500075215 -0.77798248605979214 -0.85131121430158285 -0.7089160202194752 -1.5176727485961292 0.79117729829850558 -0.038887248063233876 -0.73499808922545573 -0.65842921956900868 0.14753549431396484 -0.91317088684407033 -0.019142044513646587 -0.01132668972102493 0.19739105727212594 -0.47723898623229144 0.45453949807187805 -0.66666257244014293 -0.5470489487491984 0.20458307415428717 0.70835486084290333 0.74843638909557619 1.2758888694688939 -1.1927928053576311 0.067502212074744092 0.40550410611060583 1.3781383935594362 0.27727093121822427 0.83590323813487688 -0.52476363291060157 -0.55594504557839819 0.54599549010433379 1.5308769816341423 0.76473458926270432 1.4872771532497711 -0.69579398984090535 -0.31948004023862536 0.020414762321102911 1.4085866528304267 0.78509544026677602 1.2772367047374962 -0.16753660779388385 -0.5446421809875035 0.26291909818882075 1.4881294758091346 0.2398833938000586 1.3815410061969051 -0.023102195795925401 -1.1292099334361589 0.40665626374049157;-2.9166335090823439 -0.62717092807429919 0.98071101227106561 0.98018891350710757 0.2141524128993019 -1.4967054186935727 -2.7072300293014249 -0.53529991056229442 -0.46319148975863828 -0.026494093235894862 -0.49209692899795049 -1.7925358230669834 -1.9056605716740933 -1.1817418156358024 -0.30479165131755276 -0.57736067358710064 -0.15829410134658448 -0.77948506694457409 0.41938457172308818 -1.3603238395147657 0.44676683047957222 0.43143008235552827 -0.8919072480660869 -1.5359275078072117 0.97240656799188252 -0.43349019847478848 0.30966542774791062 1.5733798758380639 -1.0768278132591247 -0.015674668118733789 1.0589192817677056 0.15893030143327519 -0.32509965971593607 1.3374313657802577 -1.3898469403657452 0.98719910349366935 0.15704409259775437 0.67340566932600221 0.24251535525520398 2.244488474987655 -0.53235346494686753 1.4274577724235418 1.5981531421466728 0.85634095676564548 0.12853272360648169 2.8183605623838699 -0.87770319073915781 -0.35053332705630813 1.5448971071708213 1.2280625743545854 -0.80115898952170883 2.1818473105276608 0.017069674951141749 -0.37560860661386347 1.8738660087073937 1.6987388975243369 0.4841367388808126 -0.28668552369045081 0.020074330726406211 0.24867189974301954;-0.16030754175190531 0.33763623337237886 -3.785510388059909 0.13138069029539937 0.29604410528255448 -1.4832664587888333 -0.37889404157007167 -0.11782076713742171 -1.4159643863470215 -0.12281342964225142 -0.32773542724869648 -2.1083429292909561 0.57084359694229658 -1.0382664487829529 -1.4286282540425663 1.1391901983458952 -0.1618799119508455 -1.6299861238056439 -0.4192944025894445 -1.2218380915685121 -0.88706985207665578 0.38213021965459859 -1.8673644494670727 -0.37905414009075183 0.16989729181050586 -0.43579830113544193 0.38800921989193543 0.10984316634016994 -1.5214005204367047 -0.43157295314518601 -0.037215281398105836 -0.40269116818699979 1.1755416092396926 0.59518082926959293 -1.1132247224499978 0.57315615363077876 0.31349445274395155 -0.033056683190041791 1.8756293263970343 1.2518307346498849 -0.36301127680467704 -0.13689141913526134 -0.53671384893587826 1.1856730560077873 1.8862040189694731 0.74499813193353026 0.5622649731013003 1.2567571437334659 0.25909473782163495 1.163337851558341 1.7721712752858738 0.44058598655019365 0.37389374942623715 0.85571445781292665 -0.04997627768983303 1.1446496480030111 2.02708265893382 0.17289135787751805 -0.22682315623674795 -0.21979521859676857;-0.26933314655638463 1.7615107994477726 -0.42727891823830638 -2.7279049145911847 -0.05067164460625824 0.81282012898130296 0.52808246018921623 1.5688063060996842 -1.3379256516040139 -1.6543067005380059 -0.34349591632436344 0.66165116764193066 -0.082987924695299572 0.85003326838158144 -0.20074326302698231 -0.039165674271678233 -0.25897504883392158 0.71201096890479887 -0.38123400335385188 0.39261025771507257 0.22315821559901683 2.2164741897894293 -0.62450890721888264 0.49065744536580042 -0.44553517087022754 -0.13085211390477153 -0.33131313558498987 1.1552307041451617 -0.27798150201046667 -0.63962752657923649 0.0091090662539773434 -0.67553414268075085 0.38644687534502065 -1.5057632718981246 -0.72702716904374243 -0.28449283671931236 0.14657612392971098 -0.26935994943034086 0.38539483641768035 -1.9103940563640665 0.072144105368482883 0.0066915059479686883 0.47120324031259697 -0.56486660164497116 0.63917992893369269 -1.4359849755848304 -0.14744574046413697 0.10374739437794536 -0.054749607676298134 -0.65346467982893652 0.53439393617751474 -0.15451360068700834 0.36538643779938113 0.45321153208324361 -0.089350020532186186 -0.7709187598532965 0.33937702849265594 0.48018342030108296 -0.65272226803540423 -0.43519728505407479;0.027374547402454621 -0.28367522908354553 -2.913441364545664 1.4038157240657732 -0.94093307019960903 -0.28392953735293003 0.26441213455587576 -0.72894849504297587 -2.6597384011567518 2.1820075190209751 0.31714382174614847 -1.9339858998624901 -0.054501375039062397 -1.0503277480075572 -1.7803891722426719 0.84632595852813108 -0.73184340299518724 -1.0850987163978751 0.3277263965269539 -0.45158149120506114 -0.40011641859466229 2.1792223573940186 0.90844109928499761 -0.79886096276188079 -0.073041956269507505 -0.37250570679326939 1.06759420673045 1.2729140297050516 0.7053887132177975 0.011525879002693008 -0.4881963375910563 -0.22268061353707028 1.50999373896444 0.16332977829548539 0.27020421419212387 -0.034190603015333589 0.38973306399687158 0.49447027814164135 1.7847474073981515 -1.1452102473947088 -0.64474662510002034 0.76086979882692185 -0.038913972823309197 0.86180923746401072 0.73579193613005978 -1.3041397651385012 -0.72628272299437291 0.32837563250937052 -0.25822025243772134 0.91290587806085299 1.2812539627349915 -1.1619172100868651 -0.55172097021066191 0.10585122223861465 -0.15608701023214716 0.39421289158333039 1.4308536328953356 -0.83326510287652045 -0.30509321066494161 1.1427417778909579;0.049051379046224433 0.062991933514724818 0.0021643576308439244 -0.23777829059385849 -0.39678150553271946 -0.1581233863642284 0.39549674487040354 -0.40687236427060203 -0.45008253667235032 -0.13109265855874916 0.6352048381323907 -1.2108433299654953 -0.092492930880671662 0.2190528775132001 1.445931161670158 -0.37078585770448691 1.2676054753624759 -0.84313409859202038 0.19241739472475716 1.4960537110010887 1.1556070864322834 -0.81133228900946774 1.0081460100294131 -0.5636168814098258 -0.98130742673410365 1.8382182449193867 0.19765959857265461 -0.36151373619785115 -0.34651266631402899 0.9844685763598755 0.28719554918806117 1.5946722723711633 -0.031342058858963621 -1.1670939236275015 0.22757463297469666 0.65974180969332352 0.27426552494526757 1.0152929675459113 -0.41539210334834747 -1.0214919626565764 -0.36312814860498588 0.7810487523419537 0.37508994823322467 1.0585101201972358 0.3127271911242922 -0.91083997100895153 0.21509710334989415 0.38358477334513885 -0.022281736996408921 0.60708212476080681 0.054323843213275533 -0.47487846614107415 0.13549739405339503 -0.27672494120981295 -0.21929731389499468 -0.21110237062397721 -0.15956330327036242 0.048332131406393558 -0.063344370452741078 -0.18721743077251829;1.0040294119922581 0.36146275830658531 0.56701921851039294 0.27375618929434692 1.1788899033978142 0.87298559164851663 0.54083057075615615 0.72919321741307319 0.36090773414613331 -0.17215632389557803 1.2547713172687169 0.92717238184728601 0.43583669796446617 0.31226816374480237 0.8576182334595025 -0.71822688328701878 -0.17320482812247334 0.76396255507405175 0.23508633404780732 -0.64633417602404852 0.50153912654003185 -0.73608767863557467 -0.31441262187341007 -0.059410486785872692 0.65612598504434205 -0.56778045376781205 0.24209316165562797 -0.67218127268547123 -0.01264411938062325 0.031570653665039354 0.090712552834652169 -0.5454260104811145 0.26633369256013012 -0.17445313196085033 -0.076356714412224802 -0.28711303064044952 -0.036533874729977309 -0.56751945585623009 0.50923180439228044 -0.38673416535782829 0.061793521181679231 0.2040820428861122 0.43550567028867693 -0.32632761938411092 0.5831519975055659 -0.55916146562279645 -0.22515242223502385 0.35983658771242255 0.15024020472170438 -0.40196632624844109 0.69555643605550233 -0.94191346436510093 -0.9321174637666424 0.060665974671694253 0.54208315337307633 -1.2832271760103877 1.0246206685247312 -0.24677776091928189 -0.63014061661281473 -0.043627003100436164;-0.13313958004526449 0.62572984668593645 0.51529419860676673 -0.83484192479281072 0.99690824935043154 -0.25967132710409452 0.37649415863699148 0.83833869559165231 0.15806744940328532 -1.5912483520217657 2.0908445872573842 -1.8046698752827524 -0.050949203557572986 1.4865882299440987 -0.3997735329038381 -1.7955403627885589 1.7280471764216696 0.28641532058362634 0.42621931051615014 0.80623552696473932 -1.1089077433322219 -0.30518287672073741 0.59539370612434628 0.81147448086064811 -0.23348120732829056 0.28036294408427315 -0.35509712457255077 -0.50768907729800017 0.077367705436612089 -0.10003704715193892 -0.39446228428662133 -0.38821054088275364 -1.4445827713265049 -0.059133365156869344 -1.5143452383598732 -1.0373782820778441 0.081153601802200395 0.081415213621776797 -1.3394074629967079 0.19498781780228674 -1.1611682864719413 -0.04983951637968817 0.6560365154815514 -0.047754886589166871 -0.25153338323494079 1.0402339465569754 -1.10457816633065 0.35698589520546575 -0.60916783019625098 -0.26314224952758797 -0.014854281982222134 1.0726769734380475 -1.1269913292274887 -0.32130122572075176 0.16915108763151893 0.19881983612908641 0.22805086572646524 -0.06234464194379373 -0.59896651970135695 -0.13893922953636187;0.40853415455697578 -0.22973892987792782 0.40516171922598859 -0.19371582074098948 -0.021153738126926377 0.086409337563943409 0.021957934988641601 -0.53806165921055937 0.53388202013172381 0.076091380844075504 -0.058019708842153045 0.53223848981100419 0.39120155103337179 -0.64267281390553999 -0.58939327127949126 -0.094343285445903341 -1.198244652048821 0.37660624844046858 -0.67595521329416886 -0.66305286627557247 -0.38025822666401965 -0.15536840425541798 -0.59936461385486017 0.66010382491924346 -0.46624052518036835 -0.13536808439200684 0.08829000050894445 0.047853222312565634 0.78000515232529599 0.31930071934924553 -0.88642762790453267 -0.26134963643758624 0.93068539196182576 0.13998917327631483 0.48277357971105866 0.053526040968932168 -0.11877430811380668 -0.45191048464364775 0.28196064395710546 0.016408179697144611 0.43522761491734441 -0.03933760930567784 0.37348379482139671 -0.35745261717869098 0.14495669277949369 -0.216299894452708 -0.29458106096459996 -0.077614046967001901 0.83350125914833639 0.24995842412187316 0.27996740557949407 -0.044361248562031559 -0.67767711781014384 -0.16076979034379663 0.77730597496010112 -0.060466854699950175 0.5068736589691365 -0.090491859396053531 -0.44392367271710653 0.14718921967461193];

% Layer 2
b2 = [-1.4267044867155061;-0.053708581959397539;-1.3436013306275771;-1.4583392266458508;-0.067898133529697452;1.9666059938107414;-0.021484292292713918;1.6490826988782072;0.81238061333694533];
LW2_1 = [-0.45036318209079362 -2.5685439563925447 -1.0587321827510487 0.75621416777823625 -1.2386614127877165 -0.29602539610568845 0.56874884969748907 -0.55672609280773544 0.43282111608209672 0.18318757082110426 1.3519827625266561 4.0878276845111881 -1.93124530765442 -2.9044693573688538 -1.2522454933551681 -1.3700544776139203 -2.3271698486459291 1.2107534757026241 -0.15370942181996614 -2.6269110337127257;0.28097641682693381 0.34251602714971352 1.3322473874315661 0.36562220268985623 3.3019814810841148 -0.15017959637555137 0.67458487171330206 1.6425460602417701 -0.055484385399938253 2.9106283293942679 3.1033511115622718 3.6445199385361597 1.3913097635168343 -0.36594771165771001 2.3377250773095 -1.9632336189910049 0.30691572406792045 -0.16036807506343392 -0.01104095694324761 -0.043931283940604422;-2.2844592280805269 -1.9127549926708758 1.3921381820532956 -1.6086913749180993 -4.4115783617758435 -1.8130091523049106 -3.0038703378662586 -1.9429086386579526 0.38508441251207254 -1.6412497229798644 -1.7765516605129541 2.2118810903875654 -1.6647021786091556 -1.776574980472859 3.1849424758984508 1.4658074572225632 1.5981855389802153 0.48107128757684053 -1.4511397634431902 0.14103215296990004;1.1357393430893359 -0.49971351844804124 -0.13017871660678992 3.2392695543699586 -0.38994395865125964 2.7723791290195394 2.0926144930910131 -0.50039168968634973 0.043324457510628571 -3.5569668732330677 1.4681156418568768 -1.6914983357640543 -0.83827818741946525 1.2225582149451371 -2.8700521027055741 -0.19632519500220147 0.70959512859970153 -1.3058789596548916 -3.4119391581717702 -1.547539266843923;-0.063213909751063613 -0.78854009308291284 -0.67690626981530433 -3.1297464621217044 0.17826720864654058 -2.1879428538142398 1.1692126139382499 1.0373633110566853 -2.6074733893347886 -1.9705095838043063 -2.0042224776599364 -1.0149686968667582 2.4937967622947754 -3.467241275185176 -2.2457817032856027 1.635300055553621 1.3165268254250928 0.96154215339565352 3.1311261403606294 -0.63521696187863508;2.1672860122858721 -2.786870011840624 -3.7140208105000236 0.069597145716009126 1.02985589084278 2.35539000010629 -0.97013811999397337 -2.004190189899048 -3.1636169526959814 0.45879534608764361 1.0815130432738682 -0.83902799142835904 2.1610542545914986 2.3821988223687991 -0.91689097093326588 -0.0026119196076969352 -3.0544626452462138 -0.42633828159983878 1.3012212080666024 1.4966748587240619;0.025171269629095071 0.60482697121489126 2.2126986676323237 0.76191937634478557 -0.259429861129088 0.51850753436979857 1.5507316090023353 0.3460412478679793 -0.80888473858582532 -1.1410116298022666 -3.1148918456948342 0.38983333775279516 -3.0280276819070759 -0.76051969734710079 1.0431986954692771 -2.6135541283153483 -1.9150158289708508 0.8206441187612018 0.16735141938611717 0.26023712816782574;0.8963270565585133 3.8385788573673825 -0.40563028460283673 -0.0065524157304651569 -0.39672399712471951 -1.3834200881904131 -1.7240433646406557 -0.75876041917214954 3.3624836823618445 -0.21710522915552605 -0.031020869913639899 -1.1679221183848836 0.57239870138258631 4.30278612229288 0.72533382930713752 0.62858582127573592 4.0172858999939223 -0.056613507105910454 -0.089406220766562322 -1.6995887628696071;0.7260540939480391 0.32228991071866886 2.7257243459626963 -0.00080551401245521938 1.6586073414124156 1.2124354261457886 -0.23811593465070671 2.2369777147670913 2.8832998368073648 2.4860960605298454 -0.72445347135773874 -2.468378418807943 -0.53764533269936088 3.4353430645234888 -2.6417614927445268 2.9229608266292653 -0.71491277457279601 0.19246643374713693 0.055951138142891668 1.3486347513055124];

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