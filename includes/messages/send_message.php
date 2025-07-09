<?php
session_start();
require_once __DIR__ . '/../config.php';
require_once __DIR__ . '/../db.php';
require_once __DIR__ . '/../encryption/MessageEncryption.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $conversation_id = $_POST['conversation_id'];
    $message = $_POST['message'];
    $sender_id = $_SESSION['user_id'];
    
    try {
        // Get conversation encryption key
        $get_key = $db->prepare("SELECT encryption_key FROM conversation_keys WHERE conversation_id = ?");
        $get_key->bind_param("i", $conversation_id);
        $get_key->execute();
        $key_result = $get_key->get_result();
        
        if ($key_result->num_rows === 0) {
            // Generate new encryption key for conversation
            $encryption = new MessageEncryption();
            $conversation_key = $encryption->generateKey();
            
            // Store the key
            $store_key = $db->prepare("INSERT INTO conversation_keys (conversation_id, encryption_key) VALUES (?, ?)");
            $store_key->bind_param("is", $conversation_id, $conversation_key);
            $store_key->execute();
        } else {
            $conversation_key = $key_result->fetch_assoc()['encryption_key'];
        }
        
        // Encrypt the message
        $encryption = new MessageEncryption();
        $encrypted_data = $encryption->encrypt($message, $conversation_key);
        
        // Insert encrypted message
        $insert_message = $db->prepare("
            INSERT INTO messages (
                conversation_id, 
                sender_id, 
                content,
                encrypted_content,
                iv,
                tag,
                created_at
            ) VALUES (?, ?, ?, ?, ?, ?, NOW())
        ");
        
        $insert_message->bind_param(
            "iissss",
            $conversation_id,
            $sender_id,
            $message, // Store original message for display
            $encrypted_data['encrypted'],
            $encrypted_data['iv'],
            $encrypted_data['tag']
        );
        
        if ($insert_message->execute()) {
            // Return message data for immediate display
            echo json_encode([
                'success' => true,
                'message_id' => $db->insert_id,
                'content' => $message,
                'encrypted_content' => $encrypted_data['encrypted'],
                'iv' => $encrypted_data['iv'],
                'tag' => $encrypted_data['tag']
            ]);
        } else {
            throw new Exception('Failed to send message');
        }
    } catch (Exception $e) {
        echo json_encode([
            'success' => false,
            'error' => $e->getMessage()
        ]);
    }
}
?>