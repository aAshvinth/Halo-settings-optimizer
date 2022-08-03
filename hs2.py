config = open(r'SpecControlSettings.json', 'r')
#Reads the config file
settings = config.readlines()

#changes the settings for the best fps
settings[47] = """        "value": 960 """
settings[51] = """        "value": 960 """
settings[55] = """        "value": 0 """
settings[535] = """        "value": "Low" """
settings[539] = """        "value": "Low" """
settings[543] = """        "value": "Low" """
settings[555] = """        "value": "Low" """
settings[563] = """        "value": "Low" """
settings[567] = """        "value": "Low" """
settings[571] = """        "value": "Low" """
settings[599] = """        "value": "Low" """
settings[607] = """        "value": "Low" """
settings[623] = """        "value": "Low" """
with open(r'SpecControlSettings.json', 'w') as file:
    file.writelines(settings)
