#!/bin/bash
# Generate character images using Replicate API (Flux)

set -e

# Load API key
REPLICATE_API_TOKEN=$(cat ~/.config/egirl-army/config.json | grep replicate_api_key | cut -d'"' -f4)

if [ -z "$1" ]; then
    echo "Usage: ./generate-character.sh <character-name> <prompt>"
    echo "Example: ./generate-character.sh mia 'portrait of Mia, 23, latina, dark wavy hair...'"
    exit 1
fi

CHARACTER=$1
PROMPT=$2
OUTPUT_DIR="$HOME/clawd/egirl-army/images/$CHARACTER"

mkdir -p "$OUTPUT_DIR"

echo "🎨 Generating image for $CHARACTER..."

# Using SDXL for now (cheaper), can switch to Flux later
RESPONSE=$(curl -s -X POST "https://api.replicate.com/v1/predictions" \
  -H "Authorization: Bearer $REPLICATE_API_TOKEN" \
  -H "Content-Type: application/json" \
  -d "{
    \"version\": \"5599ed30703defd1d160a25a63321b4dec97101d98b4674bcc56e41f62f35637\",
    \"input\": {
      \"prompt\": \"$PROMPT\",
      \"num_outputs\": 1,
      \"guidance_scale\": 7.5,
      \"num_inference_steps\": 50
    }
  }")

# Check for errors
if echo "$RESPONSE" | grep -q "Insufficient credit"; then
    echo "❌ Error: Insufficient Replicate credit. Add funds at https://replicate.com/account/billing"
    exit 1
fi

PREDICTION_ID=$(echo "$RESPONSE" | grep -o '"id":"[^"]*"' | head -1 | cut -d'"' -f4)

if [ -z "$PREDICTION_ID" ]; then
    echo "❌ Error creating prediction: $RESPONSE"
    exit 1
fi

echo "⏳ Prediction ID: $PREDICTION_ID"
echo "⏳ Waiting for generation..."

# Poll for completion
while true; do
    STATUS_RESPONSE=$(curl -s "https://api.replicate.com/v1/predictions/$PREDICTION_ID" \
      -H "Authorization: Bearer $REPLICATE_API_TOKEN")
    
    STATUS=$(echo "$STATUS_RESPONSE" | grep -o '"status":"[^"]*"' | head -1 | cut -d'"' -f4)
    
    if [ "$STATUS" = "succeeded" ]; then
        IMAGE_URL=$(echo "$STATUS_RESPONSE" | grep -o '"output":\["[^"]*"\]' | grep -o 'https://[^"]*')
        TIMESTAMP=$(date +%Y%m%d_%H%M%S)
        OUTPUT_FILE="$OUTPUT_DIR/${CHARACTER}_${TIMESTAMP}.png"
        
        echo "✅ Downloading image..."
        curl -s "$IMAGE_URL" -o "$OUTPUT_FILE"
        echo "✅ Saved to: $OUTPUT_FILE"
        break
    elif [ "$STATUS" = "failed" ]; then
        echo "❌ Generation failed"
        echo "$STATUS_RESPONSE"
        exit 1
    else
        echo "⏳ Status: $STATUS..."
        sleep 2
    fi
done
