
> Kube-Monkey:   \
https://github.com/asobti/kube-monkey/blob/master/helm/kubemonkey/README.md

### kube-monkey installation with helm

Configuration of Kube-Monkey:
```
helm repo add kubemonkey https://asobti.github.io/kube-monkey/charts/repo
```{{exec}}

```
helm repo update
```{{exec}}

kube-monkey has a variety of flags. Here's an example installation:
```
helm install CHART_NAME_HERE kubemonkey/kube-monkey \
       --set config.dryRun=true \
       --set config.runHour=3 \
       --set config.startHour=4 \
       --set config.endHour=5 \
       --set config.timeZone=Etc/UTC
```

### Time Zones
Time zones were a little tricky to figure out. Check out the tz database, which is based off of UTC time.

"The tz database is a collaborative compilation of information about the world's time zones, primarily intended for use with computer programs and operating systems. The database attempts to record historical time zones and all civil changes since 1970, the Unix time epoch. It also includes transitions such as daylight saving time, and also records leap seconds." - From Wikipedia

https://en.wikipedia.org/wiki/Tz_database
https://en.wikipedia.org/wiki/List_of_tz_database_time_zones

### Alternate Methods
There are a variety of alternate methods that may better fit your purposes, such as if you are configuring a pipeline. Check out Dockerhub and the related configuration, such as of a toml file. You'll notice the flags are similar!