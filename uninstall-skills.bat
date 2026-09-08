@echo off
REM uninstall-skills.bat - remove as skills do acervo skills-ia-educacao dos CLIs de IA
REM Uso (CMD ou PowerShell): .\uninstall-skills.bat [--all] [--claude] [--opencode] [--codex] [--antigravity] [--antigravity-cli] [--gemini] [--dry-run]
REM Sem flags: mostra o uso (as flags sao obrigatorias).
REM --all: remove de todos os destinos, mesmo sem o CLI instalado.
REM Remove apenas skills do acervo (preserva outras skills do usuario).
setlocal EnableExtensions EnableDelayedExpansion

REM --- diretorio do repositorio (pasta deste script) ---
set "REPO_DIR=%~dp0"
if "%REPO_DIR:~-1%"=="\" set "REPO_DIR=%REPO_DIR:~0,-1%"
set "SKILLS_DIR=%REPO_DIR%\skills"

set "DRY_RUN=0"
set "TARGETS="
set "EXPLICIT=0"

REM --- destinos por CLI (mesmos do install-skills.bat / install-skills.sh) ---

call :parse_args %*
if errorlevel 1 exit /b 1

echo == Removendo skills de: %TARGETS% ==
call :count_repo_skills
echo   Skills do acervo: !REPO_COUNT!

for %%T in (%TARGETS%) do (
  echo.
  call :remove_one %%T
)

echo.
echo == Verificacao ==
for %%T in (%TARGETS%) do call :verify_one %%T

echo.
echo Pronto. Reinicie o CLI para que as skills deixem de ser detectadas.
exit /b 0

REM ---------- funcoes ----------

:parse_args
if "%~1"=="" (
  call :usage
  exit /b 1
)
:parse_loop
if "%~1"=="" goto :parse_done
if /i "%~1"=="--all" (
  set "TARGETS=claude opencode codex antigravity antigravity-cli gemini"
  set "EXPLICIT=1"
) else if /i "%~1"=="--claude" (
  set "TARGETS=!TARGETS! claude"
  set "EXPLICIT=1"
) else if /i "%~1"=="--opencode" (
  set "TARGETS=!TARGETS! opencode"
  set "EXPLICIT=1"
) else if /i "%~1"=="--codex" (
  set "TARGETS=!TARGETS! codex"
  set "EXPLICIT=1"
) else if /i "%~1"=="--antigravity" (
  set "TARGETS=!TARGETS! antigravity"
  set "EXPLICIT=1"
) else if /i "%~1"=="--antigravity-cli" (
  set "TARGETS=!TARGETS! antigravity-cli"
  set "EXPLICIT=1"
) else if /i "%~1"=="--gemini" (
  set "TARGETS=!TARGETS! gemini"
  set "EXPLICIT=1"
) else if /i "%~1"=="--dry-run" (
  set "DRY_RUN=1"
) else (
  echo Opcao desconhecida: %~1
  call :usage
  exit /b 1
)
shift
goto :parse_loop
:parse_done
if "%TARGETS%"=="" (
  call :usage
  exit /b 1
)
REM Sem flags explicitas de destino (ex.: so --dry-run), filtra pelos CLIs instalados.
if "%EXPLICIT%"=="0" (
  set "FILTERED="
  for %%T in (%TARGETS%) do (
    call :bin_of %%T bin
    where !bin! >nul 2>&1
    if not errorlevel 1 set "FILTERED=!FILTERED! %%T"
  )
  set "TARGETS=!FILTERED!"
  if "!TARGETS!"=="" (
    echo Nenhum CLI alvo instalado. Use --all para remover mesmo assim.
    exit /b 1
  )
)
exit /b 0

:usage
echo Uso: uninstall-skills.bat [--all] [--claude] [--opencode] [--codex] [--antigravity] [--antigravity-cli] [--gemini] [--dry-run]
echo   --all              remove de todos os destinos (mesmo sem CLI instalado)
echo   --claude           Claude Code (~/.claude/skills)
echo   --opencode         OpenCode (~/.config/opencode/skills)
echo   --codex            Codex (~/.agents/skills)
echo   --antigravity      Antigravity 2.0 (~/.gemini/antigravity/skills)
echo   --antigravity-cli  Antigravity CLI (~/.gemini/antigravity-cli/skills)
echo   --gemini           Gemini CLI (~/.gemini/skills)
echo   --dry-run          mostra o que seria feito sem remover
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

:count_repo_skills
set "REPO_COUNT=0"
for /d %%D in ("%SKILLS_DIR%\*") do set /a REPO_COUNT+=1
exit /b 0

:remove_one
set "T=%~1"
call :dest_of "!T!" DEST
call :bin_of "!T!" BIN
echo == !T! -^> !DEST! ==
if not exist "!DEST!\" (
  echo   Diretorio nao existe - nada a remover
  exit /b 0
)
where !BIN! >nul 2>&1
if errorlevel 1 echo   AVISO: CLI '!BIN!' nao encontrado no PATH - removendo mesmo assim.
set /a REMOVED=0
for /d %%D in ("%SKILLS_DIR%\*") do (
  if exist "!DEST!\%%~nxD\" (
    if "!DRY_RUN!"=="1" (
      echo   ^(dry-run^) removeria !DEST!\%%~nxD
    ) else (
      rmdir /s /q "!DEST!\%%~nxD"
    )
    set /a REMOVED+=1
  )
)
if "!DRY_RUN!"=="1" (
  echo   ^(dry-run^) !REMOVED! skills seriam removidas de !DEST!
) else (
  echo   Removidas: !REMOVED! skills de !DEST!
)
exit /b 0

:verify_one
set "T=%~1"
call :dest_of "!T!" DEST
if "!DRY_RUN!"=="1" (
  echo   !T!: ^(dry-run, nada removido^)
  exit /b 0
)
if not exist "!DEST!\" (
  echo   !T!: diretorio nao existe
  exit /b 0
)
set /a RESTANTES=0
for /d %%D in ("%SKILLS_DIR%\*") do if exist "!DEST!\%%~nxD\" set /a RESTANTES+=1
echo   !T!: !RESTANTES! skills do acervo restantes em !DEST!
exit /b 0