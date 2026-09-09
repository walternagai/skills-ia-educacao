@echo off
REM install-skills.bat - instala somente as skills do acervo em CLIs de IA
REM Uso (CMD ou PowerShell): .\install-skills.bat [--all] [--claude] [--opencode] [--codex] [--antigravity] [--antigravity-cli] [--gemini] [--dry-run]
REM Sem flags: mostra o uso (as flags sao obrigatorias).
REM --all: instala em todos os destinos, mesmo sem o CLI instalado.
REM Se o CLI alvo nao estiver no PATH e o winget existir, oferece instalacao via winget.
setlocal EnableExtensions EnableDelayedExpansion

REM --- diretorio do repositorio (pasta deste script) ---
set "REPO_DIR=%~dp0"
if "%REPO_DIR:~-1%"=="\" set "REPO_DIR=%REPO_DIR:~0,-1%"
set "SKILLS_DIR=%REPO_DIR%\skills"

set "DRY_RUN=0"
set "TARGETS="
set "EXPLICIT=0"

REM --- destinos por CLI (fonte: docs oficiais; mesmos do install-skills.sh) ---
REM Claude Code:     %USERPROFILE%\.claude\skills\<slug>\SKILL.md
REM OpenCode:        %USERPROFILE%\.config\opencode\skills\<slug>\SKILL.md
REM Codex:           %USERPROFILE%\.agents\skills\<slug>\SKILL.md
REM Antigravity 2.0: %USERPROFILE%\.gemini\antigravity\skills\<slug>\SKILL.md
REM Antigravity CLI: %USERPROFILE%\.gemini\antigravity-cli\skills\<slug>\SKILL.md
REM Gemini CLI:      %USERPROFILE%\.gemini\skills\<slug>\SKILL.md

call :parse_args %*
if errorlevel 1 exit /b 1

echo == Instalando skills em: %TARGETS% ==
call :count_repo_skills
echo   Origem: %SKILLS_DIR% (!REPO_COUNT! skills)

for %%T in (%TARGETS%) do (
  echo.
  call :install_one %%T
  if errorlevel 1 (
    echo Falha na instalacao em %%T - abortando
    exit /b 1
  )
)

echo.
echo == Verificacao ==
for %%T in (%TARGETS%) do call :verify_one %%T

echo.
echo Pronto. Reinicie o CLI para que as skills sejam detectadas.
echo Observacao: os 6 subagentes sao configuracoes especificas do OpenCode e nao sao instalados por este script.
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
    echo Nenhum CLI alvo instalado. Use --all para instalar mesmo assim.
    exit /b 1
  )
)
exit /b 0

:usage
echo Uso: install-skills.bat [--all] [--claude] [--opencode] [--codex] [--antigravity] [--antigravity-cli] [--gemini] [--dry-run]
echo   --all              instala em todos os destinos (mesmo sem CLI instalado)
echo   --claude           Claude Code (~/.claude/skills)
echo   --opencode         OpenCode (~/.config/opencode/skills)
echo   --codex            Codex (~/.agents/skills)
echo   --antigravity      Antigravity 2.0 (~/.gemini/antigravity/skills)
echo   --antigravity-cli  Antigravity CLI (~/.gemini/antigravity-cli/skills)
echo   --gemini           Gemini CLI (~/.gemini/skills)
echo   --dry-run          mostra o que seria feito sem copiar
exit /b 0

:dest_of
if /i "%~1"=="claude"          ( set "%~2=%USERPROFILE%\.claude\skills"                     & exit /b 0 )
if /i "%~1"=="opencode"        ( set "%~2=%USERPROFILE%\.config\opencode\skills"            & exit /b 0 )
if /i "%~1"=="codex"           ( set "%~2=%USERPROFILE%\.agents\skills"                     & exit /b 0 )
if /i "%~1"=="antigravity"     ( set "%~2=%USERPROFILE%\.gemini\antigravity\skills"         & exit /b 0 )
if /i "%~1"=="antigravity-cli" ( set "%~2=%USERPROFILE%\.gemini\antigravity-cli\skills"     & exit /b 0 )
if /i "%~1"=="gemini"          ( set "%~2=%USERPROFILE%\.gemini\skills"                     & exit /b 0 )
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

REM IDs no winget (melhor esforco; alguns CLIs sao distribuidos via npm)
REM Nota: a busca exata (-e) do winget diferencia maiusculas - use o ID com a capitalizacao exata.
REM Gemini CLI nao tem pacote winget - cai no fallback npm via :npm_pkg_of.
:winget_id_of
if /i "%~1"=="claude"          ( set "%~2=Anthropic.Claude"     & exit /b 0 )
if /i "%~1"=="opencode"        ( set "%~2=SST.opencode"         & exit /b 0 )
if /i "%~1"=="codex"           ( set "%~2=OpenAI.Codex"         & exit /b 0 )
if /i "%~1"=="antigravity"     ( set "%~2=Google.Antigravity"   & exit /b 0 )
if /i "%~1"=="antigravity-cli" ( set "%~2=Google.Antigravity"   & exit /b 0 )
set "%~2="
exit /b 1

REM Alternativa npm para os CLIs distribuidos via Node
:npm_pkg_of
if /i "%~1"=="claude"          ( set "%~2=@anthropic-ai/claude-code" & exit /b 0 )
if /i "%~1"=="opencode"        ( set "%~2=opencode-ai"               & exit /b 0 )
if /i "%~1"=="codex"           ( set "%~2=@openai/codex"             & exit /b 0 )
if /i "%~1"=="gemini"          ( set "%~2=@google/gemini-cli"        & exit /b 0 )
set "%~2="
exit /b 1

:count_repo_skills
set "REPO_COUNT=0"
for /d %%D in ("%SKILLS_DIR%\*") do set /a REPO_COUNT+=1
exit /b 0

:count_dest
set "DEST_COUNT=0"
for /d %%D in ("%~1\*") do set /a DEST_COUNT+=1
exit /b 0

:install_one
set "T=%~1"
call :dest_of "!T!" DEST
call :bin_of "!T!" BIN
echo == !T! -^> !DEST! ==
where !BIN! >nul 2>&1
if errorlevel 1 (
  echo   AVISO: CLI '!BIN!' nao encontrado no PATH.
  call :winget_id_of "!T!" WID
  if defined WID (
    where winget >nul 2>&1
    if not errorlevel 1 (
      echo   Dica: winget install -e --id !WID!
      choice /c SN /n /m "   Instalar '!BIN!' agora via winget? "
      if not errorlevel 2 (
        winget install -e --id !WID! --accept-source-agreements --accept-package-agreements
      )
    ) else (
      call :npm_pkg_of "!T!" NPKG
      if defined NPKG echo   Dica alternativa: npm install -g !NPKG!
    )
  )
  REM Sem ID winget (ex.: Gemini CLI, so via npm): sugere o pacote npm.
  if not defined WID (
    call :npm_pkg_of "!T!" NPKG
    if defined NPKG echo   Dica: npm install -g !NPKG!
  )
)
if "!DRY_RUN!"=="1" (
  echo   ^(dry-run^) copiaria %SKILLS_DIR%\* -^> !DEST!
  exit /b 0
)
if not exist "!DEST!\" mkdir "!DEST!"
REM Copia cada skill (diretorio com SKILL.md) preservando estrutura.
REM Remove o destino previo para evitar aninhamento (xcopy cria dest\slug\slug).
for /d %%D in ("%SKILLS_DIR%\*") do (
  if exist "!DEST!\%%~nxD\" rmdir /s /q "!DEST!\%%~nxD"
  xcopy "%%D" "!DEST!\%%~nxD\" /e /i /q /y >nul
  if errorlevel 1 (
    echo   X Falha ao copiar %%~nxD - abortando instalacao em !T!
    exit /b 1
  )
)
call :count_dest "!DEST!"
echo   Instaladas: !DEST_COUNT! skills em !DEST!
exit /b 0

:verify_one
set "T=%~1"
call :dest_of "!T!" DEST
if "!DRY_RUN!"=="1" (
  echo   !T!: ^(dry-run, nada copiado^)
  exit /b 0
)
if not exist "!DEST!\" (
  echo   !T!: diretorio nao existe
  exit /b 0
)
set /a MATCH=0
for /d %%D in ("%SKILLS_DIR%\*") do if exist "!DEST!\%%~nxD\" set /a MATCH+=1
echo   !T!: !MATCH! skills do acervo em !DEST!
exit /b 0