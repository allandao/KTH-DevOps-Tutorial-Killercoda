
> kube-monkey is set to run to create a plan at a certain time, and to disrupt pods at a given time between the set range, based on the randomly generated plan. Rather than waiting a few hours to see what happens, the goal is to manipulate the time with commands to get there sooner.

## Experimenting with Time Manipulation

Setting the date. Notice we're on a 24 hour clock:

```
sudo date --set="DD MM YYYY HH:MM:SS"

Practical Examples:
sudo date --set=2:59:50  # get close to the hour, which is helpful as kube-monkey planning is scheduled run on the hour
sudo date --set=05/12/23
sudo date --set="11 May 2023 14:59:55"
sudo date --set="2 Oct 2002 18:00:00"
```

```
Results:
controlplane $ sudo date --set="11 May 2023 14:59:55"
Thu May 11 14:59:55 UTC 2023
controlplane $ date
Thu May 11 14:59:55 UTC 2023
```

You'll notice the date might not change:

Run this to see processes in place that might be responsible for that.
```
ps -ef
```{{exec}}

You may notice a few things we might want to shut down.

```
systemctl stop systemd-timesyncd
```{{exec}}

```
timedatectl set-ntp false
```{{exec}}

Give them a try and seeing if the date changing works now. Running ``` date ``` will show you the current system date.

A helpful command:
```
controlplane $ timedatectl
    Local time: Thu 2023-05-11 03:00:14 UTC
    Universal time: Thu 2023-05-11 03:00:14 UTC
    RTC time: Wed 2023-05-10 14:23:06    
    Time zone: Etc/UTC (UTC, +0000)       
    System clock synchronized: no                         
    NTP service: inactive                   
    RTC in local TZ: no    
```

Notice that we're working with UTC time. Take that into account when installing kube-monkey:

```
helm install CHART_NAME_HERE kubemonkey/kube-monkey \
>       --set config.dryRun=true \
>       --set config.runHour=3 \
>       --set config.startHour=4 \
>       --set config.endHour=5 \
>       --set config.timeZone=Etc/UTC

Uses a 24 hour clock, and we set the time zone to UTC to simply time manipulation.

NOTES:
1. Wait until the application is rolled out:
  kubectl -n NAMESPACE rollout status deployment NAME_HERE
2. Check the logs:
  kubectl logs -f deployment.apps/NAME_HERE -n NAMESPACE
```

Along the way commands given above, you should see the helm charts updated accordingly:

```
controlplane $ helm list -A

You should see something along these lines:
NAME            NAMESPACE       REVISION        UPDATED                                 STATUS          CHART            APP VERSION
CHART_NAME      default         1               2023-05-10 14:14:41.981401326 +0000 UTC deployed        kube-monkey-1.5.00.5.0 
```

Recall the hours we set, and imagine the day and time today is currently 9:00 on January 10th, 2023:
```
Command Flags
      --set config.runHour=3 \
      --set config.startHour=4 \
      --set config.endHour=5 \

Sample Output:
controlplane $ kubectl logs -f deployment.apps/kube-monkey-test -n default
I0511 03:04:06.252923       1 config.go:102] Successfully validated configs
I0511 03:04:06.252976       1 main.go:54] Starting kube-monkey with v logging level 5 and local log directory /var/log/kube-monkey
I0511 03:04:06.262677       1 kubemonkey.go:25] Status Update: Generating next schedule at 2023-01-11 03:00:00 +0000 UTC
```

Since 9:00 is past hour 3 which is when kube-monkey will initially run, it will schedule itself for the next day. Let's jump to the next day to see the scheduled plan: 

```
sudo date --set="1 Jan 2023 2:59:55"
```{{exec}}

Let us wait a few seconds, and then check the logs again!

```
kubectl logs -f deployment.apps/CHART-NAME -n NAMESPACE
```

Now you should be able to see a plan. Use the date command to now skip to the scheduled time for any planned disruptions!

-----

Sample Commands (some from the docs):

If you want pods to actually be taken down:

`helm install hello-node kubemonkey --set config.dryRun=false`{{exec}}


`helm install --name hello-node kubemonkey \
               --set config.dryRun=false \
               --set config.whitelistedNamespaces="{namespace1,namespace2,namespace3}"
               --set config.runHour=21 \
               --set config.startHour=21 \
               --set config.endHour=21.05`
               {{exec}}

If you want to enable attack notifications.
`helm install --name hello-node kubemonkey \
               --set config.dryRun=false \
               --set config.whitelistedNamespaces="namespace1\"\,\"namespace2\"\,\"namespace3" \
               --set config.notifications.enabled=true \
               --set config.notifications.endpoint=http://localhost:8080/path \
               --set config.notifications.message="{\"foo\":\"bar\"}" \
               --set config.notifications.headers="Content-Type:application/json\"\,\"client-id:kubemonkey"`{{exec}}