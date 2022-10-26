# dotfiles
컴퓨터를 바꿨을때 개발 환경을 한번에 구축하려고 관리하는중 

## History
- 2022-10-26 : hammerspoon 설정 추가
- 2020-06-04 : vimwiki, k8s 플러그인 추가
- 2020-06-01 : hammerspoon 스크립트 추가
- 2020-02-08 : spectacle 단축키 변경(vim 키와 겹침)
- 2020-01-17 & 더 과거: neovim, neovim plugin 및 초기화 스크립트들 작업

## 설치 순서 
1. iTerm2 설치 및 Oh-My-Zsh 설치 `sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`
2. xcode command tool 설치 `xcode-select --install`
3. dotfiles 설치(dotfiles를 먼저 설치하는 이유는 덮어쓰기가 안되서) `curl -Lks https://raw.githubusercontent.com/pierceh89/dotfiles/master/.cfg/install.sh | /bin/zsh`
4. brew 설치 및 유틸리티 설치 `~/.cfg/brew.sh`
5. (옵션) jupyter notebook 설치 `~/.cfg/install_jupyter.sh`

## 개발환경 설정

### 1. iTerm2 & Oh-My-Zsh
맥 터미널은 기본 Terminal 대신에 iterm2를 설치한다.     
Download: https://iterm2.com    

Oh-My-Zsh 설치 스크립트  
Catalina 버전부터는 기본 쉘이 zsh로 바뀌어서 chsh 명령어를 써서 쉘을 변경할 필요가 없다.  
`sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`

ZSH THEME는 몇 년째 agnoster만 사용하고 있다. 질릴만도 한데 이만한게 없는듯
`ZSH_THEME="agnoster"`

현재(2019.12) Solarized의 경우 기본으로 포함되어있어서 따로 다운로드 받아서 추가할 필요가 없다. agnoster 테마에 필요한 Powerline font도 아래 옵션으로 설정 가능하다.  
Preferences > Profiles > Colors > Color Presets... > Solarized Dark  
Preferences > Profiels > Text > Use built-in Powerline glyphs  

특정 powerline font를 사용하고 싶다면 아래 커맨드를 통해 폰트를 설치하고, 폰트를 지정하면 된다.  
```
git clone https://github.com/powerline/fonts.git
fonts/install.sh
rm -rf fonts
```

### 2. Homebrew
맥에서 사용하는 패키지 관리 프로그램   
명령어 도구를 먼저 설치해야한다. `xcode-select --install`  
brew 설치 `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`  

### 3. IntelliJ Idea
편리한 IDE https://www.jetbrains.com

### 4. Golang
Golang 개발 https://golang.org/dl/  

### 5. Jupyter notebook
python3로 virtual env를 구성하고 jupyter notebook을 설치한다. 데이터 사이언스에 필수  
`./install_jupyter.sh`  

### 6. Neovim & IdeaVim
여전히 배우는 중인 vim. 블로그를 할 때는 vim을 사용하고 일할 때는 IdeaVim을 사용하는데 설정이 공유되서 불편함없이 사용중이다. (거의 기초적인 기능만 사용한다는 뜻이다) 

### 7. Hammerspoon

### 8. Sublime Text
텍스트 편집기(1) https://www.sublimetext.com  

### 9. Visual Studio Code
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

### Hammerspoon
macOS 전용 자동화 툴이다. Lua script를 사용하여 System API를 호출할 수 있다. 자주 쓰이는 기능은 `Spoon`이라는 플러그인 형태로 제공된다. 이 툴을 이용해서 `Spectacle` 기능을 다시 작성했다. 그 외 유용한 기능을 추가해서 사용하고 있다.

- Caffeine (잠자기 모드 방지)
- KSheet (어플리케이션 단축키 표시)
- PopupTranslateSelection (팝업 구글 번역기)
- inputsource_aurora (인풋소스에 따라 메뉴바 색상 바뀜)
- Spectacle (윈도우 이동&리사이징)
- Vim에서 입력 모드 나오면 영문으로 자동 변환

### jq
커맨드라인에서 json을 처리할 수 있는 프로그램인데 사용법만 잘 배우면 아주 유용하게 사용할 수 있을 것 같다.

## 참고 사이트
- [본격macOS에 개발환경 구축하기](https://subicura.com/2017/11/22/mac-os-development-environment-setup.html)
- [dotfiles](https://dotfiles.github.io)
- [Mathias's dotfiles](https://github.com/mathiasbynens/dotfiles)
- [Vim Awesome](https://vimawesome.com/)
- [jq](https://stedolan.github.io/jq/)
- [기계인간 John Grib](https://johngrib.github.io)
- [HammerSpoon](https://www.hammerspoon.org/)
- [dot-hammerspoon](https://github.com/zzamboni/dot-hammerspoon/blob/master/init.org)
