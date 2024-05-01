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
  if (true)
  {
    SetCapsLockState, Off
    Send, {ESC} 
  }
  else
  {
    GetKeyState, keystate, CapsLock, T
    if (keystate = "D")
      SetCapsLockState, Off
    else
      SetCapsLockState, On
    return
  }
  return


;=====================普通编辑器模范vim的开始=============================
;模拟vim上下左右
Capslock & j::
send, {Down}
Return
Capslock & k::
send, {Up}
Return
Capslock  & h:: 
send, {Left}
Return
Capslock & l::
send, {Right}
return

; 按单词移动
; Ctrl + 左/右 :: CapsLock + u/i
CapsLock & b::Send, ^{Left}
CapsLock & w::Send, ^{Right}

; 按页移动(翻页)
; PgUp/PgDn :: CapsLock + [或]
CapsLock & u::Send, {PgUp}
CapsLock & d::Send, {PgDn}

;;;;;;;;;;;;;删除一整行
^+d::   ;alt+d
Send {Home}   ;输出回车
Send +{End}   ;输入shitf键+end键
Send {delete}   ;输入delete键
return 
;;;;;;;;;;;;;复制一整行
CapsLock & y::
send {home}
send +{end}
send ^c   ;输出ctrl+c,复制一整行
return
;;;;;;;;;;;;;另起一行粘贴内容                                                                   
CapsLock & p::                                                                                        
send {end}                                                                                  
send {enter}                                                                                
send %clipboard%    ;将剪贴板的内容输出                                                  
return  

; 移动到文档首/尾
; Ctrl + Home/End :: CapsLock + -/=
CapsLock & t::Send, ^{Home}
CapsLock & g::Send, ^{End}


; 移动到行首/尾
; Ctrl + Home/End :: CapsLock + -/=
CapsLock & \::Send, {Home}
CapsLock & 4::Send, {End}

; 文本选择
; 按字符选中
; Shift + 左/下/上/右 :: Shift + h/j/k/l
; 按单词选中
; Shift + Ctrl + 左/下/上/右 :: Shift Ctrl + h/j/k/l
^+h::Send, +{Left}
^+j::Send, +{Down}
^+k::Send, +{Up}
^+l::Send, +{Right}

; 退格删除/向前删除, 按字符
CapsLock & n::Send, {Backspace}
CapsLock & m::Send, ^{Backspace}
CapsLock & ,::Send, {Delete}
CapsLock & .::Send, ^{Delete}

CapsLock & c:: Send, ^c                 ; 拷贝
CapsLock & v:: Send, ^v                 ; 粘贴
CapsLock & x:: Send, ^x                 ; 剪切
 
CapsLock & a:: Send, ^a                 ; 全选
CapsLock & s:: Send, ^s                 ; 保存


CapsLock & z:: Send, ^z                 ; 撤销
CapsLock & r:: Send, ^y                 ; 恢复

CapsLock & -:: Send, ^{-}               ; 向后重定位
CapsLock & =:: Send, ^+{-} 
;=====================普通编辑器模范vim的结果=============================


;=====================鼠标的开始=============================
;鼠标右键
CapsLock & 5:: 
Click, right,1
return
;模仿鼠标右键菜单
RAlt::
    Send,  +{F10}
return
;鼠标点击(鼠标单机要改)
!s:: 
Click, 1
Send, ^c
return
!d:: 
MouseClick, left, , , 2
Send, ^c
return
!t:: ;循环点击示例
Click, 3
Send, ^c
return
;=====================鼠标的结束=============================
