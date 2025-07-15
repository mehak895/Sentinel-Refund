# Sentinel-Refund
SentinelRefund – Intelligent Refund Fraud Detection System

SentinelRefund is a mobile-first application built to detect and prevent fraudulent refund requests in B2B commerce platforms like Flipkart Wholesale. It enables real-time flagging and rejection of suspicious refunds based on frequency, time-of-request, and behavioral patterns—helping Walmart reduce financial leakage and boost operational trust.
🚩 Problem

B2B buyers often misuse refund systems by submitting frequent or unjustified refund claims—sometimes within minutes of receiving deliveries. Without intelligent verification, this causes:

    Massive operational costs for platforms like Walmart/Flipkart.

    Loss of seller trust and damaged reputation.

    High manual workload on support teams.

✅ Solution

SentinelRefund introduces a dual-interface system:

    🔐 Customer Flow: Users can log in and request refunds with proper tracking.

    🛡️ Walmart Flow: Walmart employees see flagged refund requests with reasons and can approve/pass or reject them.

Built-in fraud detection logic includes:

    Frequency check (e.g., “Too many refunds”).

    Timing constraints (e.g., refund within 30 mins of delivery).

    Dynamic reason tagging for rejection.

🛠 Tech Stack

    🔧 Flutter (UI)

    🧠 Dart (Logic)

    🔐 Firebase Authentication (with support for multi-auth)

    ☁️ Firebase Firestore (for storing refund requests and flags)
