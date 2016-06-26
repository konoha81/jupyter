# 1. Vagrantを使ったSage jupyter環境構築

Sageでもjupyterのnotebookがスタンダードになり、Sageだけでなく、
Pandasやtheano等のpythonパッケージを使ったnotebookが増えてくると思います。

自分の紹介するnotebookを実行するのに必要な環境も含めて公開し、
誰でも同じ結果を得ることができるようにVagrantを使ってVirtualBoxのVM環境を
構築する方法を紹介します。

# 2. 必要なアプリケーションのインストール

環境構築に必要なアプリケーションは、以下の２つです。
- VirtualBox: 無料で使用できるx86仮想化ソフトウェアです。Ubuntu14.04の仮想環境を実行するために使用します。[^1]
- Vagrant: 仮想環境を構築し、実行するためのツールです。[^2]

## 2.1. VirtualBoxのインストール
![VirtualBox Logo](https://www.virtualbox.org/graphics/vbox_logo2_gradient.png "VirtualBox Logo")

VirtualBoxは、以下のダウンロードサイトからお使いの環境に合わせてダウンロードしてください。
- https://www.virtualbox.org/wiki/Downloads


## 脚注
- [1]: 私のMacOSは10.7.5と古いため、VirtualBoxのバージョンは4.3.12を使用。
- [2]: 今回使用したバージョンは1.8.4です。
