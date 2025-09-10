$ErrorActionPreference = "Stop"
$here = if ($PSScriptRoot) { $PSScriptRoot } else { Split-Path -Parent $MyInvocation.MyCommand.Path }
Set-Location (Split-Path -Parent $here)   
$today = Get-Date -Format "yyyy-MM-dd"
$y = Get-Date -Format "yyyy"
$m = Get-Date -Format "MM"
$dir = "logs/$y/$m"
New-Item -ItemType Directory -Force -Path $dir | Out-Null
$file = "$dir/$today.md"
if (-not (Test-Path $file)) {
$tpl = @"
# $today
## 何をやったか
-
## 学び
-
## 所要時間
- 分
"@
  $tpl = $tpl -replace "`r`n","`n" -replace "`r","`n"
  [IO.File]::WriteAllText($file, $tpl, [Text.UTF8Encoding]::new($false))
}
git add $file
git commit -m "study: $today 学習ログ"
git push
