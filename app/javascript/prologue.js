// グローバル領域に展開
phina.globalize();


// テキスト表示&文字送りクラス
phina.define("LabelRect", {
  superClass: "RectangleShape",
  init: function () {
    this.superInit({
      cornerRadius: 5,
      width: 630,
      height: 280,
      stroke: "white",
      fill: "#eee"
    });
    this.alpha = 0.8;

    // テキスト表示用LabelAreaクラス
    this.labelArea = LabelArea({
      text: "",
      width: 600,
      height: 240,
      fontSize: 24 // 適切なフォントサイズに変更
    }).addChildTo(this);

    this.texts = [];
    this.textIndex = 0;
    this.charIndex = 0;

    // 次のテキスト合図の▽
    this.nextTriangle = TriangleShape({
      fill: "black",
      stroke: false,
      radius: 12 // 適切なサイズに変更
    }).addChildTo(this)
      .setPosition(280, 100);
    this.nextTriangle.rotation = 180;
    this.nextTriangle.hide();
  },
  showAllText: function () {
    let text = this.texts[this.textIndex];
    this.labelArea.text = text;
    this.textAll = true;
    this.charIndex = text.length;
  },
  clearText: function () {
    this.labelArea.text = "";
  },
  nextText: function () {
    this.clearText();
    ++this.textIndex;
    this.charIndex = 0;
    this.addChar();
  },
  addChar: function () {
    if (this.texts[this.textIndex]) {
      this.labelArea.text += this.getChar();
    }
  },
  getChar: function () {
    let text = this.texts[this.textIndex];
    if (text.length <= this.charIndex) {
      this.textAll = true;
      return "";
    } else {
      this.textAll = false;
      return text[this.charIndex++];
    }
  }
});

// メインシーン
phina.define("MainScene", {
  superClass: "DisplayScene",
  init: function () {
    this.superInit();

    // 背景色
    this.backgroundColor = "black";

    // 背景用グループ
    this.backImageGroup = DisplayElement().addChildTo(this);

    // テキストエリアの矩形
    this.labelRect = LabelRect().addChildTo(this)
      .setPosition(this.gridX.center(), this.gridY.center(5.5));

    this.labelRect.texts = MAINNTEXTS;
    this.labelRect.textIndex = 0;
    this.labelRect.charIndex = 0;

    this.setPhase();
  },
  setPhase: function() {
    // 背景の変更やその他の設定をここに追加
  },
  // 更新
  update: function (app) {
    // クリックかEnterキーの入力があった場合
    if (app.pointer.getPointingStart() || app.keyboard.getKeyDown("enter")) {
      if (this.labelRect.textAll) { // テキスト全部表示済み
        this.labelRect.nextText();
        // 次の背景に切替
        this.setPhase();
      } else {
        this.labelRect.showAllText();
      }
    } else {
      this.labelRect.addChar();
    }

    if (this.labelRect.textAll) {
      this.labelRect.nextTriangle.show();
    } else {
      this.labelRect.nextTriangle.hide();
    }
  }
});

// メイン処理
phina.main(() => {
  // アプリケーションを生成
  const app = GameApp({
    // MainSceneから開始
    startLabel: "main",
    // アセット
    assets: ASSETS
  });
  // 実行
  app.run();
});
