## 使用说明

### Quick Start (*nix only)

#### Install

**via 'curl'**

```bash
curl -L https://raw.github.com/bolasblack/.vim/master/scripts/bootstrap.sh | bash
```

**via 'wget'**

```bash
wget --no-check-certificate https://raw.github.com/bolasblack/.vim/master/scripts/bootstrap.sh -O - | bash
```

#### Update

```bash
bash $HOME/.vim/scripts/update.sh
```

#### Remove

```bash
bash $HOME/.vim/scripts/remove.sh
```

### 其他方式

首先，你需要安装有 Git 。Linux 怎么装 Git 我就不说了，Windows 用户可以看一下 https://github.com/gmarik/vundle/wiki/Vundle-for-Windows 。

然后克隆仓库：

```bash
git clone --recursive --branch master https://github.com/bolasblack/.vim.git $HOME/.vim
```

**之后先去 `conf/pluginManager.vim` 看一下我列出的所有插件**，不要的全部删除或者注释掉，推荐注释掉 coding 大类后的 Python，Ruby，Language 和 Front 四个大类，等要用到的时候再取消注释。

然后把目录里的 `.vimrc` 文件也软连接到家目录下。这样如果我更新了的话，只要在 `.vim` 目录下 `git pull` 就能同步到最新啦。

软链接的命令：

    (cd ~ && ln -s .vim/.vimrc)

复制完毕后，需要先安装必须的 neobundle 插件：

    mkdir -p .vim/bundle && git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

这样 git 就会自动的 clone neobundle 插件到家目录下的 `.vim/bundle/neobundle` 文件夹啦。

然后再执行 `:NeoBundleInstall` 命令等待插件安装完毕。

最后，参考 [Powerline](://github.com/Lokaltog/powerline) 项目安装必需的字体。

## 一些有意思的 Vim 扩展工具推荐

[Vimdeck](http://vimdeck.tybenz.com/)：用 Markdown 来制作，用 Vim 来演示 Slide 。

## 问题集

### 打开 Vim 时报错说当前版本不支持 `NeoComplete` ，需要更高版本的 Vim 和对 lua 的支持

你在编译 Vim 的时候需要加入对 lua 的支持。

### 你这个王八蛋我之前用了你的这个玩意儿，我最近一次更新后现在所有插件都不能用了，而且每次打开 vim 都跳一大片错误这是怎么回事！！！

安啦安啦，我只是把之前移到家目录的文件夹移回了 `.vim` 下而已。

执行 `mv ~/.vimVundle ~/.vim/bundle` 就可以啦。

### 运行 vim 后报错说有 ^M 

可以运行我放在目录里的 re^m.py 脚本，脚本需要 dos2unix 程序支持，命令：

    python re^m.py <.vim 文件夹的目录>

### sudo vim file 时报错

报错内容如下：

    neocomplcache disabled: "sudo vim" is detected and $HOME is set to your user's home. You may want to use the sudo.vim plugin, the "-H" option with "sudo" or set always_set_home in /etc/sudoers instead.

这是由于插件 `neocomplcache` 不支持 `sudo vim` 方式编辑文件，可见文档 https://github.com/Shougo/neocomplcache/blob/master/doc/neocomplcache.txt#L1355 。

解决方案是已经配置在 `pluginManager.vim` 文件中的 `sudo.vim` 插件，打开文件时使用命令 `vim sudo:/path/to/file` 或者保存文件时使用命令 `:SudoWrite %` 。

如果不想使用 `sudo.vim` 插件，可以在用普通权限编辑完文件后使用 `:w ! sudo tee %` 命令来保存

### &lt;ESC&gt; 键实在是太麻烦了，一点都不快速

使用 <kbd>Ctrl</kbd>+<kbd>[</kbd> 替代

### 冒号的输入实在是太麻烦了

    右手得离开键盘，中指按Shift，食指按分号键

替换为：

    使用左手小指按左侧Shift，右手小指按右侧分号键

### C-c 和 C-[ 的区别

`<C-c>` 不会触发 `InsertLeave` 事件，最直观的结果是，使用块编辑的时候如果按下 `C-c` ，那么编辑的结果不会作用在其他行中。

而 `<C-[>` 则是 `<ESC>` 键的别名，该触发的都会触发。

当插件比较多的时候，我们可以明显的感觉出来，按 `<C-c>` 返回普通模式的速度要远远快于 `<C-[>` 。

参考资料：http://stackoverflow.com/questions/80677/what-is-the-difference-between-c-c-and-c-in-vim

