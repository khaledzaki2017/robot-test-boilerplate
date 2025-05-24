from robot.api.deco import keyword
from RequestsLibrary import RequestsLibrary

@keyword
def delete_session_by_name(session_name):
    lib = RequestsLibrary()
    if session_name in lib._cache:
        del lib._cache[session_name]
