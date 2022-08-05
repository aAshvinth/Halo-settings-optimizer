with open('SpecControlSettings.json', 'r', encoding='utf-8') as file:
    settings = file.readlines()

settings[47] = '        "value": 960 \n'
settings[51] = '        "value": 960 \n'
settings[55] = '        "value": 0 \n'
settings[535] = '        "value": "Low" \n '
settings[539] = '        "value": "Low" \n'
settings[543] = '        "value": "Low" \n'
settings[555] = '        "value": "Low" \n'
settings[563] = '        "value": "Low" \n'
settings[567] = '        "value": "Low" \n'
settings[571] = '        "value": "Low" \n'
settings[599] = '        "value": "Low" \n'
settings[607] = '        "value": "Low" \n'
settings[623] = '        "value": "Low" \n'

with open('SpecControlSettings.json', 'w', encoding='utf-8') as file:
    file.writelines(settings)
