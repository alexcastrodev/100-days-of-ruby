# Run test 

### Build
docker build -t ruby-power-extension .


### Run
docker run --name ruby-power-container ruby-power-extension

```bash
docker run --rm -it ruby-power-extension  

Loaded suite day_5
Started
Finished in 0.003011959 seconds.
-------------------------------------------------------
2 tests, 2 assertions, 0 failures, 0 errors, 0 pendings, 0 omissions, 0 notifications
100% passed
-------------------------------------------------------
664.02 tests/s, 664.02 assertions/s
```

## Debug

```bash
docker run --rm -it ruby-power-extension sh
ls -la /app
```