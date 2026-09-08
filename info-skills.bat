@echo off
REM info-skills.bat - informa o estado da instalacao do acervo em cada CLI de IA
REM Uso (CMD ou PowerShell): .\info-skills.bat [--all] [--claude] [--opencode] [--codex] [--antigravity] [--antigravity-cli] [--gemini] [--verbose]
REM Sem flags: informa os CLIs instalados no computador (auto-detect).
REM --all: informa todos os destinos, mesmo sem o CLI instalado.
REM Codigos de saida: 0 = acervo instalado (parcial conta como OK); 1 = nada instalado.
REM Compativel com Windows 10/11 (CMD e PowerShell).
setlocal EnableExtensions EnableDelayedExpansion

REM --- diretorio do repositorio (pasta deste script) ---
set "REPO_DIR=%~dp0"
if "%REPO_DIR:~-1%"=="\" set "REPO_DIR=%REPO_DIR:~0,-1%"
set "SKILLS_DIR=%REPO_DIR%\skills"
set "AGENTS_SRC=%REPO_DIR%\.opencode\agents"
set "AGENTS_DIR=%USERPROFILE%\.config\opencode\agents"

set "TARGETS="
set "VERBOSE=0"
set "ALL=0"
set "INSTALLED_SOMETHING=0"

call :parse_args %*
if errorlevel 1 exit /b 1

if "%ALL%"=="1" (
  set "TARGETS=claude opencode codex antigravity antigravity-cli gemini"
)

if "%TARGETS%"=="" (
  REM auto-detect: so os CLIs presentes no PATH
  for %%T in (claude opencode codex antigravity antigravity-cli gemini) do (
    call :bin_of %%T bin
    where !bin! >nul 2>&1
    if not errorlevel 1 set "TARGETS=!TARGETS! %%T"
  )
  if "!TARGETS!"=="" (
    echo info-skills.bat - nenhum CLI de IA instalado ^(claude, opencode, codex, antigravity, gemini^).
    echo Use --all para inspecionar todos os destinos ou --help para a ajuda.
    exit /b 1
  )
)

call :count_repo_skills
echo info-skills.bat - estado da instalacao (acervo: !REPO_COUNT! skills)

for %%T in (!TARGETS!) do call :report_one %%T

echo.
echo == Subagentes do OpenCode (%AGENTS_DIR%) ==
call :report_agents

echo.
echo Conferencia manual por destino (comandos do Cap. 4 do Manual AvalIA):
for %%T in (!TARGETS!) do (
  call :check_cmd_of %%T CHECK
  echo   %%T: !CHECK!
)

if "%INSTALLED_SOMETHING%"=="1" (
  echo.
  echo Resultado: OK ha instalacao do acervo nesta maquina (detalhes acima).
  exit /b 0
) else (
  echo.
  echo Resultado: X nada do acervo instalado (execute .\install-skills.bat^).
  exit /b 1
)

REM ---------- funcoes ----------

:parse_args
:parse_loop
if "%~1"=="" goto :parse_done
if /i "%~1"=="--all" (
  set "ALL=1"
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
) else if /i "%~1"=="--verbose" (
  set "VERBOSE=1"
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
exit /b 0

:usage
echo Uso: info-skills.bat [--all] [--claude] [--opencode] [--codex] [--antigravity] [--antigravity-cli] [--gemini] [--verbose]
echo   --all              informa todos os destinos (mesmo sem CLI instalado)
echo   --claude           Claude Code (~/.claude/skills)
echo   --opencode         OpenCode (~/.config/opencode/skills)
echo   --codex            Codex (~/.agents/skills)
echo   --antigravity      Antigravity 2.0 (~/.gemini/antigravity/skills)
echo   --antigravity-cli  Antigravity CLI (~/.gemini/antigravity-cli/skills)
echo   --gemini           Gemini CLI (~/.gemini/skills)
echo   --verbose          lista as skills faltantes em cada destino
echo   --help             mostra esta ajuda
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

REM comando de conferencia manual por CLI (comandos do manual, Cap. 4)
:check_cmd_of
if /i "%~1"=="claude"          ( set "%~2=Get-ChildItem $env:USERPROFILE\.claude\skills | Measure-Object" & exit /b 0 )
if /i "%~1"=="opencode"        ( set "%~2=(Get-ChildItem $env:USERPROFILE\.config\opencode\skills | Where-Object Name -like 'ia-educacao-*').Count" & exit /b 0 )
if /i "%~1"=="codex"           ( set "%~2=Get-ChildItem $env:USERPROFILE\.agents\skills | Measure-Object" & exit /b 0 )
if /i "%~1"=="antigravity"     ( set "%~2=Get-ChildItem $env:USERPROFILE\.gemini\antigravity\skills | Measure-Object" & exit /b 0 )
if /i "%~1"=="antigravity-cli" ( set "%~2=Get-ChildItem $env:USERPROFILE\.gemini\antigravity-cli\skills | Measure-Object" & exit /b 0 )
if /i "%~1"=="gemini"          ( set "%~2=Get-ChildItem $env:USERPROFILE\.gemini\skills | Measure-Object" & exit /b 0 )
set "%~2="
exit /b 1

:count_repo_skills
set "REPO_COUNT=0"
for /d %%D in ("%SKILLS_DIR%\*") do set /a REPO_COUNT+=1
exit /b 0

:count_installed
REM %1 = dest; conta skills do acervo presentes
set /a INST_COUNT=0
for /d %%D in ("%SKILLS_DIR%\*") do if exist "%~1\%%~nxD\" set /a INST_COUNT+=1
exit /b 0

:report_one
set "T=%~1"
call :dest_of "!T!" DEST
call :bin_of "!T!" BIN
echo.
echo == !T! -^> !DEST! ==
where !BIN! >nul 2>&1
if not errorlevel 1 (
  echo   CLI '!BIN!': instalado
) else (
  echo   CLI '!BIN!': nao encontrado no PATH
)
if not exist "!DEST!\" (
  echo   skills: diretorio nao existe - nada instalado (execute .\install-skills.bat !T!^)
  exit /b 0
)
call :count_installed "!DEST!"
if !INST_COUNT! EQU 0 (
  echo   skills: 0 do acervo em !DEST! (execute .\install-skills.bat !T!^)
  exit /b 0
)
if !INST_COUNT! EQU !REPO_COUNT! (
  echo   skills: !INST_COUNT!/!REPO_COUNT! - acervo completo em !DEST!
) else (
  echo   skills: !INST_COUNT!/!REPO_COUNT! - acervo parcial em !DEST! (atualize com .\install-skills.bat !T!^)
)
set "INSTALLED_SOMETHING=1"
if "%VERBOSE%"=="1" (
  for /d %%D in ("%SKILLS_DIR%\*") do if not exist "!DEST!\%%~nxD\" echo     faltante: %%~nxD
)
exit /b 0

:report_agents
set /a AG_OK=0
set /a AG_TOTAL=0
for %%F in ("%AGENTS_SRC%\*.md") do set /a AG_TOTAL+=1
if not exist "%AGENTS_DIR%\" (
  echo   diretorio nao existe - nenhum subagente instalado
  echo   ^(copie com: New-Item -ItemType Directory -Force "%AGENTS_DIR%"; Copy-Item ".opencode\agents\*.md" "%AGENTS_DIR%"^)
  exit /b 0
)
for %%F in ("%AGENTS_SRC%\*.md") do if exist "%AGENTS_DIR%\%%~nxF" set /a AG_OK+=1
if !AG_OK! EQU !AG_TOTAL! (
  echo   instalados: !AG_OK!/!AG_TOTAL! - completos
) else (
  if "%VERBOSE%"=="1" (
    for %%F in ("%AGENTS_SRC%\*.md") do if not exist "%AGENTS_DIR%\%%~nxF" echo   faltante: %%~nxF
  )
  echo   instalados: !AG_OK!/!AG_TOTAL! ^(copie com: Copy-Item ".opencode\agents\*.md" "%AGENTS_DIR%"^)
)
if !AG_OK! GTR 0 set "INSTALLED_SOMETHING=1"
exit /b 0