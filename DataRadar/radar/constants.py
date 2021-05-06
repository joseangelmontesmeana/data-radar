from radar.models import HighSchool, Library, Museum, Monument, NurserySchool, School, SecurityForce

# LOAD DATA ARGUMENTS
DATA_DIRECTORY = "data/"
SETUP_DIRECTORY = "setup/"
URLS_FILE = "data_urls.json"
DATA_FILE_NAMES = "files_data_name.json"

TABLES = {
    "HighSchools": HighSchool,
    "Libraries": Library,
    "Museums": Museum,
    "Monuments": Monument,
    "NurserySchools": NurserySchool,
    "Schools": School,
    "SecurityForces": SecurityForce
}
