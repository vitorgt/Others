#include<stdio.h>


//928565486665882042554687377851586049811727051202943778653002035883949412622569985565217252526068096441148621705633937268468348064993840680229213058794568945329011360433705149095814465178420156366919407413258531722923463563224422219139323426077006108323061721741278117603745572527861310751058362608836782467923498747567822579951254214099150884234206718113079406931713204905282119245234564595627966793892667945071359197162835824837567502525411040005602541429110077374985224722905044905054411152069727436614912655741139437766871135240214628144980687929957085578431489913122309023447126101147701276007910648511067909787874878823573857475707602522376089791113938944984980062951119567560479049441036824808309686863997699942726951523045456363592690963984922643188057281383066448746600864803885884709075550007781145071537988075966279326380143879681982529572864526885941915723509033146151681774624484474257329728461116859144363607273019638456725972267215724460685378716576887690075812078985322600951576580549221893177909831498276176433973437569944777502506922196780589077641297188658815704359468707249968204290273309771814237890189152694808542547860897204815815590027332841746168271754369334369585287269286512558222386187361756539982788920789717177841859902489770874255465638714445834630769512281392130463945224519027844287889629141816438275593551767266334461055106798682558760111144918409947951938456048969191756553534247779756125446056055872804523768694915971673864770489446210549812028558829268768164756588118703316185283364064020187124454779639470598897843376124382395612637306903113037546898084526664217870910686623266612513723492457826603676938288155491676961187981928970052786434719980479842117522200191743813991868406993656356660636984541641817385847983030756893527096442951924114414028220722913833063423238289223258270538104881449278794432835646569246122841653942975233128081826407132556260093969473619144858177117401292959206397469369793140973808036008300312902091255300447930463681405484918206904027180736468155989636230294502970247364368986591025756752781051597455966067185144723399547551527179917794870854523212978796033194023191245881228269345178004377071285006180626287116901361266578704681680397986528090054540289854766556173993762960411567812747977944708624133604139214465955998893795945788556923850992101123819231503982817680878476294151462130067328393335508014922208022074472333895598240727655498376739336519512382538668174840925619031025699513522061648042851863869825764288288570716687843478058057476722380912975128346432938716259297295480897129118307462168517427377182278289607081877194229479109477583259516105758246489357945755720683432340549077501597274111883988868952429384794015587122650852070469920754853070825915433746489916869712893532276174700457796700631686737243116571504348117953815282272100276099951653535365314954186027618845214459103074522012363602878945526071606647407799693580503337073640272479682964093247739939475201792954502806763409863307463972986179678374456026054664433817586054432629472417694027909832271633769644831287043026617901800667924562878853893075256815016727972967106013823455976750644612571768221875302929524494822662327098680517885170761793951712486860375089071260747108644801516937809198762700828348910111411019670171304571808175562616777040791770927889371849479338169783239957555976952265495003821597432850740504580440199582483004792912703861995999982479173603809319049932314366782294226216893673210788840904478718495524530537365814636741088358161622005078646529164444581451154996314448176994331708270916946827077261699410265733410045973471838245819035034376434334739607710048861901430259565428303522464081045448430638854283807029754736874215442538924231515187816268187275539752641705382349927400543845039662354121877039562705201526025915179905351713638701177489416126131840718344758608361796038185669811269731474106492629781863123316732444237917208454701444250540129388544505217041462344921436873767903072935796121572789372366780636587864050709941942204283700104857367331127326758705282217362748707128786356527671123640905949877421609034346390511591071745176450873795176291055847438051394582243927140102903774575592103846016422318667044028532175767438393649621822345877410723646017700459324185262217559605493657038818590592121966357006699342050481458523782927501219326187170309668774737836463487842187780428726522374977972830973644672416651888307673864831297364292346692716202624882418713941415321116139220133161835576986029749873420778030755395144350341811928349591344844772056240603461113631786245179046538550606978737610004240877794949793721156277338387151412438446399557416686576861786982599716459149408471130882427411983861040095860137937611027777233705426092174479302341812396324872279379074223103857629500403129103993454708968792361888156443750644400161523939619868917550529609692691742113482438791518000545906996330784014581163149115636692058728055418555787614975519488999424
//23602 fibonaccis
//4932 digitos


int main(){
	long double n = 0, first = 0, second = 1, next = 0, c = 0;
	scanf("%Lf", &n);
	for(c = 0; c < n; c++){
		if(c <= 1)
			next = c;
		else{
			next = first + second;
			first = second;
			second = next;
		}
		printf("%.0Lf\n", next);
	}
	return 0;
}
