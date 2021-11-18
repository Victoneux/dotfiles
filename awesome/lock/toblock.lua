toblock = {
    {{ }, 'Escape',
        function(_)
            reset_lock()
            grab_password()
        end
    },

    {{ 'Control' }, 'Delete',
        function ()
            reset_lock()
            grab_password()
        end
    },
    {{ modkey, 'Control' }, 'r',
        function ()
            reset_lock()
            grab_password()
        end
    },
    {{ modkey, 'Control' }, 'Delete',
        function ()
            reset_lock()
            grab_password()
        end
    },
    {{ 'Control', "Mod1" }, 'Delete',
        function ()
            reset_lock()
            grab_password()
        end
    }
}

return toblock