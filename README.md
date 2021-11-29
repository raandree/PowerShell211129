# PowerShell Workshop 211129
Content for PowerShell Workshop 11/29/2021

## Agenda

-	Git
    - Requirements and Installation
    - Markdown
-	VSCode
    - Config
    - Extensions
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
