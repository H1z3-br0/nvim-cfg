# Neovim Guide

Этот гайд описывает текущую конфигурацию `nvim` в каталоге `~/.config/nvim`.

Стек:

- `LazyVim` как основа
- `catppuccin-mocha` для темы
- `snacks.nvim` для поиска, dashboard, explorer, terminal и части UI
- `blink.cmp` для обычного автодополнения
- `Supermaven` для серых AI-подсказок
- `Claude Code` для агентной работы с кодом
- `LSP + Treesitter + conform.nvim + nvim-lint + gitsigns`

## 1. Что уже настроено

Из коробки у вас уже работают:

- LSP для переходов, rename, hover, diagnostics
- Treesitter для нормальной подсветки и структуры кода
- Форматирование через `conform.nvim`
- Линтинг через `nvim-lint`
- Поиск файлов и текста через `snacks` picker
- Explorer через `snacks` explorer
- Git-интеграция через `gitsigns` и `snacks`
- Сессии через `persistence.nvim`
- Плавающий terminal
- AI:
  - `Supermaven` для inline ghost text
  - `Claude Code` для агентных действий

## 2. Как пользоваться автодополнением

У вас есть два разных вида подсказок.

### Обычное автодополнение

Это popup-меню с вариантами от LSP, snippets, buffer и т.д.

- `Enter`: принять выбранный пункт автодополнения, если меню открыто
- `Ctrl-y`: тоже принять выбранный пункт
- `Ctrl-Space`: открыть completion-меню вручную
- `Ctrl-n`: следующий пункт
- `Ctrl-p`: предыдущий пункт

Если popup-меню не открыто, `Enter` просто делает новую строку.

### AI-подсказки от Supermaven

Это серый текст прямо в строке.

- `Tab`: принять AI-подсказку
- `Alt-]`: следующий вариант AI-подсказки
- `Alt-[`: предыдущий вариант AI-подсказки
- `Ctrl-]`: очистить текущую AI-подсказку

Логика такая:

- popup completion = `Enter`
- AI ghost text = `Tab`

Это специально разделено, чтобы не было путаницы.

## 3. Что нужно сделать один раз

### Supermaven

Если AI-подсказки не появляются:

1. Откройте `nvim`
2. Выполните:

```vim
:checkhealth supermaven
```

3. При необходимости выполните:

```vim
:SupermavenUseFree
```

Если плагин попросит логин или инициализацию, завершите её.

### Claude Code

У вас уже установлен CLI `claude`, а плагин `claudecode.nvim` подключен.

Если команды Claude не работают:

1. Проверьте в терминале:

```bash
claude --help
```

2. Если CLI требует логин, завершите его вне `nvim`
3. После этого снова откройте `nvim`

## 4. Базовые клавиши навигации

### Окна

- `Ctrl-h`: перейти в левое окно
- `Ctrl-j`: перейти в нижнее окно
- `Ctrl-k`: перейти в верхнее окно
- `Ctrl-l`: перейти в правое окно

### Изменение размеров окна

- `Ctrl-Up`: увеличить высоту
- `Ctrl-Down`: уменьшить высоту
- `Ctrl-Left`: уменьшить ширину
- `Ctrl-Right`: увеличить ширину

### Разделение окон

- `<leader>-`: split снизу
- `<leader>|`: split справа
- `<leader>wd`: закрыть окно

### Буферы

- `Shift-h`: предыдущий буфер
- `Shift-l`: следующий буфер
- `[b`: предыдущий буфер
- `]b`: следующий буфер
- `<leader>bd`: закрыть текущий буфер
- `<leader>bo`: закрыть остальные буферы
- `<leader>bb`: переключиться на предыдущий буфер

## 5. Поиск и навигация по проекту

### Главные команды

- `<leader><space>`: найти файл в root проекта
- `<leader>/`: grep по root проекта
- `<leader>,`: список буферов
- `<leader>fr`: recent files
- `<leader>fp`: список проектов
- `<leader>fc`: файлы конфига Neovim

### Explorer

- `<leader>e`: открыть explorer для root проекта
- `<leader>E`: открыть explorer для текущей cwd
- `<leader>fe`: explorer для root
- `<leader>fE`: explorer для cwd

### Символы и структура

- `<leader>ss`: символы текущего файла
- `<leader>sS`: символы workspace
- `<leader>cs`: symbols через Trouble

## 6. LSP: код, переходы, rename

### Основное

- `gd`: перейти к определению
- `gr`: найти references
- `gI`: перейти к implementation
- `gy`: перейти к type definition
- `gD`: перейти к declaration
- `K`: hover-документация

### Действия над кодом

- `<leader>ca`: code action
- `<leader>cr`: rename symbol
- `<leader>cR`: rename file
- `<leader>cl`: информация по LSP

### Диагностика

- `]d`: следующая диагностика
- `[d`: предыдущая диагностика
- `]e`: следующая ошибка
- `[e`: предыдущая ошибка
- `]w`: следующее предупреждение
- `[w`: предыдущее предупреждение
- `<leader>xx`: diagnostics через Trouble
- `<leader>xX`: diagnostics текущего буфера

## 7. Форматирование и линтинг

Форматирование и линтинг уже настроены.

Основные инструменты:

- Python: `black`, `ruff`, `pyright`
- JS/TS: `prettier`, `eslint_d`, `typescript-language-server`
- Shell: `shfmt`, `shellcheck`
- Lua: `stylua`

### Что работает

- автоформат включён
- линтинг запускается автоматически
- diagnostics показываются через LSP / Trouble / signs

### Полезные клавиши

- `<leader>uf`: переключить autoformat
- `<leader>uF`: принудительно выключить autoformat
- `<leader>cF`: format injected languages

## 8. Git

### Базовое

- `<leader>gg`: lazygit в root git-репозитория
- `<leader>gG`: lazygit в текущей cwd
- `<leader>gs`: git status picker
- `<leader>gd`: git diff hunks
- `<leader>gb`: blame для строки
- `<leader>gf`: история текущего файла
- `<leader>gl`: git log

### Hunk actions

- `]h`: следующий hunk
- `[h`: предыдущий hunk
- `<leader>ghs`: stage hunk
- `<leader>ghr`: reset hunk
- `<leader>ghS`: stage buffer
- `<leader>ghu`: undo stage hunk
- `<leader>ghp`: preview hunk
- `<leader>ghb`: blame line
- `<leader>ghd`: diff this

## 9. Терминал, сессии, scratch

### Терминал

- `<leader>ft`: terminal в root проекта
- `<leader>fT`: terminal в текущей cwd
- `Ctrl-/`: показать terminal

В терминале навигация между окнами:

- `Ctrl-h`
- `Ctrl-j`
- `Ctrl-k`
- `Ctrl-l`

### Сессии

- `<leader>qs`: восстановить session
- `<leader>qS`: выбрать session
- `<leader>ql`: восстановить последнюю session
- `<leader>qd`: перестать сохранять текущую session

### Scratch

- `<leader>.`: scratch buffer
- `<leader>S`: выбрать scratch buffer

## 10. Claude Code

`Claude Code` нужен не для inline-подсказок, а для агентной работы:

- объяснить код
- предложить изменения
- менять несколько файлов
- работать с diff
- учитывать контекст проекта

### Основные клавиши

- `<leader>ac`: открыть / закрыть Claude
- `<leader>af`: перевести фокус в Claude
- `<leader>ar`: resume Claude session
- `<leader>aC`: continue Claude session
- `<leader>ab`: добавить текущий файл в контекст
- `<leader>as`: отправить выделение в Claude
- `<leader>aa`: принять diff от Claude
- `<leader>ad`: отклонить diff от Claude

### Как лучше использовать Claude

Хорошие кейсы:

- "объясни этот модуль"
- "сделай рефакторинг"
- "почини эту ошибку"
- "добавь тесты"
- "сделай feature в нескольких файлах"

Плохой кейс:

- использовать Claude как замену обычному автодополнению по одной строке

Для этого у вас есть `Supermaven`.

## 11. Dashboard при старте

На стартовом экране доступны быстрые действия:

- `f`: Find File
- `p`: Projects
- `g`: Find Text
- `r`: Recent Files
- `s`: Restore Session
- `t`: Terminal
- `a`: Claude Code
- `c`: Config
- `l`: Lazy
- `q`: Quit

## 12. Toggle-команды

Через `<leader>u...` можно быстро переключать состояние интерфейса.

Полезные:

- `<leader>uf`: autoformat
- `<leader>ud`: diagnostics
- `<leader>ul`: line numbers
- `<leader>uL`: relative numbers
- `<leader>uw`: wrap
- `<leader>us`: spell
- `<leader>ua`: animations
- `<leader>ug`: indent guides
- `<leader>uh`: inlay hints
- `<leader>uz`: zen mode

## 13. Какой workflow сейчас самый удобный

Рекомендованный сценарий:

1. Открываете проект
2. Через `<leader><space>` / `<leader>/` находите нужные файлы
3. Пишете код
4. Используете:
   - `Enter` для обычного completion
   - `Tab` для AI ghost text от `Supermaven`
5. Для сложных задач открываете `Claude Code` через `<leader>ac`
6. Для ошибок и предупреждений пользуетесь `Trouble` и diagnostics
7. Для git-операций используете `lazygit` или hunk actions

## 14. Если что-то работает не так

### Проверка состояния

```vim
:Lazy
:Mason
:checkhealth
```

### Проверка AI

```vim
:checkhealth supermaven
```

### Проверка LSP

```vim
:LspInfo
```

### Если сломался UI или completion

1. Откройте `:Lazy`
2. Нажмите `S` для sync
3. Перезапустите `nvim`

## 15. Где лежит конфиг

Основные файлы:

- `~/.config/nvim/init.lua`
- `~/.config/nvim/lua/config/lazy.lua`
- `~/.config/nvim/lua/config/options.lua`
- `~/.config/nvim/lua/plugins/ui.lua`
- `~/.config/nvim/lua/plugins/tooling.lua`
- `~/.config/nvim/lua/plugins/ai-inline.lua`

## 16. Что можно улучшить дальше

Если захотите, следующим шагом можно сделать одно из этого:

- привести все клавиши completion к "идеальной" схеме
- добавить language-specific extras под ваш стек
- сделать отдельный раздел под Python / TS workflow
- добавить debug workflow
- сделать вторую, короткую версию гайда-шпаргалки на 1 экран
