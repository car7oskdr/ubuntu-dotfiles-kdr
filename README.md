# Ubuntu Dotfiles KDR

Este repositorio contiene mi entorno de desarrollo personal para la terminal en Ubuntu, combinando el poder gráfico de **WezTerm** con la inteligencia de **Zsh** y **Oh My Zsh**.

## Archivos de Configuración y Scripts

- `wezterm.lua`: Configuración del emulador (atajos estilo tmux, apariencia, transparencia, fuente Nerd).
- `.zshrc`: Configuración de shell (tema Agnoster, plugins: fzf, autosuggestions, syntax-highlighting).
- `.zsh_aliases`: Atajos personalizados para comandos del día a día.
- `install.sh`: Script automático para enlazar las configuraciones con tu sistema (usando symlinks).

---

# Guía de Instalación desde cero

Esta es la guía completa paso a paso para replicar la configuración de la terminal en un sistema basado en Debian/Ubuntu (como Ubuntu 24.04).

## 1. Instalar Fuentes y WezTerm

Para que los íconos y el código se vean correctamente, necesitas instalar la fuente principal (JetBrains Mono) y el respaldo (Symbols Nerd Font).

Instala WezTerm siguiendo las instrucciones oficiales para Ubuntu:
```bash
curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /usr/share/keyrings/wezterm-fury.gpg
echo 'deb [signed-by=/usr/share/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list
sudo apt update
sudo apt install wezterm
```

## 2. Instalar Zsh y Herramientas Base

Instala la shell `zsh` y el buscador `fzf`:
```bash
sudo apt update
sudo apt install -y zsh fzf
```

Instala el framework Oh My Zsh usando su script oficial:
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Clona los repositorios oficiales de los plugins dentro de la carpeta custom de Oh My Zsh:
```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
```

## 3. Aplicar Configuración (Symlinks)

Una vez que tengas todos los programas instalados, clona este repositorio (si aún no lo has hecho) y ejecuta el script de instalación automática:

```bash
cd ~/repos/kdr/ubuntu-dotfiles-kdr
chmod +x install.sh
./install.sh
```

El script se encargará automáticamente de:
1. Hacer un respaldo de tus configuraciones actuales agregándoles la extensión `.bak`.
2. Crear **enlaces simbólicos** (`symlinks`) de los archivos `.zshrc`, `.zsh_aliases` y `wezterm.lua` desde este repositorio hacia sus rutas correctas en tu sistema.

*(Nota: La configuración de WezTerm incluida en este repositorio ya fuerza automáticamente el inicio en Zsh, por lo que no es necesario modificar la shell por defecto del sistema).*

¡Con eso habrás replicado al 100% todo el entorno de tu terminal moderna!
