# Doxygen Template for DCMODEL Project                               {#README}

<!-- English bellow -->

@ja
## これは何?

Doxygenでのドキュメント生成例・テンプレートです.
[地球流体電脳倶楽部 dcmodel プロジェクト][dcmodel(ja)] で開発されている
数値モデル, ライブラリでの利用される事を想定しています.

ベーステーマとして [Doxygen Awesome][doxygen awesome] を利用し,
ソースコード内のコメントや文書(本レジュメ)は
Markdown スタイルで記述することを想定しています.

## 書き方/使い方

先ずは Doxygen 本家の Markdown サポートをご覧下さい.: \n
https://www.doxygen.nl/manual/markdown.html

ちょっと工夫している所は...

- 日英併記し易い用に,
  マクロとして `\@en ... \@enden`, `\@ja ... \@enden` を用意しています
  このファイルを確認してみて下さい.
- `subpage` を上手く活用しましょう.

- \subpage diffusion の例


## 著作権とライセンス

\subpage COPYRIGHT "著作権とライセンス" をご覧下さい.

@endja
@en
## What's this?

Example and template of Doxygen document generation.

It is intended for use with the numerical models and libraries
developed in the [dcmodel project][dcmodel(en)].

[Doxygen Awesome][doxygen awesome] is used as the base theme,
and comments and documents in the source code are
supposed to be written in Markdown style.

## How to use/write documents.

First, please visit the Doxygen homepage for Markdown support:\n
https://www.doxygen.nl/manual/markdown.html

Here is a partial list of what we are working on:
- To make it easier to write both Japanese and English,
  the macro `＠en ... ＠enden`, `＠en ... ＠enden` are available.
  (where @ is lower case). Check this file.
- Make good use of `subpage`.

## COPYRIGHT and Licenses

Please check
\subpage COPYRIGHT "Copyright and licenses".


@enden
[dcmodel(ja)]: https://dennou-k.gfd-dennou.org/library/dcmodel/index.htm
[dcmodel(en)]: https://dennou-k.gfd-dennou.org/library/dcmodel/index.htm.en
[doxygen awesome]: https://jothepro.github.io/doxygen-awesome-css/

<!-- Local Variables: -->
<!-- mode: markdown -->
<!-- End: -->
