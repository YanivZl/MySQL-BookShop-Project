#pragma once

#include <iostream>
#include <mysql.h>
#include <string>
#define SERVER "localhost"
#define USER "user"
#define PASSWORD "user9090"
#define DATABASE "bookshop"

using namespace std;

class MySQL
{
protected:
    /** MySQL connectivity Variables */
    MYSQL* connect;
    MYSQL_RES* res_set;
    MYSQL_ROW row;

    unsigned int i;

public:
    /** MySQL Constructor */
    MySQL();

    /* Function to do some sql queries return the result to str, if succes return 1, and if not return 0*/
    int returnSqlQuery(string& str , const string& query);



    /** MySQL Destructor */
    ~MySQL();
};
