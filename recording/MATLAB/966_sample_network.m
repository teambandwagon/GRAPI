function [Y,Xf,Af] = myNeuralNetworkFunction(X,~,~)
%MYNEURALNETWORKFUNCTION neural network simulation function.
%
% Generated by Neural Network Toolbox function genFunction, 27-Sep-2016 15:41:20.
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
x1_step1.xoffset = [0.5;-19.625;-38.9375;-5.02;-7.32;-6.36;1;-21.875;-37.375;-8.09;-12.43;-8.02;0;-68.6875;-85.875;-8.9;-20;-35.66;0.6875;-86.75;-175.9375;-9.77;-17.86;-42.33;3.25;-87.625;-176.875;-13.87;-23.64;-44.65;0.8125;-87.375;-177.4375;-14.61;-25.72;-42.46;1.375;-87.8125;-119.0625;-11.72;-28.91;-43.54;0.125;-86.125;-177;-10.53;-19.96;-35.77;0.5625;-87.8125;-126.8125;-10.51;-17.61;-25.88;0.1875;-87.0625;-178.1875;-5.17;-8.34;-7.99];
x1_step1.gain = [0.00556618542355192;0.0398009950248756;0.0308582449373192;0.145243282498184;0.173761946133797;0.0762485703393061;0.00558171986743415;0.0352811466372657;0.0323232323232323;0.055005500550055;0.0630914826498423;0.0510073960724305;0.00559049615653389;0.0189349112426036;0.0137221269296741;0.0467836257309941;0.0537923614846692;0.0303536196691455;0.00557200069650009;0.0169941582580988;0.0063872255489022;0.0577533930118395;0.0534616412723871;0.0276204944068499;0.0056091148115688;0.0174386920980926;0.00566672569505932;0.0443066016836509;0.0489476260401371;0.0267809319764328;0.00557491289198606;0.0161861406170966;0.00564573041637262;0.0351802990325418;0.0439463854098;0.027311211252219;0.0055953838083581;0.01548137397194;0.00683030949839915;0.0367849917233769;0.0355808574986657;0.0270160745643658;0.00559342772242615;0.0164863472436888;0.00686253484880978;0.0402090872537193;0.0459453250631748;0.0299625468164794;0.00558366777176758;0.0137634408602151;0.00654530578850481;0.0363438124659277;0.0485201358563804;0.0345901072293324;0.00557200069650009;0.0157016683022571;0.00684491978609626;0.0446229361892012;0.0906207521522429;0.0518806744487678];
x1_step1.ymin = -1;

% Layer 1
b1 = [-1.2955803534485901;-2.3015494051071443;0.27993340151430585;1.3192590069975414;0.38290579101423677;-1.3107362015901147;-0.54064017457498748;-0.49209731957722375;0.55875891393917543;-0.55332868262999158;0.028626938474766606;-0.83408343512651528;-0.93266615299338007;0.11433361084350122;1.0698107607691116;-0.61160954824370883;1.1577127716671995;-1.1606452595465229;1.3180277297234981;-0.73524662137136076];
IW1_1 = [0.65879588176609893 0.25511728571232262 0.46186755791395862 -0.39554717950311846 -0.41604001749088065 0.038363277959459242 0.3266509473092683 0.36645856475307981 0.61187794064002088 -0.18447737729243377 -0.10408821888640944 0.50513965342054512 0.4036504270185256 -0.18891445682707889 0.27263453516551056 -0.23258938211498581 -0.18250406521670931 0.28737920860742089 0.20637638620677481 -0.26404131867962977 -0.0084258137793202566 0.18938294519494434 0.049158630876298424 0.26646745874379529 -0.1819024626209321 -0.070971943961446973 -0.038261356582255893 -0.075050935322109116 0.56098037936734446 -0.20258110988130593 -0.60160117598309826 0.058459833562028045 -0.19736658743529401 -0.61915699079117581 0.41186684749614061 -0.19900789914722167 -0.68855534478731961 -0.19509450315756124 -0.61683239117778843 -0.36059158043953166 0.20274405088534578 0.11158609439739953 -0.14014440938927725 -0.39750844889805093 -0.5590900543217654 0.17504839027573305 -0.013134947740775567 0.018875046693826735 -0.045931458050402586 -0.69789805483151601 -0.82014869598080908 -0.62611410503814857 0.53478726544170596 -0.40281785202585257 -0.50650514602990215 -0.38882152988520924 -0.79917314031913456 -0.19864109822920953 -0.13565105489947485 -0.51251662416847221;0.33440665473688908 -0.34760817363164487 -0.4462253930893002 -0.62522757607130386 0.13700133356067032 -7.3611420581724298e-05 -0.0097621271151539148 -0.064899963779670361 -0.41346669821990689 -0.74611819900466569 -0.81555229961230569 0.81642601882225341 0.091135541163383404 -0.23859024514809027 0.025477920637462813 -0.53791094079660529 -0.46959148779746446 0.080217506081320972 -0.065939605403204593 -0.17134433995014806 0.26913337444563068 -1.2952264732643601 0.2100984743320389 -0.062203752471880647 -0.0018869323934692789 -0.34693435093282482 0.20134135017281549 -1.080950353093066 0.097305152055609856 0.07159110022200478 0.029043460140740225 0.096872009386937699 0.73377989705654656 -1.0455733693503444 0.07207327475590275 -0.4579430426671493 -0.15877354726253484 -0.27677943531602711 0.52627294837908312 -1.0193576550520038 0.43640322997395298 0.072231981847345542 0.0022508050321002129 0.14863310482072886 0.38615026694289079 -1.1104482540903584 0.7102816788912536 0.42717945058946405 -0.099078743897185906 0.55862291518821527 0.65682434174954107 -0.30460515992587761 0.15234987687000442 0.58415799102322696 0.2902562839163903 0.65274121469133639 0.81413688544504959 0.81155284829859786 -0.20649059659825217 0.53391718135147059;-0.33118295235597006 0.31231620083079842 0.31923245591322558 -0.89714202994973691 0.39458729873859089 0.35142426787609904 -0.36892405056137517 0.16572008754299794 -0.041666769208788326 -0.2137280214227982 1.2570136105675931 -0.19429259390419557 0.26585955012849993 -0.23305172394256379 -0.39026904404900853 -1.0279082997065097 0.93152409844641937 0.071009802410733777 0.19324864569074238 -0.4569167733221009 -0.14186789041822279 -1.4727017507047393 0.47632003346634078 -0.061601134969514845 0.21272324383554628 -0.45329300737110517 0.25143111233443299 -1.0690264973026191 0.25440276246050197 -0.12420494151531952 -0.098960945494387303 -0.34112921213403535 0.40166105316841549 -0.81819538084123133 -0.56468851282865162 -0.094126171951514556 0.13899953214695873 -0.21521287734039773 -0.061944547312944805 -0.40060360833821074 0.086467060471221935 -0.36418630509921085 0.086223412252476483 -0.86081317816805836 -0.023708218467246432 -0.51051993101776605 -0.45935442535723087 0.27643056465423382 0.031130383959177426 -0.72652256638291868 0.50937784155191557 0.096069435627929564 -0.96769852777274934 0.55931835145598185 -0.18932166491213723 -0.85170090912080476 -0.13663452516925434 0.62864001118678625 -0.32534607347032507 0.19732252965692917;-0.33270645762167905 0.46775777191470308 -0.8232879173760812 1.8152168633365826 0.16739106802356701 -0.33747764745700903 -0.35590192228299572 -0.033191338616480964 -0.33298861789345435 1.2079309432318435 1.7972480008822593 -0.14231552219938687 0.022641700326003794 -0.023779856844213153 0.045843203908234278 0.95404333708806877 2.1423539748098688 0.22308970438708012 0.38814655724257846 0.016150426817613153 0.5053165279423093 1.2157793068245426 0.86312130276886068 -0.23456224154147751 0.33130469265325041 0.033887117518486908 0.50138606203450398 0.56501672918247026 -0.045789673311706941 -0.3184344983160326 -0.10513988267268472 -0.27046898770374617 1.0112529329884701 0.8123363351315056 -0.6164406273935662 -0.29092031993661549 0.2694819631738507 -0.125746496091063 1.2893310762732884 0.18114789526463726 -0.54023599721684956 -0.15681148164365405 -0.66085872777710786 0.22380495710093018 1.226575361064421 -0.35291567010492308 -1.603749528432503 0.07973310290352148 0.13485071279419977 -0.069687126821021877 1.9420124677402595 -0.79995740990082664 -2.1241648352267872 0.43723054595728139 0.48953193400247758 0.85082105090282434 1.3889524568370499 -0.88637024300987532 0.062360201048782732 0.12161123325606615;0.13957970285814478 -0.13019250938593563 0.17994622859244894 -0.03472802670030295 -0.33544626840713837 -0.07014789992950074 0.48766668864870027 -0.095107987960561496 0.26253403441487644 0.090034543960927804 0.06005115117622932 -0.039440034854615363 0.23796745456322183 0.21677628715126179 -0.030064577261344677 0.10583038309975275 0.078832171936624756 0.086071419543392827 0.20349398004121561 0.024706068076813158 0.086167326288125234 -0.36430274323959627 0.097527457328086195 0.26772073063488233 0.20406910190189484 -0.010874929928144058 0.2202542824374816 0.057578884388631381 0.30299727568241996 0.084945486506554729 -0.19099768270496922 0.31609710927705109 0.2106369694841661 0.095164575193049813 -0.38775193323444251 0.23941009120849327 -0.5163302502649193 0.46895017549797496 0.026799150685109806 0.088539091699820632 0.036973173054778992 0.17771867120193419 -0.58912076762683729 0.40650938828464811 -0.033501077746139286 -0.0085822978373811688 -0.12341207172885418 0.14596596637198686 -0.33586663470148892 0.62436508398173352 -0.16429217352538766 0.54631410930409263 -0.018144968828606365 -0.27359701431021816 -0.51631080132637686 0.24045517746591979 0.043801931557425795 0.087710305978603673 -0.22848764908212488 0.1951239346281618;-0.076529688186120687 -0.78876938314409129 0.034830401254799477 1.9496711798055628 -0.53601965404505458 -0.28143848422952961 0.20276794385247535 -0.008404561102216223 -0.10898045371431699 0.97696398252765626 0.24304048507528062 0.2021209081679918 0.24432035301732419 0.38624654411877357 -0.02113837727750937 1.3356503398046988 0.51905587099841655 -0.22849187604084389 -0.30944299104745282 0.45350183544509609 -0.20470503155388331 0.77902657658402819 0.0045138918382309169 0.036685036989865437 0.28107463950985284 0.50403563207136093 0.43270470414172973 0.065906159838926684 0.087067690313643295 0.23623816212207691 0.17910636683184619 0.40925655146610057 0.28657643750035855 -0.39280193006218556 0.35703888298264952 -0.21400182534459197 0.39621420805851609 0.30444133788313199 0.60930625754702328 -0.59812831043743553 0.15764072968624104 -0.11082350713901805 -0.089652278193306761 0.33740869588420347 0.49719606517401282 -1.0606068509275466 -0.22362192972987027 -0.15211639977444266 -0.24259116634139555 0.018293073266950295 0.50790168564408544 -1.1083725914115683 0.018285920215269671 0.35446342927087116 -0.34736212740413969 -0.33395323680085764 0.36301132241358341 -0.87184854995684602 0.56815555175864585 0.2185563267419002;0.11222745656227821 0.079243438840751079 -0.05639742858879928 0.72662783282913401 0.059609462260279841 -0.30683821216034685 0.040948502824535937 0.50576188012592493 0.1045624525868368 0.23459974913917672 0.082969129765632227 -0.10884959119130781 0.27581498087301792 0.23425070593053243 0.012280347119455819 0.18118884178585812 0.35729818708971045 0.10643911009640881 -0.025989594229703396 -0.17771400230523821 -0.12468207788801292 -0.21526862703219013 0.35878536744059158 -0.038500655459317266 0.095124307604936564 -0.30622707480264932 -0.42125987357001365 -0.26307661957231637 -0.32105922493878986 0.25318216934664889 -0.064728464890698195 -0.69711117003753853 -0.73545843249295184 -0.3187628777763224 -0.26406035499536074 -0.27574929169985229 -0.15116178917140125 -1.0553400440431024 -0.56828238973430356 -1.1920689874113288 -0.37148946285982937 -0.31382976171555038 0.26760778157950355 -0.90971703195826481 -0.84025274361321511 -0.69631042891599992 -0.3946943261406759 -0.048601705240087077 -0.14918619863452745 -0.55670883244349589 -0.99790427717669972 -0.51285960099286698 -0.18768974255408072 0.30250322883261233 0.25816876346884299 -0.48326386904306801 -0.60762469226051841 -0.39281959734000604 -0.29952278586183145 0.19998216956585435;-0.0081353465025064721 -0.38596259381833115 -0.69920778920372351 1.6097184668811753 0.017691883765562737 -0.3489968379458443 -0.39787699814854488 -0.43052890991482945 -0.72315505349463594 1.0192149648767104 0.4928143074189214 -0.42458333436886214 0.15044572493569711 -0.063701763953207577 0.00020672949647705403 1.283808400388758 0.7238063443012962 -0.51876721718913599 0.023279879560826808 0.70609651752648528 0.15065088768025794 1.3147175100357189 -0.11194039440893291 0.0097430748294347388 -0.16503230348735676 0.55770889484514885 0.31639864020239944 0.30137691093206598 0.032315294955851656 0.54412819551806935 0.20049536305809265 0.23968311901229508 0.66252922014703119 -0.0044871534325804912 0.010496094779038687 0.057771018986383336 0.17338554863485733 -0.14455661204868026 1.2065146174412553 -0.47774914037344823 -0.075204559101121546 -0.27863358500283109 0.18411419406380675 -0.17448472076074825 1.2015572171368645 -1.2594432457258429 -0.55213899515871023 -0.085438719547623235 0.026198801965958897 -0.33663740827312894 1.3967575355591846 -0.90149470096817574 0.19224968079558613 0.51863093833240759 0.10849790881426331 -0.38806754298836926 1.3810865762629498 -1.4943754851203275 0.39054681186796003 -0.070597880725972922;-0.072527680714736198 0.85637311620527778 -0.40180372444746404 -0.53713316601000938 0.094364568364557824 0.23366376738661171 -0.1492307617497366 0.15458890475859607 -0.37578190796244904 -0.56995969057726759 -0.51901599887832428 -0.27934471947926481 -0.2992463405441721 -0.36357410415047348 -0.16045379480512717 -0.80817575131214803 -0.84146217877036311 0.16944722445252855 0.046338808707785263 -0.62142891869630934 0.39653768276471985 -0.72013990909463832 -0.75231226620137626 -0.11854256453446595 0.013737622665415491 -0.39526328759835738 0.4438613943342482 0.13648175135349719 -0.075681392595883384 0.077066761563932967 -0.30226890689421326 0.15017168576776235 0.14899704865326999 0.23521911183083727 0.034095393047129649 -0.016731603147431898 -0.078319149367471572 0.27617353620543766 0.73418899886193933 0.17118276270707783 0.10663676739691219 -0.18231973618829475 0.2433516303361406 0.4132498725752668 0.28258726196369816 0.23543901980069398 0.34805219849978175 -0.042008316284615974 0.038085401349044028 0.80086505310244527 0.90906036420746283 1.1508338627926549 0.22257401457139708 -0.38675091263504402 0.1763950710111252 1.3500842223439424 0.74186498069271956 0.8627547254454897 0.14728013086603922 0.20116253518451357;0.28693389696157107 -0.47819953388489084 -0.084723158773308729 -1.5646692988039845 0.29641207849755408 -0.0041873843112178837 0.036802995632192727 -0.15398894966224472 0.084096608373786325 -0.76483883751407444 0.31303411350708454 -0.02018991629457445 -0.011124087046905822 -0.32254118443180868 0.038998015495257221 -0.6397312108709009 -0.14619283928618915 0.042229943839636228 0.079892154527305498 0.1051879269479484 -0.11476118733223163 -0.6323199085284178 0.070907483419351991 -0.006669809714512873 -0.1932389249577825 0.17467420176209053 0.65622505592692693 -0.37043451393923488 0.4814446207861211 0.25323927758560061 -0.23586115109275746 0.13631453359114626 0.28201027837988668 0.02437114500002549 -0.07581829668657511 -0.11526628774466068 -0.2360453471318727 0.24079510149285635 0.62014213549269692 -0.049619469021285459 0.32108033191879753 -0.17836259661145468 0.30521944533944884 -0.12156438131527635 0.56572485265044803 0.33643591235582548 0.55830039253582697 0.25942830036026271 0.083479454578814297 -0.57850554610868388 0.5211059835539934 0.52730977007688296 0.45547857256551366 -0.20077296569922937 -0.27193179133812279 -0.6255745323505939 0.70477933126977255 0.56729415324006538 -0.018474753422217924 -0.045955510557848384;-0.32179057394692961 0.47730714943633967 0.065241382384027213 0.13233063264348224 0.066371517847149258 0.3744452962308944 -0.21286370841939362 0.23864447920117468 0.024690736485284949 0.12815847702242286 0.38655449511103041 0.40424610097088043 -0.1174209004350735 0.28904530829482161 -0.22477673479648874 0.089532521662442424 0.30237629940319199 0.35671111424032137 -0.26192437940909075 -0.18506026907038584 0.078148086360943045 -0.58766523811163762 0.26078417320942576 0.10751790517442972 -0.037185143428708302 -0.48399836124455842 0.070462104791522692 -1.0088371779154406 -0.35702621919721145 0.14470861014815914 -0.17355510541951935 -0.88835398000004595 0.49464837930327649 -0.49407362324342335 -0.19028741972765928 0.22742102103278275 -0.21747758400185591 -0.32699097783402775 0.39954615312039571 -0.29257719965610596 -0.15066588979389325 -0.041975503073181895 -0.12974041880397635 -0.70057660827356183 0.098869953595657978 -0.018330017237874436 0.16446539812902577 0.37482232268910409 -0.055221011869887669 -0.03513809781191074 0.55972852551841579 0.38880031266056125 -0.38576250140181428 0.098024327150057614 0.0096637345828360435 -0.24349461168382272 0.53866155081567202 0.27700772508885585 -0.26404248411013387 -0.19988849272329592;-0.13113392559536471 -0.88146792879272373 0.33860248222179745 0.11579473503270066 -0.57556552954790019 -0.19129807020190862 -0.26229650894371193 0.27951563792042128 0.080129713654436413 0.34092103805248203 -0.65820531572279495 0.47336494866474732 -0.24557799687981649 0.71536633990206056 0.37610606599863861 0.23403135093731034 -0.74875698235024946 0.11816301823049503 -0.12420180042016854 1.084993469242318 -0.093144445911158918 -0.27049667922283305 -0.26172117277357204 0.25520016998035272 -0.15681983794848342 0.86378754628295751 0.031846147454347988 -0.80862105004837304 -0.22263126659771132 0.092150082051170715 -0.05803489372168661 0.1875028833113721 -0.28046784420926801 -0.10431176950518602 0.89786160824430838 -0.23643862800331353 -0.069689716853679987 0.49168123593656937 0.088881128506038465 -0.35409935042005042 0.36523856657663761 0.088354919608466642 -0.25563800660602098 0.22308047101359849 -0.44691182839888838 -0.20854817366371525 0.91884976883332059 0.20406742838376279 -0.015732310541067069 0.13769079608037255 -0.65898685540620572 -0.17097283243693445 1.0077873123707954 0.070605308902916789 -0.4749559757936147 -0.15180315293853477 -0.51960311747757204 0.17252941747757994 0.11556703940793753 0.17455878368397187;-0.31635725697206796 0.15593734281010604 0.3064272639977132 -1.5139572907852259 0.25059470940548534 0.43328045692014594 -0.36732299527037149 -0.19668313431849338 0.26672012440228132 -1.3622663104785866 0.7664926403259944 0.57571128005022787 0.024187775492505781 -0.17870719054125048 -0.36136198053171348 -1.1254219682857767 0.80296212406831591 0.19305532803606645 0.2249201042439094 -0.73115006534084315 -0.13416283993684094 -1.586693623682923 0.52652718403627641 0.16348415877497494 0.31973121386913167 -0.68195296740048694 -0.14129611774267303 -0.53120695106669868 0.30666930436221213 -0.46544905209415754 -0.27478471722381753 -0.60673412515433278 -0.29119819583177337 -0.68539594352391131 -0.37807753594925408 -0.3028119973191355 -0.22470378489706494 0.080313138773611653 0.074211472278781387 -0.22083300103871487 0.20675668163710886 0.30536683668518244 0.27651694372059826 0.35129919258130105 -0.21505655121898076 -0.016278878528805461 -0.38295337833453219 0.47080902599956603 0.024009342175998687 0.26507694460335773 0.073346758184402838 0.42927234575570755 -1.114013498604439 0.12963145572715443 0.072637156462444105 -0.061097063611488457 -0.30941626222265406 0.80207152440100538 -0.38196829822947409 0.31986666741012182;-0.18407596177267979 0.21583191395495482 -0.080797553821992385 0.26699226034907386 -0.42629711221142319 -0.20753195881520028 -0.41950335773313424 0.13977128786899384 0.045152880138939498 -0.13191851177683026 -0.26730701670745388 0.20471164292079336 -0.39141262381866349 0.26819427613128993 -0.019667464938376112 0.60648851087072475 -0.89446897049246255 -0.12302933154882192 -0.096961560654941617 0.32345974020631674 0.2675952083063019 1.1821741439544351 -0.63898915490985275 0.38670908097250412 -0.40114147613568601 -0.21409117864551547 0.22141219434948592 0.90444375598336713 -0.13490390671841254 -0.11355070125456132 -0.10263793487466487 -0.071600871065673102 -0.074481587793361739 0.57541210343553806 0.54486153340877919 -0.20506382824091254 -0.090799027956211351 -0.74513743572483293 -0.39075497858665686 0.14564737417933055 0.65465713267937131 -0.080969100918560147 0.35880529592746679 -0.72186270698948063 0.52246237783071181 -0.44699556160279863 0.7436338475062646 -0.049262624000269851 0.41215667293028263 -0.41412534483011282 -0.018021632775508407 -0.62645093989064582 0.067348225780404183 -0.27156407284103617 0.574555058911147 -0.56319136523542668 0.36406438134730712 -0.62540359284020941 -0.45139869658271226 -0.12423397378311445;0.63480721808781515 0.32222283720618711 -0.12126464880223364 0.52060155349704673 -0.11605676680696331 0.042145093144376797 0.38471257149802496 -0.0050564357708155188 -0.413909143950354 0.076562152906515246 -0.73678499739356496 0.19845040630369157 0.48075759009952146 -0.21053260498129214 -0.031570752587230022 0.11060666502766414 -0.9017643581404956 -0.14982795330968182 0.020716169897149282 -0.31811023429088259 0.080697769052205243 0.75203282273975713 -0.42404663655144165 -0.28978063962332479 -0.27023080711162878 -0.21070215685407484 0.54325901130333121 0.41964909898673297 0.020718498073546553 0.19606580998091783 -0.039565485310209494 0.092006910640598211 0.4803971218087823 0.47027586338150357 0.45019793410568937 -0.061934147101120968 -0.15010500735487511 -0.2690450176697281 0.56698728260372411 0.36141040779573147 0.51215815414509402 -0.31049068381264044 -0.42675268955418488 0.19358414315151762 1.0330874520636522 0.88019258389427601 0.54500046754549758 0.066189105114418417 -0.60652649625094679 0.033547522983310485 0.65071971416439001 0.18353508914064257 0.2901597330185941 -0.45429415257476119 -0.30487273330263182 0.51120969609300571 1.2313183827611307 -0.11093025096976226 -0.081308067530466321 -0.055443684797893973;0.17499269325536385 -0.36336122968143353 0.27826780673086254 -0.46909279446520302 -0.024980478554255708 0.28675526928173134 0.35451357590715643 -0.26923563419100105 0.074476658554834332 -0.79400668577271227 -1.0145478806439727 -0.16055689192189501 0.21809713402884737 0.11090821937059789 -0.10632409539448474 -0.780556498687906 -1.3034606802027509 -0.13402837964006686 -0.2808358760764727 0.14775109176768378 0.20609839580963979 -0.35461882357959629 -0.16675914530705815 -0.22035313498087811 0.10472454678968314 0.15723469213692723 -0.32917899512835991 0.00071004779391780314 0.45855464233712456 0.13894981442703577 -0.066469549172941483 -0.036464069393440782 -0.0095629790910703831 0.081697009874102583 0.1038712381509385 -0.31356780619808378 0.14028218733209286 0.097011306859971586 -0.31654162241503991 0.25521860924815465 0.21660377200224687 0.10046544168158129 -0.12488954209549206 0.42154429482779843 -0.31903337098557205 0.88847687217649074 0.67048164944878264 -0.049563951954270657 0.35687352828808994 0.56389529526564042 -0.085292558397083301 0.57661472155830751 0.44095840940144659 -0.13987447126301697 -0.26231582874062925 1.0457775557288602 -0.55477310341439356 0.84219167886153457 0.40818465967242784 -0.0087343029190159426;-0.20065234646419855 -0.12129251307418878 0.0030910830178718365 -1.8185122764283059 0.65412151890377412 0.22084261793309529 -0.07638078434155475 -0.11734134912690027 0.18309588940515137 -1.3602094520499008 1.8120799934530416 -0.089557212793779872 -0.0028950741738831267 -0.47016767824243216 0.27899529854431004 -0.81514231504138535 1.5889491886568301 -0.27726623503871228 -0.068092887464036633 0.17480192757116558 0.32378054966106462 -0.73152918143520551 0.38052098778223004 0.10153756107508963 0.27155681467607962 -0.06037954772340802 0.68412823675982781 -0.28501181821163363 0.023292371418021495 0.42022779333721116 0.062107504580440114 0.32266402582790293 0.18519133104634131 0.52144316761342779 -0.96827471408171906 -0.18008658059289406 0.5002099417457947 0.15791083551572219 0.67544185190322148 1.0557453588259857 -0.81508517407742986 -0.27512279757869373 -0.12956990849073521 -0.092847847720402457 0.47865344111109615 1.5558457723169199 -1.0010865392987902 -0.24672189297846267 -0.23202362098820978 -0.21235037875748775 0.87725242181283447 1.3222211764704079 -1.0253479569781789 -0.30074847323101755 -0.16285921342927662 -0.035718386936757968 0.33923783594091078 0.92742526622485066 -0.059583351465603625 0.25030083646589385;-0.29025894461828033 -0.34583668233310366 0.48257189553829477 -0.49877262263488592 -0.44107438622594441 -0.45143800617129137 -0.14190684893836905 0.16743773413903795 0.55187262047609609 0.0084091805877086426 0.33055225236375668 -0.45350152881561101 -0.12218135723705156 -0.0090019585894745013 0.13019564824899327 -0.15941903867120669 -0.0053368041545403533 -0.16802496560238553 -0.07767152403834672 0.0026757873941336149 -0.18796818713751548 0.37437539528094499 -0.025728999393111872 -0.20716938103541041 -0.18476409310640823 -0.031049370383174769 0.35413370104103997 -0.053658534134802226 0.32520460480136737 -0.15836442532504438 -0.20373895375679038 0.040951624710598794 0.20658734464029985 -0.13202969028691611 -0.01448331134325617 0.025575964261286374 -0.25284007335656417 0.075808897029678968 0.062227156347487732 -0.55688586652911209 -0.3476620929483667 -0.24475843257266436 -0.24860651140530329 -0.086369615224354421 0.20561109991506613 -0.57312355815895211 -0.13785203195644091 0.24144595514071085 -0.15317394015958555 -0.30322706678599548 0.081338846454110339 -0.016330892333514282 0.089234521138791836 0.28970786894474848 -0.76243901845500339 -0.31035077968251534 0.16423196179296309 0.1949863480811268 -0.36816285640473562 -0.43535346468910435;0.3207715018126911 -0.0001884584803887937 -0.27419946607082774 -0.28336080205899794 0.17568988886877973 0.19388976242107145 0.17388809348191106 0.17775084811578737 -0.16822392300813857 -0.20587101256366366 -0.31298529878363623 -0.22966253871169803 -0.16413699146484403 -0.22708592017189014 0.30064227094228818 -0.17705404774311895 -0.20715943474711784 -0.020692236902183622 0.27870060359549897 -0.23909390760536942 -0.21418454672391504 0.3064302948623101 0.013518489447312317 -0.070090136990511864 0.00045322489453705414 0.070941206728318718 0.020369698194363364 0.42025964967973184 0.12485112951166946 -0.014100952959955747 -0.12039559724623995 -0.0048110068440310261 0.051722529595520636 -0.037789378211172203 0.27443652349098835 0.030939324806603503 0.26003406390150358 -0.035272693627920508 0.20500597465508771 -0.091196096923838413 0.14270006774217767 -0.2924672963017842 0.41190679549823295 -0.10277581933993639 0.18122520394281114 0.35793890042674015 0.19319603260037249 0.044011692787920352 -0.047000241310343423 -0.28223440590816684 -0.25325150194182805 0.027124763437414684 0.26760214379803487 -0.29254184971254149 0.10083515843172075 0.081204417223625591 -0.11353656705987281 0.036220852621255566 0.011624649531944477 -0.11715900148194162;-0.0135285459689667 0.58824131812219072 0.069265882558577005 0.28163332576862871 0.07700733754183238 -0.41710158525426821 0.00053062567712120899 0.19901576741248597 0.16600638508709456 -0.38143470623116754 -0.11507575349671148 -0.0062968166702317601 0.25297609247752262 0.27034435858442107 0.34441445290521377 -0.0029941907787113019 -0.34321453180267963 -0.037995293654710383 0.025705839551023915 -0.030872709649339702 0.22523843756397227 0.50389235754616024 -0.20280284088787262 0.15053427399126371 -0.19619530704898105 -0.23847605154335938 0.28437294619357134 0.39060325208151792 0.077971302500062747 0.09698049126712982 0.015434308669148075 -0.79778790822267409 0.27155206989152664 0.033041552823530079 -0.24244568718661694 -0.44884428292110989 0.071789866975600178 -0.78739068913477028 -0.18294456115001853 0.18739926208136912 -0.091663916296157805 -0.33381320905845946 -0.22709250703386291 -0.51660445116562848 0.29734662909971799 0.15780157383758009 -0.1899229589070299 -0.11064223243288701 -0.019727508233363382 -0.51380777524341592 -0.29108565542258513 -0.1876191233365255 0.29354913793640325 -0.33397224549145899 -0.0032159851198505845 -0.32244002949109363 0.033272793226912963 -0.48788513964819497 -0.24508066177320037 -0.71102807379596089];

% Layer 2
b2 = [0.32052098843043458;0.066851241316065291;0.27631520176796209;0.013896488094911303;0.49126313224098767;1.185669066023852;0.98686210103988647;-0.19856976164762208;-1.0136119596818141];
LW2_1 = [-0.98294776243124449 1.4130793444094685 1.0675349149037254 -1.6837803554231523 0.68309110725677302 0.02546558565604734 -0.038783635224450844 2.0219940300164079 0.10162333579920668 1.4718555265255333 -0.54335552631808415 -0.15702530519228541 -0.098479167394455586 -1.1512032279804905 -1.5536921886535404 0.25321897972083496 -1.1002387348086355 1.3506037587742725 0.021276182674442236 -0.49914483600269466;0.92037208101560464 2.446946974313255 0.72675195876017629 -2.6056023187116821 0.57095011302514909 -1.7239164174623365 -1.0740634417930279 -2.3095702563523344 1.6280692294644867 1.337300205111281 1.6229965003891662 -0.56754388874996331 2.7096481264089576 -1.0227311936372558 -1.186063377757274 2.1334365087133471 1.8161054243636003 -1.0669008287904265 -0.54606077595613312 -0.61938459487779307;-0.22373966030879636 1.8019050147193254 -0.87952171483707753 1.9200600943334403 1.1710303575303174 3.1821887899629888 0.63557702268976812 3.0220295154135473 -1.0796045326386632 -0.79950890785065809 0.12120264781395668 1.6560774653078814 -1.1229811685125692 0.52953439078761622 -1.4608931342702194 -0.62050572218091871 -2.6739612303844877 0.54424745343116498 -0.4101232446360305 -0.20811664445261807;0.85060301568974006 -0.73581383099645248 -2.475952310991588 -3.2150943979814133 -0.16197330493716364 0.66603990443403793 -1.6261816784782099 0.19281746238689171 0.26852899220364707 0.30535409008312986 -0.80597889740825646 2.0544790753559239 -2.4989995193917403 1.2934532629612194 0.46469036429550509 1.687658599715252 -0.93377757391352323 -0.0039449466794495196 1.1762185499578162 0.17378500141696604;0.050360555248952922 -1.5273429036553212 0.63927256363538976 3.3786021153878893 0.46236280736951851 0.62162721156564604 -0.61668566687606052 1.230447695671276 -0.6181285495068799 0.17491407018450217 -0.24966027563824225 -0.77403341590040808 0.23091974279281699 0.1793624556590194 -1.0843569796499632 -0.64109601352092516 2.8096899928864576 0.58626052313446719 0.28848804714850945 -0.37620759544687277;-1.4848805291413782 -1.4946346845101122 -0.78068414874307757 2.1587551661851827 0.25405111883952125 -0.92702955552991284 0.586829760624343 -1.1196485041754141 1.3692848724690536 -1.9402232086656457 0.34243470744604448 -1.5931525209897364 -0.93294960732819709 0.30053424605084827 0.75144476392831705 0.38451694142991372 -0.11323407869210372 -0.41880243415347945 0.60131800707475558 0.88954920045602603;1.4314957420187828 -0.3681160272987366 1.5808059212254675 -0.65569580094582713 -0.80631194981283472 -0.25981003161324856 1.7510462317642554 -0.073776276498578944 -0.94118305980343198 0.2830672023916016 1.1897291932171865 -0.39422997237651647 0.021476036330363494 1.9719666276729915 -0.46877841993371783 -1.1057060042200677 -0.054146215919982206 -0.36350269343378749 0.80572255170723361 1.3567651507241882;1.4062780752111861 -1.4592931135810456 0.033887153131841145 -0.74730268632069086 -0.47376828186291353 0.63663708159991184 1.9132589625048424 -2.0827679722201515 -1.5325553492111956 -1.1081341323833103 -0.40357874854461567 0.68892265936299479 -0.014951499965695085 -1.1487247893743429 -1.8064615370434072 0.45752763232784754 -0.19329304260024863 0.56269879152779712 -0.86098935736004201 -0.23350175787206787;-0.61279005803130593 2.0548608928007814 0.4321483348248728 2.289227879487302 0.097104973248271498 1.3408805764811778 -0.7229469802199292 1.8633558691051644 2.9199839187097711 0.85461128376321649 0.94147566079233913 -0.57101146410178338 0.15732425505090805 -0.61009466855568484 1.941524327500374 -0.10360925990948917 1.4410748449288993 0.48867468528690516 -0.17699503952354456 0.073067320622928325];

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