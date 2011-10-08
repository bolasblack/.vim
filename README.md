**Windows 用户慎用**

Linux 用户把整个文件夹复制到家目录，目录内 .vimrc 文件也复制到家目录下即可

复制完毕后运行 gvim ，然后执行 :BundleInstall 命令，等待所有插件安装完成就好啦～

呃， :BundleInstall 命令的执行需要 Git

如果运行 vim 后报错说有 ^M ，那么可以运行我放在目录里的 re^m.py 脚本，脚本需要 dos2unix 程序支持，命令内容：

python re^m.py <.vim 文件夹的目录>

Windows 用户么……在 Downloads 那个按钮那边有个 vimfiles.zip 的文件供下载，下载好以后解压到 vimfiles 文件夹里，把 bundle 文件夹里的文件夹全部复制粘贴到 plugins 文件夹下，如果说有文件重复是否覆盖就选择覆盖，粘贴好以后也也就可以用了。
