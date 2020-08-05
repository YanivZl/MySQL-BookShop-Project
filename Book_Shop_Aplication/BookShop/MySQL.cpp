#include "MySQL.h"

MySQL::MySQL()
{
    i = 0;
    row = NULL;
    res_set = NULL;
    connect = mysql_init(NULL);
    if (!connect)
    {
        cout << "MySQL Initialization Failed";
    }

    connect = mysql_real_connect(connect, SERVER, USER, PASSWORD, DATABASE, 3306, NULL, 0);


    if (connect)
    {
        cout << "Connection Succeeded\n";
    }

    else
    {
        cout << "Connection Failed\n";
    }
}


int MySQL::returnSqlQuery(string& str, const string& query)
{
    mysql_query(connect, query.c_str());
    i = 0;
    res_set = mysql_store_result(connect); // return NULL if not find.
    if (!res_set)
    {
        str = "Error.\n";
        return 0;
    }
    uint64_t numrows = mysql_num_rows(res_set); // throw exception if res_set is NULL
    uint64_t numfiedls = mysql_num_fields(res_set);
    if (!numrows)
    {
        str = "Empty result.\n";
        return 0;
    }
    while ((row = mysql_fetch_row(res_set)) != NULL)
    {
        for (int j = 0; j < numfiedls; j++)
        {
            str += row[j];
            str += '\t';
            //cout << row[i] << endl; // **To check the prints
        }
        str += '\n';
    }
    if (str.size() > 2)
    {
        str.pop_back();
        str.pop_back();
    }
    return 1;
}

MySQL :: ~MySQL()
{
    mysql_close(connect);
}
