function [Y,Xf,Af] = myNeuralNetworkFunction(X,~,~)
%MYNEURALNETWORKFUNCTION neural network simulation function.
%
% Generated by Neural Network Toolbox function genFunction, 19-Oct-2016 16:50:51.
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
x1_step1.xoffset = [0.5;-19.625;-38.9375;-5.02;-7.32;-6.36;1;-21.875;-37.375;-8.09;-12.43;-8.02;0;-68.6875;-64.5625;-8.9;-20;-35.66;0.6875;-86.75;-175.9375;-9.77;-17.86;-42.33;3.25;-87.625;-176.875;-13.87;-23.64;-44.65;0.8125;-87.375;-177.4375;-14.61;-25.72;-42.46;1.375;-87.8125;-119.0625;-11.72;-28.91;-43.54;0.125;-86.125;-177;-10.53;-19.96;-35.77;0.5625;-87.8125;-126.8125;-10.51;-17.61;-25.88;0.1875;-87.0625;-178.1875;-5.17;-8.34;-7.99];
x1_step1.gain = [0.00556618542355192;0.0398009950248756;0.0412903225806452;0.145243282498184;0.173761946133797;0.0762485703393061;0.00558171986743415;0.0352811466372657;0.0341151385927505;0.055005500550055;0.0630914826498423;0.0510073960724305;0.00559049615653389;0.0189349112426036;0.0160723254645907;0.0467836257309941;0.0537923614846692;0.0303536196691455;0.00557200069650009;0.0169941582580988;0.0063872255489022;0.0577533930118395;0.0534616412723871;0.0276204944068499;0.0056091148115688;0.0174386920980926;0.00566672569505932;0.0443066016836509;0.0489476260401371;0.0267809319764328;0.00557491289198606;0.0161861406170966;0.00564573041637262;0.0351802990325418;0.0439463854098;0.027311211252219;0.0055953838083581;0.01548137397194;0.00683030949839915;0.0367849917233769;0.0355808574986657;0.0270160745643658;0.00559342772242615;0.0164863472436888;0.00686253484880978;0.0402090872537193;0.0459453250631748;0.0299625468164794;0.00558366777176758;0.0137634408602151;0.00654530578850481;0.0363438124659277;0.0485201358563804;0.0345901072293324;0.00557200069650009;0.0157016683022571;0.00684491978609626;0.0446229361892012;0.0906207521522429;0.0518806744487678];
x1_step1.ymin = -1;

% Layer 1
b1 = [1.1642330742556799;-1.0475075832863328;1.4098780579114074;0.51178242301418886;-1.0061643966604492;1.2557017982537377;0.35298108209320783;-0.74945950925641436;0.12075422925525382;0.65994723472028216;0.085573071059446282;-0.031103235918749091;0.50930652557982448;0.25586135369139662;1.5721951551216946;-0.39353364471349345;-1.547157326959558;1.6660327275112221;1.116156836843142;-1.6308254107101874];
IW1_1 = [0.25183769169115322 -0.24669310350297388 0.11101569677946682 -0.94227430971908765 -0.48240051063269079 0.50204410170992708 0.68208952343569584 -0.039153398077572142 -0.16734118981846438 -1.2514075599385799 -1.1629407765307855 0.32713424812288494 0.014533111454628532 -0.39580784585127349 -0.29137876502630461 -1.093504558340427 -1.3217159331747286 -0.060950455044907231 -0.37342108139386487 0.26719128569313844 -0.29404927651218249 -0.51800126592910234 -0.50470643995485653 0.053491156463436509 -0.20204637604753151 0.15037512849652887 -0.019529065153448374 -0.27610738645241545 0.36263127167433912 -0.084723038745776746 -0.055519386554153047 0.37781394794567819 -0.5408621328202573 -0.38902446188764817 0.83832280283515215 -0.20413654747599455 -0.45902430797262184 -0.001157409523760645 -0.72945448203202123 0.89987972259625393 0.82969095424441397 -0.35738496856613178 0.22922743672543622 -0.46103414496934408 -1.3349586020014939 1.3465571970110619 1.1217907590192906 -0.3845673545122521 0.011433965493356263 -0.12641208895472755 -1.2418593731437555 0.78722822342121712 1.2099981694395945 -0.27291419613804146 0.15762866951498383 -0.6335167542388962 -1.3191466555204574 0.71451586179376103 0.75525233823136095 -0.076079243075701047;0.22711196899835009 0.18965843398451632 0.25085437930604942 -0.097538509775871529 -0.011917992336207925 -0.07060452883245065 0.16810763542133464 -0.33223962721634426 -0.20219587975208758 0.4116968624212653 0.52901465861011132 -0.076514613101115111 0.0079723127880900468 -0.15441104671654876 0.27377589007505676 0.47577513864322291 -0.31152030421532773 -0.31878004612436062 -0.70826311416897081 -0.0085059957393999498 0.1601710966677726 0.46151369180034241 -0.44027801525889443 0.25081814104396116 -0.47654358675065905 0.1991002887340835 -0.10256248036474006 -0.14783620876330666 0.19434249504889006 0.18612217756993715 -0.30489120585222335 0.23744383421069101 0.15960569079077608 0.093097098579073292 0.30650492153460629 0.26714263576151542 0.11206053239977601 0.32004567506837495 -0.33760734786862862 0.052858869258644928 0.39253561325521308 0.17013032766152072 0.1008352821154368 0.085613254409534822 -0.068427317680207184 0.3171263637835427 -0.086890813339672052 -0.11101698073590958 0.30527607709038623 -0.088141711224251088 0.042369363479303104 -0.26797815282689141 0.12555472038314516 0.080040965519376339 0.31253116017245347 0.20502423146475204 0.071935025818112591 -0.57218939343597786 0.26123617487718215 0.12989982975214745;-0.12848310340850613 0.18380345649608035 -0.18950193526348591 0.45391309269927793 -0.20488207257115876 0.13558154679129331 0.19165294372412384 -0.22543017749617017 -0.17457641298727591 0.8467987116906619 1.2116869994196295 -0.31671728947061306 0.077788017904481907 -0.06578410070999062 -0.30279342795402597 1.3406513329242771 0.55760767744211637 -0.37480366281380711 0.0051092166554371123 -0.14253816594143479 -0.51652161521163276 1.1738737653926181 0.64368196957680268 -0.29195678210678999 -0.055099881749266832 -0.15429592075183529 -0.16449860130594299 0.91198855678139756 0.13803948780131436 -0.26628351840969383 0.54645265000435284 0.098167349455898681 -0.15088787051331179 0.32110686935486388 -0.27466842383269552 0.15730479852701246 0.36966254897310741 -0.021488174674825552 -0.67601612498822983 0.22203085543836332 -0.85148467927414762 -0.15411092363710138 -0.5445385435048854 0.36527431498927759 -0.65674582624859734 0.046493537128399397 -0.57833888598271244 -0.23696666232336241 0.03487488789610723 0.16143637010747669 -0.59091298047307661 -0.44720647069407288 -0.099965818855590929 0.077425162275171766 -0.59482166669050018 0.51797458814948028 -0.58349951038210235 -0.49612414095963098 0.15833209302347259 -0.018054426452978785;-0.3468446352282672 -0.011176147357361145 -0.64250758485022819 1.6188499409324411 0.28130830064500856 -0.097995540265205558 -0.042423150957872705 -0.31416290563652488 -0.48463640097735761 1.2155354016438269 0.64200867917166704 0.11384315171842098 0.16459942480469042 -0.015429604344927786 -0.057495880010186073 1.0848364891751123 0.91723024826192778 -0.56920145636311403 0.08179260993626955 0.012186351857993293 0.38378166212986736 0.45984115393574637 0.69814189195047949 -0.11183249281675571 0.34752254673317506 0.050167058390943618 0.64634551195753565 0.045938038927675909 0.12091924329759282 -0.0021762026869701643 0.131581887324804 0.074697946778799998 0.63932773906537743 -0.65350813387363016 -0.14960438391675143 0.077504756322663654 -0.021182549632156246 -0.59202348025417206 1.1832162300511384 -0.90759748299767828 -0.90162745106083131 0.034953791562514221 -0.2117762732997284 -0.63592957188341714 0.95974705392861137 -1.5143107969466127 -0.58513241481546474 -0.13439217320607483 0.14727327535335422 -0.53857539104957897 1.1393426315471928 -0.76919645614996379 -0.29824150649807069 0.11030684934645167 0.3011533108021352 -0.86285346982764199 0.97677875932243841 -0.67206152989652512 -0.40524455766982226 0.29403316684833047;0.4363027868019374 -0.44625633498330836 0.053020966009395307 -0.49302637458463422 -0.2537481238454205 -0.06478578048394 0.45966151760898177 -0.47577691990789084 -0.0036983939595299073 -0.7788355669216962 -0.083029328903305596 0.21742697684608109 -0.064854784338343088 -0.22578706606042226 0.076659397395932 -0.24267657785408889 -0.75149139632969608 -0.20287652754663379 0.34823829340311796 -0.3557635301506159 -0.29559228649664737 -0.6972597716052521 0.088704335000030707 0.24059758702107162 0.22108563043853741 -0.38471133283895842 -0.40760106759570341 -0.5629931106347158 -0.01836561453096994 -0.056893817609907922 -0.25952551890869929 -0.20589164342881441 -0.42062472322406164 -0.2747974425857666 0.026781718697738745 -0.30047503440178225 0.00068873228011513254 0.23384996094680438 -0.46339710960984493 0.58786678355255106 0.36702768657537227 0.18654371735470859 0.1763538551860466 0.096058754597963814 -0.59673803434285666 -0.014147020342718296 0.42415932721994892 -0.063607594048256097 -0.37225132855609999 0.33175920285347082 -0.22869442020143077 -0.23828616848588652 -0.0783882389104536 0.19254185341274577 -0.31104833438481522 -0.057504342981617218 -0.28181282502748456 -0.25219805724239225 -0.0083594608447067342 0.11002400860074266;0.020932326323465394 0.1976347702426943 0.40194387141910909 0.25711559262199435 -0.29453836196268418 -0.47708129413909178 0.36873873138964691 0.60495908131326293 -0.2596034556088313 0.7314360600811316 -0.98295894884553103 0.25610716572636522 -0.19726993855621219 0.47112498864708585 -0.054195357863819987 1.0342496188488552 -1.124553590901143 0.14176188840001205 -0.029928278169324397 -0.24174178009230352 -0.47981624836017051 1.2661294961214906 -0.67062611538153349 -0.19799700942133502 -0.048170956229527939 -0.25456186214033716 -0.39103571469848042 0.38167089939101434 -0.21207109312627243 -0.21573011615489401 -0.045824030683278956 -0.64180641584924147 -0.92830667524834665 0.63192837699448046 0.55192519323976086 -0.023859493418581443 -0.24567626502123957 -0.37774251790305813 -1.1217392341269428 -0.086599754101878007 0.28362832973044316 -0.47014628140788595 0.067999555859993357 -0.34431676248599496 -1.0208344837269605 -0.28323813164640482 0.33700351109702731 -0.27327060667281672 0.057268557115921756 -0.02161306186798043 -1.3188096736971975 -0.28908470889272342 0.27429506962200079 0.25950591906445453 0.11045649690972789 0.36896112550125149 -1.0322984588426238 -0.459171523644266 0.11141051205159809 -0.18947174338975836;-0.11216085242385336 0.42515940254580609 -0.18860210287724136 -0.065114038821439624 0.35874680852704444 -0.29730484572469212 0.33356590636785705 0.37822006632418587 -0.23159059757711403 0.15537792754484414 0.02218352830617993 0.22441170444868175 -0.12381424846339106 0.11392964191643898 0.059889087842086977 0.022414825575912043 0.38188330787804214 0.011166108054280435 0.19429270993328701 -0.25497743051021116 -0.30507453656095945 -0.35403939147430324 0.28667512840419623 -0.34388099835672276 0.32580313198805427 -0.48316763646005345 0.10280003696369143 -0.21818815249265908 0.11975445160211548 -0.33389697011895381 -0.27287895131878376 -0.26163137387389501 0.11478163680176853 -0.23544262881735964 -0.38892366667385414 0.27818375377858057 -0.29921767546809053 -0.65809683155922227 0.52864652829925785 -0.75953150312038087 -0.10694241072703438 -0.062983086947612163 -0.23471806089715275 -0.40992275519995885 0.49117057020578231 -0.52119253289130141 -0.18083640026207579 0.084701078269227445 -0.065960218681839322 -0.30051430807026991 0.72314811128232648 -0.26746433350581023 -0.89047085729932329 -0.036602807366799002 0.29851326479424478 0.38671497644719954 0.35735939522353311 -0.053290740226634284 -0.18586655579885225 0.054791483143668301;-0.056475487775690426 -0.71929305354769058 0.097535294019161403 0.37325178976753753 -0.84850271344618766 0.14262139636133592 0.43525166704932811 -0.13091926746738908 0.16551007332282627 0.54475200792203349 -1.0566858432927904 -0.1128467832237004 0.099192620185381983 -0.47373669790312561 0.014866937128298365 0.089025404954737819 -0.83227178800147572 -0.4699567443505519 -0.34778848533086604 0.093119853117155607 -0.38947974605301272 -0.064954161236741165 -0.45287165196062829 -0.035553147262351342 -0.16601122396554252 0.92216182149170012 -0.29383728140344284 -0.2499177683018631 0.2784605018566455 0.42177145892200496 0.27580463250573273 0.78935802675519817 -0.20899333242787632 -0.99491931636816622 0.46060349968706216 -0.20451357879329893 -0.086996144275782575 0.45213020092152323 -0.0040439068242324122 -0.61104159908141675 0.59462454082590566 -0.27259622569862108 0.22974714887780642 0.84418184898857007 -0.55943067137944624 -0.8544052803073886 0.97950512441173565 0.33827118650704674 -0.11352948009878572 0.23909486490143717 -0.14303780937703003 0.090576160194473926 1.1077172024063351 0.37567880947082027 -0.37241947000398218 -0.33551038776337172 -0.71356906394111663 0.38421575844738698 0.62790991705072907 0.16336020730651823;0.3652238694276207 0.038998935447840381 0.041551062337050526 -1.1372357075314978 -0.22359140834516542 0.38070821616585471 0.058004281571494162 -0.14255764020274869 0.12494970549141277 -1.0636388916004689 -0.67715281732128907 0.16146238833659565 0.037681677340911199 0.034236396184957753 0.13691037106961129 -0.83966009236914918 -1.1590013209141761 0.54897687145300367 -0.089774731685427267 -0.33437883050163852 0.51852125991601261 -0.91971651471125682 -0.76083500385298763 -0.14260147458105624 -0.24606231470203535 0.052045992989502902 0.16013413647706998 0.23553319710726278 -0.38746717144652348 -0.45113105824237337 0.12379186195850259 0.060074224124995114 0.7367515200029302 0.5852082713373572 0.20038159172267181 -0.099790478859382692 0.18384057454973035 0.060566971992416417 0.58366278024859664 1.0755938760986841 0.19871456197429468 -0.30598074970062678 0.43445709814699718 0.51695426152201862 0.89413739570146933 1.4651878044447688 0.58523299945502583 -0.14032225983572394 0.1381936581057325 0.55636139619957536 0.77308489262783597 0.71832506965203813 0.46734929504082845 -0.026133843153401667 -0.16950101546426175 0.49453897222079624 0.51750533357013906 0.29294286745356102 0.82894371494899843 -0.28401558105858921;0.7175652756874904 0.65251923957057523 0.32116591544071288 -0.025630102880105515 -0.28755084724489693 -0.33745535352743189 0.23139265495754985 0.15882532261855756 0.04417271105970632 0.60361801461130749 -1.176252703519997 -0.29419686538962009 0.22348191317030389 0.25487193064285879 0.084572471428124046 0.40483436028036068 -1.2144857998367202 0.11860656827284546 0.066464899361072541 0.44814258895782444 0.37230826665843458 1.1512302511722292 -0.79515212320359163 -0.0060464968911002901 -0.18200013061352333 0.29824861210948794 0.39492543752928627 0.73449186698314228 -0.070263624519694548 -0.066537478704148972 -0.16964414316787124 -0.18831373738280319 0.63611249826130556 0.17520708677204441 0.93063435251708804 -0.32933339060826206 -0.64259972018843314 -0.42304397542760824 0.61535686411523105 0.12279338721159865 0.0045462975845237483 0.27513756128984329 0.17583323773523754 -0.70878317258959567 0.86438288586159218 0.49290653922911387 0.53052170292256107 -0.274231296169544 -0.66485118482587091 -0.60769398125969776 0.14810739002135276 -0.097752452280302632 1.4301293967155169 -0.69615539578632735 -0.41556582123203073 -0.29013349387073567 0.46570572613464872 -0.18217610052587715 -0.16985701507779 -0.48662961087166823;-0.10835354428910553 0.028358248149991067 -0.22340514575411535 0.48863687339323292 -0.12813505824842208 0.26490830690567796 0.24471443744562124 -0.019042167105721167 -0.21009209029812137 0.5193138806531461 0.25985774112165322 0.36949159710699381 -0.024187039052960761 -0.15414062656546998 -0.12813825253839134 0.7876644357730227 -0.10004664248242197 -0.33548045870030341 0.22687923637644003 0.022271640194406288 0.22518085021348397 0.5332150123635867 -0.11739913104433487 0.26217641175259876 0.32534434627847858 0.096774288154677368 0.38139284105232674 0.19813307926073656 0.062525784690319788 0.1001319839624492 -0.18049743611516456 0.37724200966597715 0.43093367266080967 -0.50189149101898556 -0.4414355578066933 0.24347242270270342 0.15922092706237218 0.42469884697168098 0.10699157501357025 -0.110297843541244 -0.161572339778568 -0.041361891979405131 -0.4415322210105358 0.18441652354938654 -0.009890690117492924 0.20278806808406938 -0.68160029557260315 0.30052734813742082 0.2100612276111829 0.17028622533712884 0.35134525192440497 -0.074635032555223635 -0.35865680125224086 0.1289422322467268 0.057853493530988558 0.71491331935004898 0.32673683139853332 -0.0052441025189440688 -0.11185444841055849 0.40214899947681176;0.015547337771510291 -0.18175890739997458 -0.6807485628244494 1.2556630278867473 -0.47085494091182012 -0.48560375891158247 -0.084199734456747971 0.15476647284506848 -0.24834084795362404 1.318830510774115 -1.213636870819931 0.44528207008864856 -0.18209284369370154 -0.11819367153486435 -0.17935933623786535 1.0041974589712794 -0.91689357549075612 0.092654026833179318 0.10719240374393929 -0.16923253723313772 0.087445234121558274 0.94476804321115793 -0.46145334100256225 0.12986852946487784 -0.25150221444993975 0.25329208363571781 -0.021019152383797042 0.49219557389408386 0.090263036874793673 -0.14748676684083065 0.21982061076716911 0.40606483043828545 0.28666743996910271 -0.17558217858513253 0.52634029461038301 -0.069652523209324149 0.20501394796109407 0.39540583293254972 0.063620556903395631 0.01316656947148123 0.58288000369088266 0.051079202483424131 0.042562253507565706 0.60299203019798431 0.069851149713320404 -0.95478012202514817 0.55160264894631006 -0.25273186748268039 0.10718099143269746 0.40503090160069971 0.29700813585332203 -1.2785331719084498 1.0048307761971893 0.35802524011799269 -0.11204787251539386 1.0261931253972816 0.15905425353965913 -0.62503279047673954 0.57508283110940484 0.42206260146610464;-0.13683240748811459 0.018135278854384401 0.028554779217445411 -0.24708895661411268 0.18572643269211531 -0.16898131813237047 -0.62249908000809773 -0.2356438387327435 -0.16311017436930594 -0.59184767951194017 0.2490171796177568 -0.24140615245951874 -0.48215560030618781 0.19324002525295644 -0.078945071612028045 -0.08200473163384106 0.44475285186620228 0.15095183471746382 -0.68407034078772577 -0.05021860778638685 0.42138829181438342 -0.134585794801935 0.0033564174546803294 -0.018577267557775161 -0.2378811658675031 0.34311743466247335 0.23961446656616137 -0.13253421905094587 -0.027480476849710583 -0.063627007077777659 -0.089282192532038451 -0.04382095202283634 0.3127305495874273 0.19373277484778695 0.19836178223241679 0.049421730815751894 -0.31402497701852583 0.10735617944875339 0.4372362189217 0.34968837109518941 -0.2495161473119489 -0.21381704703122961 -0.3430749471727923 0.20543449203655384 1.0301344957918943 0.15844027234051034 -0.42215540662255063 -0.24129796606112253 -0.257245146336821 0.18101218881378231 0.88173676230472009 -0.26841630253316012 0.10053080113903705 0.23124011743903497 -0.66402667828366513 0.3351382742773118 0.73926049701108354 -0.060596634077446643 0.034371942885351087 -0.24060495820755765;0.78236420907519855 -0.24339946402373239 -0.28082033208893753 -0.17151772094827575 0.21919280834674243 0.48375784141234912 0.62553683746793198 -0.34024271933258071 -0.26556955286384026 -0.57125788020307122 -0.0008865084816107871 0.087042707897526522 0.1121268087589803 -0.48250458103308136 -0.012882350863358457 -0.30315522303554249 -0.38994653541616447 -0.40430288927798441 0.58063405294344594 -0.15053067977994822 -0.3024488992100991 -0.40965337480219416 -0.12935624579924807 -0.19346849762164139 0.23904008854095585 0.11241135898048021 -0.31907357161754013 -0.029718134298190195 0.13838617461549274 0.17756149114900241 -0.19537942986320733 0.31542481952882512 0.053837213770362498 0.10484395245863998 0.047567445343704107 -0.16178530986171957 -0.063383472758658826 0.45022725236519162 -0.022144636242960165 0.43982670822143399 0.075704585317268383 -0.015251763215997732 -0.78399920858417993 0.93989117778357001 -0.1740186382969155 0.0075226320408632794 0.016569543770952745 0.12439169142511622 -0.47408532318265262 0.9508059067120469 -0.23260427374370424 -0.021390002851975641 0.39973022003489606 0.41152112592540629 -0.57397444527956953 1.0749855978913225 -0.63943186170742461 0.17819755908065285 0.35008047670576004 0.60076882028487388;0.17860852799243898 0.25570534922360144 -0.2324117094681902 0.17375458929662863 -0.063459866953142138 -0.57144403374625052 0.096508684348008147 0.59838093094558586 -0.45369172685110942 0.097832141986261056 -0.080620088172418516 0.0025170625723793185 0.11939501802600157 0.49805802135719396 0.24265635134006722 0.70184287495434095 0.16462020006277669 0.18140651657894197 -0.14592221163251146 0.10915927268704309 0.52171458791135916 1.0183040160314434 -0.27002174607092594 -0.071296754082167471 -0.20819422514167976 -0.43757314406246384 0.41058152916551116 0.65445047942359913 0.10875324996025107 0.095676638811377723 0.22044483969729592 0.015144903604447642 0.46808716049915705 0.8553821921414767 0.26932486221322749 0.32284360783557203 0.070302765664952332 -0.2575906669208321 0.48470472468531745 0.46118692039430076 -0.015175614357753423 -0.29261643743472499 -0.14144910756769674 -0.26805566992416408 1.2776754577275473 0.4472923643626176 -0.19863975010190274 0.01689945071304641 0.02533291056020744 -0.62007225471036753 0.84721476216853653 0.11646425104072895 0.1633652187457369 -0.17008617295822134 -0.087883822018500063 -0.10536327687012115 1.0559110813446775 -0.49380048542925165 -0.40574199069133066 -0.046320101614181437;-0.25343439149434221 0.13280475153099253 -0.30344357754676243 -0.043454283375398882 0.067263303550078909 -0.48047671682727416 -0.093247397354891459 0.57141936001971461 -0.29112445657101738 -0.31689465703471886 0.24879577586201887 0.075117452205676088 0.15153978334423093 0.10653792144616057 -0.54856691883178399 -0.030721028964180448 -0.10207946451537991 -0.017340984518484641 -0.01341400463607151 0.36256465293245527 -0.13250421416578725 0.24742299693805067 -0.10164972775305003 -0.04064909122373285 -0.11491303784509628 -0.093572226792682567 -0.031551912937753196 0.21949897453421185 -0.083916016385031419 0.32035906278335224 -0.29617559618341116 -0.15435222943734506 -0.24792439674690459 0.39476533196243058 -0.47539663580594421 0.058594387982388099 -0.097694364322704313 -0.29107936879046631 -0.18918454061106713 0.092777276497498326 -0.29009815049984405 -0.027044754857628511 -0.28638943573260461 0.1991989630469389 -0.53527223655073708 0.21151050403176694 -0.12947970655226623 -0.12091897685870981 -0.24736121992071575 0.13180951439072827 -0.76439382034727921 0.11760732972827399 -0.32227885540492263 -0.051554749866569806 -0.057050013156429775 0.55552443065675672 -0.29913155541425152 0.38164791686035709 0.1358718892291142 0.25339112577977774;-0.040597912574171252 -1.0398507801155259 0.43728928975525605 -0.32457749420007742 -0.18833319084290948 0.25043046380598921 0.022013516995787807 -0.73603225721891885 0.64530328643889423 0.1086572444980182 0.18030768425392091 -0.20453656646279578 0.46377070782846674 -0.26332901835708633 0.0030340614008326277 -0.61669505724851748 -0.090869646173476398 -0.31946719086379699 -0.30152485699763731 0.22247392203133992 -0.38193749990681086 -0.36092959923104867 0.06071107592276128 0.2331971671396286 -0.031457979498774949 0.49387608208955475 -0.48307614011315858 -0.20933008588488469 0.44899309130474141 0.44661792569746672 0.057036697248407771 0.98142407716131586 -0.2968712987709447 -0.29761357946364797 -0.28883673048247727 -0.29149870938002792 -0.24829168508591762 0.88540957162168388 -0.72356995829042625 -0.032256612032378215 -0.22777701173940598 -0.06506135022710173 0.24123303781334482 0.44241292785153052 -0.33882032398194301 -0.085745297417181343 0.16787911345304884 0.12187818225127872 -0.18373653182316668 0.34070786823787491 -0.36369465787045913 -0.12802312685789288 0.02251144618313836 -0.0058174720602853711 -0.11632764112335492 0.34333079598369781 -0.55400968596661726 0.22679577999277709 -0.26453722673913493 -0.0098529940984896907;-0.17023178571675529 0.01839549699323496 0.10803298419528588 -0.41755557275289268 0.428328641916354 0.34494749074409414 0.0057621782324302458 -0.061257385171231735 0.21220165013514811 -0.64836783276212073 1.1943828142118937 -0.11147200767610625 0.0040742918495900553 -0.40107869456207645 -0.13058364248904358 -0.39094698407307432 0.53127892279803202 -0.019929965071930639 -0.11998850131091371 0.11658342873960054 0.20457476777475547 -0.11624217274024053 0.097754535274975726 0.26067287012466217 -0.15257960294549991 -0.042224352146739134 -0.36803189220631988 0.32707378530625975 0.056783909519951201 -0.34247330200531728 -0.25612888186413002 0.27267315919374724 0.15942071416449191 1.1936030625192735 -0.69070516061384069 -0.12194051472855394 0.44146888154724906 0.20546056280079089 -0.024666570601197303 1.9804003552397715 -0.18229967241398398 -0.14070253588326603 -0.033346024639595948 0.99186843903694022 0.035794158869061059 1.8354833379934599 -1.0409214715201889 -0.5979034107247565 0.33154154413109921 0.73146949468819522 -0.05817350511373455 1.296958415039593 -0.3611229957912816 0.053464287101297824 0.044944254813100729 1.4960544329350027 -0.087196053945238342 0.2497762486420044 0.17401098309703755 -0.21628450302286231;-0.12666804869584486 0.14101305729275301 -0.37485790697380039 0.65707181751475807 -0.074534167136531618 0.0892529424702031 -0.063955711680612801 -0.030936677109420239 -0.41042680069227877 0.23123409377531257 0.018605653415771205 0.12042322850478039 -0.3624914615621298 -0.27371111023677852 0.303135154385689 0.46935758702971631 -0.6198007658110356 0.14015048873473787 0.22436452989426819 0.28836358254453287 0.17950590277663567 0.14398531583479818 -0.23709195337348019 0.18263109369218611 -0.078212395534690837 0.17430734991098926 0.053066496052399444 0.057194196705627323 -0.36679467679250721 -0.041365337432098886 0.18369469785653503 0.015875353089506661 0.15330855793372539 0.088325984424934445 0.2850655844740092 0.27733802803265267 0.3274629996570344 -0.09441564642667101 0.29508127141143098 0.030892662406611888 0.17025758392596946 0.060623498335655106 0.038971677826090026 0.40267080235962016 0.41253469209155524 -0.20664708625100403 0.36681225360363567 -0.18652827093033264 0.050323973829364259 0.46970420259846035 0.65688241449398921 -0.045611966372673868 0.5561476917801591 -0.07772586525077424 0.062820067948367406 1.0370637359994639 0.2860928332764397 -0.11391243752940665 0.52400204053133481 0.41094479941000495;-0.134053011943599 -0.61297876671235629 -0.70260001798109983 0.11219307083190175 -0.0079323301436241452 0.16182844447265265 0.039159834535445567 -0.58343841361890736 0.0065195073060434301 -0.61832583297552846 -0.68988636069406362 0.61779892582899398 -0.22940299318499477 -0.51549246326425446 0.097063975754058673 -0.44636700016252695 -0.55684147680535645 0.055087158795323811 0.00072211368804802993 -0.027088487454234964 0.0088047739630504711 -0.62637237834659909 0.54475247305864416 -0.23810300905892801 0.13842469547300154 0.079374589127044495 0.082676918422259202 -0.35209792683739011 -0.18359446549069805 0.079834301451749301 -0.1799767497195868 -0.019461789353606394 0.29685437426831557 -0.26283490069258014 0.12656834060593852 0.062309848980001942 -0.24993442329197285 0.26587975921186641 0.44274118223197706 -0.24203649520740905 0.033095057959319385 0.004144235310747077 0.069394911520358052 0.80162919120620313 0.40688600500056221 -0.28100897441039968 0.32379089308850351 0.27430793396800213 -0.27646750737556236 0.96968747885665718 0.28156672373300762 -0.21352370510507107 0.070427212085508673 0.41493837397696187 0.41912819509270138 0.66732324013238453 0.3079238692901754 0.079708054420531013 0.43462894459471602 0.41360096572283045];

% Layer 2
b2 = [-0.46604221406623175;-0.52423750273403702;0.44956056707607789;0.8079204258994519;0.91193554929024612;1.2341169608156946;-0.25631544936813327;0.12080767711737855;-0.73514148396002021];
LW2_1 = [-0.63505867697255758 -1.263925716443725 -1.7527513895011697 -0.17661143339449253 -0.3597982285386685 -1.6716759787669808 1.2095957917599389 1.0729509320419819 -0.58428247044553805 -0.15498504539584945 -1.0315150323514715 -0.7400393085667879 -1.1807876999229685 0.059283746255232583 -1.0694852001309556 -0.027275388337069439 1.4661953125213025 -2.1648648460359929 0.0077910698805992214 -0.40654360136849205;2.0060512984591252 0.077522733006495537 -1.0067878600662123 -2.1578439022689291 1.8210579319209312 -1.4933726661710705 -0.167803239127053 0.01063984675786624 1.859777562714747 -2.0739459784608218 0.27838628742021121 -0.92794072454441878 0.83329438627826569 1.5610423068498973 -1.1489673244800718 -0.47636072787186656 0.36766435370108186 1.770678689937345 -0.57984867864356338 1.7434308255619719;-2.1317158415021118 0.18095320643993287 0.42993913744177831 2.152412580172872 0.025409376721583402 -0.1222394944206822 0.72356105679469174 1.2753044839124328 -1.6612241435527109 -0.793333745624757 0.87959742174962996 2.379161869952398 0.63848315867223904 0.51660923465872022 -0.44114056138701552 -0.89491348480595501 0.36218073440018744 -1.3587719755081735 0.67093388388389197 0.7150118806966026;2.6587633794292547 0.71099788178144208 -0.1653923476322367 -1.0778184525561167 0.19397304448358699 0.9353993611185536 -1.3469975326370176 1.6848072635054303 1.3177524428184531 2.433133984789269 0.067322118894101585 1.3304816812174891 1.0789780376843023 -0.45187202830606299 0.44519090533389039 -1.4657135079414085 1.4780495961142244 0.65788392022572884 0.32922446946163481 -0.34986562489005857;-1.7316260630472933 0.63145687788366334 1.1115828361940019 1.1501299434634995 -0.51173627394375787 -1.8885464514433381 0.34605513440905683 -1.6770987687398957 -0.59989267449555561 -1.1498245881971927 0.82833748214319958 -1.4682398822346909 1.3729735420587805 -1.0407018470299316 0.78958426048638386 -0.77588289364333873 0.49447280033358931 2.0390968476486444 -0.71187132163162126 -1.3800021320565563;-0.54550996101898586 -0.02418676684681495 0.80638988904714948 -0.80612615268463117 -0.79649547820354516 2.2457495718528935 0.87011120013894994 -1.8617559999278155 0.68757044991222416 0.033001218077287987 0.88406277381141696 0.035581529888443847 0.069764444989145899 0.052501273297610757 1.1491138657804765 0.84201652458850196 -1.8051957560793097 2.254895751030833 1.142569713467207 -0.48221104763609307;1.0766917155506022 0.36864609300397805 -0.62468573915848014 1.1395517901015118 0.041798047892158602 0.80746308720052329 0.61560868671836433 -0.6568385581588283 -0.085274857995766756 1.0278598484414212 -0.41318392516545965 -0.56617082905889582 0.46212088025437903 -1.6292659845187276 0.95925601342473477 -1.0200928876201711 -1.7815502240940542 -1.5238528547285957 -1.0295824873313197 -1.3297518699220954;0.76139526810728053 0.029151506734998445 0.29681924701948798 -1.5322449425529316 0.30460449985198679 2.5927919499116596 -0.57011649391649144 0.90785801595059046 -1.4432522103071579 -0.50138648328537228 0.32688646407939614 -0.71164881922584888 -0.92753169438866134 -0.35737083884365439 -1.168890019321464 1.3538326393581444 0.072456673822179865 -0.12837376913661405 -1.732797650171255 -0.31364845939821351;-1.4008262560664346 0.1211775192539893 -2.0825626861076314 0.70117303145539234 -0.95912451669395993 -1.4888046581652472 0.77752349019820721 -0.083964173882785431 2.9834940636001406 0.56586916867904358 0.99607101742258819 0.032980833828112684 0.88280572316352235 -0.64333668563104507 1.9809582968350983 -0.14097763782359624 -0.79013045004388616 -0.13457552366507286 -0.43629490694783435 1.2205256619568114];

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
