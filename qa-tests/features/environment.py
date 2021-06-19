import os


def before_all(context):
    context.API_URL = os.getenv('API_URL', 'http://localhost:8000/graphql/')
    context.DB_HOST = os.getenv('DB_HOST')
    context.DB_PORT = {os.getenv('DB_PORT')}
    context.RESPONSE_DIR = "resources/response_files/"
    context.response = dict()

    if os.getenv('DB_HOST'):
        os.popen(
            f"mysql -u {os.getenv('DB_USER')} -p{os.getenv('DB_PASSWORD')} -h {os.getenv('DB_HOST')} -P "
            f"{os.getenv('DB_PORT')} {os.getenv('DB_NAME')} < resources/db/qa_dump.sql").read()
