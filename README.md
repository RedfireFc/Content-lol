Secure VPN (OpenVPN handoff) - Ready-to-build Android Studio project
===========================================================

What this project does:
- Android app named "Secure VPN"
- Fetches a live OpenVPN server list (VPN Gate-style) and displays locations
- Allows importing a .ovpn file or tapping a location to download the .ovpn and open it in the official OpenVPN Connect app via Intent
- Does NOT bundle the OpenVPN engine; it relies on the OpenVPN Connect app to run tunnels (this avoids heavy native builds)

Build with GitHub Actions:
- A workflow file is included at .github/workflows/android-build.yml that runs ./gradlew assembleDebug and stores the apk as an artifact.

How to use:
1. Create a GitHub repo and push the contents of this project (or upload this zip to GitHub).
2. Enable Actions for the repo (the workflow runs automatically on push).
3. Open the Actions tab, run the workflow or push to trigger it. Download the artifact (unsigned debug apk).
4. Install the APK on your Android device. Install OpenVPN Connect from Play Store.
5. Open Secure VPN, pick a server and tap "Open in OpenVPN" — the app will hand off the .ovpn to OpenVPN Connect to import and connect.

Notes:
- Public free OpenVPN endpoints are unstable and may be monitored. Use at your own risk.
- If you want the app to run VPNs without the official OpenVPN app, we can integrate ics-openvpn (native code) in a follow-up; that requires additional native build steps.
