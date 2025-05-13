if uwsm check may-start > /dev/null 2>&1 && uwsm select; then
        exec uwsm start default
fi

export QT_QPA_PLATFORM=wayland
export QT_QPA_PLATFORMTHEME=qt5ct


