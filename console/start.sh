#!/bin/sh
SVELTE_PORT=3000 node /app/svelte/index.js &
PORT=7860 SVELTE_PORT=3000 /app/gateway
