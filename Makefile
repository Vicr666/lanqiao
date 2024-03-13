# Git提交信息
MSG := $(shell powershell -Command "Get-Date -Format 'yyyy-MM-dd HH:mm:ss'")
MSG += Windows
linux_MSG :=`date +"%Y-%m-%d %H:%M %a"`

C ?= 

.PHONY: all win linux

win:
	@git add -A
	@git commit -m "$(C) $(MSG)"
	@git push
  
linux:
	@git add -A
	@git commit -m "$(C) $(linux_MSG)"
	@git push