# Bloodhound Fortress Live Testing Example

The Fortress Live Testing serializer will forward the response body of an API conversation, together with extra parameters.
This format is mostly used by the API Fortress product line for live testing, but could be used in other contexts as well.
More information about this module can be found on [GitHub](https://github.com/apifortress/bloodhound-modules/tree/master/fortress-forwarder).

## Usage

The `docker-compose` comes with Bloodhound and **RequestBin** to allow you to appreciate the forwarding act.
In the default settings, Bloodhound will proxy a demo API.

1. Start the full package by issuing `docker-compose up`

2. Access `localhost:8000/bucket?inspect` with your browser to create the bucket

3. Execute the following request: `curl -H 'key:ABC123' 127.0.0.1:8080/demo/retail/product`

4. The output of the proxied API should appear on your screen

5. Reload `localhost:8000/bucket?inspect` with your browser and notice the forwarded API conversation

## Description

The flow is simple, but it includes one complex aspect: the `endpoint_identifier` phase. The goal is to apply a label to the call being
processed, to be used later in the flow.
The sample configuration is as follows:

```yaml
regex:
    product_api:
    url: .*/product
    method: GET
```

Which means: *apply the `product_api` label whenever the URL ends with `product` and the method is `GET`*.
The `endpoint_identifier` actor is described on [GitHub](https://github.com/apifortress/bloodhound/blob/master/doc/07_advanced_actors.md).

The label is then used in by the `fortress_live_testing` module:

```yaml
url: '"http://requestbin:8000/bucket/"+#msg.request().callId()+"/run"'
params:
    param1: value1
    param2: value2
```
