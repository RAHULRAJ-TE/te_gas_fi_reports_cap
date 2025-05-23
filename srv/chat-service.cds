using {te.gas.ai as db} from '../db/schema';

service ChatService @(requires: 'authenticated-user') {

// @(restrict: [{
//         grant: ['READ','WRITE', 'DELETE'],
//         where: 'userID = $user'
//     }])

    entity Conversation  as projection on db.Conversation;
    entity Message      as projection on db.Message;

    type RagResponse_AdditionalContents { 

        score       : String;
        pageContent : String;
    }

    type RagResponse {
        role               : String;
        content            : String;
        messageTime        : String;
        additionalContents : array of RagResponse_AdditionalContents;
    }

   // action   getChatRagResponse(conversationId : String, messageId : String, message_time : Timestamp, user_id : String, user_query : String) returns RagResponse;
    function deleteChatData() returns String;
}
