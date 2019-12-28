# dotfiles

## TODO
- [ ] MacOs 설정을 파일을 통해서 한번에 적용  

## Installation
1. Install Oh-My-Zsh `sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`
2. Install xcode command tool `xcode-select --install`
3. Install dotfiles `curl -Lks https://raw.githubusercontent.com/pierceh89/dotfiles/master/.cfg/install.sh | /bin/bash`
4. Install brew & utils `~/.cfg/brew.sh`
5. (Optional) Install jupyter notebook `~/.cfg/install_jupyter.sh`

## Software Development

### iTerm2 & Oh-My-Zsh
맥 터미널은 기본 Terminal 대신에 iterm2를 설치한다.     
Download: https://iterm2.com    

Oh-My-Zsh 설치 스크립트  
Catalina 버전부터는 기본 쉘이 zsh로 바뀌어서 chsh 명령어를 써서 쉘을 변경할 필요가 없다.  
`sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`

```
# ZSH THEME 변경
vi ~/.zshrc
ZSH_THEME="agnoster"
```

현재(2019.12) Solarized의 경우 기본으로 포함되어있어서 따로 다운로드 받아서 추가할 필요가 없다. agnoster 테마에 필요한 Powerline font도 아래 옵션으로 설정 가능하다.  
Preferences > Profiles > Colors > Color Presets... > Solarized Dark  
Preferences > Profiels > Text > Use built-in Powerline glyphs  

특정 powerline font를 사용하고 싶다면 아래 커맨드를 통해 폰트를 설치하고, 폰트를 지정하면 된다.  
```
git clone https://github.com/powerline/fonts.git
fonts/install.sh
rm -rf fonts
```

### Homebrew
맥에서 사용하는 패키지 관리 프로그램   
명령어 도구 설치 `xcode-select --install`  
brew 설치  
`/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`  

### IntelliJ Idea
편리한 IDE https://www.jetbrains.com

### Golang
Golang 개발 https://golang.org/dl/  

### Jupyter notebook
python3로 virtual env를 구성하고 jupyter notebook을 설치한다. 데이터 사이언스에 필수  
`./install_jupyter.sh`  

### Sublime Text
텍스트 편집기(1) https://www.sublimetext.com  

### Visual Studio Code
텍스트 편집기(2) https://code.visualstudio.com/Download  

### SpaceVim
NeoVim 플러그인 중 유용하고 인기있는 것들만 모아서 패키지로 제공해주는 플러그인 (Vim에 익숙하지 않은 상태에서 설치해보니 오히려 더 어려운거 같아서 설치했다가 지웠다)  
```
#install
curl -sLf https://spacevim.org/install.sh | bash

## uninstall
curl -sLf https://spacevim.org/install.sh | bash -s -- --uninstall
rm -rf ~/.SpaceVim*
```

## Etc

### Aerial - Apple TV Aerial Views Screen Saver
이쁜 화면보호기 https://github.com/JohnCoates/Aerial    
`brew cask install aerial`  

### Alfred 4 for Mac
생산성 높여주는 앱 https://www.alfredapp.com  

Cmd + Space를 핫키로 설정하는 방법  
먼저 Spotlight의 핫키 설정을 제거하면, 앱에서 핫키로 지정이 가능하다.  
System > Keyboard > Hot key > Spotlight > disable Spotlight hot key  

### Spectacle
윈도우 크기 및 위치를 단축키로 컨트롤 가능하게 하는 앱 https://spectacleapp.com/  

설치 후 단축키 설정 복사
`cp ~/.cfg/Shortcuts.json ~/Library/Application\ Support/Spectacle/`

## 참고 사이트
- [본격macOS에 개발환경 구축하기](https://subicura.com/2017/11/22/mac-os-development-environment-setup.html)
- [dotfiles](https://dotfiles.github.io)
- [Mathias's dotfiles](https://github.com/mathiasbynens/dotfiles)
- [Vim Awesome](https://vimawesome.com/)
