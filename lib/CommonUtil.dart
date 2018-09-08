
class CommonUtil{

  static CreatePath(String path){

    String classcode;
    String siken;
    String syubetu;
    String kamoku;

    // もしかしたらいらないかも
    String KamokuID = path.toString();

    // 学科、学年
    if(KamokuID.substring(0,3) == "I4_"){
      classcode = "IE4_";
    }
    else{

    }

    // 試験種別
    if(KamokuID.substring(3,5) == "1_") {
      siken = "前期中間試験/";
    }
    else if(KamokuID.substring(3,5) == "2_"){
      siken = "前期末試験　/";
    }
    else if(KamokuID.substring(3,5) == "3_"){
      siken = "後期中間試験/";
    }
    else if(KamokuID.substring(3,5) == "4_"){
      siken = "後期末試験　/";
    }
    else{

    }

    // 一般科目or専門科目
    if(KamokuID.substring(5,7) == "1_") {
      syubetu = "一般科目/";
    }
    else if(KamokuID.substring(5,7) == "2_"){
      syubetu = "専門科目/";
    }
    else{

    }

    // 科目名
    if(KamokuID.substring(7,9) == "01"){
      kamoku = "力学";
    }
    else if(KamokuID.substring(7,9) == "02"){
      kamoku = "微分積分学Ⅰ";
    }
    else if(KamokuID.substring(7,9) == "03"){
      kamoku = "ベクトル解析";
    }
    else if(KamokuID.substring(7,9) == "04"){
      kamoku = "英会話";
    }
    else if(KamokuID.substring(7,9) == "05"){
      kamoku = "総合英語演習Ⅰ";
    }
    else if(KamokuID.substring(7,9) == "06"){
      kamoku = "応用解析学概論";
    }
    else if(KamokuID.substring(7,9) == "07"){
      kamoku = "ドイツ語";
    }
    else if(KamokuID.substring(7,9) == "08"){
      kamoku = "中国語";
    }
    else if(KamokuID.substring(7,9) == "09"){
      kamoku = "フーリエ・ラプラス変換";
    }
    else if(KamokuID.substring(7,9) == "10"){
      kamoku = "情報理論";
    }
    else if(KamokuID.substring(7,9) == "11"){
      kamoku = "電磁気学";
    }
    else if(KamokuID.substring(7,9) == "12"){
      kamoku = "情報通信工学";
    }
    else if(KamokuID.substring(7,9) == "13"){
      kamoku = "ディジタル回路応用";
    }
    else if(KamokuID.substring(7,9) == "14"){
      kamoku = "システムプログラミングⅡ";
    }
    else if(KamokuID.substring(7,9) == "15"){
      kamoku = "コンピュータアーキテクチャ";
    }
    else if(KamokuID.substring(7,9) == "16"){
      kamoku = "ソフトウェア工学";
    }
    else if(KamokuID.substring(7,9) == "17"){
      kamoku = "データベース";
    }
    else{

    }

    return toStaticString(classcode + siken + syubetu + kamoku);

  }


  static CreateSyousai(String path){

    String syousai;

    String KamokuID = path.toString();

    // 科目名
    if(KamokuID.substring(7,9) == "01"){
      syousai =' 開講時期：4年前期 / 単位数：1 / 科目区分：一般 必修 / 担当：原田徳彦 / 教科書：為近和彦『ビジュアルアプローチ力学』';
    }
    else if(KamokuID.substring(7,9) == "02"){
      syousai = "開講時期：4年前期 / 単位数：1 / 科目区分：一般 必修 / 担当：米田郁生 / 教科書：微分積分学Ⅱ、微分積分学Ⅱ問題集　ともに大日本図書発刊";
    }
    else if(KamokuID.substring(7,9) == "03"){
      syousai = " 開講時期：4年前期 / 単位数：1 / 科目区分：一般 必修 / 担当：杉村敦彦 / 教科書：「新応用数学」、「新応用数学問題集」（大日本図書）";
    }
    else if(KamokuID.substring(7,9) == "04"){
      syousai = "開講時期：4年前期 / 単位数：1 / 科目区分：一般 必修 / 担当：ﾏｲｸ ﾏｶｰｼｰ / 教科書：Breakthrough Plus 3";
    }
    else if(KamokuID.substring(7,9) == "05"){
      syousai = "開講時期：4年通年 / 単位数：2 / 科目区分：一般 必修 / 担当：田中数恵 / 教科書：「THE HIGH ROAD TO THE TOEIC LISTENING AND READING TEST」（金星堂）";
    }
    else if(KamokuID.substring(7,9) == "06"){
      syousai = "開講時期：4年通年 / 単位数：3 / 科目区分：一般 選択 / 担当：山本拓生 / 教科書：新 応用数学,　佐藤志保 他, 新日本図書";
    }
    else if(KamokuID.substring(7,9) == "07"){
      syousai = "開講時期：4年通年 / 単位数：2 / 科目区分：一般 選択 / 担当：柏倉知秀 / 教科書：『ドイツ語の時間〈話すための文法〉web練習問題付』朝日出版社/『アクセス独和辞典』三修社";
    }
    else if(KamokuID.substring(7,9) == "08"){
      syousai = "開講時期：4年通年 / 単位数：2 / 科目区分：一般 選択 / 担当：徳永彩理 / 教科書：『1年生のコミュニケーション中国語』塚本慶一監修　劉穎著　白水社";
    }
    else if(KamokuID.substring(7,9) == "09"){
      syousai = "開講時期：4年前期 / 単位数：1 / 科目区分：専門 必修 / 担当：室谷英彰 / 教科書：なし";
    }
    else if(KamokuID.substring(7,9) == "10"){
      syousai = "開講時期：4年通年 / 単位数：2 / 科目区分：専門 必修 / 担当：宮﨑亮一 / 教科書：1. 小川英一　｢マルチメディア時代の情報理論｣　コロナ社，2. 三木成彦・吉川英機「情報理論」コロナ社";
    }
    else if(KamokuID.substring(7,9) == "11"){
      syousai = "開講時期：4年通年 / 単位数：2 / 科目区分：専門 必修 / 担当：杉村敦彦 / 教科書：山口　昌一郎 著　「基礎電磁気学 改訂版」　電気学会";
    }
    else if(KamokuID.substring(7,9) == "12"){
      syousai = "開講時期：4年通年 / 単位数：2 / 科目区分：専門 必修 / 担当：原田徳彦 / 教科書：田坂修二著　「情報ネットワークの基礎 [第2版]」　数理工学社";
    }
    else if(KamokuID.substring(7,9) == "13"){
      syousai = "開講時期：4年前期 / 単位数：1 / 科目区分：専門 必修 / 担当：古賀崇了 / 教科書：松田勲,伊原充博『ディジタルIC回路の基礎』(技術評論社）, 参考図書：天野英晴『ディジタル設計者のための電子回路（改訂版）』（コロナ社）";
    }
    else if(KamokuID.substring(7,9) == "14"){
      syousai = "開講時期：4年前期 / 単位数：1 / 科目区分：専門 必修 / 担当：重村哲至 / 教科書：なし";
    }
    else if(KamokuID.substring(7,9) == "15"){
      syousai = "開講時期：4年通年 / 単位数：2 / 科目区分：専門 必修 / 担当：栁澤秀明 / 教科書：電子計算機工学";
    }
    else if(KamokuID.substring(7,9) == "16"){
      syousai = "開講時期：4年通年 / 単位数：2 / 科目区分：専門 必修 / 担当：奥本幸 / 教科書：ソフトウェア工学 高橋直久他著(森北出版)";
    }
    else if(KamokuID.substring(7,9) == "17"){
      syousai = "開講時期：4年通年 / 単位数：2 / 科目区分：専門 必修 / 担当：義永 常宏/ 教科書：なし";
    }
    else{

    }

    return toStaticString(syousai);

  }


  static createSikenName(String path){
    String classcode;
    String siken;

    // もしかしたらいらないかも
    String KamokuID = path.toString();

    // 学科、学年
    if(KamokuID.substring(0,3) == "I4_"){
      classcode = "IE4_";
    }
    else{

    }

    // 試験種別
    if(KamokuID.substring(3,5) == "1_") {
      siken = "前期中間試験/";
    }
    else if(KamokuID.substring(3,5) == "2_"){
      siken = "前期末試験　/";
    }
    else if(KamokuID.substring(3,5) == "3_"){
      siken = "後期中間試験/";
    }
    else if(KamokuID.substring(3,5) == "4_"){
      siken = "後期末試験　/";
    }
    else{

    }

    return toStaticString(classcode + siken);

  }


  static String pathcode;

   static toStaticString(String code){
    pathcode = code;
    return pathcode;
  }


}


