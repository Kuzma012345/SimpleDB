from hashlib import sha256

entre_passwd = "Example password"
salt = "TryCrack4MeBoy"
passwd = salt + entre_passwd

print(sha256(passwd.encode('utf-8')).hexdigest()) 
