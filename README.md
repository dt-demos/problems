# Overview

Example unix shell scripts related to problems.

## Setup 

* Copy the `.env-template` to `.env`
* Make a Dyantrace API token and set the Dynatrace URL Token in `.env` file.
    * API v2 scopes
        * `Ingest events`
        * `Read problems`
        * `Write problems`
    * API v1 scopes
        * `Access problem and event feed, metrics, and topology`

## Send Event 

Use this script to send an event to one or more entities.  
For an overview of Dynatrace events types, review [Categories of Davis events
](https://docs.dynatrace.com/docs/discover-dynatrace/platform/davis-ai/root-cause-analysis/concepts/events/event-types) help docs.

Running script
```
./pushevent.sh PERFORMANCE_EVENT "type(SERVICE),entityName.equals(OrderController)"
```

Within Dynatrace there view the problem.

## Get Problem

Use this script to get the details for a problem.
The script passing the optional querystring parameters to get more details about the problem.
`$DT_BASEURL/api/v2/problems/$DT_PROBLEM_ID?evidenceDetails,impactAnalysis,recentComments`

Running script and formatting output with `jq` utility.
```
./getproblem.sh -3923117663478183459_1752459060000V2 | jq '.'
```

## Close Existing Problem 

This script can be used to quickly close out an open problem. 
From the URL within Dynatrace you get obtain the Problem ID. For example: `-7079974447799175602_1752266005311V2`

Running script:
```
./closeproblem.sh 5194648246915255341_1752457020268V2
```

Within Dynatrace there view the problem and review that it is closed.