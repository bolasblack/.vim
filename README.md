将整个文件夹复制到家目录，目录内 .vimrc 文件也复制到家目录下即可

复制完毕后运行 gvim ，然后执行 :BundleInstall 命令，等待所有插件安装完成就好啦～

呃， :BundleInstall 命令的执行需要 Git，那个啥，Windows 用户么……我也不知道怎么办啦……

如果运行 vim 后报错说有 ^M ，那么可以运行我放在目录里的 re^m.py 脚本，脚本需要 dos2unix 程序支持，命令内容：

python re^m.py [.vim 文件夹的目录]
