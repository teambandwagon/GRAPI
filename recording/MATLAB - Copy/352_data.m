function [Y,Xf,Af] = myNeuralNetworkFunction(X,~,~)
%MYNEURALNETWORKFUNCTION neural network simulation function.
%
% Generated by Neural Network Toolbox function genFunction, 18-Oct-2016 13:39:19.
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
x1_step1.xoffset = [1.25;-47.6875;-178.3125;-5.65;-4.33;-5.96;0.6875;-68;-177.3125;-9.41;-13.11;-15.21;0.3125;-86;-176.6875;-12.03;-15.24;-12.8;0.0625;-77.5625;-176.375;-9.43;-25.86;-13.62;0.125;-86.1875;-176.3125;-6.21;-13.26;-16.9;0.125;-89.5625;-179.875;-8.35;-12.35;-18.21;2.75;-87.9375;-178.875;-5.87;-13.09;-8.48;0.8125;-88.6875;-178.6875;-3.95;-7.33;-5.94;0;-87.875;-178.5;-3.96;-4.64;-3.09;0.125;-87.625;-177.875;-5.94;-2.9;-5.75];
x1_step1.gain = [0.00557977332170881;0.0284444444444444;0.00564373897707231;0.1230012300123;0.151975683890578;0.119189511323004;0.0056012602835638;0.0230880230880231;0.0056002800140007;0.104384133611691;0.0796812749003984;0.0579206487112656;0.00558366777176758;0.0200375704445836;0.00565970993986558;0.069468565474123;0.0773096250483185;0.0674308833445718;0.00557491289198606;0.0211780277961615;0.0056757715501951;0.0776096235933256;0.049862877088008;0.0582750582750583;0.00556134862704206;0.016359918200409;0.00565071516863853;0.0677966101694915;0.0655522779416585;0.0656383327863472;0.00557394182198223;0.0144339197113216;0.00561009817671809;0.0587544065804935;0.0672268907563025;0.049079754601227;0.00562587904360056;0.0136054421768707;0.00560714911512178;0.0810701256586948;0.0656814449917898;0.0749063670411985;0.00558269364968597;0.0133779264214047;0.00562884784520668;0.144508670520231;0.0898472596585804;0.10989010989011;0.00556812249869497;0.0140597539543058;0.00561502017897877;0.171379605826907;0.0854335753951303;0.136986301369863;0.00556134862704206;0.0145520691223283;0.00561206594177482;0.174216027874564;0.247218788627936;0.0969461948618517];
x1_step1.ymin = -1;

% Layer 1
b1 = [-1.4990206841475588;1.0887655833810683;0.72944226065897222;-0.69178621825535247;-0.85189408944457456;-0.73182893355964618;0.31399261838776643;-0.63241927360787742;-0.39069479940785767;0.23209195814916106;0.13460718529495241;-0.58899647485662854;0.15150057524120822;0.46857991418047473;0.5503238397735396;-0.34955981625493993;-0.64567066372340587;0.75214843171404755;1.0623242692497776;-1.472099658806727];
IW1_1 = [0.079875217784911468 -0.25076090473527446 0.095908030520159462 0.06348462567379283 0.11481505508755499 -0.3164931537082058 -0.30610133852681226 0.14976341579061087 -0.23027471748489517 -0.064758003234981015 -0.24941184607849154 -0.020964063417432358 0.054893122765366127 -0.22102525452881178 -0.141047696049479 -0.23261812984214292 0.21277702967567727 0.032377672931010654 0.027981036027158748 -0.10433538628950992 0.20493362531834827 0.013201824235406997 0.093022344747412139 -0.15619053155368215 -0.084732616881011399 -0.14972388071602954 0.030458946295052424 0.030416869055354786 0.10479886312590025 0.24290227377399451 -0.34084929334506392 -0.17188490360845093 -0.25332432521931081 -0.41289344414026091 0.12625013699068144 -0.17039398655516447 -0.032309200174061893 -0.10033474987010969 0.2461959460499836 0.05234252385690475 -0.37897963639995674 0.17759088406840912 0.19901497212577127 0.32552182496534338 -0.14255683563024155 -0.073561960073392843 -0.37019912134444793 -0.14180652657861531 -0.0056604862717127193 -0.20818928620140031 0.13775251316726989 -0.28245804009017411 -0.048447949042057861 0.0044182804063902497 0.068927118307747212 -0.22320874142552577 -0.14645890771464631 0.019182980402679854 -0.21918569293116208 0.21633107011105429;-0.00022732704048043957 -0.25678340843954905 0.11773903278866164 -0.25237645995012487 -0.42559471706188717 0.26144043186045429 0.3789638989256624 -0.42171356842944974 0.012454111303054974 0.68548939127359987 0.65562238659790495 -0.21032203107781058 -0.33190037390829896 -0.26849267306708852 -1.3902227465971084 0.89607094175666058 -0.58475780015394341 -0.57769148726768582 -0.14786168417219106 -0.037932995442388401 -0.14972275057171594 0.54620928496007504 -0.065555548542594447 -0.25859316117083708 0.35394095983583618 -0.60728945861320816 0.53659584477569688 -0.25647313757131862 -0.022479428016602392 -0.034159235215148298 -0.050376655958927707 -0.054450439540449425 0.7110770776550116 0.11885382282590083 0.50860889052869507 0.27752128000509402 -0.25072694960313996 0.037126417304141103 0.21218028915782958 0.12927239824236611 0.75575283543576466 0.19418403726851136 0.27763293889631413 -0.15387136958760797 0.060303797906592842 0.041405916547389766 0.6642138407620034 -0.023089619562897117 -0.03629909688780289 0.40563350354982214 0.0038617969783624959 -0.0082714643600631695 0.52621884268989672 0.46198699152606026 -0.19117637520133374 0.23960888070167194 0.21830235486049221 -0.13116148679915252 -0.43999597470579521 -0.1504123498755722;-0.098585116913915638 0.10186867672770655 0.3990312957235494 0.11072662009013251 -0.4982464165625532 0.31125112987647069 0.14324317006847198 -0.24672965729917301 0.57286963509899602 0.1543485649302879 -0.016736801521934297 -0.182219077654522 -0.14374909815019929 -0.13647570780191473 -0.77972056322469574 0.21428825586542125 -0.88183307644327691 -0.82585545835979546 -0.30179427676664944 -0.18889460362691415 -0.44295666485102037 -0.28177957696466371 -0.24412570129544586 -0.43639930196522114 0.13666927755832672 0.0026517545031085679 0.16881889698995028 -0.46859418800997388 0.20857845802155772 -0.40688535288083827 -0.03636086058590253 0.41201124957979535 0.42902626180069198 -0.33203627441019923 0.88213580399237468 -0.069511996631831538 -0.19284183834375249 0.59619655942629779 0.44152932685422619 -0.36604296508362766 1.0680787342491449 -0.12203966856139734 0.48557918384781462 0.62018765796674291 0.42585897067336287 -0.27573446219802106 0.36752291659403719 0.16760710381040947 0.045072370037469965 0.96440763738787849 0.33132695387730876 -0.29431233929363387 1.1055834033369154 0.33880551145180787 -0.33611900331747369 0.91407586501658289 0.021472673240811306 -0.038334463149206112 0.2619214621472698 -0.058996178303406532;0.13530476971286817 -0.021228384759064984 -0.2332975074098223 -0.17345042484725517 0.35742410363499694 0.39412846397216256 0.051326222628755296 -0.55600090284131487 0.14462606649179927 -0.29133318243891437 0.075018087055742824 -0.32947495022715489 -0.053482138681447106 -0.37737394267099794 0.30813716068876262 -0.00029078142909511441 -0.029777672774034734 -0.45868226464476636 -0.1078819294947686 -0.49004652812576771 -0.31722401160395708 0.2525268287571133 -0.35694186886470169 -0.22911121136079976 0.020689426846905053 0.22950413355217084 -0.15523728335406575 0.39943328020288604 -0.11385279248968359 -0.36577776848061805 -0.042086367552909586 0.73664477601057765 -0.12727888981463334 0.20270541868672171 0.090263361545151521 -0.078261131451147214 0.31114754456577454 0.76793415363670292 0.25525108465232577 -0.079826279748311621 -0.26901000448901707 -0.33300015175402914 -0.0060245761006753416 0.82885545270107686 0.17427494694998993 0.093272398862555075 0.07280961469872882 -0.031932971136703077 -0.2410182624133356 0.68446241348667936 -0.058148563321661281 -0.32098167751665058 -0.47261577994266807 -0.13338825526764092 -0.005788240404278203 0.59497377086149572 0.10504603036254145 -0.064391083119964707 -0.1281742029124408 -0.27087090146145626;-0.42463085348329255 0.43785632744141306 -0.21823575573702933 -0.45650236511091885 0.2849400596487931 0.28630162355007249 -0.18825830929552173 0.4880610847691475 -0.71729639769279685 -1.7249336670703501 0.31506044604543887 -0.22210569514690673 0.06878663222185559 0.061449648312529664 -0.036104393053698253 -1.9532377798577547 -0.048186478356845627 -0.017555288861294857 -0.053919600765680406 -0.20080898097758279 -0.27434848666570621 -1.4129707713631592 -0.37005714653809241 -0.51707100563768305 0.14245813402028579 0.57849360540653372 -0.021294282110954681 -0.24614250353700853 -0.21111073015746015 -0.41175330473823291 0.086981400072451226 0.88185668330776601 0.39331408350658786 -0.010036986822446976 -0.1421782446908573 0.045548171273246639 0.30108404097151092 0.47973564349490916 0.24586165031767321 0.2578641190387938 0.1993571926218414 -0.19736830273769018 0.059102622300230404 0.88013031181734758 -0.094390443303069199 0.18569054024031068 -0.1010604697538658 0.092034024067040254 0.24993237695972972 0.9337555211309434 -0.030218881876705385 0.12339565082666921 0.41630673582451078 0.45150724779114865 0.19044323299125643 0.53526077145906314 0.41774704594617307 -0.091670488170700226 0.18761538804920289 0.079272006496793002;0.1343836451109556 0.042158699941022344 -0.40252400549543149 -0.26620993278279981 -0.066435878992154807 0.098040132225165999 0.17738234350663218 0.2898300465097684 -0.43936487317403661 -0.48174465321089216 -0.39366646643893216 0.19224289453969309 -0.12402666564384039 -0.20324883623431775 -0.10351698453192711 -0.29873895123635108 -0.12671110533771351 0.11966316919983928 -0.2046059124332503 0.43485315743951342 0.11489257208415744 -0.39942955942025798 -0.08407696286568743 -0.52667752763032583 0.082882693291330883 0.35935808288041327 -0.34802066842003127 -0.2977671192829352 0.086834549544099623 -0.24367909618995268 0.10255810224486869 0.0087787306232618139 -0.36613345433352029 0.2995215581980944 0.065295067219880251 0.24309760865530983 -0.045269567855232701 -0.12898844807711304 -0.35727617713970111 0.26241684983090474 0.37869231028834704 -0.21141088938263058 0.30970272424012374 0.18539397887046119 -0.28972973411243302 0.51120784073377268 0.25050408965400062 -0.16781397333698284 -0.17942762306899929 -0.34351877871705117 -0.26184855359132736 -0.057561202249574624 -0.070216229019986781 -0.053636778095016227 -0.28981901833228596 -0.37547438806889716 -0.25922887073554413 0.11589512321761006 0.17781389098955572 -0.0080050630855530019;-0.44224615245214421 -0.064185182222795234 0.50605108864870563 -0.48574299137944971 -0.083666014647120465 0.32946547052325303 -0.28989926541127159 -0.0022426207859062974 0.14717238369055671 -1.1750948668152867 0.12472252725755498 -0.62209250120133153 0.19520537321957751 -0.24684048761627519 0.0046591451126232614 -1.3974947093085019 -0.10926442630239436 -0.72917808670409645 -0.30403382184231192 -0.73421794740507906 -0.1663574843535538 -0.58021016561285332 0.10831666376261315 -0.91667645114672336 0.33499640851468165 -0.23755771598574535 0.21462197032232513 0.25741086986775458 -0.31014198820213978 -0.010205911733776616 0.17751846936429905 0.4070508141578163 0.035508690853984677 0.2722975078750039 -0.45162667757826974 0.04564104373335285 -0.21992301926860347 0.25554140146332621 0.16983914869867592 0.60127274097245786 -0.41727807505795061 -0.25040639390206387 0.14546931062238816 -0.0012821818383931451 0.23918721805021928 0.4967955178338162 -0.67622642117210807 0.24320838608771009 0.1080921961389377 0.38032882876719426 -0.16608329181446987 0.81348278121940198 0.061977169852736311 0.44688852737012785 0.24361921342574752 0.11797762819198043 -0.26116530094615092 -0.1257534909501434 -0.21559372057889731 -0.26736817648663891;0.20489932177162015 0.20281358298657293 0.082063287641420318 0.76160832555453217 0.18136045242216742 0.29832620867641085 -0.33835878930017854 -0.30262923801433461 -0.016267924794822988 0.71375001093655721 0.34934963046599921 -0.12614692322810639 0.13594325943614341 -0.22611463896963552 0.50428224856060289 1.0881956891564295 0.45235671341065298 -0.074535758960452891 0.32594552340878269 -0.034692529997932639 -0.1895419612708831 0.72623780606018595 0.19707344436710164 -0.066295156251129361 -0.18210329773620076 -0.34777962101273019 -0.45085351555570036 -0.10201493595321204 -0.57400590270708207 -0.27693959776649041 -0.18248608637632321 0.093970193836704172 -0.037089695952227553 -0.25112078009043176 -0.6752983404194749 -0.068413684597000646 -0.38219446457489015 0.30844156123461725 -0.42232261656126002 -0.32185178909166157 -0.21890733862882109 0.50967776852430458 0.030358213584470738 0.70939068024307905 0.1975571036084455 -0.62617314017675818 -0.21319761793301134 -0.17937355303378363 0.33125512368983595 1.0398515591475486 0.18043404963962631 -0.39600948295640698 0.30403577304135015 0.3439872000801959 0.033274599323181289 0.99834476767082858 -0.26304309424270084 -0.10214855166965522 0.17027513932813948 0.021949653739473253;-0.33688022654582506 0.17688435797046381 0.25757236408434603 0.68647218891006256 0.3453843001646047 -0.17824584427243007 0.025936010287868509 -0.037323368137423513 0.30793026048612737 -0.076409978699489206 1.0983341854917381 -0.32512494939308212 0.30453997679060707 -0.064965214867184984 -0.12758084258379743 0.26168343311031894 0.1559623685246801 -0.31034441924695455 0.1826326736264812 -0.20900796174106981 -0.07317292203439206 0.25146481613827626 0.2146478237673379 -0.33979047160853626 0.2272118129090199 0.29310604259505518 0.27060258100728957 -0.61129877655448739 -0.57933864010056002 -0.10638438003393294 -0.15101854529245609 -0.0071993423675407054 -0.17756429509988977 -0.16766978252012105 -1.1285478139281631 0.23939186296412993 0.29559010563163318 -0.215354306534771 0.26674984117643524 0.38063981420235388 -0.8029684017012293 0.48073194617347387 0.066554178451235124 -0.51809254807901639 -0.29391734445970663 -0.62669364261345673 -0.56378057485109423 0.22099950711023192 0.052519535414298268 -0.58989052707714928 -0.023886080527440443 0.054458978278927726 -0.35209519749628704 0.67919542688363987 -0.10642272935836815 -0.34399020922914919 0.20009441660876917 -0.13831697500997286 -0.14034359904602073 0.029166761538566715;0.46777111036019325 -0.14178841624240032 0.084561473808688059 0.29090782477218513 -0.21359557895164893 -0.15445351795948714 0.24866338724526194 0.11341501192159073 0.21692852121906792 0.70236825903137856 -1.5868845600186625 -0.099600501419987331 -0.56649991376659936 0.1489436992685734 1.4179671490249446 1.6280530236505408 -0.6836674546424617 0.3969554459762405 0.043366522914564769 0.097593516054207491 0.32378682026696137 1.1808635425742373 -0.20114804235013128 -0.067125043116807323 0.15329055998547497 0.15588490459635165 -0.40094704928229358 0.10621318801218831 0.633989287070862 -0.11853650560175666 -0.10635904889128521 -0.14937816828577932 -0.14703302807563001 -0.22850560924502811 1.0682650343581428 -0.021972471887927236 -0.45365660521467049 -0.13920609337659789 0.0079394336107857372 0.021780988276364828 0.55527660905991683 -0.19159956569235131 0.037680360941463709 0.012490360879366435 0.12407474236976214 -0.094293701898468738 0.093974434812361826 -0.28642611779575111 0.2602143532463112 0.033352777720448853 -0.20924543473424667 0.088771475585020729 -0.10632719187716996 -0.27850437501395042 -0.10440571898128259 0.10792308412501711 -0.33961988002761162 -0.1277024656415757 -0.016144104533933525 -0.44757715137360909;-0.089495549626294205 -0.31644252310840121 0.078391066908529164 -0.030188238986297945 0.23626155560109971 -0.1602581369245574 0.2858453998841935 -0.27684296831707866 0.49096728285464852 0.12644172668204903 -0.13750274116794353 0.14264639167971846 0.29948222520090967 -0.043032668090252774 0.33141856376876361 0.34716808208218547 0.22526483791880306 -0.20943614394734 0.12109427133106997 0.12469782657485072 -0.20156772041996263 0.60442369319815603 0.32430320888794173 -0.14394894104405451 -0.23885894414820633 0.3554951687985366 -0.038501956561274552 -0.265537363892207 -0.049545482125448619 0.10803530156516628 0.017620271316512646 0.16103863567656942 -0.35768299561196559 -0.54817195345908531 -0.0072940029216273846 -0.15332144654159061 -0.31924459678138373 0.63688526678209556 0.075482856326669928 -0.53780588102321081 0.2321148460601816 -0.1277114425855336 0.022560762415097052 0.80276960427223443 -0.21249250419174226 -0.396923944503215 -0.29739601743633737 -0.040453030476232582 0.01390308944416843 0.86997830445058733 -0.12626592798792033 -0.56114832384832636 0.13272884178212588 0.2782042272729926 0.092027412252579932 0.45162250793898112 -0.3529347924889481 -0.26182460930533069 0.27430334313199145 -0.15697923459145324;-0.36323211155290913 0.61299349683388282 -0.12435699720824892 0.56728990022410997 0.19249300574320594 -0.050660070332801642 -0.36405297646837886 0.64826138425352708 0.34961278140223029 0.58363651106943171 0.32066530410233829 0.25785966208987737 0.083786936898194816 0.66637721359952862 0.50122835397501408 0.41384819218704832 0.98025952258822169 0.87645317766281294 0.3147577076587082 0.34979469448091149 0.51673391140834746 0.038412543874831187 0.27601814376865635 0.57449804680138761 0.284775380883735 -0.11494103226293913 0.27612887460884122 -0.41249313993058129 -0.5707817860141412 0.47995974122982149 -0.35112649012732072 -0.087390247297339144 0.21437973365477297 -0.93786107474107028 0.0014682684325498219 -0.34098384119606578 0.1498198640682647 -0.13054913470667595 0.26618139494631737 -0.66833891485650243 0.099101047964509997 -0.10584201241615733 0.10359768330873541 0.18489865748833409 0.70816050753874582 -0.62709450419852875 -0.066685157498307793 0.32861423723143113 0.10453998479605203 0.075543973468888734 0.76072739089691233 -0.078621812206268848 -0.075094722831628102 0.34579727769894342 -0.11014194605399236 0.26760730839106683 0.61250041608809658 -0.12926507207757451 0.278273627047607 0.11247210257721141;0.18157892270292789 -0.14878718914328046 -0.59444534886640632 0.0037226843687240985 -0.21263049267790049 0.17517071774512491 0.20225854814937552 -0.37023981441394432 -0.67240899460792036 0.22912916632377861 -0.17714469192496868 -0.15189647210285948 -0.30968654616218266 -0.57460782720344727 -0.011950744430733712 0.21716981181523426 0.11961612158249743 -0.5305502433025211 -0.12751700216781278 -0.49927912086579435 -0.30570825316420941 -0.057157889234022818 -0.090506876709697801 0.020581656217417317 -0.090976290236799484 0.24544365287802117 -0.35577113661049259 0.33521822093401538 -0.0062856452845558531 0.18817097961149643 0.11047079949629429 0.075378181169650033 -0.051359944964057429 -0.21753604128713444 0.47405475482986498 -0.25139136020922115 -0.05450209075748557 0.1493853268247736 -0.072630401788845986 -0.28546562405182385 0.38380876242153172 -0.13054258239310834 -0.16015408947866638 0.65156164051900956 -0.39915733646279522 -0.089955662630189462 -0.25845347249626222 0.27826834880273293 0.09550843654907569 0.59191574804246483 -0.48629365109406136 -0.31936364428183805 0.31230225267440814 -0.09044205005483856 -0.15045805603736506 0.77383026081761908 -0.48196068418861709 -0.46343165222379856 -0.45227220838183241 0.16982820457326753;0.25496786771939267 0.25526021206344013 0.1540820988888586 -0.12378423661364628 -0.59113960041607594 -0.0019351450849436356 0.046534004404540676 0.22104691950315652 0.30615261673499611 0.2533980477166235 -0.44650221627530967 -0.0012129340726800713 -0.058196847125215785 -0.084334198158226514 0.47474080088524201 0.45713913858827032 -0.29370359658216366 0.039968225724507589 -0.010015981824697991 -0.045432057798884387 0.93694509455165798 0.21538299643941589 -0.043665855540018721 -0.013659006590973771 0.11344168953259266 -0.27203937028262659 0.99722947742908108 -0.077085373951874148 0.30658267931867006 -0.14566910712451311 0.23726426417915863 -0.044049648445503346 1.3178869188929103 -0.19134339550550267 0.40813311362694804 0.018821805232133261 -0.3479701038656971 -0.57163944092288521 0.82070061819458751 0.026611767451922164 0.62699898629487016 -0.10394218780044734 0.35995921940864917 0.069883369305019524 0.683445665530375 0.1087724557195946 0.56005003051510893 -0.29482528496945598 -0.025531577556308378 -0.39014450927393707 0.72761585553209196 -0.30600535332262957 0.29450617112568378 -0.075027074918878764 -0.11799015402942634 -0.318634662599941 1.0641921731729986 0.27363797296449976 0.29879892604504943 0.21686117727446144;-0.27232224453162651 0.33119450001490464 -0.18981140793483225 -0.39894820269561626 -0.16800005351058031 0.33202107357992666 -0.22011202655973441 -0.004946888454544043 0.21623584968823373 -0.33322691904886376 0.094016049702799032 -0.064604769366543469 0.068564293479830896 0.35584982090183986 0.11818153399890603 -0.55082434513265088 0.34462364923662203 0.042422399878885887 -0.3572836581660066 0.39365107864069226 0.060335814443612967 -1.0685162765363008 0.43473230513561595 -0.21683112487040146 -0.14936539608140229 0.13341396808905581 -0.26525325840325675 -0.27659455269190342 0.14187608765720874 0.4629110422610026 -0.087917823376300025 0.17698213159139967 -0.010366865363585732 -0.16303405749014532 -0.54945344191637768 0.18093545778998998 -0.22123874850578693 -0.081961325500672144 -0.035005261865132864 0.18396149655472993 -0.27889197474835431 0.12074786994706319 -0.4339009272570758 -0.48545079238194894 -0.18387530906526242 0.30300480277786884 0.0056005233836886091 0.22190662514186271 -0.096082795234875465 -0.4721866020935343 -0.57444459816333482 0.14229522226406977 -0.2809070254633686 0.22698431614936271 -0.26892121259825402 -0.66843281957315714 0.12408514638380432 0.084936475850719825 0.19808412474154979 -0.13217869713759692;-0.051251748347211822 -0.21723896630096731 -0.307091062976447 0.017225088991603733 0.29432995226075298 0.076235723454864388 0.27960214595661492 0.015456444935644548 -0.16075354502481923 -0.26556280555707057 0.19928887194096437 -0.063616129239190453 0.40140240932787047 0.083728851340353794 0.64265564442608558 0.074636240995107794 0.22593192731267706 0.42823818049937346 0.31241086278514768 -0.11926785133701423 0.2688051216374131 0.05404708850895204 0.3406325821670218 0.13389799440136355 -0.0814027077740066 -0.22905062984982999 0.14054922229457231 0.52949172437462488 0.10435988182256249 0.0052204634252369557 0.20498605138730552 0.32591654538338316 0.24921399078616469 -0.20818416838741763 0.039700098370380389 0.11355224046233865 -0.044468327992511172 0.5507879391737569 0.15997971840431058 -0.024442386805560202 -0.40080285592597137 -0.039228770923846433 -0.054763087634147653 0.31985968521262459 -0.11931094425978449 -0.4968198083767994 -0.50896688601479256 -0.37343359441499968 0.38258533028731107 0.70503947770143349 -0.15191556910649331 -0.50323408054285634 -0.16580189239062609 0.070019705991769834 0.33493661005769948 0.47025061395828399 -0.10256298359415884 -0.2151540129193763 0.1052104370178462 -0.42205412726194397;0.01202449642865853 0.34617395230340769 0.16046978460221925 0.042600604070329499 -0.15146790397255108 -0.26377835031963709 -0.13657176323325679 0.35260046838581227 0.38901297769335663 -0.18035423003525525 -0.95479256695819958 -0.37177132215706443 -0.1317171361842584 -0.1440401302567228 0.62570037497231268 -0.29183811893497474 0.12061521212287174 0.018197049050022802 -0.2547409703773752 0.18458777514717187 -0.33828474668659958 -0.14007305166406114 0.17352589984931746 0.35445660323911993 -0.11160269792973199 0.044563184487753316 -0.777955493470601 -0.12584155392846244 0.28843413800010032 -0.41953722630459467 -0.37293744931666067 0.52997387470780255 -0.43288990890959606 0.079342706669318711 0.52181771071139438 -0.16829247521715765 0.28409086367823683 0.77699361338192585 -0.20958778980537071 -0.23420137656606321 0.068027383388961443 -0.20739400200837899 -0.094885377454208969 0.81491368747258286 -0.38944728906866888 0.015650344731703084 0.23156823612038566 -0.13741488432304469 -0.027385905705977185 1.0194319077623888 -0.64328365203787585 0.10444292889095429 0.38834818775537217 -0.19947556388872131 0.33877638542970412 1.1706791185690606 -0.10984338534210399 0.10443179977217841 0.03182795504418244 -0.035006642920772997;-0.0069216622040390655 -0.1033996448061295 0.064963406227323828 -0.041695262646315609 -0.11928476604872788 -0.16157192922210525 -0.47967167838389907 0.53261007258665849 0.26357921759778336 -0.11649280108057022 -0.13044307211225664 0.53624858770080563 -0.1383023557506898 0.67621170504412809 -0.28858829941776504 -0.0075115307315243122 0.098530348754524294 0.42777508623869337 -0.071366149756605601 0.35777645499702698 -0.20981886700021771 -0.67243735913211233 -0.15081095550760634 0.40260757038449385 -0.11190842007575068 0.31718792786895178 0.39845959018810562 -0.45441969308704677 0.60331484581409245 0.36176308816144215 0.72830204924753117 -0.71313238895342168 -0.16787605223486618 -0.79930590817302916 0.54405789496545287 -0.017137712126621046 0.51974425326720008 -0.39153730743297432 0.21817439227805466 -0.23673678274269452 -0.2128698160891416 -0.087906934504473302 0.081865189791360898 -0.75512215369569569 0.12022149416302583 -0.27709037428261479 0.12563160764998921 0.29078695754989292 -0.57807843551761462 -1.0449575289346769 0.11484004293528566 -0.37444996728372387 -0.20790486829818061 0.013992868803393645 -0.18790120572719582 -0.93472221960762547 -0.091134428386142746 -0.15868959352973538 -0.13801047521028087 0.050519158884506088;0.2773082384553251 -0.094523214795885629 -0.15723335158597268 -0.29609565816035716 -0.40693859281448103 -0.20168196033443631 0.31320832110266433 -0.18547723928850596 0.24536159403337576 -0.93017830867858087 -0.31854990842903247 -0.53051662801599508 0.016026587654376902 0.14030097064786951 -0.062755413326212053 -0.36853419389780656 -0.17263318413556961 -0.25708334137404604 -0.26801034564050413 0.086927246967589925 0.3646379303394166 -0.17899366996764546 0.062250026380369389 0.094777442888963365 0.23815866347074843 0.057149653824576541 0.058506318554830253 0.1309135695062634 -0.069616788291349624 0.067380190389463704 0.044910839932022967 0.083517087603287368 -0.14221682281838591 0.38184294421272419 0.021983019361472431 0.043847942265316006 0.23691499337295663 -0.24472712269034602 0.19207961608315605 0.030042940968049929 -0.34586510170627005 -0.25408417614923556 0.055177669512917256 -0.48263278209101151 0.054364214237983564 0.32437250448442756 -0.1975740179338992 0.13128617581182087 -0.2986948270091811 -0.16889632527728352 0.14361361760637842 -0.042656746286266305 0.019042670671540481 0.40357879569627919 0.12463971706243118 -0.72142188229102899 0.027172495747727329 0.12572705727844691 0.023864776568166768 0.41532011191990154;-0.093544269173331918 0.69907698019241593 0.33925573916435375 0.72440953641017947 -0.29632630134510679 -0.31237374294095965 -0.26699276971626218 0.068946403062510639 -0.27910743481314881 0.12623419423188298 -0.31612503623922389 -0.19983066457138524 -0.017098632225743364 0.35970719029220782 0.10096477174870591 0.5635491130887369 -0.32402910276611657 0.23116762839936109 0.012498586066731321 0.51304261829572184 -0.041185812760096328 0.26691906291857143 -0.029444988043339476 0.33978235298812387 -0.43300403736601339 0.72319793519962117 -0.01950923189855679 -0.67624857297269803 0.25027071152695862 0.41231684205947133 0.14620490568230676 0.27914354442978567 -0.27703738815377132 -0.49170056010113905 0.51169880546093682 0.089734654654353763 0.15475200002048228 0.223414691606905 -0.18386322404988217 -0.70128698611450313 0.12279392608406929 0.49333012915267055 0.29677736058948928 0.47361911174549576 0.041174572048359746 -0.62040336792395989 0.25152744597130294 0.40677415933605504 0.036791297242238577 0.36765529440829525 -0.32785063740851822 -0.19853456345751538 0.025318876125690254 -0.46061774117637533 0.37737073951589589 0.30063111236687939 -0.25282239298876519 0.15792577116250223 -0.026915563431850635 0.21454881822809282];

% Layer 2
b2 = [-0.65449411452189465;-1.0019786757832798;0.25918080460026649;0.84370436747937372;-0.042992136871857455;0.68677941224075023;0.12706765659483815;-0.07087922468312477;0.71486004327027741];
LW2_1 = [0.044966515791275238 -0.53919826860755715 0.071381015901242684 -0.75162446280249129 1.0541519304302609 0.52669061950750917 -0.5637696175291933 -0.9172017912910414 -0.73011782303563111 -0.73352371370870317 1.3629706106447581 0.44247142034684345 -0.55292899662208317 0.54851835489911327 1.0598978113431297 0.56206501099508555 0.99817715926409567 0.4802716084237692 0.047180788769832172 0.94370181723198354;0.12917078208788785 -0.78122512932052124 0.018954816477567894 0.9861239696896823 1.7948469306773058 0.7968072912594637 2.0476904645313305 -0.87803828787495986 -1.2819340229260487 -1.1625426310044107 -0.59621105284875808 -1.1884746534736157 0.72453273568293775 -0.61838904661683924 0.2958731398202018 0.69393825678020571 0.59780963187647518 -0.27713124214328361 1.0228688822298362 -1.7709047956469441;0.54183083901175189 -0.098918861936428404 0.93462280752769078 0.75361943033124679 -0.82806377881268411 -0.63012861073000581 -0.95300155546269216 1.2260755219458084 -0.81273866298793263 0.54533577331709815 0.50430456814511349 1.3265753477215847 1.5124015979551206 -0.23013134956079187 -1.1230467658246783 0.62160790734989346 1.007011589167532 0.60386948365593329 -1.1095519700740344 0.65006298837809506;-0.51064463449436848 1.1626029980944952 0.31542445525373097 0.084937729102707499 -3.0863878235580877 0.72858461911702954 -1.5372248825828831 -0.43155287990994812 -1.7976024679349618 1.6920753494842229 0.54252698953655587 -0.85291936753796183 0.22648353581111214 1.8314223285257443 -0.57971528984602627 0.21888825759801017 -0.15970843367860482 0.90159625675938027 -0.14214512431225818 -0.97347642677873503;0.4016008237514363 -0.31939579433030485 -1.7013195144573936 -0.055968416803220428 -1.2269919833133662 -0.64843620070636399 -0.12589971695681179 0.62813256743173029 1.2487452708679672 -0.67024262467639151 0.78788251913241947 0.36157275622858798 -0.11873101129427996 -0.56445930927664034 0.97876058735118132 1.007331286658663 -1.12539949795965 0.046574746237935866 -0.36720700383095883 -0.56283498016170053;-0.27849210664490837 0.84417604965105053 1.096034182708131 1.5748939932608366 -0.25931282193498428 -0.19573642439507949 1.0003934320228833 1.4919685411368515 -0.45487316578458792 0.2742064766629963 0.99832024944966213 -0.82490436812627932 0.20038354112569234 0.15562474254862144 -1.0756562422694167 0.59864486587483989 0.61850783226737005 -2.3052270394297905 -0.59900770151874372 -0.25058911816030455;0.00027338133710324859 -0.59868742454929968 -1.9475963936252092 -0.62630340753251013 -1.5014719085095223 0.8729866649574064 0.11921020735970878 -0.37402291113879987 -0.21697003946552365 0.49007963883305111 -2.2710136933367009 -1.0530665728354376 -0.95061272113061968 1.1796446543981942 -0.010918352705602621 -0.82158853040736046 -0.87843823460379378 -0.043557918945353651 0.18176227800387468 -0.70183462027844823;0.42088632069111598 -0.83746897544959131 0.5894460630058056 0.44676545235638004 -0.16268085793244985 0.49114176080975996 0.61021822101489187 0.071377991350554212 -0.34822287023319343 0.83925243328395793 1.1721431358712617 -0.74124141697833579 0.72799995534409245 -1.1612315598154248 0.12101443987595159 0.34107145580466597 1.1688847264493449 0.13258284237163154 0.74613310375393394 0.19956232815392611;-0.19798182001525103 1.5013822833114856 1.3436923385627195 -0.11557606105970009 0.40478835062980872 0.40496436913220496 0.60914021421642495 -0.73936651597561143 0.52854126820100222 -2.1830137389696005 0.56506729550107038 -1.194223563576946 0.16136963473633997 1.5088648146150931 0.35452609759277931 -0.43023347285565094 -0.60118334731576961 0.97415301384684971 0.66108398480257802 -0.26388128932818239];

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
