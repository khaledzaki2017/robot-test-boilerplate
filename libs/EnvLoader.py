import os
from dotenv import load_dotenv
from robot.api.deco import library, keyword

@library
class EnvLoader:
    def __init__(self):
        load_dotenv()

    @keyword
    def get_env_variable(self, name):
        return os.getenv(name, "")