# Поиск игры-счётчика
$file = "F:\projects\game-site\index-9a30c2c6.js"
$output = "F:\ОТЧЕТЫ\результат_поиска.txt"

Write-Host "Ищем игру..." -ForegroundColor Green

# Самый простой поиск
$result = Select-String -Path $file -Pattern "count|click|\+\+|@click" | Select-Object -First 3

if ($result) {
    "Найдено совпадений: $($result.Count)" | Out-File $output
    $result | ForEach-Object { 
        "Строка $($_.LineNumber): $($_.Line)" | Out-File $output -Append
    }
    Write-Host "Результат сохранен в: $output" -ForegroundColor Green
} else {
    "Игра не найдена" | Out-File $output
    Write-Host "Игра не найдена" -ForegroundColor Yellow
}

Invoke-Item $output
