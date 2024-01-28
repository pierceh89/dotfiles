# dotfiles

컴퓨터를 바꿨을때 개발 환경을 한번에 구축하려고 관리하는중 

## History

- 2024-01-28 : 사용하지 않는 설정 파일, 스크립트 제거, Raycast로 대체한 Spoon 제거(Caffeine, PopupTranslateSelection, Spectacle)
- 2022-11-03 : brew 스크립트 업데이트, inputsource_aurora 업데이트, Jekyll 관련 설정 추가
- 2022-10-26 : hammerspoon 설정 추가
- 2020-06-04 : vimwiki, k8s 플러그인 추가
- 2020-06-01 : hammerspoon 스크립트 추가
- 2020-02-08 : spectacle 단축키 변경(vim 키와 겹침)
- 2020-01-17 & 더 과거: neovim, neovim plugin 및 초기화 스크립트들 작업

## 개발환경 설정

### 1. [iTerm2](https://iterm2.com)

현재(2019.12) Solarized의 경우 기본으로 포함되어있어서 따로 다운로드 받아서 추가할 필요가 없다. agnoster 테마에 필요한 Powerline font도 아래 옵션으로 설정 가능하다.  

Preferences > Profiles > Colors > Color Presets... > Solarized Dark  

Preferences > Profiels > Text > Use built-in Powerline glyphs  

Preferences > Profiels > Text > Unicode normalization form: **NFC**

### 2. [Oh-My-Zsh](https://ohmyz.sh/)

`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`

ZSH THEME는 몇 년째 agnoster만 사용하고 있다. `~/.zshrc`에서 테마 다음으로 변경하기

```
`ZSH_THEME="agnoster"`
```

### 3. [Homebrew](https://brew.sh/)

```
`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install other useful binaries.
brew install ack git tree wget yq jq

# Install ruby
brew install rbenv ruby-build
```

### 4. [Neovim](https://neovim.io) & [IdeaVim](https://github.com/JetBrains/ideavim)

여전히 배우는 중인 vim. 블로그를 할 때는 vim을 사용하고 일할 때는 IdeaVim을 사용하는데 설정이 공유되서 불편함없이 사용중이다. (거의 기초적인 기능만 사용한다는 뜻이다) 

```
# Install vi-related tools
brew install neovim
brew install ctags-exuberant
brew install gotags

# Install Vim plugin manager
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

Execute `:PlugInstall` in vim

# Remove outdated versions from the cellar.
brew cleanup
```

### 5. [Hammerspoon](https://www.hammerspoon.org)

macOS 전용 자동화 툴이다. Lua script를 사용하여 System API를 호출할 수 있다. 자주 쓰이는 기능은 `Spoon`이라는 플러그인 형태로 제공된다. 이 툴을 이용해서 `Spectacle` 기능을 다시 작성했다.(지금은 Raycast로 대체함) 그 외 유용한 기능을 추가해서 사용하고 있다.

- KSheet (어플리케이션 단축키 표시)
- inputsource_aurora (인풋소스에 따라 메뉴바 색상 바뀜)
- Vim에서 입력 모드 나오면 영문으로 자동 변환
- ~~Caffeine (잠자기 모드 방지)~~
- ~~PopupTranslateSelection (팝업 구글 번역기)~~
- ~~Spectacle (윈도우 이동&리사이징)~~

### 6. [Visual Studio Code](https://code.visualstudio.com/)

- Go, Vim 확장 설치하기
- VS Code 터미널에서 깨지는 문자가 있기 때문에 Powerline font를 설치해야 한다.
```
# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts
```
- Settings > 'terminal font family' 검색 > 'DejaVu Sans Mono for Powerline' 입력

### 7. [Ruby](https://www.ruby-lang.org/en/) & [Jekyll](https://jekyllrb-ko.github.io)

Jekyll 블로그
```sh
rbenv install 3.0.4
rbenv global 3.0.4
cd [BLOG_PATH]
gen install bundler
bundler install
# M1 맥북에서 빌드 실패하는 경우
gem install eventmachine -v '1.2.7' -- --with-ldflags="-Wl,-undefined,dynamic_lookup"
```

## Etc

### [Raycast](https://www.raycast.com)

생산성을 높여주는 앱. 우연히 알게 되어서 살펴봤는데 알프레드보다 훨씬 좋은것 같아서 갈아타게 됐다.
Hammerspoon으로 만들었던 구글 번역 팝업도 이미 있고, Spectacle 역할을 하는 확장도 이미 있어서 교체했다.
심지어 앱스토어에서 설치해서 쓰던 포모도로 기능도 있어서 바로 설치했다. Hammersoon으로 만들어서 사용하는 기능들도 전부 교체하는게 어떨까 싶다. 

### [Alfred](https://www.alfredapp.com)

생산성 높여주는 앱인데, 라이트하게 쓰다보니 파워팩은 구매하지 않고 사용하고 있었다.
그러다보니 제약사항이 있었는데 Raycast가 사용할 수 있는 기능도 많고, 필요한 기능은 만들 수도 있어서 갈아탔다.

## 참고 사이트

- [본격macOS에 개발환경 구축하기](https://subicura.com/2017/11/22/mac-os-development-environment-setup.html)
- [dotfiles](https://dotfiles.github.io)
- [Mathias's dotfiles](https://github.com/mathiasbynens/dotfiles)
- [Vim Awesome](https://vimawesome.com/)
- [jq](https://stedolan.github.io/jq/)
- [기계인간 John Grib](https://johngrib.github.io)
- [HammerSpoon](https://www.hammerspoon.org/)
- [dot-hammerspoon](https://github.com/zzamboni/dot-hammerspoon/blob/master/init.org)

