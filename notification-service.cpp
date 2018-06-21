#include "notification-service.hpp"
/*
RecordSet NotificationService::GetNotificationsCounters()
{
    boost::optional<AccountID> account_id = mUnreadNotifications.GetAccount( Session::UserID(), Session::ClientID() );
    RecordSet all_accounts( CreateAccountCountersFormat() );
    if( account_id )
       for( NoticeCounters const& counters: mUnreadNotifications.GetNoticesCounters( account_id->ProfileId() ) )
       {
          all_accounts.AddRow( counters.ToRecord() );
       }
    return  all_accounts;
}
*/
