# dorks2telegram
GitDorker send message to Telegram for track new interesting repos.

## Goal 
Check for only new repos h24.
## Configuration
* *Telegram* https://github.com/fabianonline/telegram.sh
* *GitHub Token* https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/creating-a-personal-access-token
* *Git Dorker* https://github.com/obheda12/GitDorker

## Usage 

`./dorks.sh <your_target>`  

or

`./multi_dorks.sh < <file.txt>` 

_dorks2telegram creates a folder "telegram_db" in which to save data, After the first cycle you need to launch again the command , the output will only treat about the latest repository and will be send to telegram._
