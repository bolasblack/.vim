Linux 用户把整个文件夹复制到家目录，目录内 .vimrc 文件也复制到家目录下即可。其实我个人推荐硬链接，这样如果我更新了的话，只要在 .vim 目录下

    git pull
    
就能同步到最新啦。硬链接的命令内容：

    ln ~/.vim/.vimrc ~/.vimrc
    
复制完毕后运行 Vim ，然后执行 `:BundleInstall` 命令，等待所有插件安装完成就好啦～

呃， `:BundleInstall` 命令的执行需要 Git 。

如果运行 vim 后报错说有 ^M ，那么可以运行我放在目录里的 re^m.py 脚本，脚本需要 dos2unix 程序支持，命令内容：

    python re^m.py <.vim 文件夹的目录>

Windows 用户么……个人还是推荐弄个 *nix 环境吧。如果一定要试试看的话，可以按照 .vim/conf/pluginManager.vim 里的内容下载插件。
