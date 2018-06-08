function mainRegionConfig() {

   return [
      {
         "id": "AllNotifications",
         "caption": rk("Лента уведомлений"),
         "message": rk("Здесь будут появляться уведомления"),
         "icon": "",
         "order": 10,
         "auth": true,

         "contentTpl": "SBISPlugin/Common/NotificationsBase/NotificationsBase",
         "counterEvent": "NoticeCenter.OnNotice"
      },

      {
         "id": "NotificationMessage",
         "caption": rk("Сообщения"),
         "message": rk("Здесь будут появляться сообщения от Ваших коллег"),
         "icon": "icon-menuMessages",
         "img": "menuMessages",

         "order": 20,
         "auth": true,

         "contentTpl": "SBISPlugin/Common/NotificationsBase/NotificationsBase",
         "counterEvent": "NoticeCenter.OnNotice"
      },

      {
         "id": "NotificationTask",
         "caption": rk("Задачи"),
         "message": rk("Здесь будут появляться задачи"),
         "icon": "icon-task",
         "img": "task",

         "order": 30,
         "auth": true,

         "contentTpl": "SBISPlugin/Common/NotificationsBase/NotificationsBase",
         "counterEvent": "NoticeCenter.OnNotice"
      },

      {
         "id": "NotificationNews",
         "caption": rk("Новости"),
         "message": rk("Здесь будут появляться новости Вашей компании"),
         "icon": "icon-menuNews",
         "img": "menuNews",

         "order": 40,
         "auth": true,

         "contentTpl": "SBISPlugin/Common/NotificationsBase/NotificationsBase",
         "counterEvent": "NoticeCenter.OnNotice"
      },

      {
         "id": "NotificationDoc",
         "caption": rk("Документы"),
         "message": rk("Здесь будут появляться документы"),
         "icon": "icon-papeerPlane",
         "img": "papeerPlane",

         "order": 50,
         "auth": true,

         "contentTpl": "SBISPlugin/Common/NotificationsBase/NotificationsBase",
         "counterEvent": "NoticeCenter.OnNotice"
      },

      {
         "id": "NotificationDemand",
         "caption": rk("Требования"),
         "message": rk("Здесь будут появляться документы отчетности"),
         "icon": "icon-Surveyors",
         "img": "Surveyors",

         "order": 60,
         "auth": true,

         "contentTpl": "SBISPlugin/Common/NotificationsBase/NotificationsBase",
         "counterEvent": "NoticeCenter.OnNotice"
      },

      {
         "id": "NotificationReport",
         "caption": rk("Отчеты"),
         "message": rk("Здесь будут появляться документы отчетности"),
         "icon": "icon-menuRequirements",
         "img": "menuRequirements",

         "order": 70,
         "auth": true,

         "contentTpl": "SBISPlugin/Common/NotificationsBase/NotificationsBase",
         "counterEvent": "NoticeCenter.OnNotice"
      },

      {
         "id": "Letters",
         "caption": rk("Письма"),
         "message": rk("Здесь будут появляться письма из ФНС, ПФР, Росстат"),
         "icon": "icon-envelope",
         "img": "envelope",

         "order": 80,
         "auth": true,

         "contentTpl": "SBISPlugin/Common/NotificationsBase/NotificationsBase",
         "counterEvent": "NoticeCenter.OnNotice"
      },

      {
         "id": "NotificationOther",
         "caption": rk("Прочие уведомления"),
         "message": rk("Здесь будут появляться уведомления"),
         "icon": "icon-menuNotifications",
         "img": "menuNotifications",

         "order": 90,
         "auth": true,

         "contentTpl": "SBISPlugin/Common/NotificationsBase/NotificationsBase",
         "counterEvent": "NoticeCenter.OnNotice"
      }
   ];
}