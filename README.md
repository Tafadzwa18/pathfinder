# Pathfinder

A mobile tourist guide application designed to help users discover **recreational attractions in Norton, Zimbabwe**.
The application allows users to explore places to visit, view attraction details, locate them on a map, and save their favorite destinations.

The project is built using **Flutter** for the mobile application and **Supabase** for authentication, database storage, and backend services.

---

## Project Goal

The goal of this application is to create a **local discovery platform** that helps residents and visitors easily find recreational places in Norton such as parks, picnic spots, resorts, leisure centers, and scenic locations.

The first version of the application focuses **only on attractions located within Norton**. Future versions will expand to include **nearby recreational destinations such as Lake Chivero and Darwendale**.

---

## Features (MVP)

### 1. Browse Attractions

Users can view a list of recreational attractions located in Norton.

Features include:

* attraction cards with images
* attraction names and categories
* short descriptions
* easy navigation to details

---

### 2. Attraction Details

Each attraction contains detailed information including:

* attraction name
* images
* description
* available activities
* location
* opening hours
* entry fee information
* contact details (if available)

---

### 3. Map View

Users can explore attractions using an interactive map.

The map allows users to:

* view attractions as map markers
* tap markers to view attraction information
* visually understand where attractions are located within Norton

---

### 4. Favorites

Registered users can save attractions they are interested in.

This allows users to:

* bookmark attractions
* quickly access saved places later
* plan future visits

---

### 5. Search and Filtering

Users can search for attractions and filter them by category.

Example categories may include:

* Parks & Gardens
* Picnic Spots
* Nature & Scenic Areas
* Sports & Leisure
* Resorts & Lodges
* Family Activities

---

### 6. Authentication

The application supports user accounts.

Users can:

* sign up
* log in
* log out

Guest users can still browse attractions, but saving favorites requires an account.

---

### 7. Admin Content Management

Administrators manage the attraction information displayed in the application.

Admins can:

* add new attractions
* edit attraction information
* upload images
* manage attraction categories
* mark attractions as featured
* deactivate outdated attractions

---

## Technology Stack

### Frontend

* Flutter

### Backend

* Supabase

### Supabase Services Used

* Authentication
* PostgreSQL Database
* Storage (images)
* Row Level Security (RLS)

---

## Future Improvements

Planned features for later versions include:

* Nearby destinations outside Norton
* User reviews and ratings
* Trip itinerary planner
* Local events listing
* Offline support
* Weather integration
* Personalized recommendations

---
