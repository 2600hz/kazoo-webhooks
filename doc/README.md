# Webhooks *Event driven HTTP*

The webhooks app provides accounts the ability to receive HTTP requests in response to events within {% BRAND_NAME %}.

## Overview

{% BRAND_NAME %}, internally, runs messages through a message broker; in this case RabbitMQ via the AMQP protocol. These messages are flowing in a protected, high-trust environment which necessitates no 3rd party client access.

However, {% BRAND_NAME %} also strives to provide 3rd parties (resellers or integrators, for instance) access to the goings on of the system.

Webhooks effectively provides an AMQP->HTTP bridge to allow events in {% BRAND_NAME %} to flow from the AMQP message bus to the HTTP server of the 3rd party.
