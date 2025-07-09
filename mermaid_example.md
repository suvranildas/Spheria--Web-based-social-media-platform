# Mermaid Examples

## Simple Flowchart
```mermaid
flowchart TD
    A[Start] --> B{Is it working?}
    B -->|Yes| C[Great!]
    B -->|No| D[Try Again]
    D --> B
```

## Simple Sequence Diagram
```mermaid
sequenceDiagram
    User->>Browser: Click Button
    Browser->>Server: Send Request
    Server->>Database: Query Data
    Database-->>Server: Return Data
    Server-->>Browser: Send Response
    Browser-->>User: Show Result
```

## Simple Class Diagram
```mermaid
classDiagram
    class User {
        +String name
        +String email
        +login()
        +logout()
    }
    class Post {
        +String content
        +create()
        +delete()
    }
    User --> Post: creates
``` 


```mermaid
flowchart TD
    A[Web Page] -- Input Data --> B[Server (PHP)]
    B -- Gorgias Query --> C[Cloud Gorgias API]
    C -- Gorgias Query --> D[Cloud Gorgias]
    D -- Results/Explanation --> C
    C -- Results/Explanation --> B
    B -- Results & Explanation --> A

    subgraph Server
        B
        C
    end

    D[Cloud Gorgias]
``` 

flowchart TD
    User --> Login
    User --> Register
    Login -->  Web[Home Page]
    Register --> verify[Account verification]
    verify --> Web[Home Page]
    Server[PHP Serve]
    DB[(Database Encrypted Tables)]

    Web -- Send Input Data --> Server
    Server -- Query / Store Data<br/>(Encrypt/Decrypt) --> DB
    DB -- Return Data --> Server
    Server -- Send Results --> Web