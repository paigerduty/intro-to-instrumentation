import random
import os
from opentelemetry import trace
from opentelemetry.sdk.resources import Resource
from opentelemetry.sdk.trace import TracerProvider
from opentelemetry.sdk.trace.export import BatchSpanProcessor
from opentelemetry.exporter.otlp.proto.http.trace_exporter import OTLPSpanExporter
from flask import Flask

app = Flask(__name__)


trace.set_tracer_provider(
    TracerProvider(
        resource=Resource.create({
            "service.name": "hello-otel",
            "service.instance.id": "instance-12",
        }),
    ),
)
# Create tracer from global tracer provider
tracer = trace.get_tracer(__name__)

trace.get_tracer_provider().add_span_processor(
    BatchSpanProcessor(OTLPSpanExporter(endpoint="http://localhost:4318/v1/traces"))
)

HITS = 0

@app.route('/')
def hello_world():
    with tracer.start_as_current_span("foo"):
        global HITS
        HITS = HITS + 1
        msg = f'This webpage has been viewed {HITS} times'
        return msg

@app.route("/rolldice")
def roll_dice():
    with tracer.start_as_current_span("do_roll") as s:
        result = do_roll()
        s.set_attribute("roll.value", result)
        return result

def do_roll():
    return str(random.randint(1, 6))

if __name__ == "__main__":
    app.run(host="0.0.0.0")
