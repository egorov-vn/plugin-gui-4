import QtQuick 1.1

QtObject {

    property variant storage;

    function isExist()
    {
        return (storage ? true : false);
    }

    function set(key, value)
    {
        var local = storage ? storage : {};
        local[key] = value;
        storage = local;
    }

    function append(obj)
    {
        var local = storage ? storage : {};

        var keys = Object.keys(obj);
        for (var i = 0; i < keys.length; i++) {
            if (keys[i] !== "")
                local[keys[i]] = obj[keys[i]];
        }

        storage = local;
    }

    function get(key)
    {
        var local = storage ? storage : {};
        var value = local[key] ? local[key] : "";
        return value;
    }

    function getAll()
    {
        return storage;
    }

    function remove(key)
    {
        var local = storage ? storage : {};
        delete local[key];
        storage = local;
    }

    function isKeyExist(key)
    {
        var local = storage ? storage : {};
        if (local[key])
            return true;
        return false;
    }

    function keys()
    {
        var local = storage ? storage : {};
        return Object.keys(local);
    }

    function count()
    {
        var local = storage ? storage : {};
        var count = 0;

        var keys = Object.keys(local);
        for (var i = 0; i < keys.length; i++)
        {
            if (keys[i] !== "") count ++;
        }

        return count;
    }

    function clear()
    {
        var local = {};
        storage = local;
    }
}
