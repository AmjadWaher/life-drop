# Donor App - Tasks & Milestones

## Milestone 1: Project Setup & Core Infrastructure (Week 1)

### Tasks
- [x] Initialize Flutter project with proper structure
- [x] Set up Clean Architecture folders (UI, Logic, Data)
- [x] Configure Bloc/Riverpod state management
- [x] Set up REST API client ( Dio)
- [ ] Set up WebSocket connection manager
- [ ] Configure Firebase project (FCM, Analytics)
- [x] Set up dependency injection
- [x] Create app theme and design system
- [x] Set up routing (GoRouter)

---

## Milestone 2: Authentication & Profile (Week 2)

### Tasks
- [x] Implement login screen with phone/email input
- [x] Implement OTP verification flow
- [x] Implement user registration screen
- [ ] Create user profile model and repository
- [ ] Implement profile management (edit name, phone)
- [x] Add blood type selection (A+, A-, B+, B-, AB+, AB-, O+, O-)
- [ ] Implement account verification status
- [ ] Add secure token storage
- [ ] Implement auto-login with token refresh

---

## Milestone 3: Home Screen & Request List (Week 3)

### Tasks
- [ ] Create home screen with request list
- [ ] Implement pull-to-refresh functionality
- [ ] Add priority indicators (Critical/Urgent/Normal) with color coding
- [ ] Create request card component
- [ ] Implement filtering/sorting by priority
- [ ] Add empty state design
- [ ] Implement loading states and error handling

---

## Milestone 4: Request Details & Actions (Week 3-4)

### Tasks
- [ ] Create request details screen
- [ ] Implement accept request functionality
- [ ] Implement cancel request (before arrival)
- [ ] Create active request screen
- [ ] Add request status display (Pending/Accepted/Completed)
- [ ] Implement countdown timer for response
- [ ] Add confirmation dialogs for actions

---

## Milestone 5: Push Notifications (Week 4)

### Tasks
- [ ] Integrate Firebase Cloud Messaging (FCM)
- [ ] Implement notification handling for Critical priority
- [ ] Configure urgent notification behavior
- [ ] Handle Normal priority as in-app notifications
- [ ] Implement notification tap navigation
- [ ] Add notification permission handling
- [ ] Create notification settings screen

---

## Milestone 6: Real-Time Updates (Week 5)

### Tasks
- [ ] Implement WebSocket connection for real-time updates
- [ ] Add auto-reconnect logic with exponential backoff
- [ ] Implement request removal when quota is full
- [ ] Implement instant status updates via WebSocket
- [ ] Handle offline mode with retry queue
- [ ] Add connection status indicator

---

## Milestone 7: Navigation to Hospital (Week 5-6)

### Tasks
- [ ] Integrate Google Maps Flutter SDK
- [ ] Implement "Start Navigation" button
- [ ] Add open with Google Maps functionality
- [ ] Calculate and display fastest route
- [ ] Show estimated travel time
- [ ] Add location permission handling
- [ ] Handle map fallback if not installed

---

## Milestone 8: Availability & Cooldown System (Week 6)

### Tasks
- [ ] Implement availability status tracking
- [ ] Create countdown timer after donation (56 days)
- [ ] Add cooldown period storage (local + server sync)
- [ ] Display availability status on profile
- [ ] Block requests when unavailable
- [ ] Show timer on home screen when unavailable

---

## Milestone 9: Cancellation & Reliability Tracking (Week 7)

### Tasks
- [ ] Implement cancellation with slot release
- [ ] Add reliability score calculation
- [ ] Create cancellation penalty system
- [ ] Display reliability score on profile
- [ ] Add frequent cancellation warning
- [ ] Implement cancellation cooldown

---

## Milestone 10: Gamification (Week 7-8)

### Tasks
- [ ] Implement points system for donations
- [ ] Create badges system (Bronze, Silver, Gold, Platinum)
- [ ] Add badge display on profile
- [ ] Implement milestone achievements
- [ ] Create leaderboard screen (optional)
- [ ] Add gamification UI components

---

## Milestone 11: Location Handling (Week 8)

### Tasks
- [ ] Implement static location storage (home, work, university)
- [ ] Add live location updates when app is open
- [ ] Create location management screen
- [ ] Implement location permission handling
- [ ] Optimize battery usage for location tracking
- [ ] Add fallback for location services disabled

---

## Milestone 12: UI Screens (Ongoing)

### Tasks
- [x] Create Splash Screen with logo and loading
- [x] Polish Login/Register screens
- [ ] Polish Home Screen
- [ ] Polish Request Details Screen
- [ ] Polish Active Request Screen
- [ ] Polish Profile Screen
- [ ] Add screen animations and transitions
- [ ] Implement responsive design
- [ ] Add dark mode support

---

## Milestone 13: Performance & Reliability (Week 9)

### Tasks
- [ ] Optimize notification response time
- [ ] Implement offline mode handling
- [ ] Add request retry logic
- [ ] Implement connection monitoring
- [ ] Add app performance monitoring
- [ ] Optimize UI rendering

---

## Milestone 14: Security & Testing (Week 10)

### Tasks
- [ ] Implement secure API calls (HTTPS)
- [ ] Add API token encryption
- [ ] Implement user data protection
- [ ] Write unit tests for blocs
- [ ] Write widget tests for UI components
- [ ] Perform security audit
- [ ] Create test documentation

---

## Milestone 15: Build & Deployment (Week 10-11)

### Tasks
- [ ] Configure iOS build settings
- [ ] Configure Android build settings
- [ ] Generate debug APKs/IPAs
- [ ] Set up CI/CD pipeline
- [ ] Create app store listings
- [ ] Perform final QA testing
- [ ] Prepare release notes