"===============================================================================
"     FileName: gtrans.vim
"         Desc: Google Translate Plugin for Vim
"               Need python
"       Author: yicuan
"        Email: bolasblack@gmail.com
"     HomePage: http://plafer.tk
"      Version: 0.2
"   LastChange: 2011-07-19 15:15:30
"      Install: 把文件复制到 $VIM/plugin/ 目录下即可，插件需要 Python 的支持。
"        Usage: 使用时，可以在普通模式下将光标移到目标单词上，使用 /gt 快捷键
"               或者输入 :Gtrans 来获得翻译；或者在可视模式下高亮选择文本，输
"               入 :VGtrans 或者快捷键 /gv 获得翻译。默认将内容翻译成为简体中
"               文，可以修改 g:Gtrans_DefaultLang 改变默认目标语言，如：
"                   let g:gtrans_DefaultLang = 'tw'
"               当然，设置的语言必须是初始就有或者你已经设置过的。可以通过传入
"               参数来设置翻译目标语言，如：
"                   :Gtrans('en')
"               不过目前只支持单词的翻译，因为输入命令的方法不能使用范围。不过
"               可以修改 g:gtrans_DefaultLang 以达到类似的效果。
"               初始可以翻译为三种语言：
"                   en : 英语
"                   zh : 简体中文
"                   tw : 繁体中文
"               可以通过设置 g:gtrans_LangDict 变量增加其他语言，如：
"                   let g:gtrans_LangDict = {
"                       目标语言的缩写（就是要传入的参数） : 
"                       对应的语言名称缩写（需要通过GtransLangHelp 命令查找）
"                   }
"      History: 2011.04.18 完工～（应该差不多了……），目前的情况是，翻译一次可
"               视模式高亮的内容后，无法重复翻译相同内容……
"               2011.07.19 修改了一下 GetTrans 和 Translate 函数，可以传入目标
"               语言，感谢 lifu cheng <leftcold@gmail.com> 童鞋的建议～现在的
"               问题只有两点了，第一是反应速度有点慢，第二是可视模式翻译不错，
"               但是以后非可视模式下的获取单词总是会有些问题。
"===============================================================================
if !has('python')
	finish
endif

command! -nargs=? Gtrans call GetTrans(<args>)
command! -nargs=? VGtrans call GetTransVis()
command! -nargs=? GtransLangHelp call GetTransHelp()
map <leader>gt :call GetTrans()<CR>
map <leader>gv :call GetTransVis()<CR>

let g:gtrans_PrevText = ''
if !exists('g:gtrans_DefaultLang')
    let g:gtrans_DefaultLang = 'zh'
endif
if !exists('g:gtrans_LangDict')
    let g:gtrans_LangDict = {}
endif

func! GetTransHelp() "{{{
    let dictInfo = "'AFRIKAANS' : 'af'\n'ALBANIAN' : 'sq'\n'AMHARIC' : 'am'\n'ARABIC' : 'ar'\n'ARMENIAN' : 'hy'\n'AZERBAIJANI' : 'az'\n'BASQUE' : 'eu'\n'BELARUSIAN' : 'be'\n'BENGALI' : 'bn'\n'BIHARI' : 'bh'\n'BRETON' : 'br'\n'BULGARIAN' : 'bg'\n'BURMESE' : 'my'\n'CATALAN' : 'ca'\n'CHEROKEE' : 'chr'\n'CHINESE' : 'zh'\n'CHINESE_SIMPLIFIED' : 'zh-CN'\n'CHINESE_TRADITIONAL' : 'zh-TW'\n'CORSICAN' : 'co'\n'CROATIAN' : 'hr'\n'CZECH' : 'cs'\n'DANISH' : 'da'\n'DHIVEHI' : 'dv'\n'DUTCH' : 'nl'  \n'ENGLISH' : 'en'\n'ESPERANTO' : 'eo'\n'ESTONIAN' : 'et'\n'FAROESE' : 'fo'\n'FILIPINO' : 'tl'\n'FINNISH' : 'fi'\n'FRENCH' : 'fr'\n'FRISIAN' : 'fy'\n'GALICIAN' : 'gl'\n'GEORGIAN' : 'ka'\n'GERMAN' : 'de'\n'GREEK' : 'el'\n'GUJARATI' : 'gu'\n'HAITIAN_CREOLE' : 'ht'\n'HEBREW' : 'iw'\n'HINDI' : 'hi'\n'HUNGARIAN' : 'hu'\n'ICELANDIC' : 'is'\n'INDONESIAN' : 'id'\n'INUKTITUT' : 'iu'\n'IRISH' : 'ga'\n'ITALIAN' : 'it'\n'JAPANESE' : 'ja'\n'JAVANESE' : 'jw'\n'KANNADA' : 'kn'\n'KAZAKH' : 'kk'\n'KHMER' : 'km'\n'KOREAN' : 'ko'\n'KURDISH' : 'ku'\n'KYRGYZ' : 'ky'\n'LAO' : 'lo'\n'LATIN' : 'la'\n'LATVIAN' : 'lv'\n'LITHUANIAN' : 'lt'\n'LUXEMBOURGISH' : 'lb'\n'MACEDONIAN' : 'mk'\n'MALAY' : 'ms'\n'MALAYALAM' : 'ml'\n'MALTESE' : 'mt'\n'MAORI' : 'mi'\n'MARATHI' : 'mr'\n'MONGOLIAN' : 'mn'\n'NEPALI' : 'ne'\n'NORWEGIAN' : 'no'\n'OCCITAN' : 'oc'\n'ORIYA' : 'or'\n'PASHTO' : 'ps'\n'PERSIAN' : 'fa'\n'POLISH' : 'pl'\n'PORTUGUESE' : 'pt'\n'PORTUGUESE_PORTUGAL' : 'pt-PT'\n'PUNJABI' : 'pa'\n'QUECHUA' : 'qu'\n'ROMANIAN' : 'ro'\n'RUSSIAN' : 'ru'\n'SANSKRIT' : 'sa'\n'SCOTS_GAELIC' : 'gd'\n'SERBIAN' : 'sr'\n'SINDHI' : 'sd'\n'SINHALESE' : 'si'\n'SLOVAK' : 'sk'\n'SLOVENIAN' : 'sl'\n'SPANISH' : 'es'\n'SUNDANESE' : 'su'\n'SWAHILI' : 'sw'\n'SWEDISH' : 'sv'\n'SYRIAC' : 'syr'\n'TAJIK' : 'tg'\n'TAMIL' : 'ta'\n'TATAR' : 'tt'\n'TELUGU' : 'te'\n'THAI' : 'th'\n'TIBETAN' : 'bo'\n'TONGA' : 'to'\n'TURKISH' : 'tr'\n'UKRAINIAN' : 'uk'\n'URDU' : 'ur'\n'UZBEK' : 'uz'\n'UIGHUR' : 'ug'\n'VIETNAMESE' : 'vi'\n'WELSH' : 'cy'\n'YIDDISH' : 'yi'\n'YORUBA' : 'yo'\n'UNKNOWN' : ''\n"
    let urlInfo = "\nMore Infomation In \nhttp://code.google.com/intl/zh-CN/apis/language/translate/v1/getting_started.html#translatableLanguages "
    let transLangInfo = dictInfo . urlInfo
    call s:ShowTransWindow(transLangInfo)
endfunc
"}}}

func! GetTrans(...) "{{{
    let targetLang = g:gtrans_DefaultLang
    if a:0 == 1
        let targetLang = a:1
    endif
    call s:Translate(eval("expand('<cword>')"), targetLang)
endfunc

func! GetTransVis()
    let targetLang = g:gtrans_DefaultLang
    let visText = s:GetVisual()
    call s:Translate(visText, targetLang)
endfunc

"func! GetTrans(...) "{{{
	"let visText = s:GetVisual()
	""let currMode = mode()
	""echo currMode.' '.msg
	"let targetLang = g:gtrans_DefaultLang
    "if a:0 == 1
        "let targetLang = a:1
    "endif
    "if visText == '' || g:gtrans_PrevText == visText
        "call s:Translate(eval("expand('<cword>')"), targetLang)
    "else
        "call s:Translate(visText, targetLang)
        "let g:gtrans_PrevText = visText
    "endif
"endfunc
"}}}
"}}}

func! s:GetVisual() "{{{
	let firstcol= col("'<")
	let lastcol= col("'>")
	let firstline = line("'<")
	let lastline = line("'>")
	let str = ''
	if firstline == lastline 
		let ll  = getline(firstline)
		let str = strpart(ll,firstcol-1,lastcol-firstcol)
	else
		let lcount = firstline+1
		let lines = []
		let ll  = strpart(getline(firstline),firstcol-1)
		call add(lines,ll)
		while lcount < lastline
			let ll = getline(lcount)
			call add(lines,ll)
			let lcount += 1
		endw
		let ll = strpart(getline(lcount),0,lastcol-1)
		call add(lines,ll)
		let str = join(lines,"\n")
	endif
	return str
endfunc
"}}}

func! s:Translate(text, tl) "{{{
python << EOF
# -*- coding:utf-8 -*-
import urllib
import urllib2
import json
import vim
import sys 
reload(sys) 
sys.setdefaultencoding('utf8')

def getTargetLang(tl): #{{{
    langDict = {'en': 'en', 'zh': 'zh-CN', 'tw': 'zh-TW'}
    try:
        targetLang = tl in langDict.keys() \
                and langDict[tl] \
                or vim.eval("g:gtrans_LangDict['"+ tl +"']")
        return targetLang
    except:
        errorStr = '找不到目标语言'+tl+'，请对 g:gtrans_langDict 变量进行设置'
        raise Exception, errorStr
#}}}

def getJSON(sourceText, targetLang): #{{{
    url = 'http://translate.google.cn/translate_a/t'
    params = urllib.urlencode({'client':'json',
                               #'hl':'zh-CN', #这个参数实在是不知道有什么用
                               'tl':targetLang,
                               'text':sourceText})
    req    = url + '?' + params
    opener = urllib2.build_opener()
    opener.addheaders = [('User-agent','Mozilla/5.0')]
    urllib2.install_opener(opener)
    data = urllib2.urlopen(req).read()
    return json.loads(data)
#}}}

def formatJSON(sourceText, jsonData): #{{{
    output = ''
    try:
        result = jsonData['dict']
    except:
        sentences = jsonData['sentences']
        for i in range(0,len(sentences)):
            output += sentences[i]['orig'] + ':\n'
            output += sentences[i]['trans']
    else:
        output = sourceText + ':\n'
        for i in range(0,len(result)):
            output += result[i]['pos']
            output += ':'
            for j in range(0,len(result[i]['terms'])):
                if j != 0:
                    output += ','
                output += result[i]['terms'][j]
            if i != len(result)-1:
                output += '\n'
    return output
#}}}

try:
    sourceText = vim.eval('a:text')
    targetLang = vim.eval('a:tl')
    #text = text.strip()
    sourceText.replace(' ','%20')
    sourceText.replace('\n','%0A')
    targetLang = getTargetLang(targetLang)
    jsonData = getJSON(sourceText, targetLang)
    output = formatJSON(sourceText, jsonData)
except Exception, e:
    output = str(e)
vim.command('call s:ShowTransWindow("' + output.encode(vim.eval("&encoding")) + '")')
EOF
endfunc
"}}}

func! s:ShowTransWindow(string) "{{{
	let @z = a:string
	if bufexists("TransWindow") > 0
		sil! bwipeout TransWindow
	endif
	silent botright new TransWindow
	if bufexists("TransWindow") > 0
		resize 5
		set buftype=nofile
		sil normal "zP
	endif
endfunc
"}}}
