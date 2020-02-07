# AFtheM Fortress Forwarder Example

One of the main reason for the existence of AFtheM is providing a good way to forward API conversations to other agents.
This example demonstrantes how this happens using the FortressForwarder module that can be found on [GitHub](https://github.com/apifortress/afthem-modules/tree/master/fortress-forwarder).

While the Forwarder has been specifically designed to output a format that is compatible with [API Fortress](https://apifortress.com),
it can really be used with any system.

## Usage

The `docker-compose` comes with AFtheM and **RequestBin** to allow you to appreciate the forwarding act.
In the default settings, AFtheM will proxy a demo API.

1. Start the full package by issuing `docker-compose up`

2. Execute the following request: `curl -H 'key:ABC123' 127.0.0.1:8080/demo/retail/product`

3. The output of the proxied API should appear on your screen

4. Access `localhost:8000/bucket?inspect` with your browser and notice the forwarded API conversation