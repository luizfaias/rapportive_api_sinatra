# Rapportive API via Sinatra

This app retrieves JSON data from [Rapportive](http://rapportive.com) based on a given email address.

### example

http://rapportive-sinatra.herokuapp.com/api/v1/rapportive/luizfaias@gmail.com


### usage (v1)

```bash
bundle
foreman start

curl -i localhost:5000/api/v1/rapportive/user@email.com
```

Please submit bug reports to [Luiz Faias](mailto:luizfaias@gmail.com).