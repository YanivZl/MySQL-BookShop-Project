#pragma once
#include <iostream>
#include "AnarAndYanivBookShop.h"


#define UNDERLINE "\033[4m"

#define CLOSEUNDERLINE "\033[0m"

using namespace std;

class Messages {

public:
    AnarAndYanivBookShop bookshop;
    int managerCheck;
    void error_try_again_msg()
    {
        cout << "\tWrong input, try again" << endl;
    }

    int first_menu(string& full_name)
    {
        system("CLS");
        int check_res;
        string user_name, pass, str;
        while(1)
        {
            cout << "\n\t\t" << UNDERLINE << "Welcome to the book store!!!" << CLOSEUNDERLINE << endl;
            cout << "\n\tPlease Login:" << endl << endl;
            cout << "\t\tUser Name: ";
            cin >> user_name;
            cout << "\t\tPassword: ";
            cin >> pass;
            check_res = bookshop.checkUserNameAndPass(user_name , pass , full_name);
            if (check_res) // Connected
            {
                Sleep(1000);
                system("CLS");
            }
            if (!check_res) // Not connected
            { 
                cout << "\n\t\tLogin error.\n";
                Sleep(1000);
                system("CLS");
                continue;
            }
            if (check_res)
                return check_res;
        }
    }

    int main_msg()
    {
        int answer, i = 0;
        do
        {
            if (i > 0)
                error_try_again_msg();
            cout << "1. Buy book\n2. Sell book\n3. Find book\n4. Other options" << endl;
            cin >> answer;
            i++;
        } while (answer < 1 || answer>4);

        return answer;
    }

    //int other_msg(int isManager , const string& full_name)
    //{
    //    int answer;
    //    string tabtab = "\t\t";
    //    vector<string> sheiltas{ 
    //        "Check if book in stock" , 
    //        "Oldest customer" , 
    //        "Oldest book" , 
    //        "Current order list" , 
    //        "How many copies of book has been sold" , 
    //        "Most read writer between dates" , 
    //        "Top 3 customers who purchased the most books" ,  
    //        "Which book has the most translations" ,
    //        "Customer's purchase history" , 
    //        "Customer's order history" ,
    //        "Calculate shipment cost" ,
    //        "If a customer ever split his order" ,
    //        "Current order status" , 
    //        "The amount of shipments made by Xpress" ,
    //        "The total money transferred to the store account via Bit" ,
    //        "Last 12 months that had more more profit than the average" ,
    //        "How many shipments were from the post office and Xperss" ,
    //        "Data on all the shipments that had more than 2 editions from the same book" ,
    //        "Data on all the customers that bought in the past and didn't buy book in the last 24 months" , 
    //        "List of customers that ordered a book and still did't buy" ,
    //        "Number of books in the main storage" ,
    //        "Number of books that the store bought between specific dates and the cost" ,
    //        "Store's profit on specific month" , 
    //        "Annual average monthly" ,
    //        "Specific worker's paycheck" ,
    //        "Worker with the most sales on specific month"
    //    };
    //    while(1)
    //    {
    //        if (isManager == 2) // Manager 
    //            cout << "\n\t\t" << UNDERLINE << "Hellow " << full_name << " --Manager--" << CLOSEUNDERLINE << endl;
    //        if (isManager == 1) // Regular employee
    //            cout << "\n\t" << UNDERLINE << "Hellow " << full_name << CLOSEUNDERLINE << endl;
    //        cout << "\n\tChoose one of the following:\n" << endl;
    //        for (int i = 0; i < sheiltas.size(); i++)
    //            cout << tabtab << i + 1 << ". " << sheiltas[i] << endl;
    //        cin >> answer;
    //        if (answer < 1 || answer > 25) { error_try_again_msg(); Sleep(1000); }
    //        system("CLS");
    //        if (answer >= 1 && answer <= 25)
    //            break;

    //    }

    //    cout << "\n\t" << UNDERLINE << "**" + sheiltas[(size_t)(answer - 1)] + "**"<< CLOSEUNDERLINE << endl;
    //    return answer;
    //}

    int other_msg(int isManager, const string& full_name)
    {
        int answer;
        string tabtab = "\t\t";
         vector<int> managerOptions{
             5, 12, 14, 15, 16, 22, 23, 24, 25, 26
         };
        vector<string> sheiltas{
            "Check if book in stock" ,
            "Oldest customer" ,
            "Oldest book" ,
            "Current order list" ,
            "How many copies of book has been sold" ,
            "Most read writer between dates" ,
            "Top 3 customers who purchased the most books" ,
            "Which book has the most translations" ,
            "Customer's purchase history" ,
            "Customer's order history" ,
            "Calculate shipment cost" ,
            "If a customer ever split his order" ,
            "Current order status" ,
            "The amount of shipments made by Xpress" ,
            "The total money transferred to the store account via Bit" ,
            "Last 12 months that had more more profit than the average" ,
            "How many shipments were from the post office and Xperss" ,
            "Data on all the shipments that had more than 2 editions from the same book" ,
            "Data on all the customers that bought in the past and didn't buy book in the last 24 months" ,
            "List of customers that ordered a book and still did't buy" ,
            "Number of books in the main storage" ,
            "Number of books that the store bought between specific dates and the cost" ,
            "Store's profit on specific month" ,
            "Annual average monthly" ,
            "Specific worker's paycheck" ,
            "Worker with the most sales on specific month"
        };
        while (1)
        {
            if (isManager == 2) // Manager 
                cout << "\n\t\t" << UNDERLINE << "Hello " << full_name << " --Manager--" << CLOSEUNDERLINE << endl;

            else if (isManager == 1) // Regular employee
                cout << "\n\t" << UNDERLINE << "Hello " << full_name << CLOSEUNDERLINE << endl;

            cout << "\n\tChoose one of the following:\n" << endl;

            for (int i = 0; i < sheiltas.size(); i++)
            {
                if (isManager == 2)
                {
                    cout << tabtab << i + 1 << ". " << sheiltas[i] << endl;
                }
                else
                {
                     int managerCheck = 0;  
                     for (int j = 0; j < managerOptions.size(); j++)
                     {
                         if(i+1 == managerOptions[j])
                             managerCheck = 1;
                     }
                    if (!managerCheck)
                    {
                        if (i + 1 == 5 || i + 1 == 12 || i + 1 == 14 || i + 1 == 15 || i + 1 == 16 || i + 1 == 22 || i + 1 == 23 || i + 1 == 24 || i + 1 == 25 || i + 1 == 26)
                            continue;
                        if (i + 1 >= 5 && i + 1 < 12)
                            cout << tabtab << i << ". " << sheiltas[i] << endl;
                        else if (i + 1 >= 12 && i + 1 < 14)
                            cout << tabtab << i - 1 << ". " << sheiltas[i] << endl;
                        else if (i + 1 >= 14 && i + 1 < 22)
                            cout << tabtab << i - 4 << ". " << sheiltas[i] << endl;
                        else
                            cout << tabtab << i + 1 << ". " << sheiltas[i] << endl;
                    }
                }
            }
            cin >> answer;
            if (isManager == 1)
            {
                if (answer >= 5 && answer <= 10)
                    answer++;
                else if (answer == 11)
                    answer += 2;
                else if (answer >= 12 && answer <= 16)
                    answer += 5;
                else
                    answer += 10;
            }
            if (answer < 1 || answer > 26) { error_try_again_msg(); Sleep(1000); }
            system("CLS");
            if (answer >= 1 && answer <= 26)
                break;

        }

        cout << "\n\t" << UNDERLINE << "*" + sheiltas[(size_t)(answer - 1)] + "*" << CLOSEUNDERLINE << endl;
        return answer;
    }


    int execute_selected_query(int choice)
    {
        switch (choice)
        {
        case 1:
            cout << "\n\t1. By book name\n\t2. By author name\n\n\t";
            cin >> choice;
            while (1)
            {
                if (choice == 1) { bookshop.getBookFromStockByBookName(); break; }
                if (choice == 2) { bookshop.getBookFromStockByAuthorName(); break; }
                else
                    error_try_again_msg();
            }
            break;
        case 2:
            bookshop.whoIsTheFirstCustomerInTheShop();
            break;
        case 3:
            bookshop.oldestBookInTheStock();
            break;
        case 4:
            bookshop.ordersList();
            break;
        case 5:
            bookshop.howMuchOfBookHasBeenSold();
            break;
        case 6:
            bookshop.whoIsTheMostReadAuthor();
            break;
        case 7:
            bookshop.listOf3BestCustomers();
            break;
        case 8:
            bookshop.whoIsTheBookWithMostTranslations();
            break;
        case 9:
            bookshop.customerHistory();
            break;
        case 10:
            bookshop.orderHistoryByCustomer();
            break;
        case 11:
            bookshop.calculateDeliveryPriceBySelectedBooks();
            break;
        case 12:
            bookshop.getInfoIfCustomerEverSplitDealToFewDeliveries();
            break;
        case 13: 
            bookshop.getDeliveryStatus();
            break;
        case 14:
            bookshop.getNumberOfDeliveriesThatDoneByXpressInSpecificMonth();
            break;
        case 15: 
            bookshop.getSumOfBitAppIncomeInSpecificMonth();
            break;
        case 16:
            bookshop.getDealsFromPastYearAndMoreProfitableThanLastYearAVG();
            break;
        case 17:
            bookshop.howManyDeliveriesDeliveredWithEachCompany();
            break;
        case 18:
            bookshop.getInfoIfCustomerEverSplitDealToFewDeliveries();
            break;
        case 19:
            bookshop.customersDidntBuyBookInLast24Month();
            break;
        case 20:
            bookshop.getOrdersThatArrivedBefore14DaysAndNotBoughtYet();
            break;
        case 21:
            bookshop.getNumberOfBooksInShopByMonthlyCut();
            break;
        case 22:
            bookshop.howManyBooksTheStoreBoughtBetweenDatesAndThePrice();
            break;
        case 23: 
            bookshop.storesProfitOnSpecificMonth();
            break;
        case 24:
            bookshop.getPastYearDealsAVGbyMonthlyCut();
            break;
        case 25:
            bookshop.getSalaryOfEmployeeByMonth();
            break;
        case 26:
            bookshop.sellerWithTheMostSalesPerMonth();
            break;
        default:
            break;
        }
        while(1)
        {
            cout << "\n\t1.Main Menu\n\t2.Exit\n\n\t";
            cin >> choice;
            if (choice != 1 && choice != 2) { error_try_again_msg(); Sleep(1000); }
            else{   Sleep(1000); return choice;  }
        }
    }
};