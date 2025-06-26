
param (
    [string]$workspaceName = $(Read-Host "👤 Enter your Perforce workspace name"),
    [string]$workspaceRoot = $(Read-Host "📁 Enter the full path to your Unreal project folder")
)

if (-Not (Test-Path $workspaceRoot)) {
    Write-Host "❌ ERROR: Path $workspaceRoot does not exist." -ForegroundColor Red
    exit 1
}

# Detect .uproject
$uproject = Get-ChildItem -Path $workspaceRoot -Filter *.uproject -File -Recurse -ErrorAction SilentlyContinue | Select-Object -First 1
if (-Not $uproject) {
    Write-Host "❌ ERROR: No .uproject file found in $workspaceRoot." -ForegroundColor Red
    exit 1
}

$p4ignorePath = Join-Path $workspaceRoot ".p4ignore.txt"
$p4configPath = Join-Path $workspaceRoot "p4config.txt"

$p4ignoreContent = @"
.vs/
.idea/
*.suo
*.user
*.opensdf
*.VC.db
*.vscode

# Engine folders
Engine/Intermediate/
Engine/Saved/

# Project build folders
Binaries/
Build/
DerivedDataCache/
Intermediate/
Saved/
BuildDerivedData/
BuildGraph/
Makefile

# Config artifacts
*.ini~
*.bak

# IDE-specific clutter
*.sln
*.vcxproj*
*.csproj*
*.exe.config
*.sdf
*.opensdf
*.gpState
*.ncb

# Git and temp files
.git/
*.log
*.tmp
*.temp
*.db
*.DS_Store
*.pdb

# Python
*.pyc
*.pyo
__pycache__/
*.egg-info/

# Unreal Build system
*.xcodeproj/
*.xcworkspace/
*.xcuserstate
*.hmap
*.ipa
*.dsym
*.dSYM
*.ubtmanifest
*.unsuccessfulbuild
*.Build.cs
*.Target.cs
*.uprojectdirs
*.BuildId
*.modules
*.target
*.version
*.modules
*.swarm
*.swarmcache
*.swarmagent
*.swarmgraph
*.swarmreport
*.swarmdebuglog
*.swarmoptions
"@

$p4configContent = @"
P4CLIENT=$workspaceName
P4PORT=1666
P4USER=casulscrub
P4IGNORE=.p4ignore.txt
"@

# Write files
$p4ignoreContent | Set-Content -Path $p4ignorePath -Encoding UTF8
$p4configContent | Set-Content -Path $p4configPath -Encoding UTF8

# Show result
Write-Host "`n✅ Created the following files:"
Write-Host "   - $p4ignorePath"
Write-Host "   - $p4configPath"

# Validate with p4 set
Push-Location $workspaceRoot
$p4env = & p4 set
Write-Host "`n📋 Current Perforce Settings:"
Write-Output $p4env
Pop-Location
