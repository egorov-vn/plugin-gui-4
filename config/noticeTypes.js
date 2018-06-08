function noticeTypes() {

   return {
      /**
       * Локальные типы уведомлений
       */
      localNoticeTypes: {
         Undefined:                       0,
         SystemErrorMessage:              1,
         SystemInfoMessage:               2,
         AccountMessage:                  3,

         NotificationMessage:             4,    // Сообщения
         NotificationNews:                5,    // Новости
         NotificationTask:                6,    // Задачи
         NotificationOther:               7,    // Прочие уведомления: тендер, вебинар, обращения, календарное событие, универсальное, совещание
         NotificationDoc:                 8,    // Документ,  принят, отклонен
         NotificationDemand:              9,    // Отчетность (Требования)
         NotificationReport:              10,   // Отчет: Отчёт ФНС сдан, Отчёт ФНС не принят, Уведомления о зашифрованной отчетности (Получен ответ)
         Letters:                         13,   // Письма из: ФНС, ПФР, Росстат

         AllNotifications:                100
      },

      getKey: function(value) {
         var object = this.localNoticeTypes;
         for (var key in object) {
            if (object.hasOwnProperty(key)) {
               if (object[key] === value) return key;
            }
         }
      },

      /**
       * Внешние типы уведомлений
       */
      externalNoticeTypes: {
         Undefined:                       0,
         SystemErrorMessage:              1,
         SystemInfoMessage:               2,
         AccountMessage:                  3,

         NotificationMessage:             4,
         NotificationNews:                5,
         NotificationTask:                6,
         NotificationCalendarEvent:       7,    // Календарное событие
         NotificationDoc:                 8,    // Документ
         NotificationDemand:              9,    // Отчетность (Требования)
         NotificationDocApproved:         10,   // Уведомление: Документ принят
         NotificationDocRejected:         11,   // Уведомление: Документ отклонен
         NotificationTenderNew:           12,   // Уведомление: Новый тендер
         NotificationWebinarStart:        13,   // Уведомление: Начат вебинар
         Treatment:                       14,   // Обращения (уведомление о переходе обращения в следующую фазу)
         NotificationMeetingNew:          15,   // Уведомление: Новое совещание
         FNSReportApproved:               16,   // Отчёт ФНС сдан
         FNSReportRejected:               17,   // Отчёт ФНС не принят
         LetterFromFNS:                   18,   // Письмо из ФНС (Федеральная Налоговая Служба)
         LetterFromPFR:                   19,   // Письмо из ПФР (Пенсионный Фонд России)
         LetterFromRosstat:               20,   // Письмо из Росстат (Федеральная служба государственной статистики)
         Universal:                       21,   // Универсальный тип уведомлений
         EncryptedReport:                 22,   // Уведомления о зашифрованной отчетности (Получен ответ)
         CommittedCalls:                  23,   // Входящие (совершаемые) звонки
         MissedCalls:                     24,   // Пропущенные звонки
         CallServiceMessages:             25,   // Сервисные сообщения
         NotificationFromNote:            26,   // Уведомление из заметки

         Instruction:                     27    // Инструкция
      },

      /**
       * Преобразование внешних типов уведомлений в локальный тип
       * @param {String} noticeType
       * @returns {Number}
       */
      toLocalNoticeType: function(noticeType) {
         switch (noticeType)
         {
            case this.externalNoticeTypes.Undefined:
               return this.localNoticeTypes.Undefined;
            case this.externalNoticeTypes.SystemErrorMessage:
               return this.localNoticeTypes.SystemErrorMessage;
            case this.externalNoticeTypes.SystemInfoMessage:
               return this.localNoticeTypes.SystemInfoMessage;
            case this.externalNoticeTypes.AccountMessage:
               return this.localNoticeTypes.AccountMessage;

            case this.externalNoticeTypes.NotificationMessage:
               return this.localNoticeTypes.NotificationMessage;
            case this.externalNoticeTypes.NotificationNews:
               return this.localNoticeTypes.NotificationNews;
            case this.externalNoticeTypes.NotificationTask:
               return this.localNoticeTypes.NotificationTask;

            case this.externalNoticeTypes.NotificationCalendarEvent:
            case this.externalNoticeTypes.NotificationTenderNew:
            case this.externalNoticeTypes.NotificationWebinarStart:
            case this.externalNoticeTypes.NotificationMeetingNew:
            case this.externalNoticeTypes.Universal:
            case this.externalNoticeTypes.Treatment:
               // Звонки
            case this.externalNoticeTypes.CommittedCalls:
            case this.externalNoticeTypes.MissedCalls:
            case this.externalNoticeTypes.CallServiceMessages:
               // Уведомление из заметки
            case this.externalNoticeTypes.NotificationFromNote:
               // Прочие
            case this.externalNoticeTypes.Instruction:
               return this.localNoticeTypes.NotificationOther;

            case this.externalNoticeTypes.NotificationDoc:
            case this.externalNoticeTypes.NotificationDocApproved:
            case this.externalNoticeTypes.NotificationDocRejected:
               return this.localNoticeTypes.NotificationDoc;

            case this.externalNoticeTypes.NotificationDemand:
               return this.localNoticeTypes.NotificationDemand;

            case this.externalNoticeTypes.FNSReportRejected:
            case this.externalNoticeTypes.FNSReportApproved:
            case this.externalNoticeTypes.EncryptedReport:
               return this.localNoticeTypes.NotificationReport;

            case this.externalNoticeTypes.LetterFromFNS:
            case this.externalNoticeTypes.LetterFromPFR:
            case this.externalNoticeTypes.LetterFromRosstat:
               return this.localNoticeTypes.Letters;
         }

         return this.localNoticeTypes.Undefined;
      },

      /**
       * Преобразование локального типа уведомления во внешний тип используемый в приложении
       * @param {Number} noticeType
       * @returns {String[]}
       */
      toExternalNoticeType: function(noticeType) {
         switch (noticeType)
         {
            case this.localNoticeTypes.Undefined:
               return [ this.externalNoticeTypes.Undefined ];
            case this.localNoticeTypes.SystemErrorMessage:
               return [ this.externalNoticeTypes.SystemErrorMessage ];
            case this.localNoticeTypes.SystemInfoMessage:
               return [ this.externalNoticeTypes.SystemInfoMessage ];
            case this.localNoticeTypes.AccountMessage:
               return [ this.externalNoticeTypes.AccountMessage ];

            case this.localNoticeTypes.NotificationMessage:
               return [ this.externalNoticeTypes.NotificationMessage ];
            case this.localNoticeTypes.NotificationNews:
               return [ this.externalNoticeTypes.NotificationNews ];
            case this.externalNoticeTypes.NotificationTask:
               return [ this.externalNoticeTypes.NotificationTask ];

            case this.localNoticeTypes.NotificationOther:
               return [
                  this.externalNoticeTypes.NotificationTenderNew,
                  this.externalNoticeTypes.NotificationCalendarEvent,
                  this.externalNoticeTypes.NotificationWebinarStart,
                  this.externalNoticeTypes.NotificationMeetingNew,
                  this.externalNoticeTypes.Universal,
                  this.externalNoticeTypes.Treatment,
                  // Звонки
                  this.externalNoticeTypes.CommittedCalls,
                  this.externalNoticeTypes.MissedCalls,
                  this.externalNoticeTypes.CallServiceMessages,
                  // Уведомление из заметки
                  this.externalNoticeTypes.NotificationFromNote,
                  // Прочие
                  this.externalNoticeTypes.Instruction
               ];

            case this.localNoticeTypes.NotificationDoc:
               return [
                  this.externalNoticeTypes.NotificationDoc,
                  this.externalNoticeTypes.NotificationDocApproved,
                  this.externalNoticeTypes.NotificationDocRejected
               ];

            case this.localNoticeTypes.NotificationDemand:
               return [ this.externalNoticeTypes.NotificationDemand ];

            case this.localNoticeTypes.NotificationReport:
               return [
                  this.externalNoticeTypes.FNSReportRejected,
                  this.externalNoticeTypes.FNSReportApproved,
                  this.externalNoticeTypes.EncryptedReport
               ];

            case this.localNoticeTypes.Letters:
               return [
                  this.externalNoticeTypes.LetterFromFNS,
                  this.externalNoticeTypes.LetterFromPFR,
                  this.externalNoticeTypes.LetterFromRosstat
               ];

            case this.localNoticeTypes.AllNotifications:
               return [
                  this.externalNoticeTypes.NotificationMessage,
                  this.externalNoticeTypes.NotificationNews,
                  this.externalNoticeTypes.NotificationTask,
                  this.externalNoticeTypes.NotificationCalendarEvent,
                  this.externalNoticeTypes.NotificationDoc,
                  this.externalNoticeTypes.NotificationDemand,
                  this.externalNoticeTypes.NotificationDocApproved,
                  this.externalNoticeTypes.NotificationDocRejected,
                  this.externalNoticeTypes.NotificationTenderNew,
                  this.externalNoticeTypes.NotificationWebinarStart,
                  this.externalNoticeTypes.Treatment,
                  this.externalNoticeTypes.NotificationMeetingNew,
                  this.externalNoticeTypes.FNSReportApproved,
                  this.externalNoticeTypes.FNSReportRejected,
                  this.externalNoticeTypes.LetterFromFNS,
                  this.externalNoticeTypes.LetterFromPFR,
                  this.externalNoticeTypes.LetterFromRosstat,
                  this.externalNoticeTypes.Universal,
                  this.externalNoticeTypes.EncryptedReport,
                  this.externalNoticeTypes.CommittedCalls,
                  this.externalNoticeTypes.MissedCalls,
                  this.externalNoticeTypes.CallServiceMessages,
                  this.externalNoticeTypes.NotificationFromNote,
                  // Прочие
                  this.externalNoticeTypes.Instruction
               ];
         }

         return [ this.externalNoticeTypes.Undefined ];
      }
   };
}