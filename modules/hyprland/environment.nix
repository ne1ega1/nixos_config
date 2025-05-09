{
    env = [
        # BASE
        "EDITOR, nvim"
        "GDK_BACKEND, wayland, x11"
        "CLUTTER_BACKEND, wayland"
        "ELECTRON_OZONE_PLATFORM_HINT, wayland"
        # WLR
        "WLR_NO_HARDWARE_CURSORS,  1"
        "WLR_RENDERER_ALLOW_SOFTWARE,  1"
        "WLR_DRM_NO_ATOMIC, 1"
        # XDG
        "XDG_CURRENT_DESKTOP, Hyprland"
        "XDG_SESSION_TYPE, wayland"
        "XDG_SESSION_DESKTOP, Hyprland"
        # QT
        "QT_QPA_PLATFORM, wayland"
        "QT_QPA_PLATFORMTHEME, qt5ct"
        "QT_AUTO_SCREEN_SCALE_FACTOR, 1"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION, 1"
        # OTHER
        "XCURSOR_THEME, macchiatoDark"
        "XCURSOR_SIZE, 24"
        "ANKI_WAYLAND, 1"
        "OBSIDIAN_USE_WAYLAND, 1"
        "MOZ_ENABLE_WAYLAND, 1"
        # NVIDIA
        "LIBVA_DRIVER_NAME, nvidia"
        "GBM_BACKEND, nvidia-drm"
        "__GLX_VENDOR_LIBRARY_NAME, nvidia"
        "__GL_VRR_ALLOWED, 1"
        "__GL_THREADED_OPTIMIZATIONS, 0"
        "nvidia_anti_flicker, true"
    ];
}
