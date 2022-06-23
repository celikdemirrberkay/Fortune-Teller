import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.purpleAccent,
        appBar: AppBar(
          backgroundColor: Colors.purple,
          centerTitle: true,
          title: Text(
            "Günün Falı",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: FortuneTeller(),
      ),
    );
  }
}

class FortuneTeller extends StatefulWidget {
  @override
  State<FortuneTeller> createState() => _FortuneTellerState();
}

class _FortuneTellerState extends State<FortuneTeller> {
  int answerIndex = 0;
  int hunderedPercentLove = Random().nextInt(100);
  int hunderedPercentMoney = Random().nextInt(100);

  //Aşk durumu
  List<String> listOfText = [
    'AŞK: Bugün, aşk ve ilişki hayatınızda biraz daha temkinli olmalısın. Onu her konuda doğru anlamda anladığından da emin misin?',
    'AŞK: Aşk ve ilişki hayatınızda hakimiyeti eline almak ve birlikteliğinizi dilediğiniz gibi yönlendirmek isteyebilirsin. Bu isteğinin denge içerisindeki bir ilişkiye ne şekilde fayda edeceğini gözden geçirmelisin.',
    'AŞK: Duygularınızın bugün biraz düzensiz olduğunu görebilirsiniz. Güne, daha önce hiç yapmadığınız bir şekilde başlamanızı sağlayan doğal bir elektrik hissi var. Kalbiniz her zaman doğruyu söyler.',
    'AŞK: Duygularınız çoğu zaman rasyonel düşüncelerinize galip geliyor ve sonunda derinlerde duyguların beslediği bir karmaşa ortaya çıkıyor. Çok da mantıklı düşünerek kalbinizi görmezden gelmeyin. Amacınız bu ikisi arasında dengeyi bulmak.',
    'AŞK: Duygusal olarak kötü hissetmeyin, sezgileriniz güçlü durumda. Sevgilinizin hislerini bu sezgiler ile anlamaya çalışın. Bazen sadece eğlenmek gerekir, siz de rahatlayın ve birlikte eğlenin!',
    'PARA: Kafanıza uzun süredir koyduğunuz bazı harcamalar var, bugün kendinize bunlara gerçekten ne kadar ihtiyacınız olduğunu sorun ve bir kısmını iptal edin. Bugün bir hayır kurumuna küçücük bir bağış yapın, kendinizi çok daha iyi hissedeceksiniz.',
    'PARA: Nakit akışınızın dengesini bozabilecek dönemlere giriyoruz, bu aralar kesinlikle masa başına oturup bir bütçe hesabı yapmalısınız, önümüzdeki 3 ay boyunca gelir gider dengenizden emin olmadan hareket etmeyin',
    'PARA: Bugün, başkalarına yardım, destek ve hizmet duygunuzun yüksek olduğu bir gün olabilir, hayır, bağış işlerinde yer alabilirsiniz.',
    'PARA: Bugün kendinize güveniniz oldukça yüksek, ancak bu size pek fayda getirmeyebilir, bağlantılarınız size verdikleri destekten şüphelenebilirler. Sakin hareket edin, bir adım geri durun, ve paradan çok sağlığınızla ilgilenin.',
    'PARA: Para kaynaklarımız ile ilgili detaylar bu dönem dikkat etmelisiniz. Ayrıca maddi konularda ve harcamalarda uzun süredir sizi meşgul eden bir konuda karara varabilirsiniz, yakınlarınızdan veya eşinizden karar alırken yardım isteyin.',
    'TAVSİYE: Bugün meraklı kişiliğini ön plana çıkartarak insanlara soru sormaktan çekinme ',
    'TAVSİYE: Bugün daha önce hiç fark etmediğin şeylerin hep orada olduğunu fark edebilirsin, sadece biraz daha dikkatli olmaya çalış',
    'TAVSİYE: Bugün ikili ilişkilerinde daha aktif ve verici olmaya çalışabilirsin, aynı fikirde olduğun insanları daha dikkatli dinlemeye ve sorgulamaya başla',
    'TAVSİYE: Bugün sadece işine odaklan, dikkatini dağıtacak her türlü nesne ve sosyal medyadan uzaklaşmak kendini daha mutlu hissettirebilir',
    'TAVSİYE: Bugün tek başına biraz yürüyüş yap, çocukluğunda dinlediğin şarkıları aç ve o zamanlar oynadığın oyunları hayal et'
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 120,
            margin: EdgeInsets.only(bottom: 50.0),
            child: Image.asset('assets/falci.png'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                answerIndex = Random().nextInt(5);
              });
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 40.0),
              child: Card(
                child: ListTile(
                  leading: Icon(
                    Icons.favorite,
                    color: Colors.pink,
                  ),
                  title: Text("Aşk Durumu"),
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                answerIndex = Random().nextInt(5) + 5;
              });
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 40.0),
              child: Card(
                child: ListTile(
                  leading: Icon(
                    Icons.attach_money,
                    color: Colors.green,
                  ),
                  title: Text("Para Durumu"),
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                answerIndex = Random().nextInt(5) + 10;
              });
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 40.0),
              child: Card(
                child: ListTile(
                  leading: Icon(
                    Icons.watch_later,
                    color: Colors.blueAccent,
                  ),
                  title: Text("Günlük Tavsiye"),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(20.0),
            child: Text(
              listOfText[answerIndex],
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          Row(
            children: <Widget>[
              //----- Yüzde durumları------
              Container(
                padding: EdgeInsets.all(1.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                //color: Colors.white,
                width: 140,
                margin: EdgeInsets.all(30.0),
                child: ListTile(
                  leading: Icon(
                    Icons.favorite,
                    color: Colors.pink,
                  ),
                  title: Text(
                    "%"+hunderedPercentLove.toString(),
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
               // color: Colors.white,
                width: 140,
                margin: EdgeInsets.all(30.0),
                child: ListTile(
                  leading: Icon(
                    Icons.attach_money,
                    color: Colors.green,
                  ),
                  title: Text(
                    "%"+hunderedPercentMoney.toString(),
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
