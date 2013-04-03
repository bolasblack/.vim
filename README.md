## 使用说明

首先，你需要安装有 Git 。Linux 怎么装 Git 我就不说了，Windows 用户可以看一下 https://github.com/gmarik/vundle/wiki/Vundle-for-Windows 。

Linux 用户把整个文件夹复制到家目录，目录内 .vimrc 文件也复制到家目录下即可。其实我个人推荐软链接，这样如果我更新了的话，只要在 .vim 目录下 `git pull` 就能同步到最新啦。

软链接的命令：

    (cd ~ && ln -s .vim/.vimrc)

复制完毕后，需要先安装必须的 vundle 插件：

    mkdir ~/.vimVundle && git clone https://github.com/gmarik/vundle.git ~/.vimVundle/vundle

这样 git 就会自动的 clone vundle 插件到家目录下的 .vimVundle 文件夹啦。

**之后先去 `conf/pluginManager.vim` 看一下我列出的所有插件**

有不想用的就直接注释掉（推荐注释掉 coding 大类后的 Python，Ruby，Language 和 Front 四个大类，等要用到的时候再取消注释）

然后再执行 `:BundleInstall` 命令等待插件安装完毕。

## 问题集

### 运行 vim 后报错说有 ^M 

可以运行我放在目录里的 re^m.py 脚本，脚本需要 dos2unix 程序支持，命令：

    python re^m.py <.vim 文件夹的目录>

### sudo vim file 时报错

报错内容如下：

    neocomplcache disabled: "sudo vim" is detected and $HOME is set to your user's home. You may want to use the sudo.vim plugin, the "-H" option with "sudo" or set always_set_home in /etc/sudoers instead.

这是由于插件 `neocomplcache` 不支持 `sudo vim` 方式编辑文件，可见文档 https://github.com/Shougo/neocomplcache/blob/master/doc/neocomplcache.txt#L1355 。

解决方案是已经配置在 `pluginManager.vim` 文件中的 `sudo.vim` 插件，打开文件时使用命令 `vim sudo:/path/to/path` 或者保存文件时使用命令 `:SudoWrite %` 。

如果不想使用 `sudo.vim` 插件，可以在用普通权限编辑完文件后使用 `:w ! sudo tee %` 命令来保存
