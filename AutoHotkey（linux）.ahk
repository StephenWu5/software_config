; #window   +shift   ^ctrl !alt
;网页快捷跳转
;=========================================================================
#b::Run https://www.baidu.com/

!g::Run https://www.gov.cn/
;新建txt 待办事项
#t::Run, Notepad  C:\Users\Administrator\Desktop\待办事项.txt

;-------------------------------------------------------------------------

::/startup::C:\Users\Administrator\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
;-------------------------------------------------------------------------


;截图颜色
;=========================================================================
^#c:: 
MouseGetPos, mouseX, mouseY
; 获得鼠标所在坐标，把鼠标的 X 坐标赋值给变量 mouseX ，同理 mouseY 
PixelGetColor, color, %mouseX%, %mouseY%, RGB 
; 调用 PixelGetColor 函数，获得鼠标所在坐标的 RGB 值，并赋值给 color 
StringRight color,color,6 
; 截取 color（第二个 color）右边的6个字符，因为获得的值是这样的：#RRGGBB，一般我们只需要 RRGGBB 部分。把截取到的值再赋给 color（第一个 color）。
clipboard = %color% 
; 把 color 的值发送到剪贴板 return
;-------------------------------------------------------------------------




;caps lock 映射为esc  用于gvim和webstorm中
;=========================================================================
classname = ""
keystate = ""
Capslock::
  WinGetClass, classname, A
;clipboard=%classname% 
;  if (classname = "Vim" || classname = "SunAwtFrame")
    Send, {ESC} 
  return

