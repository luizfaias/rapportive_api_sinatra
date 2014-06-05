# Rapportive API via Sinatra

This app retrieves JSON data from [Rapportive](http://rapportive.com) based on a given email address.

### example

http://rapportive-api-sinatra.herokuapp.com/api/v1/rapportive/luizfaias@gmail.com


### usage (v1)

```bash
bundle
foreman start

curl -i localhost:5000/api/v1/rapportive/user@email.com
```

Feel free to contribute and [submit issues here](https://github.com/luizfaias/rapportive_api_sinatra/issues).