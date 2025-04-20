from pathlib import Path
import shutil

# Target directory
DEST_DIR = Path.cwd() / "kde"

# Source (home) directory
HOME_DIR = Path.home()

backups = {
    "Panel": [".config/plasma-org.kde.plasma.desktop-appletsrc"],
    "Global Theme": [
        ".config/kdeglobals",
        ".config/kscreenlockerrc",
        ".config/kwinrc",
        ".config/gtkrc",
        ".config/gtkrc-2.0",
        ".config/gtk-4.0",
        ".config/gtk-3.0",
        ".config/ksplashrc",
        ".config/kglobalshortcutsrc",
        ".config/kwinrulesrc",
        ".config/khotkeysrc",
        ".config/kaccessrc",
        ".config/kwinrulesrc",
    ],
    "Plasma style": [
        ".config/plasmarc",
        ".config/plasmanotifyrc",
        ".config/plasma-localerc",
        ".config/ktimezonedrc",
    ],
    "Colors": [".config/Trolltech.conf"],
    "Fonts": [".config/kcmfonts", ".config/kfontinstuirc"],
    "Cursors": [
        ".config/kcminputrc",
    ],
    "Launch Feedback": [".config/klaunchrc"],
    "KDE connect": [".config/kdeconnect"],
    "Dolphin": [".config/dolphinrc"],
    "Kate": [
        ".config/katerc",
        ".config/katevirc",
        ".config/kate-externaltoolspluginrc",
    ],
    "Konsole": [
        ".config/konsolerc",
        ".config/konsolesshconfig",
    ],
    "System Settings": [".config/systemsettingsrc"],
}


def copy_path(src_relative_path):
    src = HOME_DIR / src_relative_path
    dest = DEST_DIR / src_relative_path

    if src.exists():
        print("[Copying]")
        dest.parent.mkdir(parents=True, exist_ok=True)
        if src.is_dir():
            shutil.copytree(src, dest, dirs_exist_ok=True)
        else:
            shutil.copy2(src, dest)
    else:
        print("[Skipping]")


for key in backups:
    for path in backups[key]:
        print(key, path, end=" ")
        copy_path(path)
