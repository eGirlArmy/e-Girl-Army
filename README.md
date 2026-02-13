# E-Girl Army - Virtual Influencer Agency

An AI-powered virtual influencer agency running 20 characters across 5 niches.

## Structure

```
egirl-army/
├── README.md
├── characters.json        # All 20 character definitions
├── generate-character.sh  # Image generation script
├── images/               # Generated images by character
│   ├── mia/
│   ├── jordan/
│   └── ...
└── schedules/            # Content calendars
```

## Characters

### Trading & Finance (4)
- **Mia Reyes** (@miaDayTrades) - Miami, coffee + charts
- **Jordan Blake** (@jordanblake_) - NYC, sophisticated finance
- **Chloe Kim** (@chloetrades) - LA, minimalist options trader
- **Bella Torres** (@bellatorres) - Austin, meme trader energy

### Fitness & Wellness (4)
- **Maya Chen** (@mayawellness) - San Diego, yoga guru
- **Riley Brooks** (@rileybrooks_fit) - Denver, hiking + gym
- **Ava Martinez** (@avafit_miami) - Miami, beach fitness
- **Zoe Williams** (@zoepilates) - LA, pilates queen

### Lifestyle & Fashion (4)
- **Sophie Laurent** (@sophielaurent) - Paris-NYC, luxury aesthetic
- **Emma Collins** (@emmacollins_) - London, cozy + books
- **Lily Park** (@lilypark_) - Seoul-LA, K-beauty + streetwear
- **Nadia Hassan** (@nadiaxhassan) - Dubai-Miami, glam + travel

### Tech & Gaming (4)
- **Alex Quinn** (@alexquinn_gg) - Seattle, gamer girl
- **Sam Torres** (@samcodes_) - Austin, coder aesthetic
- **Kai Nakamura** (@kainakamura) - Tokyo-SF, anime + tech
- **Dev Patel** (@devbuilds) - Bay Area, startup girl

### Travel & Adventure (4)
- **Luna Morales** (@lunatravels) - Nomad, adventure blogger
- **Iris Chen** (@irisinnbali) - Bali, digital nomad
- **Jade Wilson** (@jadewilson_) - Australia, surf + van life
- **Nina Costa** (@ninacosta_) - Europe, city hopper

## Usage

### Generate a character image
```bash
./generate-character.sh mia "portrait of Mia at a coffee shop..."
```

### Credentials
Stored in `~/.config/egirl-army/`:
- `config.json` - API keys
- `mia.json` - Mia's account credentials

## Requirements

- Replicate API key (for image generation)
- Anti-detect browser (GoLogin) - for running multiple accounts
- Residential proxies - for unique IPs
- Scheduling tool - for bulk posting

## Status

- [x] Character definitions complete
- [x] Replicate API configured
- [ ] Add Replicate credit
- [ ] Generate base faces for all 20
- [ ] Set up anti-detect browser
- [ ] Set up proxies
- [ ] Create Instagram accounts
- [ ] Begin posting

---
*Built by Wiz for AIFrens*
