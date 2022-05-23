SELECT distinct(income_level), avg(average_balance),avg(q1_balance), avg(q2_balance), avg(q3_balance) 
FROM credit_card_data GROUP BY Income_Level;

SELECT distinct(reward), count(offer_accepted) FROM credit_card_data WHERE offer_accepted='Yes' GROUP BY reward;
SELECT distinct(Mailer_Type), count(offer_accepted) FROM credit_card_data WHERE offer_accepted='Yes' GROUP BY mailer_type;
SELECT distinct(income_level), count(offer_accepted) FROM credit_card_data WHERE offer_accepted='Yes' GROUP BY income_level;
SELECT distinct(Bank_Accounts_Open), count(offer_accepted) FROM credit_card_data WHERE offer_accepted='Yes' GROUP BY Bank_Accounts_Open;
SELECT distinct(Overdraft_Protection), count(offer_accepted) FROM credit_card_data WHERE offer_accepted='Yes' GROUP BY Overdraft_Protection;
SELECT distinct(Credit_Rating), count(offer_accepted) FROM credit_card_data WHERE offer_accepted='Yes' GROUP BY credit_rating;
SELECT distinct(Credit_Cards_Held), count(offer_accepted) FROM credit_card_data WHERE offer_accepted='Yes' GROUP BY Credit_Cards_Held;
SELECT distinct(Homes_Owned), count(offer_accepted) FROM credit_card_data WHERE offer_accepted='Yes' GROUP BY Homes_Owned;
SELECT distinct(Own_Your_Home), count(offer_accepted) FROM credit_card_data WHERE offer_accepted='Yes' GROUP BY Own_Your_Home;

SELECT * FROM credit_card_data WHERE Overdraft_Protection = 'No' AND Offer_Accepted = 'Yes';
