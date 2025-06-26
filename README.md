# PerforceWorkspaceBootstrap
Perforce Workspace Bootstrap

Absolutely! Here's a ready-to-publish setup for your **Perforce Workspace Bootstrap Repository**, perfect for sharing with teammates or your future self 🔁

---

## 📁 Repository Name Suggestion

**`PerforceWorkspaceBootstrap`**

---

## 📄 README.md (Full Version)

````markdown
# 🚀 Perforce Workspace Bootstrap

A lightweight PowerShell utility that automates the creation of `.p4ignore.txt` and `p4config.txt` files for Unreal Engine projects using Perforce.

Perfect for solo developers and teams working across multiple streams, this script helps enforce clean workspace practices and prevent common Perforce mistakes — like checking in `Intermediate/` or `.vs/` folders.

---

## 🧰 Features

- ✅ Automatically generates `.p4ignore.txt` using best practices for Unreal Engine, Visual Studio, and Git
- ✅ Creates `p4config.txt` with stream-specific Perforce settings
- ✅ Auto-detects `.uproject` files to validate setup
- ✅ Prints current Perforce settings for verification
- 💥 Works across all local streams and folders

---

## 📦 What's Included

- `Setup-PerforceWorkspace-FULL.ps1`: Interactive PowerShell script for bootstrapping new workspaces with clean ignore/config files

---

## 🧪 Usage

### 1. Clone or download this repo  
```bash
git clone https://github.com/yourusername/PerforceWorkspaceBootstrap.git
````

### 2. Run the script

Open PowerShell and run:

```powershell
.\Setup-PerforceWorkspace-FULL.ps1
```

You’ll be prompted for:

* Workspace name (`P4CLIENT`)
* Path to your Unreal project folder

The script will then:

* Detect your `.uproject`
* Generate `.p4ignore.txt` with production-grade ignore rules
* Generate `p4config.txt` scoped to the current stream
* Show your current `p4 set` state for sanity-checking

---

## 📁 Example Folder Structure

```
YourStream/
├── MyProject/
│   ├── MyProject.uproject
│   ├── .p4ignore.txt ✅
│   └── p4config.txt  ✅
```

---

## 🧠 Why This Matters

Perforce can easily choke on junk like `Intermediate/`, `Saved/`, and `.vs/` folders. This tool ensures:

* Consistent workspace hygiene
* Clean check-ins
* No accidentally added binaries or cache files

---

## 🛠 Future Features (PRs welcome!)

* Auto-generate workspaces from client templates
* Auto-sync depot on success
* Cross-platform support with Bash/Zsh
* GUI front-end via WinForms

---

## 📜 License

MIT — free to use, fork, and share. Attribution appreciated 🎓

---

## 💬 Questions or Suggestions?

Open an issue or ping [@casulscrub](https://github.com/casulscrub) — we're building clean pipelines one rooster at a time 🐓🔥

```

---

Would you like me to:
- 📁 Zip the `.ps1` and `README.md` into a repo bundle?
- 🐙 Help push this to your GitHub automatically?  
- 🧪 Add a test file validator that checks ignored files per workspace?

Let’s make it pro.
```
