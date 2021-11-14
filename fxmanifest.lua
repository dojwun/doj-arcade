fx_version 'adamant'

games { 'gta5' }



shared_scripts { 
	'config.lua'
}

client_script "client.lua"

server_script "server.lua"

files {
	"html/css/style.css",
	"html/css/reset.css",
	"html/css/img/monitor.png",
	"html/css/img/table.png",
	"html/*.html",
	"html/scripts/listener.js",
}

ui_page "html/index.html"
