import requests
import json
from requests.auth import AuthBase
from Crypto.Hash import HMAC
from Crypto.Hash import SHA256
from datetime import datetime
from dateutil.tz import tzlocal


# Class to perform HMAC encoding
class AuthHmacMetosGet(AuthBase):
    # Creates HMAC authorization header for Metos REST service GET request.
    def __init__(self, apiRoute, publicKey, privateKey):
        self._publicKey = publicKey
        self._privateKey = privateKey
        self._method = 'GET'
        self._apiRoute = apiRoute

    def __call__(self, request):
        dateStamp = datetime.utcnow().strftime('%a, %d %b %Y %H:%M:%S GMT')
        print("timestamp: ", dateStamp)
        request.headers['Date'] = dateStamp
        msg = (self._method + self._apiRoute + dateStamp + self._publicKey).encode(encoding='utf-8')
        h = HMAC.new(self._privateKey.encode(encoding='utf-8'), msg, SHA256)
        signature = h.hexdigest()
        request.headers['Authorization'] = 'hmac ' + self._publicKey + ':' + signature
        return request


# Endpoint of the API, version for example: v1
apiURI = 'https://api.fieldclimate.com/v1'

# HMAC Authentication credentials
publicKey = '5e1ed3bd94a04b89d4f96d68b44e609e7cdd244d'
privateKey = '4bbdf62d503004295516bdb61a6ca22e1aeb24f8'

# Service/Route that you wish to call
# apiRoute = '/data/optimized/00206230/raw/from/1559941200/to/1560027600'
# apiRoute = '/data/optimized/00206285/raw/from/1559941200/to/1560027600'
#apiRoute = '/data/optimized/00206230/daily/from/1559941200/to/1562231264'
#apiRoute = '/data/optimized/00206285/daily/from/1559941200/to/1562231264'
apiRoute = '/data/optimized/00206230/raw/last/1'
# apiRoute = '/station/00206285/sensors'
# apiRoute = '/station/00206285'

auth = AuthHmacMetosGet(apiRoute, publicKey, privateKey)
response = requests.get(apiURI+apiRoute, headers={'Accept': 'application/json'}, auth=auth)


with open("00206285.daily.json","w") as f:
    f.write(json.dumps(response.json(), indent=4))
