class Zodiacs {
  final int id;
  final String name;
  final String imgAsset;
  final String birthdate;
  final String description;
  final List<String> imgUrls;

  Zodiacs({
    required this.id,
    required this.name,
    required this.imgAsset,
    required this.birthdate,
    required this.description,
    this.imgUrls = const [],
  });
}

var zodiacsData = [
  Zodiacs(
      id: 1,
      name: 'Aquarius',
      imgAsset: 'assets/images/icon_aquarius.jpeg',
      birthdate: 'Jan 20 - Feb 18',
      description:
          'Zodiak aquarius adalah zodiak yang memiliki lambang seorang laki-laki yang sedang menumpahkan air yang berasal dari akuarium yang sedang dibawa dan berelemen udara. Maka dari itu, seseorang yang berzodiak aquarius pasti orangnya mudah cair atau mudah bergaul dengan orang-orang baru, sehingga memiliki banyak teman.',
      imgUrls: [
        'https://i.pinimg.com/originals/23/24/4b/23244b2e8e9a0be6feae98450cf9e512.png',
        'https://i.pinimg.com/originals/a2/1c/05/a21c05dfc83cab6807d694679b5c39a1.jpg',
        'https://i.pinimg.com/474x/b7/54/38/b754384c69204c942d2b01b3e1e31b45.jpg'
      ]),
  Zodiacs(
    id: 2,
    name: 'Aries',
    imgAsset: 'assets/images/icon_aries.jpeg',
    birthdate: 'Mar 21 - Apr 19',
    description:
        'Aries merupakan salah satu zodiak yang pertama dalam rasi bintang, dimana sangat terlihat sebagai cermin kepribadian menonjol dengan penuh semangat dan dipenuhi energi positif. Aries adalah bagian dari zodiak api yang dipengaruhi oleh planet Mars yang memiliki arti sifat pejuang, memiliki gairah dan aktif dalam berbagai hal apapun. Secara umum zodiak Aries adalah tokoh mitologi yang disimbolkan seekor domba jantan berbulu emas. Lambang tanduk emas pada Aries adalah domba, yang dimana terlihat kuat, keras, menyukai hal baru dan pantang menyerah.',
    imgUrls: [
      'https://i.pinimg.com/originals/73/c7/3a/73c73aea7bdc7a4f098efecd78843a9c.png',
      'https://i.pinimg.com/originals/9e/b8/f0/9eb8f0e66e9ddab18401e771d18ee06a.jpg',
      'https://i.pinimg.com/474x/cd/1b/c9/cd1bc9b9aa192b4d1e5c73b7a5f3e383.jpg'
    ],
  ),
  Zodiacs(
    id: 3,
    name: 'Cancer',
    imgAsset: 'assets/images/icon_cancer.jpeg',
    birthdate: 'Jun 21 - Jul 22',
    description:
        'Simbol binatang dari zodiak cancer adalah kepiting dan secara simbol astrologis digambarkan dengan simbol seperti angka 69. Simbol 69 ini sering dianggap menggambarkan sekumpulan capit kepiting. Setiap tanda atau simbol zodiak dikaitkan dengan bagian-bagian tubuh tertentu. Simbol cancer dianggap sebagai representasi dada yang menggambarkan feminitas atau keibuan. Simbol kepiting juga menunjukkan sifat tertutup, pendiam, tetapi protektif.',
    imgUrls: [
      'https://i.pinimg.com/originals/80/2e/9e/802e9e00824de8a5f40ae71c5af36e18.png',
      'https://i.pinimg.com/originals/5b/0b/a5/5b0ba59108f60e706a5a043df0e5cb2e.jpg',
      'https://i.pinimg.com/474x/57/54/c0/5754c019a852d5fee6c2c77caeea9ec5.jpg'
    ],
  ),
  Zodiacs(
    id: 4,
    name: 'Capcricorn',
    imgAsset: 'assets/images/icon_capricorn.jpeg',
    birthdate: 'Des 22 - Jan 19',
    description:
        'Menurut mitologi Yunani, kambing dijadikan lambang zodiak Capricorn. Konon, ada seekor kambing bernama Amaltheus yang memberukan susunya kepada Dewa Zeus, sang dewa tertinggi bangsa Yunani kuno yang disembunyikan ibunya dalam sebuah gua karena takut dimangsa oleh bapaknya yang ganas. Oleh karena jasanya ini, kambing ini diangkat ke langit dan dibekali cahaya, maka jadilah bintang yang dikenal dengan Capricorn.',
    imgUrls: [
      'https://i.pinimg.com/originals/f5/c2/a5/f5c2a59a88e92c31d8ace340c3dd5c11.png',
      'https://i.pinimg.com/originals/78/51/a6/7851a64a1dd681f5017442cf3b8f795a.jpg',
      'https://i.pinimg.com/474x/ff/4b/ff/ff4bff6e4de71c8f6cf70745c6333d76.jpg'
    ],
  ),
  Zodiacs(
    id: 5,
    name: 'Gemini',
    imgAsset: 'assets/images/icon_gemini.jpeg',
    birthdate: 'Mei 21 - Jun 20',
    description:
        'Zodiak yang identik dengan simbol kembar dan elemen udara. Gemini biasanya dikenal sebagai orang yang humoris serta banyak bicara. Akan tetapi ada juga yang menganggap mereka bermuka dua. Kepribadian yang cukup berlainan ini nyatanya tetap membuat Gemini cukup populer di lingkungan pergaulannya. Sifat umum lain dari seorang Gemini yang diamini banyak orang adalah senang bergosip. Bagi mereka gosip adalah sebuah keharusan, bahkan tak jarang melebih-lebihkan sesuatu.',
    imgUrls: [
      'https://i.pinimg.com/originals/5e/cd/7a/5ecd7aa403539a8aa1c61fd6c092e507.png',
      'https://i.pinimg.com/originals/28/fd/b1/28fdb152612177678b4bbb482e16d4ed.jpg',
      'https://i.pinimg.com/474x/e0/06/39/e006395dc5a02dd6094c8913f5f9faf1.jpg'
    ],
  ),
  Zodiacs(
    id: 6,
    name: 'Leo',
    imgAsset: 'assets/images/icon_leo.jpeg',
    birthdate: 'Jul 22 - Agt 22',
    description:
        'Beberapa sifat Leo yang menonjol adalah percaya diri, gagah, serta berani. Tak jauh dari sifat alami singa yang menjadi simbol mereka. Maka tak aneh jika mereka juga memiliki martabat yang tinggi dan tidak pernah berbuat curang ketika melakukan sesuatu. Meski sifat-sifat tersebut terkesan kaku, nyatanya seorang Leo bisa jadi penuh warna serta mengagumkan. Jangan heran jika kamu melihat Leo menjadi pusat perhatian di mana saja. Akan tetapi kadang-kadang mereka juga cukup gampang tersulut amarahnya.',
    imgUrls: [
      'https://i.pinimg.com/originals/de/63/c2/de63c2a800013b15f0d8e91f6a202039.png',
      'https://i.pinimg.com/originals/b2/b6/6d/b2b66d927f652c194589ff18f647385d.jpg',
      'https://i.pinimg.com/474x/d3/80/d1/d380d1136403c7af07e53383f65cbd8b.jpg'
    ],
  ),
  Zodiacs(
    id: 7,
    name: 'Libra',
    imgAsset: 'assets/images/icon_libra.jpeg',
    birthdate: 'Sept 23 - Okt 22',
    description:
        'Orang-orang yang lahir dalam naungan zodiak Libra umumnya memiliki sisi yang lembut, hangat sekaligus mempesona. Mereka juga memiliki naluri yang cukup kuat serta sangat objektif ketika mengatasi suatu masalah. Libra dapat menjadi seorang penengah sekaligus pencari solusi yang adil, sesuai dengan lambangnya yaitu timbangan. Meskipun begitu, mereka juga adalah sosok yang terlalu polos dan sering kali kesulitan untuk menolak permintaan orang lain, hingga ia sering dimanfaatkan oleh orang lain.',
    imgUrls: [
      'https://i.pinimg.com/originals/68/ed/60/68ed60de9c23d947e2140bbbd3099260.png',
      'https://i.pinimg.com/originals/c8/04/a7/c804a7fa8620b89049473dd05888821a.jpg',
      'https://i.pinimg.com/474x/66/ae/c0/66aec0bb2643806f6c3bb21f1e0a5add.jpg'
    ],
  ),
  Zodiacs(
    id: 8,
    name: 'Pisces',
    imgAsset: 'assets/images/icon_pisces.jpeg',
    birthdate: 'Feb 18 - Mar 19',
    description:
        'Zodiak pisces ini dilambangkan dengan lambang ikan. Hal ini ikan yang hidup di air akan lebih bebas, begitu juga dengan orang yang berzodiak pisces, ia akan merasa lebih tenang dan lebih cair atau mudah berkomunikasi dengan lingkungan yang sudah membuatnya nyaman. Jadi, ketika kamu memiliki seorang teman atau si “dia” zodiaknya pisces, maka sebisa mungkin buat dirinya merasa nyaman agar komunikasi yang dilakukan akan lebih lancar.',
    imgUrls: [
      'https://i.pinimg.com/originals/74/9a/e9/749ae91100f45a0abc1eda4448724944.png',
      'https://i.pinimg.com/originals/08/9d/71/089d710bec1b884717a808c94f11e8c0.jpg',
      'https://i.pinimg.com/474x/3d/66/f0/3d66f0ef355285476242dc092e848d6e.jpg'
    ],
  ),
  Zodiacs(
    id: 9,
    name: 'Sagittarius',
    imgAsset: 'assets/images/icon_sagittarius.jpeg',
    birthdate: 'Nov 22 - Des 20',
    description:
        'Sagitarius adalah zodiak yang berelemen api dan dilambangkan dengan Dewa yang wujudnya menyerupai setengah manusia dan setengah kuda yang sedang memandang. Ke mana pun panah itu pergi, maka Dewa itu akan mengikutinya. Begitu juga, dengan para sagitarius yang selalu pergi sesuai keinginannya. Dalam hal ini, keinginan dapat diartikan sebagai bisa bebas ke mana saja, baik itu jalan-jalan atau travelling, bebas memilih karir atau pekerjaan, bebas memilih pasangan kekasih, dan sebagainya.',
    imgUrls: [
      'https://i.pinimg.com/originals/c3/9f/f9/c39ff9e6711bac0743b91e6dd1b14040.png',
      'https://i.pinimg.com/originals/c1/cf/44/c1cf4446a5f4e8adb2f49bcee88e29c5.jpg',
      'https://i.pinimg.com/474x/d6/55/09/d65509f9c2cfa384a2de0f2c650758ac.jpg'
    ],
  ),
  Zodiacs(
    id: 10,
    name: 'Scorpio',
    imgAsset: 'assets/images/icon_scorpio.jpeg',
    birthdate: 'Okt 23 - Nov 21',
    description:
        'Kemisteriusan seorang Scorpio datang dari unsur planet Pluto yang dianggap sebagai lambang bagi hal-hal yang misterius. Di samping itu, zodiak ini memiliki elemen air yang membawa sifat kompleks ke dalam diri Scorpio. Alasannya karena emosi dan perasaan mempunyai pengaruh yang kuat ketika elemen air melakukan sebuah tindakan. Tak ayal orang lain akan kesusahan untuk menebak sikapnya. Secara umum, Scorpio adalah sosok yang terkenal pekerja keras, tekun, dan ambisius. Mereka juga senang membela kaum yang lebih lemah, rendah hati, serta dermawan. Ketika berkaitan dengan keyakinan, Scorpio sangat berpegang teguh pada peraturan dan nilai yang mereka yakini.',
    imgUrls: [
      'https://i.pinimg.com/originals/74/fe/8d/74fe8d6eec70e0dbd29d3d3cc25616e3.png',
      'https://i.pinimg.com/originals/38/bb/3b/38bb3b00e0ec215a7259a08c9d08ac5d.jpg',
      'https://i.pinimg.com/474x/c3/ac/75/c3ac7582e0c6e3bfd6ee5e7b6e3e811f.jpg'
    ],
  ),
  Zodiacs(
    id: 11,
    name: 'Taurus',
    imgAsset: 'assets/images/icon_taurus.jpeg',
    birthdate: 'Apr 20 - Mei 20',
    description:
        'Pada umumnya, seseorang yang berada di bawah naungan zodiak Taurus adalah orang yang memiliki kepribadian setia, dapat diandalkan, lembut, penyayang, serta murah hati. Selain itu, Taurus adalah seseorang yang dikenal sabar, sangat bersahabat, dan mandiri. Akan tetapi, meskipun memiliki kepribadian yang sabar, seorang Taurus bisa menjadi sangat emosional apabila sedang marah dan dikenal cukup seram ketika marah.',
    imgUrls: [
      'https://i.pinimg.com/originals/16/37/25/163725ed414d7933423d262422d7e169.png',
      'https://i.pinimg.com/originals/15/cc/e6/15cce68b669780264e7f50d8ab1b4910.jpg',
      'https://i.pinimg.com/474x/8a/fa/db/8afadbb68305cf38c3efc3759ef10f88.jpg'
    ],
  ),
  Zodiacs(
    id: 12,
    name: 'Virgo',
    imgAsset: 'assets/images/icon_virgo.jpeg',
    birthdate: 'Agt 23 - Sept 22',
    description:
        'Dalam urutan zodiak, Virgo merupakan bintang yang berada pada urutan keenam dalam daftar zodiak. Zodiak Virgo biasanya dikenal sebagai seseorang yang perfeksionis sekaligus pekerja keras. Menurut laman Astrology.com, Virgo merupakan seseorang yang dilahirkan untuk mengabdi dan hal tersebut membuat seorang Virgo merasa senang. Virgo merupakan seseorang yang memiliki rasa tanggung jawab besar dan selalu memastikan bahwa pekerjaan yang mereka lakukan selalu berakhir baik.',
    imgUrls: [
      'https://i.pinimg.com/originals/2b/ab/25/2bab25ff5bd7d52a2847abd95b35efbd.png',
      'https://i.pinimg.com/originals/02/0d/d3/020dd3ad5dbece8c67cfd045ca38d289.jpg',
      'https://i.pinimg.com/474x/37/01/d1/3701d16fe8b12435654a39f44fe4e372.jpg'
    ],
  )
];
