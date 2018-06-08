function settings() {

   /**
    * Данные раздела настроек. Описание всех разделов.
    */

    return [
        {
            id: 'common',
            caption: 'Общее',
            icon: 'settings',
            source: 'Plugin/Settings/Common',
            groupId: 1
        },

        {
            id: 'network',
            caption: 'Сеть',
            icon: 'tFNetwork',
            source: 'Plugin/Settings/Network',
            groupId: 1
        },

        {
            id: 'diagnostic',
            caption: 'Диагностика',
            icon: 'admin2',
            source: 'Plugin/Settings/Diagnostic',
            groupId: 1
        },

        {
            id: "notifications",
            caption: "Уведомления",
            icon: "bell",
            source: "Plugin/Settings/Notifications",
            groupId: 2,
            auth: true
        },

        {
            id: 'about',
            caption: 'О программе',
            icon: 'info',
            source: 'Plugin/Settings/About',
            groupId: 3
        }
    ];
}
