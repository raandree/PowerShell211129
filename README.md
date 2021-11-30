# PowerShell Workshop 211129
Content for PowerShell Workshop 11/29/2021

## Agenda


> Note: geforktes Repo



- Git
  - Requirements to get started:
    - Download git from https://git-scm.com/downloads
    - Create a repository on GitHub
    - Clone the repository in VSCode using the command 'git clone'
    - The command ```git remote -v``` returns the origin of the repo, indicating that it has been cloned from GigHub

    If you want to work with git offline without connecting to GitHUb or any other cloud based source control system.
    - Create a folder
    - In PowerShell navigate to the newly created folder
    - type ```git init``` which create the hidden ```.git``` folder is in fact the git database.
    - The command ```git remote -v``` returns the nothing, indicating that the folder does not have a remote source.
  - Markdown
    Is the ideal and simple way to document source code or any other tool or process. An introduction can be found on [Markdown Guide](https://www.markdownguide.org).
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
    - You can create yourself debug configs for each project. This is stored in the ```launch.json``` file in the ```.vscode``` folder.
    > You can find more information about [debugging](https://code.visualstudio.com/Docs/editor/debugging).
    - Breakpoints can have added expressions or hit count, which makes debugging of loops much more comfortable.
    - The watch pane is most effective way to get an overview of you variables and their content.
    - Use the call stack that shows you the path to the current breakpoint in your code. You can easily navigate back to the part of the code that called the code you are currently having the breakpoint in.
    - Remote debugging works in the ISE by opening a script with the command ```psEdit``` in the remote machine within a interactive session. If the workflow to start the script remotely is more complex, you can use the cmdlet ```Wait-Debugger``` to halt the process and attache to it with ```Enter-PSHostProcess```. You need to know the process ID which is reflected by the variable ```$PID```.
  - Git Integration
    A simple Git implementation is built into VSCode by default. The extension [GitLense](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens) additionally gives you a graphical file and commit history.
- Coding best practices
  - The DSC Community's coding [style guideline](https://dsccommunity.org/styleguidelines/).
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
- Pester
-	Regular Expressions
-	JEA
-	GUI und Universal Dashboard (Web UI)


Useful Links and Resources
 - [Everything you want to know about...](https://powershellexplained.com/)
 - [ValueFromPipeline and ValueFromPipelineByPropertyName explained](https://learn-powershell.net/2013/05/07/tips-on-implementing-pipeline-support/)
 - [PowerShell.one](https://powershell.one/)
 - [PowerShell training material](https://github.com/raandree/PowerShellTraining) that explains functions and modules