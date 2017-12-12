Create a new webhook on Github with parameters:

- Payload URL
  `http://YOUR_EXTERNAL_IP:9999/github-webhook`
  
- Content type
  `application/json`
  
- Secret
  `YOUR_SECRET_KEY`
  
- Which events would you like to trigger this webhook?
  Enable `Pull request`
 
Then starts the server:

```bash
bundle install
GITHUB_HOOK_SECRET="YOUR_SECRET_KEY" rackup --host YOUR_EXTERNAL_IP --port 9999
```
