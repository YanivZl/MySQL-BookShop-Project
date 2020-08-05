#pragma once

#include "MySQL.h"
#include <vector>
#include <algorithm>
#include <time.h>
#define ISRAEL_POST_KG_PRICE 10
#define XPRESS_KG_PRICE	15
#define ISRAEL_POST_SLOW_PRICE 10
#define ISRAEL_POST_AVG_PRICE 20
#define ISRAEL_POST_FAST_PRICE 30
#define XPRESS_TA_PRICE 10
#define XPRESS_DELIVERY_PRICE 30


class AnarAndYanivBookShop
{
private:
	MySQL mysql;
public:

	//Enter to the book shop func
	int checkUserNameAndPass(const string& user_name, const string& pass , string& full_name);

	// All functions will use mysql.returnSqlQuery(...)
	void showTables();
	void getBookFromStockByBookName(); // Sheilta 1.1
	void getBookFromStockByAuthorName();// Sheilta 1.1
	void whoIsTheFirstCustomerInTheShop();// Sheilta 2
	void oldestBookInTheStock(); // Sheilta 3
	void ordersList();// Sheilta 4
	void howMuchOfBookHasBeenSold(); // Sheilta 5
	void whoIsTheMostReadAuthor(); // Sheilta 6
	void listOf3BestCustomers(); // Sheilta 7
	void whoIsTheBookWithMostTranslations(); // Sheilta 8
	void customerHistory(); // Sheilta 9
	void orderHistoryByCustomer(); // Sheilta 10
	void calculateDeliveryPriceBySelectedBooks(); // Sheilta 11
	void getInfoIfCustomerEverSplitDealToFewDeliveries();// Sheilta 12
	void getDeliveryStatus(); // Sheilta 13
	void getNumberOfDeliveriesThatDoneByXpressInSpecificMonth(); // Sheilta 14
	void getSumOfBitAppIncomeInSpecificMonth(); // Sheilta 15
	void getDealsFromPastYearAndMoreProfitableThanLastYearAVG(); // Sheita 16
	void howManyDeliveriesDeliveredWithEachCompany(); // Sheilta 17
	void allDeliveriesWithTwoDiffrentBookEditions(); // Sheilta 18
	void customersDidntBuyBookInLast24Month(); // Sheilta 19
	void getOrdersThatArrivedBefore14DaysAndNotBoughtYet(); // Sheilta 20
	void getNumberOfBooksInShopByMonthlyCut(); // Sheilta 21
	void howManyBooksTheStoreBoughtBetweenDatesAndThePrice(); // Sheilta 22a
	void storesProfitOnSpecificMonth(); // Sheilta 22b
	void getPastYearDealsAVGbyMonthlyCut(); // Sheita 23
	void getSalaryOfEmployeeByMonth(); // Sheilta 24
	void sellerWithTheMostSalesPerMonth(); // Sheilta 25



};