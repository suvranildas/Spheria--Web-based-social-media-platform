# Spheria Platform Architecture

## System Overview

```mermaid
graph TD
    A[User] --> B[index.php]
    B --> C[Authentication]
    B --> D[Feed Management]
    B --> E[Post Management]
    B --> F[Comment System]
    B --> G[Like System]
    B --> H[Share System]
    B --> I[Notification System]
    
    C --> J[Session Management]
    C --> K[User Database]
    
    D --> L[Post Database]
    D --> M[Media Database]
    
    E --> N[Post Creation]
    E --> O[Post Display]
    E --> P[Media Upload]
    
    F --> Q[Comment Database]
    F --> R[Comment UI]
    
    G --> S[Like Database]
    G --> T[Like UI]
    
    H --> U[Share Options]
    H --> V[Social Media Integration]
    
    I --> W[Notification Database]
    I --> X[Real-time Updates]
```

## Database Schema

```mermaid
erDiagram
    USERS ||--o{ POSTS : creates
    USERS ||--o{ COMMENTS : writes
    USERS ||--o{ LIKES : gives
    USERS ||--o{ NOTIFICATIONS : receives
    POSTS ||--o{ COMMENTS : has
    POSTS ||--o{ LIKES : receives
    POSTS ||--o{ POST_MEDIA : contains
    
    USERS {
        int user_id PK
        string username
        string email
        string profile_image
        datetime created_at
    }
    
    POSTS {
        int post_id PK
        int user_id FK
        string content
        string visibility
        datetime created_at
    }
    
    COMMENTS {
        int comment_id PK
        int post_id FK
        int user_id FK
        string comment_text
        datetime created_at
    }
    
    LIKES {
        int like_id PK
        int post_id FK
        int user_id FK
        datetime created_at
    }
    
    POST_MEDIA {
        int media_id PK
        int post_id FK
        string file_path
        string media_type
        string mime_type
    }
    
    NOTIFICATIONS {
        int notification_id PK
        int user_id FK
        string type
        string content
        boolean is_read
        datetime created_at
    }
```

## Frontend Components

```mermaid
graph LR
    A[Main Layout] --> B[Left Sidebar]
    A --> C[Main Content]
    A --> D[Right Sidebar]
    
    C --> E[Stories Section]
    C --> F[Posts Feed]
    C --> G[Quick Comment Form]
    
    B --> H[Navigations]
    H --> Home
    H --> Search
    H --> Spheres
    H --> Inbox
    H --> Create
    B --> I[User Profile]
    
    D --> J[Suggestions]
    D --> K[Trending Topics]
    
    F --> L[Post Card]
    L --> M[Post Header]
    L --> N[Post Content]
    L --> O[Post Footer]
    L --> P[Action Buttons]
```

## User Interactions

```mermaid
sequenceDiagram
    participant User
    participant Frontend
    participant Backend
    participant Database
    
    User->>Frontend: Login
    Frontend->>Backend: Authentication Request
    Backend->>Database: Verify Credentials
    Database-->>Backend: User Data
    Backend-->>Frontend: Session Token
    Frontend-->>User: Redirect to Feed
    
    User->>Frontend: Create Post
    Frontend->>Backend: Post Data
    Backend->>Database: Store Post
    Database-->>Backend: Confirmation
    Backend-->>Frontend: Success Response
    Frontend-->>User: Update Feed
    
    User->>Frontend: Like Post
    Frontend->>Backend: Like Request
    Backend->>Database: Update Likes
    Database-->>Backend: Confirmation
    Backend-->>Frontend: Updated Count
    Frontend-->>User: Update UI
```

## File Structure

```mermaid
graph TD
    A[spheria1] --> B[index.php]
    A --> C[includes/]
    A --> D[assets/]
    
    C --> E[config.php]
    C --> F[db.php]
    C --> G[sidebar.php]
    C --> H[right-sidebar.php]
    
    D --> I[css/]
    D --> J[js/]
    D --> K[images/]
    
    I --> L[style.css]
    I --> M[sidebar.css]
    I --> N[feed.css]
    
    J --> O[like.js]
    J --> P[stories.js]
    J --> Q[share.js]
    J --> R[comments.js]
``` 

graph LR
    A[Main Layout] --> B[Left Sidebar]
    A --> C[Main Content]
    A --> D[Right Sidebar]
    
    C --> E[Stories Section]
    C --> F[Posts Feed]
    C --> G[Quick Comment Form]
    
    B --> H[Navigations]
    H --> Home
    H --> Search
    H --> Spheres
    H --> Inbox
    H --> Create
    B --> I[User Profile]
    
    D --> J[Suggestions]
    D --> K[Trending Topics]
    
    F --> L[Post Card]
    L --> M[Post Header]
    L --> N[Post Content]
    L --> O[Post Footer]
    L --> P[Action Buttons]