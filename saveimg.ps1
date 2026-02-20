param($panelDir)

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

try {
    if (-not [System.Windows.Forms.Clipboard]::ContainsImage()) {
        Write-Output "<no image in clipboard>"
        exit
    }

    $img = [System.Windows.Forms.Clipboard]::GetImage()

    if (-not $panelDir) {
        $panelDir = (Get-Location).Path
    }

    $mediaFolder = Join-Path $panelDir "media"

    if (-not (Test-Path $mediaFolder)) {
        New-Item -ItemType Directory -Path $mediaFolder -Force | Out-Null
    }

    $existing = Get-ChildItem $mediaFolder -Filter "img_*.png" -ErrorAction SilentlyContinue
    $count = ($existing | Measure-Object).Count + 1
    $filename = ("img_{0:D2}.png" -f $count)

    $path = Join-Path $mediaFolder $filename
    $img.Save($path, [System.Drawing.Imaging.ImageFormat]::Png)

    Write-Output "![Imagen](media/$filename)"
}
catch {
    Write-Output $_.Exception.Message
}