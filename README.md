   (a real phone call plays the audio), or falls back to the ntfy built-in sounds.# agents-alert

Urgent alert channel for AI agents to reach the phone on call.

Two tiers:

- **push** (default, free): ntfy.sh push notification with priority=max and the custom
  siren+voice ringtone ("Your agents need you!"). Works from any machine with internet.
- **call** (optional): true outbound phone call via Twilio that plays the siren audio
  out loud, then speaks the message.

## Install (any machine)

    curl -fsSL https://raw.githubusercontent.com/tavishm/agents-alert/master/install.sh | bash

Then test:

    ~/.local/bin/agents-alert test

## Phone setup (one time)

1. Install the **ntfy** app ([Android](https://play.google.com/store/apps/details?id=io.heckel.ntfy) / [iOS](https://apps.apple.com/us/app/ntfy/id1625396347)).
2. Add subscription to topic `the-x20-agents`.
3. In the subscription settings, set **Notification priority = Max**. On Android,
   pick **Sound = podcast.mp3** (download it from any alert). iOS cannot use custom
   sound files in notifications; on iPhone the siren arrives via the **call** tier

## Sending alerts

    agents-alert push "GPU idle, training halted"
    agents-alert call "GPU idle, training halted"   # needs Twilio env vars

## Config

`~/.config/agents-alert.conf` holds `NTFY_TOPIC` and `NTFY_URL`.
Twilio credentials come from env: `TWILIO_ACCOUNT_SID`, `TWILIO_AUTH_TOKEN`, `TWILIO_FROM`, `ALERT_PHONE`.

## Audio

The custom ringtone (siren -> "Your agents need you!" -> siren, ~6 s) lives in `audio/`.
