-- Resource Metadat
fx_version 'cerulean'
games { 'gta5' }

author 'yxupy#1337'
description 'Yxupy Dark Market.'
version '1.0.0'

ui_page 'html/index.html'
	files { 
        'html/index.html',
        'html/index.js',
        'html/index.css',
        'html/reset.css'
	}

shared_scripts {
        'config.lua'
}
        


client_script {'client/nui.lua'}
server_script {'server/server.lua'}