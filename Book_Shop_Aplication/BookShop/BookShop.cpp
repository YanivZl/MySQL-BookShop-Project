// BookShop.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>
#include "Interface.h"
int main()
{
    Messages msg;
    string full_name;
    int isManger = msg.first_menu(full_name);
    while(1)
    {
        int query_choice = msg.other_msg(isManger, full_name);
        int choice = msg.execute_selected_query(query_choice);
        if (choice == 2)
            break;
    }
    cout << "\n\t" << full_name << ", Have a nice day!\n\tGoodbye!" << endl;
    Sleep(1000);
}

// Run program: Ctrl + F5 or Debug > Start Without Debugging menu
// Debug program: F5 or Debug > Start Debugging menu

// Tips for Getting Started: 
//   1. Use the Solution Explorer window to add/manage files
//   2. Use the Team Explorer window to connect to source control
//   3. Use the Output window to see build output and other messages
//   4. Use the Error List window to view errors
//   5. Go to Project > Add New Item to create new code files, or Project > Add Existing Item to add existing code files to the project
//   6. In the future, to open this project again, go to File > Open > Project and select the .sln file
