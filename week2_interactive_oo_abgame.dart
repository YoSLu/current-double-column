import 'dart:io';
import 'dart:math';

class ABGame3{
  int maxtime = 7; //限制最大次數
  int count = 0; //計算剩餘次數
  int a = 0;
  int b = 0;
  String result = "start"; //隨意給初始值，此變數接收playgame的return

  String playGame (String guess, String Ans){
    if (guess != null && guess.length == 3) { //確認他有東西並且長度為3
      int? guess_int = int.tryParse(guess); //確認他是數字
      if (guess_int != null) {
        String Ges = "$guess"; //提guess成字串
        if (Ges[0] != Ges[1] && Ges[0] != Ges[2] && Ges[1] != Ges[2]) { //去除使用者輸入重複數字的可能
          if (Ges.compareTo(Ans) == 0) {
            return ("3A, 恭喜獲勝!"); //處理獲勝情況
          }
          else {
            for (int i = 0; i < Ans.length; i++) {
              if (Ges[i] == Ans[i]) {
                a++; //計算a的數量
              }
              if (Ans.contains(Ges[i]) && Ges[i] != Ans[i]) {
                b++;
              }
            }
          }
        }
        else {
          return ("輸入不合法，有重複數字！"); //輸入3字元但有非數字的反饋
        }
      }
      else {
        return ("輸入不合法，有非數字字元！"); //輸入3字元但有非數字的反饋
      }
    }
    else {
      return ("輸入不合法，null或非三位數！"); //輸入3字元但有非數字的反饋
    }
    return ("$a A $b B, 請繼續");
  }

  String get_answer(){ //試著做了一個getter但不確定對不對
    var rng = Random();
    String c = 't';

    for(int i = 0; i < 3; i++){
      int poker = rng.nextInt(10);
      while (c.contains("$poker")){
        continue; //如果相同就不連接
      }
      c = c + '$poker';  //接在原字串的後面
    }
    String _Ans = c.substring(1, 4); //只取後面的，第一個英文不取
    print(_Ans);
    return _Ans;
  }

  int start(){
    String _Ans = get_answer();

    while (result != "3A, you win in $count turns!"){  //結束語或次數超過時跳出，顯示fail
      a = 0;
      b = 0;
      print ("3位數的AB game，計7次機會，已用$count 次");
      String? guess = stdin.readLineSync();
      count++;

      if (guess != null){
        result = playGame(guess, _Ans);
        print(result);
        if (result == "3A, 恭喜獲勝!"){ //已是正確答案所以return 1 結束
          return 1;
        }
      }
    }
    print("答案是$_Ans，you fail!"); //超過7次的結束語
    return 0;
  }

  ABgame3(int maxtime, int a, int b, String result, int answer){
    this.maxtime = 7; //只寫需要控制的東西
  }
}

void main() {
  ABGame3 abGame3 = ABGame3();
  abGame3.start();
}