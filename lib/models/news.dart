import "dart:math";

final _random = new Random();


class News {
  final String title;
  final String subtitle;
  final String content;
  final String category;
  final String time;
  final String author;
  final String seen;
  final String favorite;
  final String image;
  final String estimate;

  News({
    this.author,
    this.content,
    this.category,
    this.estimate,
    this.favorite,
    this.image,
    this.seen,
    this.subtitle,
    this.time,
    this.title,
  });
}

List<News> beritaList = [
  News(
    author: "Nick Chong",
    estimate: "3",
    category: "Health",
    favorite: "700",
    seen: "4.51K",
    time: "4 hours ago",
    title:
    "Penyakit Jantung Koroner",
    image:
    "https://asset-a.grid.id/crop/0x0:0x0/700x465/photo/2018/03/16/3442868594.jpg",
    subtitle:
    "Penyakit jantung koroner (PJK) adalah kondisi ketika pembuluh darah jantung (arteri koroner) tersumbat oleh timbunan lemak. Bila lemak makin menumpuk, maka arteri akan makin menyempit, dan membuat aliran darah ke jantung berkurang.",
    content:
    "Penyakit jantung koroner (PJK) adalah kondisi ketika pembuluh darah jantung (arteri koroner) tersumbat oleh timbunan lemak. Bila lemak makin menumpuk, maka arteri akan makin menyempit, dan membuat aliran darah ke jantung berkurang.\nBerkurangnya aliran darah ke jantung akan memicu gejala PJK, seperti angina dan sesak napas. Bila kondisi tersebut tidak segera ditangani, arteri akan tersumbat sepenuhnya, dan memicu serangan jantung.\nArteri koroner adalah pembuluh darah yang mengalirkan darah kaya oksigen ke jantung. Terdapat dua jenis arteri koroner, yang sama-sama bercabang dari aorta atau pembuluh darah besar, yaitu:\n\n   1.	Arteri koroner kiri utama (left main coronary artery/LMCA) – Arteri ini berfungsi mengalirkan darah ke serambi kiri dan bilik kiri jantung. LMCA terbagi menjadi dua bagian, yaitu:\n     - Left anterior descending (LAD) – berfungsi mengalirkan darah ke bagian depan dan kiri jantung.\n    - Circumflex (LCX) – berfungsi mengalirkan darah ke bagian belakang dan sisi luar jantung.\n   2.	Arteri koroner kanan (right coronary artery/RCA) – Arteri ini mengalirkan darah ke serambi kanan dan bilik kanan. Selain itu, RCA juga mengalirkan darah ke nodus sinoatrial dan nodus atrioventrikular, yang mengatur ritme jantung. RCA terbagi menjadi right posterior descending dan acute marginal artery. Bersama LAD, RCA juga mengalirkan darah ke bagian tengah jantung, dan septum (dinding pemisah antara bilik kanan dan bilik kiri jantung).\n\n Berdasarkan data WHO, penyakit jantung koroner merupakan salah satu penyakit tidak menularpenyebab kematian tertinggi di dunia. Pada tahun 2015 saja, tercatat lebih dari 7 juta orang meninggal karena PJK. Sedangkan di Indonesia sendiri, lebih dari 2 juta orang terkena PJK di tahun 2013. Dari jumlah tersebut, PJK lebih sering terjadi pada rentang usia 45-54 tahun.",
  ),
  News(
    author: "BBC News",
    estimate: "5",
    category: "Health",
    favorite: "502",
    seen: "1.22K",
    time: "10 hours ago",
    title:
    "Gejala Penyakit Jantung Koroner",
    image:
    "https://i0.wp.com/rsbudikemuliaan.id/wp-content/uploads/2019/04/Penyakit-jantung-koroner-e1555920168397.jpg?fit=350%2C263&ssl=1",
    subtitle:
    "Gejala Penyakit Jantung Koroner",
    content:
    "Gejala yang ditimbulkan oleh penyakit jantung koroner, meliputi:\n\n   •	Nyeri dada atau ketidaknyamanan pada dada, nyeri ini bisa menjalar ke leher, rahang, bahu, dan tangan sisi kiri, punggung, perut sisi kiri (sering dianggap maag). Nyeri ini ringan sampai dengan berat. Nyeri dada ini disebut dengan “angina” yang dapat bertahan selama beberapa menit. Jika plak belum menyumbat arteri koronaria secara total, maka angina akan mereda dengan sendirinya. Jika angina bertahan terus-menerus, maka segera bawa diri ke dokter.\n   •	Keringat dingin, mual, muntah, atau mudah lelah.\n   •	Irama denyut jantung yang tidak stabil (aritmia), bahkan bisa menyebabkan henti jantung (sudden cardiac arrest) yang bila tidak ditangani dengan cepat dapat menyebabkan kematian."
    ),
  News(
    author: "Jon Fingas",
    estimate: "123",
    category: "Health",
    favorite: "23K",
    seen: "40.53K",
    time: "12 Hours ago",
    title:
    "Penyebab Penyakit Jantung Koroner",
    image:
    'https://d1bpj0tv6vfxyp.cloudfront.net/3pilihanpengobatanuntukatasipenyakitjantungkoronerhalodoc.jpg',
    subtitle:
    "Penyebab penyakit jantung koroner ada banyak. Meski begitu, penelitian telah menunjukkan bahwa tekanan darah tinggi, kolesterol dan trigliserida tinggi, diabetes, kegemukan, kebiasaan merokok, serta peradangan pada pembuluh darah merupakan faktor utama yang melukai dinding arteri, sehingga menyebabkan PJK.",
    content:
    'Penyebab penyakit jantung koroner ada banyak. Meski begitu, penelitian telah menunjukkan bahwa tekanan darah tinggi, kolesterol dan trigliserida tinggi, diabetes, kegemukan, kebiasaan merokok, serta peradangan pada pembuluh darah merupakan faktor utama yang melukai dinding arteri, sehingga menyebabkan PJK.\n Saat arteri rusak, plak akan lebih mudah menempel pada arteri dan lambat laun menebal. Penyempitan pembuluh kemudian akan menghambat aliran darah kaya oksigen ke jantung. Jika plak ini pecah, trombosit akan menempel pada luka di arteri dan membentuk gumpalan darah yang memblokir arteri.  Hal ini dapat menyebabkan angina semakin parah.\n Ketika bekuan darah cukup besar, maka arteri akan tertekan yang menyebabkan infark miokard atau kematian otot jantung.'
  ),
  News(
    author: "Kirsten Korosec",
    estimate: "8",
    category: "Health",
    favorite: "12K",
    seen: "304K",
    time: "22 Hours ago",
    title: "Faktor Risiko Penyakit Jantung Koroner",
    image:
    'https://labcito.co.id/wp-content/uploads/2020/02/Prediktor-Penyakit-Jantung-Koroner-Featured.jpg',
    subtitle:
    "Beberapa faktor yang dapat memengaruhi penyakit jantung koroner,meliputi:",
    content:
    'Beberapa faktor yang dapat memengaruhi penyakit jantung koroner,meliputi:\n\n  •	Usia lanjut. Semakin tua, arteri akan semakin menyempit dan rapuh.\n  •	Pria lebih memiliki risiko terkena penyakit jantung koroner daripada wanita.\n  •	Apabila ada anggota keluarga yang mengidap gangguan jantung, maka risiko PJK meningkat.\n  •	Merokok. Nikotin dapat menyebabkan penyempitan arteri sementara karbon monoksida menyebabkan kerusakan pembuluh.\n  •	Memiliki riwayat tekanan darah tinggi dan/atau kadar lemak darah yang tinggi.\n  •	Memiliki trauma mental atau stres psikologis berat jangka waktu panjang.'
  ),
  News(
      author: "Darrell Etherington",
      estimate: "6",
      category: "Health",
      favorite: "21K",
      seen: "40.25K",
      time: "8 Hours ago",
      title:
      "Diagnosis Penyakit Jantung Koroner",
      image:
      "https://cdn0-production-images-kly.akamaized.net/82YkPm54TED9szRGFk6rjwxpyCk=/640x360/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/3213603/original/069540200_1597830972-doctor-holding-red-heart_38810-6746__1_.jpg",
      subtitle:
      "Sebagai langkah awal diagnosis, dokter akan menanyakan gejala yang dialami, serta memeriksa faktor risiko yang dimiliki pasien.",
      content:
      'Sebagai langkah awal diagnosis, dokter akan menanyakan gejala yang dialami, serta memeriksa faktor risiko yang dimiliki pasien. Bila pasien berisiko terserang penyakit jantung koroner (PJK), dokter akan memeriksa tekanan darah pasien.\n Dokter juga akan menjalankan tes darah, untuk mengukur kadar kolesterol pasien. Agar didapat hasil yang akurat, pasien akan diminta berpuasa 12 jam sebelum tes dilakukan.\n Kemudian, untuk memastikan diagnosis, dokter akan menjalankan beberapa metode pemeriksaan yang meliputi:\n\n   Elektrokardiografi (EKG)\n EKG bertujuan merekam aktivitas listrik jantung pasien. Melalui EKG, dokter dapat mengetahui apakah pasien pernah atau sedang mengalami serangan jantung. EKG juga dapat membantu dokter mengetahui detak dan irama jantung pasien tergolong normal atau tidak.Pada sejumlah kasus, dokter akan menyarankan pasien menjalani Holter monitoring. Sama seperti EKG, pemeriksaan ini bertujuan merekam aktivitas listrik jantung. Bedanya, pasien akan memakai perangkat kecil yang disebut monitor Holter. Alat tersebut akan dikalungkan di dada pasien, selama pasien beraktivitas dalam 24 jam.\n\n   Foto Rontgen\n Foto Rontgen di bagian dada dapat dilakukan guna melihat kondisi jantung, paru-paru, dan pembuluh darah. Melalui foto Rontgen dada, dokter dapat mengetahui bila ukuran jantung membesar atau terdapat gangguan pada paru-paru.\n\n   CT scan dan MRI scan\n Dua tes pencitraan ini dapat dilakukan untuk melihat kondisi jantung dengan lebih detail, yang tidak dapat terlihat pada pemeriksaan foto Rontgen. Pemeriksaan ini juga bisa memperlihatkan bila ada penumpukan kalsium di pembuluh darah, yang dapat memicu penyakit jantung koroner.\n\n   Uji tekanan (stress test)\n Bila gejala yang dialami pasien lebih sering muncul saat sedang beraktivitas, dokter akan menyarankan uji tekanan. Tes ini bertujuan mengukur kerja jantung pasien ketika beraktivitas.\n Dalam uji tekanan, pasien akan diminta berjalan di treadmill, atau mengayuh sepeda statis, sambil menjalani pemeriksaan EKG di saat yang bersamaan. Pada saat pasien tidak dapat beraktivitas, dokter akan memberi obat untuk meningkatkan detak jantung sambil menjalankan tes MRI.\n\n   Ekokardiografi\n Ekokardiografi adalah pemeriksaan dengan menggunakan gelombang suara (seperti USG), untuk menampilkan gambaran jantung pasien di monitor. Selama ekokardiografi dilakukan, dokter dapat memeriksa, apakah semua bagian dinding jantung berfungsi baik dalam memompa darah.\n Dinding jantung yang bergerak lemah, bisa disebabkan oleh kekurangan oksigen, atau adanya kerusakan akibat serangan jantung. Hal tersebut bisa menjadi tanda PJK.\n\n   Pemeriksaan enzim jantung\n Pemeriksaan enzim jantung dilakukan dengan mengambil sampel darah pasien, untuk diperiksa di laboratorium. Melalui pemeriksaan ini, dokter dapat mengetahui kadar troponin T dalam darah pasien.\n Troponin adalah protein yang dihasilkan sel jantung yang mengalami kerusakan. Pada seseorang yang terkena serangan jantung, kadar troponin akan meningkat dalam 3-12 jam setelahnya. Kadar troponin akan mencapai puncaknya dalam 1-2 hari, dan kembali normal setelah 5-14 hari.\n Kadar troponin terkait secara langsung dengan tingkat kerusakan otot jantung. Dengan kata lain, makin tinggi kadar troponin dalam darah, makin parah pula kerusakan jantung yang dialami.\n\n   Pemeriksaan radionuklir\n Pemeriksaan radionuklir digunakan untuk membantu mengukur aliran darah ke otot jantung, saat beristirahat dan saat beraktivitas. Tes ini hampir sama seperti uji tekanan, yaitu dengan meminta pasien berjalan di treadmillatau mengayuh sepeda statis. Bedanya, tes ini dapat menunjukkan informasi yang lebih lengkap dengan menampilkan gambar jantung pasien.\n Sebelum tes dilakukan, pasien akan disuntikkan zat radioaktif yang disebut isotop. Bila pasien tidak dapat berjalan di treadmill atau menggunakan sepeda statis, dokter akan memberikan obat untuk meningkatkan detak jantung pasien. Kemudian, kamera akan diarahkan ke dada pasien, dan menangkap gambar saat isotop mengalir ke jantung.\n\n    Kateterisasi jantung dan angiografi koroner\n Katerisasi jantung bertujuan untuk melihat kondisi jantung, dengan memasukkan kateter melalui pembuluh darah di lengan atau paha untuk diarahkan ke jantung. Kemudian, dokter akan menjalankan prosedur angiografi koroner. Prosedur ini dilakukan dengan menyuntikkan cairan kontras, dan menggunakan foto Rontgen untuk melihat aliran darah menuju jantung. Melalui angiografi koroner, dokter dapat mengetahui bila ada penyumbatan di pembuluh darah.'
  ),
];

List<News> makanBurukList = [
  News(
    author: "Nick Chong",
    estimate: "3",
    category: "Health",
    favorite: "700",
    seen: "4.56K",
    time: "4 hours ago",
    title:
    "Pizza",
    image:
    "https://img.buzzfeed.com/thumbnailer-prod-us-east-1/video-api/assets/216054.jpg",
    subtitle:
    'Pizza menjadi makanan yang dilarang untuk penyakit jantung. Makanan ini mengandung sodium, lemak, dan kalori yang sangat tinggi sehingga berbahaya bagi kesehatan jantung.',
    content:
    'Pizza menjadi makanan yang dilarang untuk penyakit jantung. Makanan ini mengandung sodium, lemak, dan kalori yang sangat tinggi sehingga berbahaya bagi kesehatan jantung.',
  ),
  News(
      author: "BBC News",
      estimate: "5",
      category: "Health",
      favorite: "502",
      seen: "1.27K",
      time: "10 hours ago",
      title:
      "Mie Instan",
      image:
      "https://asset-a.grid.id/crop/0x0:0x0/x/photo/2018/05/23/2114580807.jpg",
      subtitle:
      "Lezatnya mie instan ternyata tidak cocok bagi pasien penyakit jantung. Ada beberapa kandungan yang justru tinggi dan berbahaya bagi kesehatan, seperti lemak, hingga beban glikemik.",
      content:
      'Lezatnya mie instan ternyata tidak cocok bagi pasien penyakit jantung. Ada beberapa kandungan yang justru tinggi dan berbahaya bagi kesehatan, seperti lemak, hingga beban glikemik.'
  ),
  News(
      author: "Jon Fingas",
      estimate: "12",
      category: "Health",
      favorite: "23K",
      seen: "40.58K",
      time: "12 Hours ago",
      title:
      "Bakso",
      image:
      'https://cdn.idntimes.com/content-images/post/20200122/bakso-362ae4f801fa9cf14e910faf3cd4eae0_600x400.jpg',
      subtitle:
      "Bakso merupakan salah satu daging olahan yang enak. Tapi, bolehkah penderita jantung makan bakso? Jawabannya adalah tidak boleh.",
      content:
      'Bakso merupakan salah satu daging olahan yang enak. Tapi, bolehkah penderita jantung makan bakso? Jawabannya adalah tidak boleh.\nDaging olahan apa saja mengandung tinggi garam, kalori, dan lemak jenuh. Dengan kandungan tersebut, serangan jantung akan lebih berisiko bagi pasiennya.'
  ),
  News(
      author: "Kirsten Korosec",
      estimate: "8",
      category: "Health",
      favorite: "12K",
      seen: "309K",
      time: "22 Hours ago",
      title: "Kue",
      image:
      'https://ecs7.tokopedia.net/img/cache/700/product-1/2019/3/5/44503115/44503115_9be4efe2-5817-45d7-bdf3-75124fd453be_1196_1196.jpg',
      subtitle:
      "Ada beberapa jenis kue yang menjadi pantangan bagi pasien penyakit jantung, misalnya kukis dan muffin. Kue tersebut mengandung gula yang tinggi serta lemak jenuh dan lemak trans.",
      content:
      'Ada beberapa jenis kue yang menjadi pantangan bagi pasien penyakit jantung, misalnya kukis dan muffin. Kue tersebut mengandung gula yang tinggi serta lemak jenuh dan lemak trans.'
  ),
  News(
      author: "Darrell Etherington",
      estimate: "6",
      category: "Health",
      favorite: "21K",
      seen: "40.20K",
      time: "8 Hours ago",
      title:
      "Kentang Goreng",
      image:
      "https://cdn0-production-images-kly.akamaized.net/oIN3wVed8tEnm39rmcJtHo7D0eA=/640x360/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/970871/original/021248500_1440846143-header_chiantilvpa_com.jpg",
      subtitle:
      "Renyahnya kentang goreng ternyata tidak boleh dicicipi oleh pasien penyakit jantung. Pasalnya, kentang goreng mengandung banyak garam dan lemak dari minyak.",
      content:
      'Renyahnya kentang goreng ternyata tidak boleh dicicipi oleh pasien penyakit jantung. Pasalnya, kentang goreng mengandung banyak garam dan lemak dari minyak.\nBahkan, sebuah penelitian mencatat seseorang yang makan kentang goreng dua hingga tiga kali seminggu berisiko terkena serangan jantung.'
  ),
  News(
    author: "Nick Chong",
    estimate: "3",
    category: "Health",
    favorite: "700",
    seen: "4.51K",
    time: "4 hours ago",
    title:
    "Mie Telur",
    image:
    "https://img-global.cpcdn.com/recipes/0428a38df63a6555/1200x630cq70/photo.jpg",
    subtitle:
    'Mie telur juga menjadi salah satu makanan yang dilarang untuk penyakit jantung. Sebab, mie telur bila diolah dengan tambahan kolesterol bisa berbahaya.',
    content:
    'Mie telur juga menjadi salah satu makanan yang dilarang untuk penyakit jantung. Sebab, mie telur bila diolah dengan tambahan kolesterol bisa berbahaya.\nNah, mie telur dengan olahan yang baik dengan tambahan protein dan vitamin B bisa menjadi resep makanan untuk penyakit jantung.'
  ),
  News(
      author: "BBC News",
      estimate: "5",
      category: "Health",
      favorite: "502",
      seen: "1.22K",
      time: "10 hours ago",
      title:
      "Soda",
      image:
      "https://5.imimg.com/data5/BW/OR/PU/SELLER-49520187/thums-up-cold-drink-500x500.jpg",
      subtitle:
      "Tak hanya makanan, soda juga memiliki kandungan gula yang sangat tinggi. Kandungan gula tersebut dapat berbahaya karena bisa memicu kegemukan bagi pasien penyakit jantung.",
      content:
      'Tak hanya makanan, soda juga memiliki kandungan gula yang sangat tinggi. Kandungan gula tersebut dapat berbahaya karena bisa memicu kegemukan bagi pasien penyakit jantung.'
  ),
  News(
      author: "Jon Fingas",
      estimate: "12",
      category: "Health",
      favorite: "23K",
      seen: "40.53K",
      time: "12 Hours ago",
      title:
      "Keju",
      image:
      'https://bravaradio.com/wp-content/uploads/2017/01/keju-termahal-di-dunia.jpg',
      subtitle:
      "Kandungan keju penuh dengan lemak. Artinya, bagi pasien penyakit jantung tidak diperbolehkan mengonsumsi keju karena dapat berbahaya bagi kesehatan jantung.",
      content:
      'Kandungan keju penuh dengan lemak. Artinya, bagi pasien penyakit jantung tidak diperbolehkan mengonsumsi keju karena dapat berbahaya bagi kesehatan jantung.'
  ),
  News(
      author: "Kirsten Korosec",
      estimate: "8",
      category: "Health",
      favorite: "12K",
      seen: "304K",
      time: "22 Hours ago",
      title:
      "Gorengan",
      image:
      'https://assets-pergikuliner.com/uploads/bootsy/image/18921/Gorengan__detik.net.id_.jpg',
      subtitle:
      "Makanan yang dilarang untuk penyakit jantung terakhir adalah gorengan. Sebab, makanan ini mengandung tinggi lemak yang berasal dari minyak.",
      content:
      'Makanan yang dilarang untuk penyakit jantung terakhir adalah gorengan. Sebab, makanan ini mengandung tinggi lemak yang berasal dari minyak.\nAdapun, lemak yang terdapat dalam gorengan bisa berbahaya bagi kesehatan jantung.'
  ),
];

List<News> makanBaikList = [
  News(
    author: "Nick Chong",
    estimate: "3",
    category: "Health",
    favorite: "700",
    seen: "4.55K",
    time: "4 hours ago",
    title:
    "Sayuran hijau",
    image:
    "https://awsimages.detik.net.id/community/media/visual/2019/12/26/b837b439-7d20-4e4a-b989-d50ca6c8edf3_169.jpeg?w=700&q=90",
    subtitle:
    'Sayuran hijau adalah sahabat baik bagi penderita sakit jantung. Pola makan sehat tak pernah luput dari menu ini. Ragam nutrisi pada sayuran hijau mampu menekan risiko terkena serangan jantung.',
    content:
    'Sayuran hijau adalah sahabat baik bagi penderita sakit jantung. Pola makan sehat tak pernah luput dari menu ini. Ragam nutrisi pada sayuran hijau mampu menekan risiko terkena serangan jantung.\n Dari banyaknya sayuran hijau, brokoli, bayam, kangkung, sawi hijau, pakcoy, dan asparagus adalah pilihan terbaik. Sayuran ini mengandung vitamin C, vitamin E, folat, kalium, kalsium, dan serat yang membantu fungsi jantung bekerja normal.\n Namun jika ingin mengolahnya, tumis dengan sedikit garam atau dijadikan lalap agar manfaat dari sayuran hijau tetap didapat.'
  ),
  News(
      author: "BBC News",
      estimate: "5",
      category: "Health",
      favorite: "502",
      seen: "1.26K",
      time: "10 hours ago",
      title:
      "Kentang",
      image:
      "https://image-cdn.medkomtek.com/AqKL90eISrf_GbhYtRAuAi9Simc=/640x640/smart/klikdokter-media-buckets/medias/2302888/original/079980300_1547360960-Makan-Kentang-Mentah-ini-Bahayanya-By-success863-Shutterstock.jpg",
      subtitle:
      "Kandungan kalium dalam kentang berperan menurunkan tekanan darah sehingga baik bagi jantung. Kentang bisa menggantikan nasi putih pada menu makan harian Anda ditambah dengan sayur hijau.",
      content:
      'Kandungan kalium dalam kentang berperan menurunkan tekanan darah sehingga baik bagi jantung. Kentang bisa menggantikan nasi putih pada menu makan harian Anda ditambah dengan sayur hijau.\n Selalu ingat, jangan konsumsi kentang dengan cara digoreng karena minyak goreng merupakan salah satu sumber kolesterol. Cara terbaik mengonsumsi kentang bagi penderita sakit jantung adalah dengan mengukus atau merebusnya.'
  ),
  News(
      author: "Jon Fingas",
      estimate: "12",
      category: "Health",
      favorite: "23K",
      seen: "40.57K",
      time: "12 Hours ago",
      title:
      "Ikan",
      image:
      'https://image-cdn.medkomtek.com/WOkQp9M2yhtaczqOWUeMrYm_8FM=/1200x675/smart/klikdokter-media-buckets/medias/2312804/original/057465700_1582721737-Viral-Bintik-Putih-di-Daging-Ikan-Lele-Bolehkah-Dimakan-shutterstock_385414768.jpg',
      subtitle:
      "Situs kesehatan Mayo Clinic mengungkapkan ikan dengan kandungan asam lemak omega 3 mampu membantu mengurangi kolesterol dan meningkatkan kesehatan pembuluh darah.",
      content:
      'Situs kesehatan Mayo Clinic mengungkapkan ikan dengan kandungan asam lemak omega 3 mampu membantu mengurangi kolesterol dan meningkatkan kesehatan pembuluh darah.\n Jenis ikan dengan asam lemak omega 3, yaitu sarden, tuna, dan salmon. Ikan sarden dan tuna, bisa ditemukan di pasar tradisional dan harganya relatif lebih murah ketimbang salmon.\n Pastikan tidak menggunakan minyak atau mentega berlebih saat memasak ikan. Memanggang bisa menjadi pilihan tepat.\n Konsumsi setidaknya 150 gram ikan dalam seminggu demi menjaga kesehatan jantung.'
  ),
  News(
      author: "Kirsten Korosec",
      estimate: "8",
      category: "Health",
      favorite: "12K",
      seen: "308K",
      time: "22 Hours ago",
      title:
      "Oatmeal dan gandum murni",
      image:
      'https://s2.bukalapak.com/bukalapak-kontenz-production/content_attachments/31907/w-744/rolled_oat.jpg',
      subtitle:
      "Oatmeal dan gandum murni terbuat dari tanaman haver yang kaya serat. Kandungan serat mampu menurunkan kadar kolesterol sehingga mencegah terbentuknya plak pada pembuluh arteri.",
      content:
      'Oatmeal dan gandum murni terbuat dari tanaman haver yang kaya serat. Kandungan serat mampu menurunkan kadar kolesterol sehingga mencegah terbentuknya plak pada pembuluh arteri.\n Oatmeal bekerja selayaknya spons di saluran pencernaan yang dapat menyerap kolesterol, sehingga tidak terserap aliran darah.\n Hindari mengonsumsi oatmeal instan karena seringkali sudah mengandung pemanis buatan. Untuk itu, selalu perhatikan dan baca label nutrisi setiap kali ingin mengonsumsi makanan kemasan.'
  ),
  News(
      author: "Darrell Etherington",
      estimate: "6",
      category: "Health",
      favorite: "21K",
      seen: "40.29K",
      time: "8 Hours ago",
      title:
      "Tomat",
      image:
      "https://res.cloudinary.com/dk0z4ums3/image/upload/v1534576509/attached_image/9-manfaat-tomat-buah-yang-disangka-sayur.jpg",
      subtitle:
      "Warna merah alami pada tomat mengandung antioksidan likopen, yang mampu menurunkan risiko penyakit jantung dan stroke. Penelitian Nutrition Journal menyebutkan minum jus tomat tanpa gula selama 8 minggu mampu mengurangi kadar trigliserida,",
      content:
      'Warna merah alami pada tomat mengandung antioksidan likopen, yang mampu menurunkan risiko penyakit jantung dan stroke. Penelitian Nutrition Journal menyebutkan minum jus tomat tanpa gula selama 8 minggu mampu mengurangi kadar trigliserida, yang menghambat aliran darah dan memicu serangan jantung.Jenis makanan yang baik untuk penyakit jantung di atas mungkin ada yang tak cocok seleranya di lidah Anda atau terlalu mahal.Tak usah bingung, Anda bisa menggantinya dengan buah yang harganya lebih terjangkau. Buah untuk penyakit jantung antara lain alpukat, anggur, pisang, jeruk, melon, pepaya, stroberi, dan apel.Kandungan vitamin pada buah-buahan tersebut baik dan kaya akan serat sehingga baik untuk jantung.'
  ),
  News(
      author: "BBC News",
      estimate: "5",
      category: "Health",
      favorite: "502",
      seen: "1.26K",
      time: "10 hours ago",
      title:
      "Ubi Jalar",
      image:
      "https://image-cdn.medkomtek.com/jJ2hXbw-k4-j8K9Fm82i5loFBno=/1200x675/smart/klikdokter-media-buckets/medias/1459093/original/029007600_1483460306-Benarkah-Ubi-Bisa-Bantu-Atasi-Osteoporosis.jpg",
      subtitle:
      "Umbi yang punya rasa manis ini mengandung vitamin A yang menyehatkan tubuh, termasuk jantung Anda. Kandungan serat dan nutrisi lain diketahui dapat mengurangi kadar kolesterol dalam darah.",
      content:
      'Umbi yang punya rasa manis ini mengandung vitamin A yang menyehatkan tubuh, termasuk jantung Anda. Kandungan serat dan nutrisi lain diketahui dapat mengurangi kadar kolesterol dalam darah.\n  Untuk nutrisi terbaik, sebaiknya Anda pilih ubi jalar yang berwarna oranye atau ungu. Anda bisa menikmati ubi jalar dengan direbus, dipanggang, atau ditambahkan pada sayur. Namun bagi Anda yang memiliki penyakit ginjal, jangan mengonsumsi ibu terlalu banyak karena umbi ini mengandung oksalat yang cukup tinggi.'
  ),
  News(
      author: "Jon Fingas",
      estimate: "12",
      category: "Health",
      favorite: "23K",
      seen: "40.57K",
      time: "12 Hours ago",
      title:
      "Buah Ceri",
      image:
      'https://photo.jpnn.com/arsip/normal/2018/08/22/buah-ceri-foto-pixabay.jpg',
      subtitle:
      "Buah ceri bisa menjadi makanan pilihan untuk pasien penyakit jantung. ",
      content:
      'Buah ceri bisa menjadi makanan pilihan untuk pasien penyakit jantung. Alasannya, karena ceri kaya dengan antioksidan polifenol dan karotenoid, serat, serta vitamin C. Semua nutrisi tersebut dapat meningkatkan fungsi jantung dan pembuluh darah. Pilihlah buah ceri segar untuk mendapatkan semua manfaatnya.'
  ),
  News(
      author: "Kirsten Korosec",
      estimate: "8",
      category: "Health",
      favorite: "12K",
      seen: "308K",
      time: "22 Hours ago",
      title:
      "Anggur",
      image:
      'https://ecs7.tokopedia.net/img/cache/700/VqbcmM/2020/10/10/0c0f1e1a-93e7-4be8-a558-75d9876009d8.jpg',
      subtitle:
      "Senyawa aktif dalam buah anggur dapat mengurangi ketegangan atau kekakuan pada pembuluh darah arteri. Kulit anggur merah yang mengandung antioksidan polifenol juga bisa memelihara fungsi endotel.",
      content:
      'Senyawa aktif dalam buah anggur dapat mengurangi ketegangan atau kekakuan pada pembuluh darah arteri. Kulit anggur merah yang mengandung antioksidan polifenol juga bisa memelihara fungsi endotel.\n  Konsumsi buah anggur juga dipercaya mampu mengurangi lemak darah, menurunkan tekanan darah, dan meningkatkan fungsi trombosit sehingga mencegah pembentukan plak. Dengan begitu, risiko penyakit jantung  dapat ditekan.'
  ),
  News(
      author: "Darrell Etherington",
      estimate: "6",
      category: "Health",
      favorite: "21K",
      seen: "40.29K",
      time: "8 Hours ago",
      title:
      "Alpukat",
      image:
      "https://fitshop-production.s3.ap-southeast-1.amazonaws.com/wp-content/uploads/2020/04/20125115/Alpukat-Muda.jpg",
      subtitle:
      "Zat-zat yang terkandung di dalam buah alpukat, seperti asam lemak tak jenuh, antioksidan polifenol, karotenoid, vitamin E, fitosterol, dan squalene bersifat larut dalam lemak. Semua senyawa tersebut sangat populer dengan manfaatnya dalam menurunkan kadar kolesterol.",
      content:
      'Zat-zat yang terkandung di dalam buah alpukat, seperti asam lemak tak jenuh, antioksidan polifenol, karotenoid, vitamin E, fitosterol, dan squalene bersifat larut dalam lemak. Semua senyawa tersebut sangat populer dengan manfaatnya dalam menurunkan kadar kolesterol.\n  Daging buah alpukat juga mengandung acetogenin yang bisa menghambat penggumpalan platelet atau keping darah. Manfaat acetogenin ini kemungkinan besar mencegah terjadinya penggumpalan darah di dalam pembuluh arteri.'
  ),
];

List<News> olahragaList = [
  News(
      author: "Nick Chong",
      estimate: "3",
      category: "Health",
      favorite: "700",
      seen: "4.50K",
      time: "4 hours ago",
      title:
      "Tips Olahraga Untuk Pasien Penyakit Jantung",
      image:
      "https://akcdn.detik.net.id/visual/2020/10/30/1220205899_169.jpeg?w=360&q=90",
      subtitle:
      'Selain pilihan olahraga yang tidak boleh sembarangan, pasien penyakit kardiovaskuler juga harus tahu panduan aman untuk melaksanakannya. Mari ikuti langkah aman berolahraga jika punya penyakit jantung berikut ini.',
      content:
      'Selain pilihan olahraga yang tidak boleh sembarangan, pasien penyakit kardiovaskuler juga harus tahu panduan aman untuk melaksanakannya. Mari ikuti langkah aman berolahraga jika punya penyakit jantung berikut ini.\n\n   1. Tanya dokter\n Beberapa pasien yang baru saja menjalani prosedur medis tidak disarankan untuk melakukan olahraga sebelum benar-benar pulih. Karenanya, sebelum pasien jantung melakukan olahraga, pastikan kondisi fisiknya memadai dengan menanyakannya ke dokter. Dokter akan merekomendasikan jenis aktivitas fisik yang aman dan sesuai dengan kondisi Anda.\n\n   2. Mulailah pelan-pelan\n Misalnya, jika Anda baru pertama kali atau baru mulai kembali berolahraga, mulailah selama 15 menit lalu minggu berikutnya menjadi 20 menit, dan seterusnya. Menurut dr. Irma Lidia, tim dokter Jovee, pasien jantung sebaiknya berolahraga selama 30 – 60 menit per sesinya atau 150 menit aerobik per minggu, diluar pemanasan dan pendinginan.\n\n   3. Sesuaikan juga dengan kemampuan diri Anda\n Jangan terlalu cepat melakukan olahraga berat. Prinsipnya adalah, makin sering dan rutin Anda olahraga, jantung juga makin sehat.\n\n   4. Tingkatkan intensitas\n Secara bertahap, tingkatkan durasi dan beratnya aktivitas fisik Anda. Contohnya, di minggu pertama Anda mulai dengan berjalan kaki selama 30 menit setiap hari di minggu pertama. Kemudian di minggu selanjutnya Anda bisa kombinasikan jalan kaki dengan jenis olahraga lainnya.\n\n   5. Jangan olahraga di luar jika cuaca terlalu panas atau lembab\n Cuaca yang lembab bisa membuat Anda lebih cepat lelah. Cuaca ekstrem juga dapat memengaruhi peredaran darah, sulit bernapas, hingga nyeri dada. Sebaiknya Anda berolahraga di dalam rumah jika cuaca sedang tidak mendukung.\n\n   6. Banyak minum air\n Terutama saat cuaca panas. Jangan sampai menunggu haus, baru Anda minum. Dengan minum, kondisi jantung Anda akan terjaga karena air mendukung kerja sel, organ, dan jaringan di dalam tubuh.\n\n   7. Hindari mandi dengan air panas atau dingin setelah olahraga\n Temperatur ekstrem akan membuat kerja jantung lebih berat. Mandi air panas juga dapat mengakibatkan peningkatan denyut jantung dan aritmia.\n\n dr. Irma Lidia juga mengatakan, “Untuk yang baru memulai latihan/olahraga, mulailah dengan perlahan. Anda bisa juga menggunakan ukuran RPE 3 (rate of perceived exertion) sebagai patokan intensitas latihan,” Ketika seseorang masih dapat berbicara saat berolahraga, artinya intensitas latihan mereka berada di RPE tingkat 3.“Goal yg ingin dicapai adalah melakukan latihan ini selama 30 menit. Namun, selalu dengarkan tubuh Anda dan jangan memaksakan diri. Istirahatlah sebelum Anda merasa terlalu capek.” lanjut dr. Irma Lidia.'
  ),
  News(
      author: "Nick Chong",
      estimate: "3",
      category: "Health",
      favorite: "700",
      seen: "4.51K",
      time: "4 hours ago",
      title:
      "Hal Yang Perlu Diwaspadai Saat Berolahraga",
      image:
      "https://akcdn.detik.net.id/visual/2016/02/09/37ff8783-506d-4192-828b-1fb2ca669cc0_169.jpg?w=650",
      subtitle:
      'Jangan memaksakan untuk olahraga jika sedang tidak enak badan atau demam. Penderita penyakit jantung sebaiknya menunggu sampai kondisinya pulih sebelum kembali berolahraga, kecuali dokter telah mengizinkannya.',
      content:
      'Jangan memaksakan untuk olahraga jika sedang tidak enak badan atau demam. Penderita penyakit jantung sebaiknya menunggu sampai kondisinya pulih sebelum kembali berolahraga, kecuali dokter telah mengizinkannya.\n Segera istirahat jika denyut nadi Anda terlalu cepat dan tidak teratur atau jantung jadi berdebar-debar. Kemudian periksa nadi Anda setelah beristirahat selama 15 menit. Cara mudahnya dengan:\n\n   •	Tempelkan jari telunjuk dan tengah Anda di pergelangan tangan bagian dalam yang dilewati pembuluh darah arteri;\n   •	Tekan dengan kuat arteri Anda sampai merasakan denyutnya;\n   •	Hitung denyut nadi Anda selama 60 detik, atau selama 30 detik lalu kalikan 2 sehingga mendapatkan hasil denyut nadi per menit.\n\n Kalau denyut nadi Anda masih > 100 kali per menit, sebaiknya hubungi dokter. Selain itu, beberapa keadaan yang mengharuskan Anda istirahat dan menghentikan aktivitas ialah:\n\n  •	Merasa lemas\n  •	Pusing\n  •	Merasa tekanan atau nyeri di dada, leher, lengan, rahang, atau bahu'
  ),
  News(
      author: "Nick Chong",
      estimate: "3",
      category: "Health",
      favorite: "700",
      seen: "4.53K",
      time: "4 hours ago",
      title:
      "Penuhi Kebutuhan Nutrisi",
      image:
      "https://fk.unair.ac.id/archives/wp-content/uploads/2016/03/nutrisi-atlit-740x450.jpg",
      subtitle:
      'Olahraga mengharuskan tubuh pasien penyakit jantung untuk mengeluarkan banyak energi.',
      content:
      'Olahraga mengharuskan tubuh pasien penyakit jantung untuk mengeluarkan banyak energi. Maka dari itu, pastikan Anda memastikan kebutuhan nutrisi tercukupi. Konsumsilah pilihan makanan yang sehat untuk jantung agar tubuh tetap fit. Salah satu nutrisi yang penting bagi kesehatan jantung adalah omega 3. Anda bisa memenuhi kebutuhannya dengan mengonsumsi ikan berlemak, kacang-kacangan, sayuran berdaun hijau, bahkan suplemen tambahan.'
  ),
  News(
      author: "Nick Chong",
      estimate: "3",
      category: "Health",
      favorite: "700",
      seen: "4.531K",
      time: "4 hours ago",
      title:
      "Jalan kaki",
      image:
      "https://asset-a.grid.id/crop/0x0:0x0/750x500/photo/haifoto/original/78560_foto-ilustrasi-orang-orang-berjalan-kaki.jpg",
      subtitle:
      'Jalan santai dan cepat merupakan salah satu jenis olahraga cardio. Cara ini mungkin menjadi olahraga yang paling mudah karena dapat dilakukan kapan serta di mana saja. Meski terlihat tidak membutuhkan banyak tenaga, ternyata jalan kaki bisa membantu meningkatkan denyut jantung dan aliran darah, serta menurunkan tekanan darah.',
      content:
      'Jalan santai dan cepat merupakan salah satu jenis olahraga cardio. Cara ini mungkin menjadi olahraga yang paling mudah karena dapat dilakukan kapan serta di mana saja. Meski terlihat tidak membutuhkan banyak tenaga, ternyata jalan kaki bisa membantu meningkatkan denyut jantung dan aliran darah, serta menurunkan tekanan darah.\n Lakukan olahraga ini setiap hari, setidaknya selama 30 menit. Untuk mendapatkan hasil yang maksimal dari jalan kaki ini, sebaiknya Anda berjalan kaki dengan jarak tempuh mencapai 8 km per minggu.'
  ),
  News(
      author: "BBC News",
      estimate: "5",
      category: "Health",
      favorite: "502",
      seen: "1.245K",
      time: "10 hours ago",
      title:
      "Yoga",
      image:
      "https://cdn.idntimes.com/content-images/community/2019/12/photo-1544367567-0f2fcb009e0b-d2b2948c8a1226c7ced5d0907b2040c7_600x400.jpeg",
      subtitle:
      "Yoga dapat membantu respons tubuh terhadap stres melalui teknik bernapas dan meditasinya. Secara umum, olahraga yoga dapat mengurangi risiko penyakit jantung. Olahraga ini juga dikatakan mampu meningkatkan kesadaran untuk menerapkan gaya hidup sehat bagi pasien penyakit jantung.",
      content:
      'Yoga dapat membantu respons tubuh terhadap stres melalui teknik bernapas dan meditasinya. Secara umum, olahraga yoga dapat mengurangi risiko penyakit jantung. Olahraga ini juga dikatakan mampu meningkatkan kesadaran untuk menerapkan gaya hidup sehat bagi pasien penyakit jantung.\n Yoga telah terbukti memiliki efek positif terhadap peradangan, stres, sistem saraf otonom jantung, serta mencegah faktor risiko penyakit kardiovaskular. Menurut studi yang dipublikasikan di European Journal of Cardiovascular Nursing, selain mampu menurunkan kadar kolesterol dan trigliserida dalam darah, yoga dapat mengendalikan denyut jantung serta tekanan darah.'
  ),
  News(
      author: "Jon Fingas",
      estimate: "12",
      category: "Health",
      favorite: "23K",
      seen: "40.556K",
      time: "12 Hours ago",
      title:
      "Tai chi",
      image:
      'https://cdn.britannica.com/47/18447-050-2C5E2037/Tai-Chi-chuan-practitioner.jpg',
      subtitle:
      "Tai chi adalah latihan kebugaran asal negeri Cina yang menggunakan teknik peregangan ringan dengan gerakan lambat yang terfokus. Manfaat utama tai chi adalah mengasah kemampuan Anda untuk konsentrasi, mengendalikan pernapasan, serta mengatur irama tubuh sehingga dapat meredakan stres.",
      content:
      'Tai chi adalah latihan kebugaran asal negeri Cina yang menggunakan teknik peregangan ringan dengan gerakan lambat yang terfokus. Manfaat utama tai chi adalah mengasah kemampuan Anda untuk konsentrasi, mengendalikan pernapasan, serta mengatur irama tubuh sehingga dapat meredakan stres.\n Penelitian terdahulu menunjukkan bahwa tai chi membantu menurunkan tekanan darah. Bagi penderita penyakit jantung yang seringkali merasa lelah, teknik gerakan lambat tai chi akan menguatkan otot-otot jantung. Gerakan tai chi yang lambat pun turun membantu mengendalikan berat badan.'
  ),
  News(
      author: "Kirsten Korosec",
      estimate: "8",
      category: "Health",
      favorite: "12K",
      seen: "3.067K",
      time: "22 Hours ago",
      title:
      "Berenang",
      image:
      'https://img.antaranews.com/cache/800x533/2020/03/21/shutterstock_674549569.jpg',
      subtitle:
      "Berenang adalah salah satu olahraga low-impact yang terbaik. Olahraga ini cocok untuk Anda yang ingin menurunkan berat badan, penderita radang sendi, hingga orang yang baru sembuh dari penyakit jantung umum, seperti aterosklerosis atau gagal jantung. Semua gerakan olahraga yang dilakukan di dalam air cenderung lebih mudah.",
      content:
      'Berenang adalah salah satu olahraga low-impact yang terbaik. Olahraga ini cocok untuk Anda yang ingin menurunkan berat badan, penderita radang sendi, hingga orang yang baru sembuh dari penyakit jantung umum, seperti aterosklerosis atau gagal jantung. Semua gerakan olahraga yang dilakukan di dalam air cenderung lebih mudah.\n Dilansir dari situs Cleveland Clinic, berenang dapat meningkatkan sirkulasi darah, menurunkan berat badan, membuat pernapasan jadi lebih baik, menormalkan detak jantung dan tekanan darah.'
  ),
  News(
      author: "Darrell Etherington",
      estimate: "6",
      category: "Health",
      favorite: "21K",
      seen: "40.278K",
      time: "8 Hours ago",
      title:
      "Bersepeda",
      image:
      "https://m.ayobogor.com/images-bogor/post/articles/2018/05/01/1460/header-cycling_05252017132500.jpg",
      subtitle:
      "Bersepeda dapat memperkuat otot jantung, menurunkan denyut nadi istirahat, mengurangi kadar kolesterol, dan memperlancar peredaran darah.",
      content:
      'Bersepeda dapat memperkuat otot jantung, menurunkan denyut nadi istirahat, mengurangi kadar kolesterol, dan memperlancar peredaran darah. Hal ini akan mencegah risiko serangan jantung dan stroke pada pasien penyakit jantung. Disamping itu, olahraga ini juga bisa membantu menurunkan berat badan dengan membakar lemak tubuh.'
  ),
];

List<News> randomList = [
  olahragaList[_random.nextInt(olahragaList.length)],
  makanBaikList[_random.nextInt(makanBaikList.length)],
  olahragaList[_random.nextInt(olahragaList.length)],
  makanBaikList[_random.nextInt(makanBaikList.length)],
  makanBurukList[_random.nextInt(makanBurukList.length)],
  makanBurukList[_random.nextInt(makanBurukList.length)],
  makanBaikList[_random.nextInt(makanBaikList.length)],
  olahragaList[_random.nextInt(olahragaList.length)],
  makanBaikList[_random.nextInt(makanBaikList.length)],
];