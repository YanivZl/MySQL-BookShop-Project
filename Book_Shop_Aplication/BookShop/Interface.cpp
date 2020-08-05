//#include <iostream>
//using namespace std;
//
//class Messages {
//
//    void error_try_again_msg()
//    {
//        cout << "Wrong input, try again" << endl;
//    }
//
//    int first_menu()
//    {
//        int answer, i = 0;
//        cout << "Welcome to the book store!!!" << endl;
//        do
//        {
//            if (i > 0)
//                error_try_again_msg();
//            cout << "Register please:" << endl;
//            cout << "1. manager\n2. seller" << endl;
//            cin >> answer;
//            i++;
//        } while (answer != 1 && answer != 2);
//    }
//
//    int main_msg()
//    {
//        int answer, i = 0;
//        do
//        {
//            if (i > 0)
//                error_try_again_msg();
//            cout << "1. Buy book\n2. Sell book\n3. Find book\n4. Other options" << endl;
//            cin >> answer;
//            i++;
//        } while (answer < 1 || answer>4);
//
//        return answer;
//    }
//
//    int other_msg()
//    {
//        int answer, i = 0;
//        do
//        {
//            if (i > 0)
//                error_try_again_msg();
//            cout << "Choose one of the following:" << endl;
//            cout << "1. Oldest customer" << endl;
//            cout << "2. Oldest book" << endl;
//            cout << "3. Current order list" << endl;
//            cout << "4. Book's copies" << endl;
//            cout << "5. Most read writer between dates " << endl;
//            cout << "6. Top 3 customers who purchased the most books" << endl;
//            cout << "7. Which book has the most translations" << endl;
//            cout << "8. Customer's history purchase" << endl;
//            cout << "9. Calculate shipment cost" << endl;
//            cout << "10. If a customer ever split his order" << endl;
//            cout << "11. Current order status" << endl;
//            cout << "12. The amount of shipments made by Xpress" << endl;
//            cout << "13. The total money transferred to the store account via Bit" << endl;
//            cout << "14. Last 12 months that had more more profit than the average" << endl;
//            cout << "15. How many shipments were from the post office and Xperss" << endl;
//            cout << "16. Data on all the shipments that had more than 2 editions from the same book" << endl;
//            cout << "17. Data on all the customers that bought in the past and didn't buy book in the last 24 months" << endl;
//            cout << "18. List of customers that ordered a book and still did't buy" << endl;
//            cout << "19. Number of books in the main storage" << endl;
//            cout << "20. Number of books that the store bought between specific dates and the cost" << endl;
//            cout << "21. Store's profit on specific month" << endl;
//            cout << "22. Annual average monthly" << endl;
//            cout << "23. Specific worker's paycheck" << endl;
//            cout << "24. Worker with the most sales on specific month" << endl;
//            cin >> answer;
//            i++;
//        } while (answer < 1 || answer>25);
//
//        return answer;
//    }
//};
