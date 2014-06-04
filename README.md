# Rapportive API via Sinatra

This app shows your Zendesk end-users' profile and social media links based on their emails. Information provided by [Rapportive](http://rapportive.com).

### usage (v1)

```bash
bundle
foreman start

curl -i localhost:5000/api/v1/rapportive/user@email.com
```

Please submit bug reports to [Luiz Faias](mailto:luizfaias@gmail.com).