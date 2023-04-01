from hashlib import sha256

from db_manager.config import SALT


class Encrypt:

    @staticmethod
    def encrypt_password(password):
        passwd = SALT + password

        return sha256(passwd.encode('utf-8')).hexdigest()
