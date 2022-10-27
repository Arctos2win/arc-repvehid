fx_version 'adamant'

game 'gta5'
author 'Arctos.'
description 'repair vehicle from player id.' 
lua54 'yes'
version '1.0.0'

shared_scripts {
	'@es_extended/imports.lua'
}

server_scripts {
	'server.lua'
}

client_scripts {
	'client.lua'
}

dependency 'es_extended'