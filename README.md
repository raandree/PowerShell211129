# PowerShell Workshop 211129
Content for PowerShell Workshop 11/29/2021

## Agenda

- Git
  - Requirements and Installation
  - Markdown
- [Azure DevOps Server](https://azure.microsoft.com/en-us/services/devops/server/)
  - This product is the equivalent to GitHub or Azure DevOps Service but on-prem.
  - Main features for PowerShell Developers is:
    - Repo to store and version your code
    - Artifact feed based on NuGet to publish scripts and modules.
- VSCode
  - **Keep in mind the ```F1``` shortcut which give you access to literally every command.**  
  - Extensions
    > Note: You can automatically install extensions into VSCode by calling ```code --install-extension <path>```
    - [PowerShell](https://marketplace.visualstudio.com/items?itemName=ms-vscode.PowerShell)
    - [GitLense](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens)
    - [Markdown All in One](https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one)
    - [Code Spell Checker](https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker)
    - [YAML](https://marketplace.visualstudio.com/items?itemName=redhat.vscode-yaml)
    - [vscode-icons](https://marketplace.visualstudio.com/items?itemName=vscode-icons-team.vscode-icons)
  - Config
    - Each VSCode project can have it own settings when storing them in the file ```settings.json``` which must be in the ```.vscode``` folder. These settings may contain code style settings and settings for extensions.
    
  - Debugging
  - Git Integration
-	Advanced Functions
-	Performance
  - Remoting, Remote persistent sessions
-	Asynchronous routines
-	RESTApi
-	PSFramework
-	NTFSSecurity
-	Splatting
-	SQL für Config Daten und Logging
  - dbatools
-	Yaml
-	Regular Expressions
-	JEA
-	GUI und Universal Dashboard (Web UI)

---

## Git

Requirements to get started:
- Download git from https://git-scm.com/downloads
- Create a repository on GitHub
- Clone the repository in VSCode using the command 'git clone'
- The command ```git remote -v``` returns the origin of the repo, indicating that it has been cloned from GigHub

If you want to work with git offline without connecting to GitHUb or any other cloud based source control system.
- Create a folder
- In PowerShell navigate to the newly created folder
- type ```git init``` which create the hidden ```.git``` folder is in fact the git database.
- The command ```git remote -v``` returns the nothing, indicating that the folder does not have a remote source.
