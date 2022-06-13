# やりたいこと

---

さやの対話セットと、NTTが作成した対話セットを別々にFineTuningするのではなく、ごちゃまぜで一気に学習すると、サヤらしさと応答精度が変わるのではないか？

### データセット

NTT

- Empathetic-dialog 60000
- persona-chat 61833

Saya

- sayaで応答　60,000文
- age17で応答 60000

validationセットは、とりあえずはぐちゃぐちゃにまぜたものの中から一部を用いて学習

> でも、内容の濃いものを出現させたければ、Empathetic-dialogを学習すればよいのではないか？
> 

データセットはtraining : validation を8:2で学習する。

# TODO

以下の４パターンのデータセットを作成

1. Empathetic-dialog + saya
2. Empathetic-dialog + age17
3. persona-chat + saya
4. persona-chat + age17

それらを用いて追加学習


# 学習結果（Validation）

- Empathetic-dialog + saya

    PPL:18.48  LOSS:5.842

- Empathetic-dialog + age17

    PPL:20.1 LOSS:5.956

- persona-chat + saya
    
    PPL : 19.63  LOSS:4.295
    
- persona-chat + age17
    
    PPL:20.89  LOSS: 5.978
