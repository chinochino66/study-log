$ErrorActionPreference = "Stop"

# リポ直下へ移動（scripts の1階層上）
$here = if ($PSScriptRoot) { $PSScriptRoot } else { Split-Path -Parent $MyInvocation.MyCommand.Path }
Set-Location (Split-Path -Parent $here)

# リモートの変更を取り込んで衝突を避ける（Web上で編集した場合の保険）
git pull --rebase --autostash

$today = Get-Date -Format "yyyy-MM-dd"
$y = Get-Date -Format "yyyy"
$m = Get-Date -Format "MM"
$dir = Join-Path "logs" (Join-Path $y $m)
New-Item -ItemType Directory -Force -Path $dir | Out-Null

$file = Join-Path $dir "$today.md"
$created = $false

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
    # 行末をLFに統一し、UTF-8 (No BOM) で書く
    $tpl = $tpl -replace "`r`n","`n" -replace "`r","`n"
    [IO.File]::WriteAllText($file, $tpl, [Text.UTF8Encoding]::new($false))
    $created = $true
}

# 変更があるときだけコミット
git add -- $file | Out-Null
$changed = (git status --porcelain -- $file)
if ($created -or $changed) {
    git commit -m "study: $today 学習ログ"
    git push
} else {
    Write-Host "no change; nothing to commit/push"
}
