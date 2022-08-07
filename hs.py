with open('SpecControlSettings.json', 'r', encoding='utf-8') as file:
    settings = file.readlines()
fps = input('Input your monitors refresh rate:')

settings[47] = '        "value": ' + fps + '\n'
settings[375] = '        "value": 0 \n'
settings[463] = '        "value": 0 \n'
settings[467] = '        "value": 0 \n'
settings[475] = '        "value": 0 \n'
settings[535] = '        "value": "Low" \n '
settings[539] = '        "value": "Low" \n'
settings[543] = '        "value": "Low" \n'
settings[547] = '        "value": "Low" \n'
settings[555] = '        "value": "Low" \n'
settings[563] = '        "value": "Low" \n'
settings[567] = '        "value": "Low" \n'
settings[571] = '        "value": "Low" \n'
settings[579] = '        "value": "off" \n'
settings[599] = '        "value": "Low" \n'
settings[603] = '        "value": "Low" \n'
settings[607] = '        "value": "Low" \n'
settings[611] = '        "value": "off" \n'
settings[615] = '        "value": "Low" \n'
settings[619] = '        "value": "Low" \n'
settings[623] = '        "value": "Low" \n'
settings[635] = '        "value": "Low" \n'

with open('SpecControlSettings.json', 'w', encoding='utf-8') as file:
    file.writelines(settings)
