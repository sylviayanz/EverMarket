# EverMarket E-Commerce Analysis

## Company Background
Established in 2018, EverMarket is a global e-commerce leader specializing in premium consumer electronics. 

The company operates through an omnichannel distribution strategy, leveraging both its web platform and mobile application to serve an international customer base. EverMarket's marketing ecosystem encompasses strategic digital initiatives, including targeted email campaigns, search engine optimization (SEO), and affiliate partnerships. The company's product portfolio prominently features high-demand offerings from industry-leading manufacturers such as Apple, Samsung, and ThinkPad, consistently driving significant market share in the consumer electronics sector.


# Data Structure & Initial Checks
EverMarket has a core dataset consisting of orders, order statuses, customers, products, and geographic information, with a total row count of 108,127 records.

The Entity Relationship Diagram can be found  [here](https://github.com/sylviayanz/EverMarket/blob/main/EverMarket%20ERD.png).

The data cleaning change log can be found [here](https://docs.google.com/document/d/1x_6FtqfkpM4P56TlK2onV0IGhUkG6LhKkhMfuDUR2Mo/edit?usp=sharing).

The SQL queries performed to uncover these insights can be found [here](https://console.cloud.google.com/bigquery?sq=820445983612:163ccacdd3554467b238d23659276b75).

The interactive dashboard can be found [here](https://public.tableau.com/app/profile/sylvia.tsai/viz/EverMarketSalesPerformanceDashboard/SalesDashboard).

# Executive Summary
<img width="989" alt="Screenshot 2025-03-03 at 6 43 54 PM" src="https://github.com/user-attachments/assets/dbac6f1f-eb2f-4a8a-b196-99502c951d27" />

From 2019 to 2022, EverMarket generated **$28M in total revenue across 108K orders, with an average order value (AOV) of $260.** The sales trends across these four years showed significant fluctuations.

 - **COVID Surge:**  
	 - 2020 marked an exceptional year as consumer behavior shifted toward online ordering. The company experienced a sharp increase across all key performance metrics, **with revenue soaring by 163%, orders doubling, and average order value (AOV) increasing by 31%.** 
	 - Notably, March 2020 saw the highest percentage increase in sales, coinciding with the onset of COVID-19 lockdowns—highlighting the profound impact of pandemic-driven consumer behavior.
 
 - **Momentum Reversed:** 
	 - December 2020 marked the peak across all key metrics, but the company has experienced a downturn since then. 
	 - **In 2021, despite a 6% increase in order volume, total sales declined by 10%,** indicating that order growth did not translate into revenue due to a significant drop in average order value (AOV) from 2020 levels. 
	 - This downward trend intensified in 2022, with **total sales plummeting by 46% and order volume falling by 40%**, as the market gradually returned to pre-pandemic norms.
 
 - **Loyalty Program:** 
	 - Since its launch, the Loyalty Program has demonstrated consistent and substantial growth. Its share of total revenue increased nearly fivefold—**from 11% in 2019 to 53% by 2021—and remained at that elevated level through 2022**, underscoring its effectiveness in driving both customer engagement and revenue contribution. 
	 - Moreover, loyalty members consistently outperformed non-members, with their **average order value (AOV) steadily increasin**g over time, while non-member AOV experienced a notable decline.
    
 - **Product Performance:** 
	 - **The 4K gaming monitor emerged as the top-performing product, contributing 35% of total sales.** 
	 - Apple also led as the top brand, accounting for 50% of overall revenue. It’s worth highlighting that MacBook Air sales **increased by 383%** in 2020, largely driven by the shift to remote work during the pandemic.




# Insights Deep Dive



																																									
## Sales Trends

<img width="1175" alt="Screenshot 2025-05-06 at 11 09 58 AM" src="https://github.com/user-attachments/assets/9cb57248-8551-4103-be24-4ed1d1afe74b" />

 -   **Peak Performance in 2020:**  
	 - 2020 marked the company’s strongest year, with annual revenue reaching a record high of **$10 million**—a **163% increase** from 2019. 
	 - The average order value (AOV) rose to **$300**  in 2020, reflecting a **31% year-over-year growth**. 
	 - **Sales began to surge in March 2020 with a 50% month-over-month increase, eventually peaking in December at $1.25 million.** This highlights the strong impact of pandemic-driven consumer behavior, as demand for electronic gadgets soared amid the shift to at-home lifestyles.
    
 - **Post-Pandemic Decline:**  
	-  	Following the pandemic, consumers became more cautious about high-value purchases. As a result, total sales declined by **10% in 2021**, and the downward trend intensified in 2022, with a **46% year-over-year drop**, bringing annual revenue down to **$4.9 million**—less than half of the 2020 peak.
	- This decline in 2022 was further reflected in a **40% decrease in order volume**, while the average order value (AOV) returned to 2019 levels, signaling a clear shift back to pre-pandemic consumer behavior.
	-  **While sales in 2020 and 2021 consistently outperformed the average, 2022 marked a decisive turning point**, with monthly revenue falling below average for most of the year. In **October 2022**, sales dropped to **$178K**, representing the lowest monthly revenue in company history.

- **Seasonal Trend:**
	- Peak performance tends to concentrate in year-end months—particularly **September and December—both showing around 20% growth.** 
	- In contrast, adjacent months such as **October and February consistently exhibit sharp declines,** suggesting that consumer behavior is heavily influenced by the anticipation of holiday season promotions.



## Brand & Product Trends

<img width="992" alt="productshare" src="https://github.com/user-attachments/assets/facf462b-f3ec-4f1e-b000-d3c670a68835" />

 - **Product Portfolio Concentration:**
   -   **95% of total sales revenue is generated by four core products** - gaming monitors, Airpods headphones, Macbook Air and ThinPad laptops - out of an 8-product portfolio, indicating these should be the focus of sales optimization efforts.

 - **Gaming Monitors & Laptops Lead Revenue:**
   -  During the pandemic, **laptop products** experienced explosive growth, generating an **additional $3.2M in revenue** during 2020, with MacBook Air's product share rocketing from 15% to 28%, propelled by surging work-from-home demand. 
   - While **Gaming Monitors' share** declined in 2020, but it bounced back afterwards and continued climbing, **reaching nearly 40% of revenue share in 2022**, remaining firmly entrenched as the top revenue contributor.

 - **Low-Performing Products Worth Monitoring:**
	 - **Bose headphones** recorded the weakest performance across the catalog, with just **27 orders** and **3K revenue** in four years, making them the least desirable product overall.
	 - Additionally, **Apple iPhone sales remained relatively low**, warranting further investigation into product positioning or pricing strategy.


<img width="1213" alt="Screenshot 2025-05-06 at 2 26 07 PM" src="https://github.com/user-attachments/assets/2e452de9-03de-46ae-a764-33482f13d23d" />
 
 - **Apple Leads in Both Volume and Revenue:**
	 - As a brand, **Apple accounted for 49% of total orders and 51% of total revenue**, reflecting strong customer demand and higher average order values (AOV).
    -   **Apple AirPods**  stood out as the top-selling product, with **48K+ orders** and **$7.7 million** in revenue.

-   **Samsung: High Volume, Low Revenue Contribution:**
	- **Samsung represented 27% of all orders**, yet contributed only **3% of total revenue** due to significantly lower AOV. This gap highlights a potential need to reassess pricing strategy or product bundling to improve revenue performance.


## Refunds
<img width="1071" alt="Screenshot 2025-05-06 at 5 45 28 PM" src="https://github.com/user-attachments/assets/8e97e490-4cb4-497a-b189-3ddd984f31f5" />

-   **Pandemic-Era Spike and Post-COVID Recovery in Refund Rates:**
	- **Refund rates surged to 11% in 2020**, likely driven by rapid order growth, shifting customer expectations, and fulfillment challenges during the height of the pandemic.
	- Encouragingly, **rates declined in 2021 and eventually fell below pre-pandemic levels**, indicating improvements in product quality, logistics, and overall customer satisfaction.
        
-   **Laptops Showed the Highest Return Rates:**
    
    -   **MacBook Air and ThinkPad laptops** saw the highest return rates during 2019–2020, reaching **up to 17%**, suggesting product fit or quality concerns during the pandemic-fueled growth period.
        
-   **AirPods and Gaming Monitors Led in Refund Volume:**
    
    -   **Apple AirPods (2.6K refunds)** and **4K gaming monitors (1.4K refunds)** recorded the highest number of returns, despite being top-selling products.
        
    -   **Refund counts for both items dropped significantly post-pandemic**, indicating improved quality, clearer customer expectations, or better onboarding experiences.
  
        
-   **High-Value Products Face Higher Return Risk:**
    
    -   More expensive items tend to face **higher refund rates**, potentially due to greater customer scrutiny and expectations—even when functionality is sound.

 
> **Note:** No refund data was recorded in 2022, which may impact trend analysis.

## Loyalty Program

<img width="1792" alt="Screenshot 2025-05-07 at 9 56 11 AM" src="https://github.com/user-attachments/assets/7b4d4c67-e584-460a-baa9-0823b6cd0237" />
Launched in 2019, the loyalty program aimed to incentivize repeat purchases through a points-based reward system and targeted discounts. The program is now under a four-year performance review to evaluate its long-term viability.

- Over the four-year period, **non-loyalty customers generated $17 million in sales**, while loyalty members contributed **$10 million**, indicating that non-members still made up a larger share of total revenue.

-   **Revenue Shift in 2021:**
	-  **Loyal customer sales overtook non-loyal sales in 2021**, marking a turning point in revenue dynamics. For the first time, both **order volume and average order value (AOV)** among loyalty members exceeded those of non-members.

-   **Diverging AOV Trends:**
	- **Loyal customers demonstrated a consistent upward trend in AOV**, indicating growing value per transaction.
	- In contrast, **non-loyal AOV declined sharply after 2020**, highlighting potential disengagement or lower-value purchases.
	- However, **data from late 2022 signals a possible trend reversal**, suggesting the gap may be narrowing. Continued monitoring is recommended.
 
-   **Loyal Customer Purchasing Efficiency:**
	- Loyalty members completed their purchase journey significantly faster—**on average 20 days shorter** than non-loyal customers (**49 days vs. 70 days**), reflecting greater purchasing intent and decision-making efficiency.

## Marketing Channel 

<img width="990" alt="Screenshot 2025-03-03 at 8 02 33 PM" src="https://github.com/user-attachments/assets/d5ee0720-c232-4090-9322-fc00f381e859" />


-   **Direct Channel Dominates in Orders and Revenue:**
	- The **direct website channel** is the company’s strongest performer, accounting for **78% of total orders** and **83% of total revenue**. This highlights the effectiveness of the **direct-to-consumer (DTC) model**, supported by strong brand presence and a well-optimized digital storefront.

-   **Affiliate Channel Delivers High AOV:**
	- While order volume from affiliates remains low, the **affiliate channel achieved the highest average order value (AOV) at $303**. This indicates its effectiveness in attracting **high-value customers** and presents a potential opportunity for expansion.

-   **Email Campaigns Drive Volume but Underperform in Value:**
	- **Email marketing contributes 17% of total orders**, making it a significant channel by volume. However, with the **lowest AOV at $181**, it signals a need to optimize targeting, messaging, and promotional strategies to **improve overall transaction value**.

## Global Reach

<img width="1395" alt="Screenshot 2025-05-08 at 11 14 49 AM" src="https://github.com/user-attachments/assets/171a9dbb-4182-4e19-aac5-0f3247f955a6" />

- **Top 10 Markets: 78% of Revenue:**
	- EverMarket’s services span over **190 countries across four global regions**. The **top 10 markets accounted for 78% of total revenue**, with the **US leading at $13.3M (47%)** and an **average order value (AOV) of $262**.  In the U.S., the **4K gaming monitor** was the top-performing product, contributing **36% of national sales**, reflecting strong consumer demand for high-performance displays.
	- When combined with Canada, **the North American region contributed over 50% of both total revenue and order volume**, underscoring its strategic importance and maturity as a core market.

- **Japan Emerges as a High-Value Growth Market:**
	- Japan recorded the **highest AOV at $395**, well above the overall market average of $260. This was primarily driven by strong demand for **laptops and high-resolution monitors**.  
	- This indicates a **clear consumer preference for premium tech products**, backed by **high purchasing power**, positioning Japan as a prime target for **focused marketing campaigns** and **high-end product expansion**.


# Recommendations

### **Boost Sales**

 - **Diversify Product Offerings:** Expand beyond pandemic-driven categories by exploring adjacent or complementary product lines. Diversification will help **mitigate dependency on short-term demand cycles** and ensure relevance as consumer needs evolve.
 - **Strengthen Focus in Core Markets:** Prioritize the top 10 countries (78% of revenue) to secure a stable, scalable revenue base.
 - **Leverage Premium Demand in High-AOV Regions**: In markets like **Japan**, where consumer appetite for high-end products is strong, implement **localized promotions, bundle deals, or exclusive discounts** to align with premium expectations and drive incremental sales.
 - **Offset Seasonal Slumps with Targeted Campaigns:** Implement promotional strategies to address recurring dips in **October and February**. Tactics such as **early holiday promotions**, **limited-time offers**, and **customer re-engagement campaigns** (e.g., loyalty triggers) can help **smooth revenue fluctuations** and improve off-peak performance.

### **Product Strategy**

 - **Optimize Product Portfolio:** Reassess **low-performing products** (e.g., iPhone, Bose SoundSport headphones, each <1% revenue) for potential repositioning, bundling, or phase-out.
 - **Expand the Apple Ecosystem:** Introduce more **Apple-compatible accessories and complementary products** to boost AOV and cross-sell, capitalizing on Apple’s 50% revenue share.

### **Expand Loyalty Program Value**


-   **Continue Monitoring Program Performance:** The Loyalty Program has demonstrated steady year-over-year growth, consistently outperforming non-members in **AOV, total sales, and order volume**. However, a slight **slowdown was observed at the end of 2022**, warranting continued observation before making major adjustments.
    
-   **Leverage Program Value to Drive Member Spend:**  Exclusive perks and benefits have effectively incentivized members to spend more. These value drivers should be **reinforced through marketing**, especially during key purchasing periods.
    
-   **Target High-AOV Returning Customers for Enrollment:**  Promote the Loyalty Program to **returning customers with high purchase value** who are not yet members. This segment is likely to convert and generate incremental value through program participation.



# Dashboard
The interactive dashboard can be found in Tableau Public  [here](https://public.tableau.com/app/profile/sylvia.tsai/viz/EverMarketSalesPerformanceDashboard/SalesDashboard).

<img width="1433" alt="Dashboard Screenshot" src="https://github.com/user-attachments/assets/829fc699-fb02-4355-aebc-c50bdcf71e96" />
