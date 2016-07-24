# 1. SageMathへのパッケージの追加方法

# 2. pythonパッケージの追加
Sageにpythonのパッケージを追加するには、vagrantのsshコマンドでUbuntuに入ります。

```bash
$ vagrant ssh
Welcome to Ubuntu 14.04.4 LTS (GNU/Linux 3.13.0-86-generic x86_64)
途中省略
Last login: Fri Jul  8 23:45:33 2016 from 10.0.2.2
vagrant@vagrant-ubuntu-trusty-64:~$ 
```

sageは、システムが管理している場所にインストールされているため、
sudoコマンドでsageを-shオプションを付けて起動します。
プロンプトに(sage-sh)が付いているのが、目安です。
```bash
vagrant@vagrant-ubuntu-trusty-64:~$ sudo sage -sh
途中省略
Bypassing shell configuration files...

Note: SAGE_ROOT=/usr/lib/sagemath
(sage-sh) root@vagrant-ubuntu-trusty-64:~$
```

pipコマンドでパッケージを追加します。
以下の例では、pythonにggplotを追加しています。

```bash
(sage-sh) root@vagrant-ubuntu-trusty-64:~$ pip install ggplot
The directory '/home/vagrant/.cache/pip/http' or its parent directory is not owned by the current user and the cache has been disabled. Please check the permissions and owner of that directory. If executing pip with sudo, you may want sudo's -H flag.
のワーニングがでますが、ここではそのまま処理してください。

Collecting ggplot
  Downloading ggplot-0.10.0-py2-none-any.whl (2.1MB)
    100% |████████████████████████████████| 2.1MB 357kB/s 
途中省略
Installing collected packages: ggplot
Successfully installed ggplot-0.10.0
(sage-sh) root@vagrant-ubuntu-trusty-64:~$ 
```

パッケージのインストールが完了したら、exitコマンドでsageを終了し、
もう一度exitでUbuntuから抜けてください。
```bash
(sage-sh) root@vagrant-ubuntu-trusty-64:~$ exit
exit
Exited Sage subshell.
vagrant@vagrant-ubuntu-trusty-64:~$ exit
logout
Connection to 127.0.0.1 closed.
$ 
```

# 3. Rパッケージの追加
Rのパッケージは、notebookでも可能ですが、インストールに失敗した場合や大きなパッケージのインストールで
途中経過が知りたい場合にsageコマンドからのインストール方法が便利です。

vagrant sshでUbuntuに入った後から説明します。

sudoコマンドでsageを-Rオプション付きで起動します。
```bash
vagrant@vagrant-ubuntu-trusty-64:~$ sudo sage -R
途中省略
R version 3.2.4 Revised (2016-03-16 r70336) -- "Very Secure Dishes"
Copyright (C) 2016 The R Foundation for Statistical Computing
Platform: x86_64-pc-linux-gnu (64-bit)
途中省略
Type 'q()' to quit R.

> 
```

> がRのプロンプトです。optionsでリポジトリの場所を指定し、
install.packagesでインストールするパッケージを指定します。

ここでは、ggplot2とjsonliteをインストールします。
```R
> options(repos='http://cran.us.r-project.org')
> install.packages('ggplot2')
trying URL 'http://cran.us.r-project.org/src/contrib/ggplot2_2.1.0.tar.gz'
Content type 'application/x-gzip' length 1571788 bytes (1.5 MB)
==================================================
downloaded 1.5 MB

* installing *source* package ‘ggplot2’ ...
途中省略
The downloaded source packages are in
	‘/tmp/Rtmp6jFDbX/downloaded_packages’
> install.packages('jsonlite')
trying URL 'http://cran.us.r-project.org/src/contrib/jsonlite_1.0.tar.gz'
Content type 'application/x-gzip' length 1057732 bytes (1.0 MB)
==================================================
downloaded 1.0 MB

* installing *source* package ‘jsonlite’ ...
途中省略
The downloaded source packages are in
	‘/tmp/Rtmp6jFDbX/downloaded_packages’
>
```

Rを終了するには、q()と入力します。workspaceを保存しないので、nを入力します。

```R
> q()
Save workspace image? [y/n/c]: n
vagrant@vagrant-ubuntu-trusty-64:~$
```

# 4. MySageMathにインストールされている(したい)パッケージ

## 4.1 Ubuntuパッケージ

- libmagickwand-dev	（これは、Wand用です）
- pkg-config
- jags 3.4.0

## 4.2 pythonパッケージ

- pandas 
- ggplot 0.10.0
- Wand 0.4.3
- seaborn 0.7.1
- pyjags

## 4.3 Rパッケージ

- ggplot2
- jsonlite
- glmmML
- coda
- rjags from source

apt-getでインストールしたjagsのバージョンが3.4.0のため、以下の手順でrjags3.15をインストールします。
#pre{{
$ wget https://cran.r-project.org/src/contrib/Archive/rjags/rjags_3-15.tar.gz
$ sudo sage -R <<EOF
install.packages("rjags_3-15.tar.gz", repo=NULL, type="source")
EOF

}}
