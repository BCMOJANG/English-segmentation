param(
  [string]$msg = "自动更新"
)

$dir = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location -LiteralPath $dir

git add index.html version.txt README.md LICENSE
git commit -m $msg
git push

if ($LASTEXITCODE -eq 0) {
  Write-Host "✓ 推送成功！" -ForegroundColor Green
} else {
  Write-Host "✗ 推送失败，请检查网络或 token" -ForegroundColor Red
}
