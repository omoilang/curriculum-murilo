@echo off
setlocal

echo Publicando os commits de main em ordem, com um push para cada etapa...
for /f "delims=" %%C in ('git rev-list --first-parent --reverse main') do (
  git push origin %%C:refs/heads/main
  if errorlevel 1 exit /b 1
)

echo Publicando tambem as branches de desenvolvimento...
git push origin --all
if errorlevel 1 exit /b 1

echo Publicacao concluida.
