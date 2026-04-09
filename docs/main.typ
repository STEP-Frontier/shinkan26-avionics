#import "piman-theme.typ": *

#set text(lang: "ja")

#show: piman-theme.with(
  title: [光る！電子工作体験],
  author: [筑波大学宇宙技術プロジェクト],
  event: [電装班 2026年度新歓資料],
)

#title-slide()

= 私たちの紹介

== STEPとは

== 電装班でやっていること

= 今日やること

#focus-slide([LEDを光らせてみよう])

== 必要なもの

- マイコン
- LED
- ジャンパー線
  - マイコンとLEDを接続するための線
- 抵抗

#speaker-note([それぞれ実物を見せながら説明])

== マイコンとは

- マイクロコントローラーの略で、小さなコンピュータのようなもの
- センサーなどの部品と接続するためのピンが外に出ていて回路に組み込みやすい
- 今回は、LEDを点滅させるためにマイコンを使う

#figure(image("stm32g431kb.jpg", height: 40%), caption: "今回使うマイコン(STM32G431KB)")

== LEDを点滅させるまでの道筋

- LEDとマイコンをジャンパー線で接続
- マイコンにLEDを点滅させるプログラムを書き込む
- LEDが点滅する！💡💡💡💡💡

== 環境構築: VSCode

- まずは、マイコンにプログラムを書き込むための環境を整えよう
- Visual Studio Code (VSCode) をインストール
  - VSCodeは、Microsoftが提供する無料のコードエディタで、様々なプログラミング言語に対応している
- https://code.visualstudio.com/ からインストール
- インストールができたら、近くにいるSTEPのメンバーに声をかけてください！

== 今回使うプログラムをダウンロード

- 今回使うプログラムと資料は、インターネットに公開されている
- https://github.com/STEP-Frontier/shinkan26-avionics からダウンロード
- Code → Download ZIP をクリックしてダウンロードしてください

#figure(image("download_source_code.png", height: 45%), caption: "ダウンロードをするボタン")

== LEDとマイコンをジャンパー線で接続

#figure(image("circuit_diagram.png", height: 100%), caption: "LEDとマイコンの接続例")

== LEDを点滅させるプログラムを書く

- 先ほどダウンロードしたzipファイルを解凍し、そのフォルダをVSCodeで開いてください
- srcフォルダの中にmain.cppというファイルがあるので、開いてみましょう
- そこに、LEDを点滅させるためのプログラムが書いてあります

#pagebreak()

```c
void setup() {
  pinMode(PA1, OUTPUT); // PA1ピンを出力モードに設定
}

void loop() {
  digitalWrite(PA1, HIGH); // PA1ピンをHIGH(LEDを点灯)
  delay(500); // 500ミリ秒(0.5秒)待機
  digitalWrite(PA1, LOW); // PA1ピンをLOW(LEDを消灯)
  delay(500);
}
```

== マイコンに実際に書き込んでみよう

下のバーにある→のアイコンをクリックして、マイコンにプログラムを書き込む

#focus-slide([光る！！！])

== 実践: 点滅の頻度を変えてみよう

```c
void setup() {
  pinMode(PA1, OUTPUT);
}

void loop() {
  digitalWrite(PA1, HIGH);
  delay(500); // ここを変更
  digitalWrite(PA1, LOW);
  delay(500); // ここを変更
}
```

#pagebreak()

```c
void setup() {
  pinMode(PA1, OUTPUT);
}

void loop() {
  digitalWrite(PA1, HIGH);
  delay(100); // 0.5秒から0.1秒に変更
  digitalWrite(PA1, LOW);
  delay(100); // 0.5秒から0.1秒に変更
}
```

== 文字列を出力してみよう(シリアル通信)

- シリアル通信という仕組みを使って文字列を出力する
- 下のバーのコンセントマークをクリックすると、シリアルモニタが開く
- シリアルモニタには、マイコンから送られた文字列が表示される

#pagebreak()

```c
void setup() {
  pinMode(PA1, OUTPUT);
  Serial.begin(115200); // シリアル通信を開始
}

void loop() {
  digitalWrite(PA1, HIGH);
  Serial.println("PA1 HIGH"); // シリアルモニタに「PA1 HIGH」と出力
  delay(100);
  digitalWrite(PA1, LOW);
  Serial.println("PA1 LOW"); // シリアルモニタに「PA1 LOW」と出力
  delay(100);
}
```

#pagebreak()

#figure(image("serial_monitor.png", height: 60%), caption: "実行例")

= 最後に

#focus-slide([最後に])

== 電装班の活動について

- 電装班では、ロケットの電装系の設計・製作を行っている
- 例えば、データ収集のためのセンサーの開発などを行っている
- 今後、ロケットの姿勢制御なども行う予定
- 興味がある人は、ぜひ電装班に来てね！

== これからの新歓予定

#figure(image("shinkan_schedule.jpeg", height: 90%), caption: "これからの新歓予定")