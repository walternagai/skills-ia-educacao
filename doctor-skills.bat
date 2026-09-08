@echo off
REM doctor-skills.bat - verifica se o computador reune os pre-requisitos do acervo
REM Uso (CMD ou PowerShell): .\doctor-skills.bat [--all] [--claude] [--opencode] [--codex] [--antigravity] [--antigravity-cli] [--gemini] [--fix]
REM Sem flags: diagnostica todos os destinos, mesmo sem o CLI instalado.
REM --fix: tenta corrigir o que faltar (instala CLIs ausentes via npm quando possivel).
REM Codigos de saida: 0 = OK; 1 = faltam pre-requisitos essenciais.
REM Compativel com Windows 10/11 (CMD e PowerShell).
setlocal EnableExtensions EnableDelayedExpansion

REM --- diretorio do repositorio (pasta deste script) ---
set "REPO_DIR=%~dp0"
if "%REPO_DIR:~-1%"=="\" set "REPO_DIR=%REPO_DIR:~0,-1%"
set "SKILLS_DIR=%REPO_DIR%\skills"
set "AGENTS_SRC=%REPO_DIR%\.opencode\agents"
set "AGENTS_DIR=%USERPROFILE%\.config\opencode\agents"

set "OK=0"
set "WARN=0"
set "FAIL=0"
set "FIX=0"
set "TARGETS="

REM --- destinos por CLI (fonte: docs oficiais; mesmos do doctor-skills.sh) ---
REM Claude Code:     %USERPROFILE%\.claude\skills\<slug>\SKILL.md
REM OpenCode:        %USERPROFILE%\.config\opencode\skills\<slug>\SKILL.md
REM Codex:           %USERPROFILE%\.agents\skills\<slug>\SKILL.md
REM Antigravity 2.0: %USERPROFILE%\.gemini\antigravity\skills\<slug>\SKILL.md
REM Antigravity CLI: %USERPROFILE%\.gemini\antigravity-cli\skills\<slug>\SKILL.md
REM Gemini CLI:      %USERPROFILE%\.gemini\skills\<slug>\SKILL.md

call :parse_args %*
if errorlevel 1 exit /b 1

echo doctor-skills.bat - diagnostico do ambiente
call :print_os

echo.
echo == Ambiente base ==

REM bash: Git Bash e opcional no Windows (trilha Unix via Git Bash/WSL2)
where bash >nul 2>&1
if not errorlevel 1 (
  call :pass "bash no PATH (trilha Git Bash/WSL2 disponivel)"
) else (
  call :info "bash ausente (opcional: somente para a trilha Unix via Git Bash/WSL2)"
)
where curl >nul 2>&1
if not errorlevel 1 (
  call :pass "curl no PATH - necessario para instalar o OpenCode"
) else (
  call :fail "curl ausente - necessario para instalar o OpenCode (ou use winget/npm/scoop/choco)"
)
where git >nul 2>&1
if not errorlevel 1 (
  call :pass "git no PATH - recomendado para clonar/atualizar o repositorio"
) else (
  call :warn "git ausente - recomendado para clonar/atualizar o repositorio (ZIP dispensa o git)"
)
where node >nul 2>&1
if not errorlevel 1 (
  for /f "tokens=*" %%V in ('node --version 2^>nul') do set "NODE_VER=%%V"
  set "NODE_MAJOR=!NODE_VER:v=!"
  for /f "tokens=1 delims=." %%M in ("!NODE_MAJOR!") do set "NODE_MAJOR=%%M"
  if !NODE_MAJOR! GEQ 18 (
    echo   [OK] node (!NODE_VER!) - requerido: ^>= 18
    set /a OK+=1
  ) else (
    call :fail "node !NODE_VER! e anterior ao minimo (18) - atualize em https://nodejs.org"
  )
) else (
  call :fail "node ausente (requerido 18 ou superior) - necessario para os CLIs distribuidos via npm"
)
where npm >nul 2>&1
if not errorlevel 1 (
  call :pass "npm no PATH - distribui a maioria dos CLIs"
) else (
  call :warn "npm ausente - distribui a maioria dos CLIs (instale com o Node.js)"
)
if exist "%SKILLS_DIR%\" (
  call :count_repo_skills
  call :pass "acervo: %SKILLS_DIR% (!REPO_COUNT! skills)"
) else (
  call :fail "acervo nao encontrado em %SKILLS_DIR% - execute este script na raiz do repositorio"
)
if exist "%AGENTS_SRC%\" (
  call :pass "subagentes no repositorio: %AGENTS_SRC%"
) else (
  call :warn "pasta .opencode\agents\ nao encontrada - os subagentes do OpenCode nao serao sincronizaveis"
)

echo.
echo == CLIs de IA ==
for %%T in (!TARGETS!) do call :check_cli %%T

echo.
echo == Subagentes do OpenCode ==
call :check_agents

echo.
echo == Placar ==
echo   OK: !OK!   Avisos: !WARN!   Falhas: !FAIL!
if !FAIL! GTR 0 (
  echo.
  echo Resultado: X ha pre-requisitos a resolver antes de instalar.
  exit /b 1
)
if !WARN! GTR 0 (
  echo.
  echo Resultado: AVISO ambiente utilizavel, com ressalvas (veja os avisos).
  exit /b 0
)
echo.
echo Resultado: OK ambiente pronto para instalar as skills.
exit /b 0

REM ---------- funcoes ----------

:parse_args
if "%~1"=="" (
  set "TARGETS=claude opencode codex antigravity antigravity-cli gemini"
  exit /b 0
)
:parse_loop
if "%~1"=="" goto :parse_done
if /i "%~1"=="--all" (
  set "TARGETS=claude opencode codex antigravity antigravity-cli gemini"
) else if /i "%~1"=="--claude" (
  set "TARGETS=!TARGETS! claude"
) else if /i "%~1"=="--opencode" (
  set "TARGETS=!TARGETS! opencode"
) else if /i "%~1"=="--codex" (
  set "TARGETS=!TARGETS! codex"
) else if /i "%~1"=="--antigravity" (
  set "TARGETS=!TARGETS! antigravity"
) else if /i "%~1"=="--antigravity-cli" (
  set "TARGETS=!TARGETS! antigravity-cli"
) else if /i "%~1"=="--gemini" (
  set "TARGETS=!TARGETS! gemini"
) else if /i "%~1"=="--fix" (
  set "FIX=1"
) else if /i "%~1"=="--help" (
  call :usage & exit /b 0
) else if /i "%~1"=="-h" (
  call :usage & exit /b 0
) else (
  echo Opcao desconhecida: %~1
  call :usage
  exit /b 1
)
shift
goto :parse_loop
:parse_done
if "%TARGETS%"=="" (
  set "TARGETS=claude opencode codex antigravity antigravity-cli gemini"
)
exit /b 0

:usage
echo Uso: doctor-skills.bat [--all] [--claude] [--opencode] [--codex] [--antigravity] [--antigravity-cli] [--gemini] [--fix]
echo   --all              diagnostica todos os destinos (padrao)
echo   --claude           Claude Code (~/.claude/skills)
echo   --opencode         OpenCode (~/.config/opencode/skills)
echo   --codex            Codex (~/.agents/skills)
echo   --antigravity      Antigravity 2.0 (~/.gemini/antigravity/skills)
echo   --antigravity-cli  Antigravity CLI (~/.gemini/antigravity-cli/skills)
echo   --gemini           Gemini CLI (~/.gemini/skills)
echo   --fix              tenta corrigir o que faltar (instala CLIs ausentes via npm)
echo   --help             mostra esta ajuda
exit /b 0

:print_os
for /f "tokens=4-5 delims=. " %%A in ('ver') do set "WINVER=%%A.%%B"
echo   Sistema: Windows (versao !WINVER!)
exit /b 0

:pass
set "MSG=%~1"
echo   [OK] !MSG!
set /a OK+=1
exit /b 0

:warn
set "MSG=%~1"
echo   [AVISO] !MSG!
set /a WARN+=1
exit /b 0

:fail
set "MSG=%~1"
echo   [X] !MSG!
set /a FAIL+=1
exit /b 0

:info
set "MSG=%~1"
echo   [i] !MSG!
exit /b 0

:dest_of
if /i "%~1"=="claude"          ( set "%~2=%USERPROFILE%\.claude\skills"                 & exit /b 0 )
if /i "%~1"=="opencode"        ( set "%~2=%USERPROFILE%\.config\opencode\skills"        & exit /b 0 )
if /i "%~1"=="codex"           ( set "%~2=%USERPROFILE%\.agents\skills"                 & exit /b 0 )
if /i "%~1"=="antigravity"     ( set "%~2=%USERPROFILE%\.gemini\antigravity\skills"     & exit /b 0 )
if /i "%~1"=="antigravity-cli" ( set "%~2=%USERPROFILE%\.gemini\antigravity-cli\skills" & exit /b 0 )
if /i "%~1"=="gemini"          ( set "%~2=%USERPROFILE%\.gemini\skills"                 & exit /b 0 )
set "%~2="
exit /b 1

:bin_of
if /i "%~1"=="claude"          ( set "%~2=claude"      & exit /b 0 )
if /i "%~1"=="opencode"        ( set "%~2=opencode"    & exit /b 0 )
if /i "%~1"=="codex"           ( set "%~2=codex"       & exit /b 0 )
if /i "%~1"=="antigravity"     ( set "%~2=antigravity" & exit /b 0 )
if /i "%~1"=="antigravity-cli" ( set "%~2=antigravity" & exit /b 0 )
if /i "%~1"=="gemini"          ( set "%~2=gemini"      & exit /b 0 )
set "%~2="
exit /b 1

REM Dica de instalacao do CLI (npm preferencial no Windows nativo)
:fix_hint_of
if /i "%~1"=="claude"          ( set "%~2=@anthropic-ai/claude-code" & exit /b 0 )
if /i "%~1"=="opencode"        ( set "%~2=opencode-ai"               & exit /b 0 )
if /i "%~1"=="codex"           ( set "%~2=@openai/codex"             & exit /b 0 )
if /i "%~1"=="antigravity"     ( set "%~2="                          & exit /b 0 )
if /i "%~1"=="antigravity-cli" ( set "%~2="                          & exit /b 0 )
if /i "%~1"=="gemini"          ( set "%~2=@google/gemini-cli"        & exit /b 0 )
set "%~2="
exit /b 1

:pkg_of
if /i "%~1"=="claude"          ( set "%~2=npm: @anthropic-ai/claude-code" & exit /b 0 )
if /i "%~1"=="opencode"        ( set "%~2=npm: opencode-ai | winget: sst.opencode | scoop/choco" & exit /b 0 )
if /i "%~1"=="codex"           ( set "%~2=npm: @openai/codex" & exit /b 0 )
if /i "%~1"=="antigravity"     ( set "%~2=download: https://antigravity.google" & exit /b 0 )
if /i "%~1"=="antigravity-cli" ( set "%~2=download: https://antigravity.google" & exit /b 0 )
if /i "%~1"=="gemini"          ( set "%~2=npm: @google/gemini-cli" & exit /b 0 )
set "%~2="
exit /b 1

:count_repo_skills
set "REPO_COUNT=0"
for /d %%D in ("%SKILLS_DIR%\*") do set /a REPO_COUNT+=1
exit /b 0

:check_cli
set "T=%~1"
call :dest_of "!T!" DEST
call :bin_of "!T!" BIN
echo.
echo -- !T! (!BIN!) -^> !DEST! --
where !BIN! >nul 2>&1
if not errorlevel 1 (
  call :pass "CLI '!BIN!' no PATH"
) else (
  call :pkg_of "!T!" PKG
  call :fail "CLI '!BIN!' nao encontrado no PATH (pacote: !PKG!)"
  call :fix_hint_of "!T!" NPKG
  if defined NPKG (
    if "!FIX!"=="1" (
      echo     --fix: executando npm install -g !NPKG!
      npm install -g !NPKG! >nul 2>&1
      if not errorlevel 1 (
        call :pass "CLI '!BIN!' instalado via npm"
      ) else (
        call :warn "instalacao via npm falhou - execute manualmente: npm install -g !NPKG!"
      )
    ) else (
      call :info "correcao possivel com: npm install -g !NPKG! (ou use --fix)"
    )
  ) else (
    call :info "instalacao manual necessaria (sem pacote npm conhecido)"
  )
)
if exist "!DEST!\" (
  call :pass "diretorio de skills existe (!DEST!)"
) else (
  call :info "diretorio de skills ainda nao existe (!DEST!) - sera criado pelo install-skills.bat"
)
exit /b 0

:check_agents
set /a AG_OK=0
set /a AG_TOTAL=0
if exist "%AGENTS_DIR%\" (
  for %%F in ("%AGENTS_SRC%\*.md") do (
    set /a AG_TOTAL+=1
    if exist "%AGENTS_DIR%\%%~nxF" set /a AG_OK+=1
  )
  if !AG_OK! EQU !AG_TOTAL! (
    call :pass "todos os subagentes instalados em %AGENTS_DIR% (!AG_OK!/!AG_TOTAL!)"
  ) else (
    call :warn "subagentes instalados: !AG_OK!/!AG_TOTAL! (copie com: xcopy .opencode\agents\*.md %AGENTS_DIR%\ /y)"
  )
) else (
  call :warn "diretorio de agentes nao existe (%AGENTS_DIR%) - copie com: New-Item -ItemType Directory -Force %AGENTS_DIR%; Copy-Item .opencode\agents\*.md %AGENTS_DIR%\"
)
exit /b 0