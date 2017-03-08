BEGIN;
commit;

--
-- Create model BidAsk
--
CREATE TABLE "main_bidask" ("id" serial NOT NULL PRIMARY KEY, "frequency" integer NULL, "ask" double precision NULL, "asksize" double precision NULL, "bid" double precision NULL, "bidsize" double precision NULL, "date" timestamp with time zone NULL, "created_at" timestamp with time zone NULL, "updated_at" timestamp with time zone NULL, "crawl_source" varchar(200) NULL);
commit;

--
-- Create model City
--
CREATE TABLE "main_city" ("id" serial NOT NULL PRIMARY KEY, "is_save" boolean NOT NULL, "is_confirm" boolean NOT NULL, "last_edited_time" timestamp with time zone NOT NULL, "created_time" timestamp with time zone NOT NULL, "name" varchar(500) NOT NULL, "latitude" integer NOT NULL, "longitude" integer NOT NULL);
commit;

--
-- Create model Company
--
CREATE TABLE "main_company" ("id" serial NOT NULL PRIMARY KEY, "is_private_company_all" boolean NOT NULL, "is_private_company_class" boolean NOT NULL, "is_private_investor_class" boolean NOT NULL, "is_private_company_short" boolean NOT NULL, "is_private_company_long" boolean NOT NULL, "is_private_company_industry" boolean NOT NULL, "is_private_company_country" boolean NOT NULL, "is_private_company_city" boolean NOT NULL, "is_private_company_state" boolean NOT NULL, "is_private_company_region" boolean NOT NULL, "is_private_company_employee" boolean NOT NULL, "is_private_corporation" boolean NOT NULL, "is_private_company_established" boolean NOT NULL, "is_private_company_founded_year" boolean NOT NULL, "is_private_patent" boolean NOT NULL, "is_private_team" boolean NOT NULL, "is_private_company_fundraising" boolean NOT NULL, "is_private_company_logo" boolean NOT NULL, "is_private_company_website" boolean NOT NULL, "is_private_company_founded_day" boolean NOT NULL, "is_private_company_founded_month" boolean NOT NULL, "is_private_company_name" boolean NOT NULL, "company_favorite_count" integer NOT NULL, "company_recommendation_count" integer NOT NULL, "is_active" boolean NOT NULL, "is_public" boolean NOT NULL, "is_save" boolean NOT NULL, "is_confirm" boolean NOT NULL, "is_trusted_vc" boolean NOT NULL, "is_partner" boolean NOT NULL, "is_angel" boolean NOT NULL, "is_government" boolean NOT NULL, "is_tips" boolean NOT NULL, "is_dcamp" boolean NOT NULL, "is_rocketpunch" boolean NOT NULL, "is_dart" boolean NOT NULL, "is_bizinkorea" boolean NOT NULL, "is_startup" boolean NOT NULL, "is_investor" boolean NOT NULL, "ticker" varchar(100) NULL, "exchange" varchar(100) NULL, "sec_cik" varchar(100) NULL, "sec_cik_int" varchar(100) NULL, "partner_order" integer NOT NULL, "last_edited_time" timestamp with time zone NOT NULL, "created_time" timestamp with time zone NULL, "company_name" varchar(1000) NOT NULL, "company_kor_name" varchar(1000) NULL, "company_class" varchar(15) NOT NULL, "tips_start_date" date NULL, "rocketpunch_url" varchar(1001) NULL, "angellist_url" varchar(702) NULL, "sec_url" varchar(701) NULL, "e27_url" varchar(700) NULL, "f6s_url" varchar(703) NULL, "forbes_url" varchar(707) NULL, "investor_class" varchar(1000) NOT NULL, "company_short" varchar(10001) NOT NULL, "company_long" text NOT NULL, "company_industry" varchar(5002) NOT NULL, "company_continent" varchar(300) NULL, "company_country" varchar(300) NOT NULL, "company_city" varchar(300) NOT NULL, "company_state" varchar(300) NULL, "company_region" varchar(300) NULL, "company_location" varchar(1003) NULL, "company_location_latitude" integer NOT NULL, "company_location_longitude" integer NOT NULL, "company_employee" varchar(20) NOT NULL, "corporation" varchar(10) NOT NULL, "company_established" varchar(30) NULL, "company_founded_year" integer NULL, "company_founded_month" integer NULL, "company_founded_day" integer NULL, "company_website" varchar(1007) NOT NULL, "company_logo" varchar(1008) NOT NULL, "company_fundraising" varchar(300) NOT NULL, "company_fundraising_currency" varchar(300) NULL, "company_fundraising_highlight" varchar(300) NULL, "company_fundraising_deck" varchar(1009) NULL, "company_number" varchar(210) NULL, "corporate_number" varchar(211) NULL, "employee_total" integer NOT NULL, "employee_total_month_ago" integer NOT NULL, "employee_added_this_month" integer NOT NULL, "employee_growth_month" integer NOT NULL, "employee_total_6month_ago" integer NOT NULL, "employee_added_in_6month" integer NOT NULL, "employee_growth_6month" integer NOT NULL, "employee_added_since_funding" integer NOT NULL, "employee_months_since_funding" integer NOT NULL, "employee_growth_since_funding" integer NOT NULL, "investor_list_csv" varchar(5012) NULL, "product_list_csv" varchar(5013) NULL, "product_market_csv" varchar(5014) NULL, "invested_funding_stage_csv" varchar(5015) NULL, "traffic_growth_month" integer NOT NULL, "last_funding_amt" double precision NOT NULL, "last_funding_date" timestamp with time zone NULL, "last_funding_months_ago" integer NOT NULL, "total_funding_amt" double precision NOT NULL, "funding_stage_name" varchar(116) NULL, "product_app_store" varchar(217) NULL, "product_google_play" varchar(218) NULL, "company_top_keywords" varchar(5019) NULL, "company_interests" varchar(5020) NULL, "company_alerts" varchar(221) NULL, "traffic_monthly_unique" integer NOT NULL, "traffic_monthly_unique_week_ago" integer NOT NULL, "traffic_monthly_weekly_growth" integer NOT NULL, "traffic_monthly_unique_month_ago" integer NOT NULL, "traffic_monthly_monthly_growth" integer NOT NULL, "traffic_mobile_download" integer NOT NULL, "traffic_mobile_download_week_ago" integer NOT NULL, "traffic_mobile_download_weekly_growth" integer NOT NULL, "traffic_mobile_download_month_ago" integer NOT NULL, "traffic_mobile_download_monthly_growth" integer NOT NULL, "revenue" double precision NOT NULL, "total_valuation" double precision NOT NULL, "total_asset" double precision NOT NULL, "total_debt" double precision NOT NULL, "total_capital" double precision NOT NULL, "total_sales" double precision NOT NULL, "net_income" double precision NOT NULL, "operating_income" double precision NOT NULL, "ratio_sales_net" double precision NOT NULL, "ratio_sales_operating" double precision NOT NULL, "period_end_date" timestamp with time zone NULL, "investor_fund_sold_3yr" integer NOT NULL, "investor_last_funding_date" timestamp with time zone NULL, "investor_portfolio_size" integer NOT NULL, "investor_total_deals" integer NOT NULL, "score1" double precision NOT NULL, "score2" double precision NOT NULL, "score3" double precision NOT NULL, "score4" double precision NOT NULL, "score5" double precision NOT NULL, "company_linkedin_page" varchar(1017) NULL, "company_facebook_page" varchar(1018) NULL, "company_twitter" varchar(1019) NULL, "crawl_source" varchar(200) NULL, "slug" varchar(50) NULL UNIQUE, "invested_stages_csv" varchar(5013) NULL, "invested_success" integer NOT NULL, "invested_success_amt" double precision NOT NULL, "invested_founder_csv" varchar(5014) NULL, "invested_market_csv" varchar(5015) NULL, "invested_continent_csv" varchar(5016) NULL, "city_id" integer NULL);
commit;

--
-- Create model CompanyInvestingEvent
--
CREATE TABLE "main_companyinvestingevent" ("id" serial NOT NULL PRIMARY KEY, "event_round" varchar(300) NULL, "event_investors" varchar(500) NULL, "event_investors_id" varchar(500) NULL, "last_edited_time" timestamp with time zone NOT NULL, "created_time" timestamp with time zone NOT NULL, "is_user_input" boolean NOT NULL, "is_tips" boolean NOT NULL, "is_rocketpunch" boolean NOT NULL, "event_day" integer NULL, "event_month" integer NULL, "event_year" integer NULL, "event_currency" varchar(100) NULL, "event_amount" varchar(200) NULL, "invest_currency" varchar(3) NULL, "invest_amt" double precision NOT NULL, "invest_date" timestamp with time zone NULL, "crawl_source" varchar(200) NULL);
commit;

--
-- Create model CompanyInvestor
--
CREATE TABLE "main_companyinvestor" ("id" serial NOT NULL PRIMARY KEY, "last_edited_time" timestamp with time zone NOT NULL, "created_time" timestamp with time zone NULL, "is_user_input" boolean NOT NULL, "investor_day" integer NULL, "investor_month" integer NULL, "investor_year" integer NULL, "investor_currency" varchar(100) NULL, "investor_amount" varchar(200) NULL, "invest_currency" varchar(3) NULL, "invest_amt" double precision NOT NULL, "invest_date" timestamp with time zone NULL, "is_active" boolean NOT NULL, "is_tips" boolean NOT NULL, "is_rocketpunch" boolean NOT NULL, "is_estimate" boolean NOT NULL, "crawl_source" varchar(200) NULL);
commit;

--
-- Create model CompanyResource
--
CREATE TABLE "main_companyresource" ("id" serial NOT NULL PRIMARY KEY, "company_id" integer NOT NULL);
commit;

--
-- Create model Continent
--
CREATE TABLE "main_continent" ("id" serial NOT NULL PRIMARY KEY, "is_save" boolean NOT NULL, "is_confirm" boolean NOT NULL, "last_edited_time" timestamp with time zone NOT NULL, "created_time" timestamp with time zone NOT NULL, "name" varchar(500) NOT NULL, "latitude" integer NOT NULL, "longitude" integer NOT NULL, "crawl_source" varchar(200) NULL, "company_count" integer NOT NULL, "company_investor_count" integer NOT NULL, "company_startup_count" integer NOT NULL, "company_public_count" integer NOT NULL, "user_count" integer NOT NULL);
commit;

--
-- Create model Country
--
CREATE TABLE "main_country" ("id" serial NOT NULL PRIMARY KEY, "is_save" boolean NOT NULL, "is_confirm" boolean NOT NULL, "last_edited_time" timestamp with time zone NOT NULL, "created_time" timestamp with time zone NOT NULL, "name" varchar(500) NOT NULL, "latitude" integer NOT NULL, "longitude" integer NOT NULL, "company_count" integer NOT NULL, "company_investor_count" integer NOT NULL, "company_startup_count" integer NOT NULL, "company_public_count" integer NOT NULL, "user_count" integer NOT NULL, "continent_id" integer NOT NULL);
commit;

--
-- Create model Feed
--
CREATE TABLE "main_feed" ("id" serial NOT NULL PRIMARY KEY, "frequency" integer NULL, "date" timestamp with time zone NULL, "open" double precision NULL, "high" double precision NULL, "low" double precision NULL, "close" double precision NULL, "change" double precision NULL, "settle" double precision NULL, "open_interest" double precision NULL, "volume" double precision NULL, "wap" double precision NULL, "created_at" timestamp with time zone NULL, "updated_at" timestamp with time zone NULL, "crawl_source" varchar(200) NULL);
commit;

--
-- Create model FundingStage
--
CREATE TABLE "main_fundingstage" ("id" serial NOT NULL PRIMARY KEY, "name" varchar(500) NOT NULL, "created_at" timestamp with time zone NULL, "updated_at" timestamp with time zone NULL, "count" integer NULL, "stage_step" integer NULL, "crawl_source" varchar(200) NULL);
commit;

--
-- Create model Instrument
--
CREATE TABLE "main_instrument" ("id" serial NOT NULL PRIMARY KEY, "broker" varchar(255) NULL, "sym" varchar(255) NULL, "cur" varchar(255) NULL, "exch" varchar(255) NULL, "secType" varchar(255) NULL, "trade_freq" integer NULL, "mult" double precision NULL, "local_sym" varchar(255) NULL, "contractMonth" varchar(255) NULL, "expiry" varchar(255) NULL, "evRule" varchar(255) NULL, "liquidHours" varchar(255) NULL, "longName" varchar(255) NULL, "minTick" double precision NULL, "timeZoneId" varchar(255) NULL, "tradingHours" varchar(255) NULL, "underConId" integer NULL, "created_at" timestamp with time zone NULL, "updated_at" timestamp with time zone NULL, "crawl_source" varchar(200) NULL, "company_id" integer NULL);
commit;

--
-- Create model InvestorType
--
CREATE TABLE "main_investortype" ("id" serial NOT NULL PRIMARY KEY, "name" varchar(500) NOT NULL, "slug" varchar(50) NULL UNIQUE, "created_at" timestamp with time zone NULL, "updated_at" timestamp with time zone NULL);
commit;

--
-- Create model Market
--
CREATE TABLE "main_market" ("id" serial NOT NULL PRIMARY KEY, "name" varchar(255) NULL, "vertical" varchar(255) NULL, "sub_vertical" varchar(255) NULL, "total" integer NOT NULL, "slug" varchar(50) NULL UNIQUE, "created_at" timestamp with time zone NULL, "updated_at" timestamp with time zone NULL, "crawl_source" varchar(200) NULL);
commit;

--
-- Create model Prediction
--
CREATE TABLE "main_prediction" ("id" serial NOT NULL PRIMARY KEY, "frequency" integer NULL, "pred_start_date" timestamp with time zone NULL, "date" timestamp with time zone NULL, "open" double precision NULL, "high" double precision NULL, "low" double precision NULL, "close" double precision NULL, "volume" double precision NULL, "wap" double precision NULL, "algo_name" varchar(200) NULL, "is_scaled" boolean NOT NULL, "created_at" timestamp with time zone NULL, "updated_at" timestamp with time zone NULL, "crawl_source" varchar(200) NULL, "instrument_id" integer NOT NULL);
commit;

--
-- Create model Region
--
CREATE TABLE "main_region" ("id" serial NOT NULL PRIMARY KEY, "is_save" boolean NOT NULL, "is_confirm" boolean NOT NULL, "last_edited_time" timestamp with time zone NOT NULL, "created_time" timestamp with time zone NOT NULL, "name" varchar(500) NOT NULL, "latitude" integer NOT NULL, "longitude" integer NOT NULL, "crawl_source" varchar(200) NULL);
commit;

--
-- Create model Resource
--
CREATE TABLE "main_resource" ("id" serial NOT NULL PRIMARY KEY, "company_favorite_count" integer NOT NULL, "company_recommendation_count" integer NOT NULL, "resource_type" varchar(50) NOT NULL, "commodity_type" varchar(50) NOT NULL, "is_active" boolean NOT NULL, "is_commodity" boolean NOT NULL, "is_public" boolean NOT NULL, "is_save" boolean NOT NULL, "is_confirm" boolean NOT NULL, "is_trusted_vc" boolean NOT NULL, "is_partner" boolean NOT NULL, "is_angel" boolean NOT NULL, "is_government" boolean NOT NULL, "is_tips" boolean NOT NULL, "is_rocketpunch" boolean NOT NULL, "is_startup" boolean NOT NULL, "is_investor" boolean NOT NULL, "ticker" varchar(100) NULL, "exchange" varchar(100) NULL, "sec_cik" varchar(100) NULL, "sec_cik_int" varchar(100) NULL, "partner_order" integer NOT NULL, "last_edited_time" timestamp with time zone NOT NULL, "created_time" timestamp with time zone NULL, "company_name" varchar(1000) NOT NULL, "company_kor_name" varchar(1000) NULL, "company_class" varchar(15) NOT NULL, "tips_start_date" date NULL, "rocketpunch_url" varchar(1001) NULL, "angellist_url" varchar(702) NULL, "sec_url" varchar(701) NULL, "e27_url" varchar(700) NULL, "f6s_url" varchar(703) NULL, "forbes_url" varchar(707) NULL, "investor_class" varchar(1000) NOT NULL, "company_short" varchar(10001) NOT NULL, "company_long" text NOT NULL, "company_industry" varchar(5002) NOT NULL, "company_continent" varchar(300) NULL, "company_country" varchar(300) NOT NULL, "company_city" varchar(300) NOT NULL, "company_state" varchar(300) NULL, "company_region" varchar(300) NULL, "company_location" varchar(1003) NULL, "company_location_latitude" integer NOT NULL, "company_location_longitude" integer NOT NULL, "company_employee" varchar(20) NOT NULL, "corporation" varchar(10) NOT NULL, "company_established" varchar(30) NULL, "company_founded_year" integer NULL, "company_founded_month" integer NULL, "company_founded_day" integer NULL, "company_website" varchar(1007) NOT NULL, "company_logo" varchar(1008) NOT NULL, "company_fundraising" varchar(300) NOT NULL, "company_fundraising_currency" varchar(300) NULL, "company_fundraising_highlight" varchar(300) NULL, "company_fundraising_deck" varchar(1009) NULL, "company_number" varchar(210) NULL, "corporate_number" varchar(211) NULL, "employee_total" integer NOT NULL, "employee_total_month_ago" integer NOT NULL, "employee_added_this_month" integer NOT NULL, "employee_growth_month" integer NOT NULL, "employee_total_6month_ago" integer NOT NULL, "employee_added_in_6month" integer NOT NULL, "employee_growth_6month" integer NOT NULL, "employee_added_since_funding" integer NOT NULL, "employee_months_since_funding" integer NOT NULL, "employee_growth_since_funding" integer NOT NULL, "investor_list_csv" varchar(5012) NULL, "product_list_csv" varchar(5013) NULL, "product_market_csv" varchar(5014) NULL, "invested_funding_stage_csv" varchar(5015) NULL, "traffic_growth_month" integer NOT NULL, "last_funding_amt" double precision NOT NULL, "last_funding_date" timestamp with time zone NULL, "last_funding_months_ago" integer NOT NULL, "total_funding_amt" double precision NOT NULL, "funding_stage_name" varchar(116) NULL, "product_app_store" varchar(217) NULL, "product_google_play" varchar(218) NULL, "company_top_keywords" varchar(5019) NULL, "company_interests" varchar(5020) NULL, "company_alerts" varchar(221) NULL, "traffic_monthly_unique" integer NOT NULL, "traffic_monthly_unique_week_ago" integer NOT NULL, "traffic_monthly_weekly_growth" integer NOT NULL, "traffic_monthly_unique_month_ago" integer NOT NULL, "traffic_monthly_monthly_growth" integer NOT NULL, "traffic_mobile_download" integer NOT NULL, "traffic_mobile_download_week_ago" integer NOT NULL, "traffic_mobile_download_weekly_growth" integer NOT NULL, "traffic_mobile_download_month_ago" integer NOT NULL, "traffic_mobile_download_monthly_growth" integer NOT NULL, "revenue" double precision NOT NULL, "total_valuation" double precision NOT NULL, "total_asset" double precision NOT NULL, "total_debt" double precision NOT NULL, "total_capital" double precision NOT NULL, "total_sales" double precision NOT NULL, "net_income" double precision NOT NULL, "operating_income" double precision NOT NULL, "ratio_sales_net" double precision NOT NULL, "ratio_sales_operating" double precision NOT NULL, "period_end_date" timestamp with time zone NULL, "investor_fund_sold_3yr" integer NOT NULL, "investor_last_funding_date" timestamp with time zone NULL, "investor_portfolio_size" integer NOT NULL, "investor_total_deals" integer NOT NULL, "score1" double precision NOT NULL, "score2" double precision NOT NULL, "score3" double precision NOT NULL, "score4" double precision NOT NULL, "score5" double precision NOT NULL, "company_linkedin_page" varchar(1017) NULL, "company_facebook_page" varchar(1018) NULL, "company_twitter" varchar(1019) NULL, "crawl_source" varchar(200) NULL, "slug" varchar(50) NULL UNIQUE, "invested_stages_csv" varchar(5013) NULL, "invested_success" integer NOT NULL, "invested_success_amt" double precision NOT NULL, "invested_founder_csv" varchar(5014) NULL, "invested_market_csv" varchar(5015) NULL, "invested_continent_csv" varchar(5016) NULL, "city_id" integer NULL, "continent_id" integer NULL, "country_id" integer NULL, "funding_stage_id" integer NULL, "invested_stages_id" integer NULL, "investor_type_id" integer NULL, "owner_id" integer NULL, "region_id" integer NULL);
commit;

--
-- Create model State
--
CREATE TABLE "main_state" ("id" serial NOT NULL PRIMARY KEY, "is_save" boolean NOT NULL, "is_confirm" boolean NOT NULL, "last_edited_time" timestamp with time zone NOT NULL, "created_time" timestamp with time zone NOT NULL, "name" varchar(500) NOT NULL, "latitude" integer NOT NULL, "longitude" integer NOT NULL, "continent_id" integer NOT NULL, "country_id" integer NOT NULL);
commit;

--
-- Create model System
--
CREATE TABLE "main_system" ("id" serial NOT NULL PRIMARY KEY, "version" varchar(255) NULL, "system" varchar(255) NULL, "name" varchar(255) NULL, "c2id" varchar(255) NULL, "c2api" varchar(255) NULL, "c2qty" integer NULL, "c2submit" boolean NOT NULL, "ibqty" integer NULL, "ibsubmit" boolean NOT NULL, "trade_freq" integer NULL, "ibmult" integer NULL, "c2mult" integer NULL, "signal" varchar(255) NULL, "c2instrument_id" integer NULL, "ibinstrument_id" integer NULL);
commit;

--
-- Add field state to resource
--
ALTER TABLE "main_resource" ADD COLUMN "state_id" integer NULL;
commit;

ALTER TABLE "main_resource" ALTER COLUMN "state_id" DROP DEFAULT;
commit;

--
-- Add field resource to instrument
--
ALTER TABLE "main_instrument" ADD COLUMN "resource_id" integer NULL;
commit;

ALTER TABLE "main_instrument" ALTER COLUMN "resource_id" DROP DEFAULT;
commit;

--
-- Add field instrument to feed
--
ALTER TABLE "main_feed" ADD COLUMN "instrument_id" integer NOT NULL;
commit;

ALTER TABLE "main_feed" ALTER COLUMN "instrument_id" DROP DEFAULT;
commit;

--
-- Add field resource to companyresource
--
ALTER TABLE "main_companyresource" ADD COLUMN "resource_id" integer NOT NULL;
commit;

ALTER TABLE "main_companyresource" ALTER COLUMN "resource_id" DROP DEFAULT;
commit;

--
-- Add field funding_stage to companyinvestor
--
ALTER TABLE "main_companyinvestor" ADD COLUMN "funding_stage_id" integer NULL;
commit;

ALTER TABLE "main_companyinvestor" ALTER COLUMN "funding_stage_id" DROP DEFAULT;
commit;

--
-- Add field investor to companyinvestor
--
ALTER TABLE "main_companyinvestor" ADD COLUMN "investor_id" integer NOT NULL;
commit;

ALTER TABLE "main_companyinvestor" ALTER COLUMN "investor_id" DROP DEFAULT;
commit;

--
-- Add field owner to companyinvestor
--
ALTER TABLE "main_companyinvestor" ADD COLUMN "owner_id" integer NOT NULL;
commit;

ALTER TABLE "main_companyinvestor" ALTER COLUMN "owner_id" DROP DEFAULT;
commit;

--
-- Add field funding_stage to companyinvestingevent
--
ALTER TABLE "main_companyinvestingevent" ADD COLUMN "funding_stage_id" integer NULL;
commit;

ALTER TABLE "main_companyinvestingevent" ALTER COLUMN "funding_stage_id" DROP DEFAULT;
commit;

--
-- Add field investor to companyinvestingevent
--
CREATE TABLE "main_companyinvestingevent_investor" ("id" serial NOT NULL PRIMARY KEY, "companyinvestingevent_id" integer NOT NULL, "companyinvestor_id" integer NOT NULL);
commit;

--
-- Add field owner to companyinvestingevent
--
ALTER TABLE "main_companyinvestingevent" ADD COLUMN "owner_id" integer NULL;
commit;

ALTER TABLE "main_companyinvestingevent" ALTER COLUMN "owner_id" DROP DEFAULT;
commit;

--
-- Add field continent to company
--
ALTER TABLE "main_company" ADD COLUMN "continent_id" integer NULL;
commit;

ALTER TABLE "main_company" ALTER COLUMN "continent_id" DROP DEFAULT;
commit;

--
-- Add field country to company
--
ALTER TABLE "main_company" ADD COLUMN "country_id" integer NULL;
commit;

ALTER TABLE "main_company" ALTER COLUMN "country_id" DROP DEFAULT;
commit;

--
-- Add field funding_stage to company
--
ALTER TABLE "main_company" ADD COLUMN "funding_stage_id" integer NULL;
commit;

ALTER TABLE "main_company" ALTER COLUMN "funding_stage_id" DROP DEFAULT;
commit;

--
-- Add field invested_stages to company
--
ALTER TABLE "main_company" ADD COLUMN "invested_stages_id" integer NULL;
commit;

ALTER TABLE "main_company" ALTER COLUMN "invested_stages_id" DROP DEFAULT;
commit;

--
-- Add field investor_type to company
--
ALTER TABLE "main_company" ADD COLUMN "investor_type_id" integer NULL;
commit;

ALTER TABLE "main_company" ALTER COLUMN "investor_type_id" DROP DEFAULT;
commit;

--
-- Add field owner to company
--
ALTER TABLE "main_company" ADD COLUMN "owner_id" integer NOT NULL;
commit;

ALTER TABLE "main_company" ALTER COLUMN "owner_id" DROP DEFAULT;
commit;

--
-- Add field region to company
--
ALTER TABLE "main_company" ADD COLUMN "region_id" integer NULL;
commit;

ALTER TABLE "main_company" ALTER COLUMN "region_id" DROP DEFAULT;
commit;

--
-- Add field state to company
--
ALTER TABLE "main_company" ADD COLUMN "state_id" integer NULL;
commit;

ALTER TABLE "main_company" ALTER COLUMN "state_id" DROP DEFAULT;
commit;

--
-- Add field continent to city
--
ALTER TABLE "main_city" ADD COLUMN "continent_id" integer NOT NULL;
commit;

ALTER TABLE "main_city" ALTER COLUMN "continent_id" DROP DEFAULT;
commit;

--
-- Add field country to city
--
ALTER TABLE "main_city" ADD COLUMN "country_id" integer NOT NULL;
commit;

ALTER TABLE "main_city" ALTER COLUMN "country_id" DROP DEFAULT;
commit;

--
-- Add field state to city
--
ALTER TABLE "main_city" ADD COLUMN "state_id" integer NULL;
commit;

ALTER TABLE "main_city" ALTER COLUMN "state_id" DROP DEFAULT;
commit;

--
-- Add field instrument to bidask
--
ALTER TABLE "main_bidask" ADD COLUMN "instrument_id" integer NOT NULL;
commit;

ALTER TABLE "main_bidask" ALTER COLUMN "instrument_id" DROP DEFAULT;
commit;

CREATE INDEX "main_bidask_fad6c43b" ON "main_bidask" ("frequency");
commit;

CREATE INDEX "main_bidask_5fc73231" ON "main_bidask" ("date");
commit;

CREATE INDEX "main_bidask_fde81f11" ON "main_bidask" ("created_at");
commit;

CREATE INDEX "main_bidask_afd1a1a8" ON "main_bidask" ("updated_at");
commit;

CREATE INDEX "main_city_a9b0c97b" ON "main_city" ("last_edited_time");
commit;

CREATE INDEX "main_city_bb5855f0" ON "main_city" ("created_time");
commit;

CREATE INDEX "main_city_b068931c" ON "main_city" ("name");
commit;

CREATE INDEX "main_city_28c1e37e" ON "main_city" ("latitude");
commit;

CREATE INDEX "main_city_ba569b80" ON "main_city" ("longitude");
commit;

CREATE INDEX "main_city_name_ef161c88_like" ON "main_city" ("name" varchar_pattern_ops);
commit;

ALTER TABLE "main_company" ADD CONSTRAINT "main_company_city_id_5d91dee3_fk_main_city_id" FOREIGN KEY ("city_id") REFERENCES "main_city" ("id") DEFERRABLE INITIALLY DEFERRED;
commit;

CREATE INDEX "main_company_4264c638" ON "main_company" ("is_active");
commit;

CREATE INDEX "main_company_11725655" ON "main_company" ("is_public");
commit;

CREATE INDEX "main_company_463223eb" ON "main_company" ("is_confirm");
commit;

CREATE INDEX "main_company_38c5f373" ON "main_company" ("is_trusted_vc");
commit;

CREATE INDEX "main_company_f3d6f5c9" ON "main_company" ("is_partner");
commit;

CREATE INDEX "main_company_d8e3caae" ON "main_company" ("is_angel");
commit;

CREATE INDEX "main_company_4df577bd" ON "main_company" ("is_tips");
commit;

CREATE INDEX "main_company_9e1a2164" ON "main_company" ("is_dcamp");
commit;

CREATE INDEX "main_company_fee55b15" ON "main_company" ("is_rocketpunch");
commit;

CREATE INDEX "main_company_ade1cc8a" ON "main_company" ("is_dart");
commit;

CREATE INDEX "main_company_a2a803c4" ON "main_company" ("is_bizinkorea");
commit;

CREATE INDEX "main_company_61f856e3" ON "main_company" ("is_startup");
commit;

CREATE INDEX "main_company_6e2900d4" ON "main_company" ("is_investor");
commit;

CREATE INDEX "main_company_8a084cf7" ON "main_company" ("ticker");
commit;

CREATE INDEX "main_company_5c731c8c" ON "main_company" ("exchange");
commit;

CREATE INDEX "main_company_154c1303" ON "main_company" ("sec_cik");
commit;

CREATE INDEX "main_company_22b6a063" ON "main_company" ("sec_cik_int");
commit;

CREATE INDEX "main_company_a9b0c97b" ON "main_company" ("last_edited_time");
commit;

CREATE INDEX "main_company_bb5855f0" ON "main_company" ("created_time");
commit;

CREATE INDEX "main_company_c1007e8a" ON "main_company" ("company_name");
commit;

CREATE INDEX "main_company_4264fa21" ON "main_company" ("company_kor_name");
commit;

CREATE INDEX "main_company_bc4de5a9" ON "main_company" ("company_class");
commit;

CREATE INDEX "main_company_f2452ee6" ON "main_company" ("rocketpunch_url");
commit;

CREATE INDEX "main_company_fbff80ba" ON "main_company" ("angellist_url");
commit;

CREATE INDEX "main_company_f06814ed" ON "main_company" ("sec_url");
commit;

CREATE INDEX "main_company_d69203b3" ON "main_company" ("e27_url");
commit;

CREATE INDEX "main_company_33780092" ON "main_company" ("f6s_url");
commit;

CREATE INDEX "main_company_bba37091" ON "main_company" ("forbes_url");
commit;

CREATE INDEX "main_company_d3380a28" ON "main_company" ("investor_class");
commit;

CREATE INDEX "main_company_b7eb5d9c" ON "main_company" ("company_industry");
commit;

CREATE INDEX "main_company_7e214e10" ON "main_company" ("company_continent");
commit;

CREATE INDEX "main_company_9e2b0ee2" ON "main_company" ("company_country");
commit;

CREATE INDEX "main_company_0693b93b" ON "main_company" ("company_city");
commit;

CREATE INDEX "main_company_3bd52307" ON "main_company" ("company_state");
commit;

CREATE INDEX "main_company_16670d4e" ON "main_company" ("company_region");
commit;

CREATE INDEX "main_company_8b6b622d" ON "main_company" ("company_location");
commit;

CREATE INDEX "main_company_6c50c7f1" ON "main_company" ("company_location_latitude");
commit;

CREATE INDEX "main_company_2885a201" ON "main_company" ("company_location_longitude");
commit;

CREATE INDEX "main_company_192c3778" ON "main_company" ("company_established");
commit;

CREATE INDEX "main_company_ad226066" ON "main_company" ("company_founded_year");
commit;

CREATE INDEX "main_company_2c93df8c" ON "main_company" ("company_founded_month");
commit;

CREATE INDEX "main_company_f6018d4e" ON "main_company" ("company_founded_day");
commit;

CREATE INDEX "main_company_b109d4cd" ON "main_company" ("company_website");
commit;

CREATE INDEX "main_company_c5b49fd9" ON "main_company" ("company_number");
commit;

CREATE INDEX "main_company_7d826fd6" ON "main_company" ("corporate_number");
commit;

CREATE INDEX "main_company_ee724e2f" ON "main_company" ("investor_list_csv");
commit;

CREATE INDEX "main_company_1bf93bcf" ON "main_company" ("product_market_csv");
commit;

CREATE INDEX "main_company_023e7239" ON "main_company" ("invested_funding_stage_csv");
commit;

CREATE INDEX "main_company_b7e28c0c" ON "main_company" ("last_funding_amt");
commit;

CREATE INDEX "main_company_e83ca751" ON "main_company" ("last_funding_date");
commit;

CREATE INDEX "main_company_cbbcbb27" ON "main_company" ("total_funding_amt");
commit;

CREATE INDEX "main_company_a66285ba" ON "main_company" ("total_valuation");
commit;

CREATE INDEX "main_company_b2337225" ON "main_company" ("total_asset");
commit;

CREATE INDEX "main_company_74cf7cd2" ON "main_company" ("total_debt");
commit;

CREATE INDEX "main_company_86a19171" ON "main_company" ("total_capital");
commit;

CREATE INDEX "main_company_faf3b8e3" ON "main_company" ("total_sales");
commit;

CREATE INDEX "main_company_dc6fb62a" ON "main_company" ("period_end_date");
commit;

CREATE INDEX "main_company_7271259c" ON "main_company" ("score1");
commit;

CREATE INDEX "main_company_ed28b0ab" ON "main_company" ("score2");
commit;

CREATE INDEX "main_company_f6f63d76" ON "main_company" ("score3");
commit;

CREATE INDEX "main_company_a164b067" ON "main_company" ("score4");
commit;

CREATE INDEX "main_company_3d3a97ef" ON "main_company" ("score5");
commit;

CREATE INDEX "main_company_259764f4" ON "main_company" ("invested_stages_csv");
commit;

CREATE INDEX "main_company_fe284ac2" ON "main_company" ("invested_success");
commit;

CREATE INDEX "main_company_20ef32af" ON "main_company" ("invested_success_amt");
commit;

CREATE INDEX "main_company_9a8daa8f" ON "main_company" ("invested_founder_csv");
commit;

CREATE INDEX "main_company_5630e841" ON "main_company" ("invested_market_csv");
commit;

CREATE INDEX "main_company_0704c6f5" ON "main_company" ("invested_continent_csv");
commit;

CREATE INDEX "main_company_c7141997" ON "main_company" ("city_id");
commit;

CREATE INDEX "main_company_ticker_4149c4db_like" ON "main_company" ("ticker" varchar_pattern_ops);
commit;

CREATE INDEX "main_company_exchange_1a05eba2_like" ON "main_company" ("exchange" varchar_pattern_ops);
commit;

CREATE INDEX "main_company_sec_cik_7b025924_like" ON "main_company" ("sec_cik" varchar_pattern_ops);
commit;

CREATE INDEX "main_company_sec_cik_int_3ba08eef_like" ON "main_company" ("sec_cik_int" varchar_pattern_ops);
commit;

CREATE INDEX "main_company_company_name_c6596a83_like" ON "main_company" ("company_name" varchar_pattern_ops);
commit;

CREATE INDEX "main_company_company_kor_name_7e5c492f_like" ON "main_company" ("company_kor_name" varchar_pattern_ops);
commit;

CREATE INDEX "main_company_company_class_9cfdcf26_like" ON "main_company" ("company_class" varchar_pattern_ops);
commit;

CREATE INDEX "main_company_rocketpunch_url_842d83a8_like" ON "main_company" ("rocketpunch_url" varchar_pattern_ops);
commit;

CREATE INDEX "main_company_angellist_url_540cf579_like" ON "main_company" ("angellist_url" varchar_pattern_ops);
commit;

CREATE INDEX "main_company_sec_url_6c371b03_like" ON "main_company" ("sec_url" varchar_pattern_ops);
commit;

CREATE INDEX "main_company_e27_url_28e94143_like" ON "main_company" ("e27_url" varchar_pattern_ops);
commit;

CREATE INDEX "main_company_f6s_url_7fc127ff_like" ON "main_company" ("f6s_url" varchar_pattern_ops);
commit;

CREATE INDEX "main_company_forbes_url_0d1c2eeb_like" ON "main_company" ("forbes_url" varchar_pattern_ops);
commit;

CREATE INDEX "main_company_investor_class_e512402e_like" ON "main_company" ("investor_class" varchar_pattern_ops);
commit;

CREATE INDEX "main_company_company_industry_3655f161_like" ON "main_company" ("company_industry" varchar_pattern_ops);
commit;

CREATE INDEX "main_company_company_continent_f1dfdf47_like" ON "main_company" ("company_continent" varchar_pattern_ops);
commit;

CREATE INDEX "main_company_company_country_c1e38bbf_like" ON "main_company" ("company_country" varchar_pattern_ops);
commit;

CREATE INDEX "main_company_company_city_b794803c_like" ON "main_company" ("company_city" varchar_pattern_ops);
commit;

CREATE INDEX "main_company_company_state_6cad372a_like" ON "main_company" ("company_state" varchar_pattern_ops);
commit;

CREATE INDEX "main_company_company_region_58fd4651_like" ON "main_company" ("company_region" varchar_pattern_ops);
commit;

CREATE INDEX "main_company_company_location_ae7335e0_like" ON "main_company" ("company_location" varchar_pattern_ops);
commit;

CREATE INDEX "main_company_company_established_659a4c36_like" ON "main_company" ("company_established" varchar_pattern_ops);
commit;

CREATE INDEX "main_company_company_website_3804a77f_like" ON "main_company" ("company_website" varchar_pattern_ops);
commit;

CREATE INDEX "main_company_company_number_1f6438c9_like" ON "main_company" ("company_number" varchar_pattern_ops);
commit;

CREATE INDEX "main_company_corporate_number_5a682158_like" ON "main_company" ("corporate_number" varchar_pattern_ops);
commit;

CREATE INDEX "main_company_investor_list_csv_3fd74834_like" ON "main_company" ("investor_list_csv" varchar_pattern_ops);
commit;

CREATE INDEX "main_company_product_market_csv_f1473e2b_like" ON "main_company" ("product_market_csv" varchar_pattern_ops);
commit;

CREATE INDEX "main_company_invested_funding_stage_csv_7a97f97a_like" ON "main_company" ("invested_funding_stage_csv" varchar_pattern_ops);
commit;

CREATE INDEX "main_company_slug_3e49a6e4_like" ON "main_company" ("slug" varchar_pattern_ops);
commit;

CREATE INDEX "main_company_invested_stages_csv_6a57e968_like" ON "main_company" ("invested_stages_csv" varchar_pattern_ops);
commit;

CREATE INDEX "main_company_invested_founder_csv_7c883131_like" ON "main_company" ("invested_founder_csv" varchar_pattern_ops);
commit;

CREATE INDEX "main_company_invested_market_csv_478006cd_like" ON "main_company" ("invested_market_csv" varchar_pattern_ops);
commit;

CREATE INDEX "main_company_invested_continent_csv_8dece8e7_like" ON "main_company" ("invested_continent_csv" varchar_pattern_ops);
commit;

CREATE INDEX "main_companyinvestingevent_e04d39f6" ON "main_companyinvestingevent" ("event_round");
commit;

CREATE INDEX "main_companyinvestingevent_a9b0c97b" ON "main_companyinvestingevent" ("last_edited_time");
commit;

CREATE INDEX "main_companyinvestingevent_bb5855f0" ON "main_companyinvestingevent" ("created_time");
commit;

CREATE INDEX "main_companyinvestingevent_4df577bd" ON "main_companyinvestingevent" ("is_tips");
commit;

CREATE INDEX "main_companyinvestingevent_fee55b15" ON "main_companyinvestingevent" ("is_rocketpunch");
commit;

CREATE INDEX "main_companyinvestingevent_e7136bc0" ON "main_companyinvestingevent" ("event_day");
commit;

CREATE INDEX "main_companyinvestingevent_64a46b37" ON "main_companyinvestingevent" ("event_month");
commit;

CREATE INDEX "main_companyinvestingevent_3b200b75" ON "main_companyinvestingevent" ("event_year");
commit;

CREATE INDEX "main_companyinvestingevent_2b660b3e" ON "main_companyinvestingevent" ("invest_currency");
commit;

CREATE INDEX "main_companyinvestingevent_1c5f0b93" ON "main_companyinvestingevent" ("invest_amt");
commit;

CREATE INDEX "main_companyinvestingevent_40802acb" ON "main_companyinvestingevent" ("invest_date");
commit;

CREATE INDEX "main_companyinvestingevent_event_round_fbdee96b_like" ON "main_companyinvestingevent" ("event_round" varchar_pattern_ops);
commit;

CREATE INDEX "main_companyinvestingevent_invest_currency_f1b74553_like" ON "main_companyinvestingevent" ("invest_currency" varchar_pattern_ops);
commit;

CREATE INDEX "main_companyinvestor_a9b0c97b" ON "main_companyinvestor" ("last_edited_time");
commit;

CREATE INDEX "main_companyinvestor_bb5855f0" ON "main_companyinvestor" ("created_time");
commit;

CREATE INDEX "main_companyinvestor_a669ba6c" ON "main_companyinvestor" ("is_user_input");
commit;

CREATE INDEX "main_companyinvestor_e4c5f499" ON "main_companyinvestor" ("investor_day");
commit;

CREATE INDEX "main_companyinvestor_6443feea" ON "main_companyinvestor" ("investor_month");
commit;

CREATE INDEX "main_companyinvestor_e840ed8f" ON "main_companyinvestor" ("investor_year");
commit;

CREATE INDEX "main_companyinvestor_c1b77059" ON "main_companyinvestor" ("investor_currency");
commit;

CREATE INDEX "main_companyinvestor_353c5b1f" ON "main_companyinvestor" ("investor_amount");
commit;

CREATE INDEX "main_companyinvestor_2b660b3e" ON "main_companyinvestor" ("invest_currency");
commit;

CREATE INDEX "main_companyinvestor_1c5f0b93" ON "main_companyinvestor" ("invest_amt");
commit;

CREATE INDEX "main_companyinvestor_40802acb" ON "main_companyinvestor" ("invest_date");
commit;

CREATE INDEX "main_companyinvestor_4264c638" ON "main_companyinvestor" ("is_active");
commit;

CREATE INDEX "main_companyinvestor_4df577bd" ON "main_companyinvestor" ("is_tips");
commit;

CREATE INDEX "main_companyinvestor_fee55b15" ON "main_companyinvestor" ("is_rocketpunch");
commit;

CREATE INDEX "main_companyinvestor_347a36a7" ON "main_companyinvestor" ("is_estimate");
commit;

CREATE INDEX "main_companyinvestor_investor_currency_3c6146e3_like" ON "main_companyinvestor" ("investor_currency" varchar_pattern_ops);
commit;

CREATE INDEX "main_companyinvestor_investor_amount_de085f9f_like" ON "main_companyinvestor" ("investor_amount" varchar_pattern_ops);
commit;

CREATE INDEX "main_companyinvestor_invest_currency_61c9b4ff_like" ON "main_companyinvestor" ("invest_currency" varchar_pattern_ops);
commit;

ALTER TABLE "main_companyresource" ADD CONSTRAINT "main_companyresource_company_id_cd1921c8_fk_main_company_id" FOREIGN KEY ("company_id") REFERENCES "main_company" ("id") DEFERRABLE INITIALLY DEFERRED;
commit;

CREATE INDEX "main_companyresource_447d3092" ON "main_companyresource" ("company_id");
commit;

CREATE INDEX "main_continent_a9b0c97b" ON "main_continent" ("last_edited_time");
commit;

CREATE INDEX "main_continent_bb5855f0" ON "main_continent" ("created_time");
commit;

CREATE INDEX "main_continent_b068931c" ON "main_continent" ("name");
commit;

CREATE INDEX "main_continent_28c1e37e" ON "main_continent" ("latitude");
commit;

CREATE INDEX "main_continent_ba569b80" ON "main_continent" ("longitude");
commit;

CREATE INDEX "main_continent_225d95cb" ON "main_continent" ("company_count");
commit;

CREATE INDEX "main_continent_1a1d3fe1" ON "main_continent" ("company_investor_count");
commit;

CREATE INDEX "main_continent_43f5deee" ON "main_continent" ("company_startup_count");
commit;

CREATE INDEX "main_continent_e4dfb059" ON "main_continent" ("company_public_count");
commit;

CREATE INDEX "main_continent_68c7b353" ON "main_continent" ("user_count");
commit;

CREATE INDEX "main_continent_name_6b0bcb6a_like" ON "main_continent" ("name" varchar_pattern_ops);
commit;

ALTER TABLE "main_country" ADD CONSTRAINT "main_country_continent_id_38ce1f9e_fk_main_continent_id" FOREIGN KEY ("continent_id") REFERENCES "main_continent" ("id") DEFERRABLE INITIALLY DEFERRED;
commit;

CREATE INDEX "main_country_a9b0c97b" ON "main_country" ("last_edited_time");
commit;

CREATE INDEX "main_country_bb5855f0" ON "main_country" ("created_time");
commit;

CREATE INDEX "main_country_b068931c" ON "main_country" ("name");
commit;

CREATE INDEX "main_country_28c1e37e" ON "main_country" ("latitude");
commit;

CREATE INDEX "main_country_ba569b80" ON "main_country" ("longitude");
commit;

CREATE INDEX "main_country_225d95cb" ON "main_country" ("company_count");
commit;

CREATE INDEX "main_country_1a1d3fe1" ON "main_country" ("company_investor_count");
commit;

CREATE INDEX "main_country_43f5deee" ON "main_country" ("company_startup_count");
commit;

CREATE INDEX "main_country_e4dfb059" ON "main_country" ("company_public_count");
commit;

CREATE INDEX "main_country_68c7b353" ON "main_country" ("user_count");
commit;

CREATE INDEX "main_country_071e6d87" ON "main_country" ("continent_id");
commit;

CREATE INDEX "main_country_name_1c6d92a2_like" ON "main_country" ("name" varchar_pattern_ops);
commit;

CREATE INDEX "main_feed_fad6c43b" ON "main_feed" ("frequency");
commit;

CREATE INDEX "main_feed_5fc73231" ON "main_feed" ("date");
commit;

CREATE INDEX "main_feed_fde81f11" ON "main_feed" ("created_at");
commit;

CREATE INDEX "main_feed_afd1a1a8" ON "main_feed" ("updated_at");
commit;

CREATE INDEX "main_fundingstage_b068931c" ON "main_fundingstage" ("name");
commit;

CREATE INDEX "main_fundingstage_fde81f11" ON "main_fundingstage" ("created_at");
commit;

CREATE INDEX "main_fundingstage_afd1a1a8" ON "main_fundingstage" ("updated_at");
commit;

CREATE INDEX "main_fundingstage_name_67ea9c02_like" ON "main_fundingstage" ("name" varchar_pattern_ops);
commit;

ALTER TABLE "main_instrument" ADD CONSTRAINT "main_instrument_company_id_9782a023_fk_main_company_id" FOREIGN KEY ("company_id") REFERENCES "main_company" ("id") DEFERRABLE INITIALLY DEFERRED;
commit;

CREATE INDEX "main_instrument_e3c9c373" ON "main_instrument" ("broker");
commit;

CREATE INDEX "main_instrument_cce85e72" ON "main_instrument" ("sym");
commit;

CREATE INDEX "main_instrument_b5fddf1e" ON "main_instrument" ("cur");
commit;

CREATE INDEX "main_instrument_871489d5" ON "main_instrument" ("exch");
commit;

CREATE INDEX "main_instrument_193240a0" ON "main_instrument" ("secType");
commit;

CREATE INDEX "main_instrument_3ca59627" ON "main_instrument" ("trade_freq");
commit;

CREATE INDEX "main_instrument_0f9f2d92" ON "main_instrument" ("mult");
commit;

CREATE INDEX "main_instrument_229543a1" ON "main_instrument" ("local_sym");
commit;

CREATE INDEX "main_instrument_ea6e7a9b" ON "main_instrument" ("contractMonth");
commit;

CREATE INDEX "main_instrument_601c7ddc" ON "main_instrument" ("expiry");
commit;

CREATE INDEX "main_instrument_4546e386" ON "main_instrument" ("evRule");
commit;

CREATE INDEX "main_instrument_1db70381" ON "main_instrument" ("liquidHours");
commit;

CREATE INDEX "main_instrument_9eb38def" ON "main_instrument" ("longName");
commit;

CREATE INDEX "main_instrument_e69952b0" ON "main_instrument" ("minTick");
commit;

CREATE INDEX "main_instrument_9842a082" ON "main_instrument" ("timeZoneId");
commit;

CREATE INDEX "main_instrument_3bfd35b6" ON "main_instrument" ("tradingHours");
commit;

CREATE INDEX "main_instrument_d8fae1fe" ON "main_instrument" ("underConId");
commit;

CREATE INDEX "main_instrument_fde81f11" ON "main_instrument" ("created_at");
commit;

CREATE INDEX "main_instrument_afd1a1a8" ON "main_instrument" ("updated_at");
commit;

CREATE INDEX "main_instrument_447d3092" ON "main_instrument" ("company_id");
commit;

CREATE INDEX "main_instrument_broker_e5570726_like" ON "main_instrument" ("broker" varchar_pattern_ops);
commit;

CREATE INDEX "main_instrument_sym_50e7d8d7_like" ON "main_instrument" ("sym" varchar_pattern_ops);
commit;

CREATE INDEX "main_instrument_cur_52005761_like" ON "main_instrument" ("cur" varchar_pattern_ops);
commit;

CREATE INDEX "main_instrument_exch_7faf5632_like" ON "main_instrument" ("exch" varchar_pattern_ops);
commit;

CREATE INDEX "main_instrument_secType_fa1df52c_like" ON "main_instrument" ("secType" varchar_pattern_ops);
commit;

CREATE INDEX "main_instrument_local_sym_78400407_like" ON "main_instrument" ("local_sym" varchar_pattern_ops);
commit;

CREATE INDEX "main_instrument_contractMonth_d5adc152_like" ON "main_instrument" ("contractMonth" varchar_pattern_ops);
commit;

CREATE INDEX "main_instrument_expiry_044aa443_like" ON "main_instrument" ("expiry" varchar_pattern_ops);
commit;

CREATE INDEX "main_instrument_evRule_7f405280_like" ON "main_instrument" ("evRule" varchar_pattern_ops);
commit;

CREATE INDEX "main_instrument_liquidHours_e1aa5559_like" ON "main_instrument" ("liquidHours" varchar_pattern_ops);
commit;

CREATE INDEX "main_instrument_longName_9c9432ea_like" ON "main_instrument" ("longName" varchar_pattern_ops);
commit;

CREATE INDEX "main_instrument_timeZoneId_6fdb874a_like" ON "main_instrument" ("timeZoneId" varchar_pattern_ops);
commit;

CREATE INDEX "main_instrument_tradingHours_09f1c451_like" ON "main_instrument" ("tradingHours" varchar_pattern_ops);
commit;

CREATE INDEX "main_investortype_slug_53785cb8_like" ON "main_investortype" ("slug" varchar_pattern_ops);
commit;

CREATE INDEX "main_market_b068931c" ON "main_market" ("name");
commit;

CREATE INDEX "main_market_e6dec152" ON "main_market" ("vertical");
commit;

CREATE INDEX "main_market_55a2ea80" ON "main_market" ("sub_vertical");
commit;

CREATE INDEX "main_market_fde81f11" ON "main_market" ("created_at");
commit;

CREATE INDEX "main_market_afd1a1a8" ON "main_market" ("updated_at");
commit;

CREATE INDEX "main_market_name_c00d7eef_like" ON "main_market" ("name" varchar_pattern_ops);
commit;

CREATE INDEX "main_market_vertical_2592e68d_like" ON "main_market" ("vertical" varchar_pattern_ops);
commit;

CREATE INDEX "main_market_sub_vertical_ef6e3e6f_like" ON "main_market" ("sub_vertical" varchar_pattern_ops);
commit;

CREATE INDEX "main_market_slug_058ed5ec_like" ON "main_market" ("slug" varchar_pattern_ops);
commit;

ALTER TABLE "main_prediction" ADD CONSTRAINT "main_prediction_instrument_id_c33e1b5d_fk_main_instrument_id" FOREIGN KEY ("instrument_id") REFERENCES "main_instrument" ("id") DEFERRABLE INITIALLY DEFERRED;
commit;

CREATE INDEX "main_prediction_fad6c43b" ON "main_prediction" ("frequency");
commit;

CREATE INDEX "main_prediction_d7a744c6" ON "main_prediction" ("pred_start_date");
commit;

CREATE INDEX "main_prediction_5fc73231" ON "main_prediction" ("date");
commit;

CREATE INDEX "main_prediction_fde81f11" ON "main_prediction" ("created_at");
commit;

CREATE INDEX "main_prediction_afd1a1a8" ON "main_prediction" ("updated_at");
commit;

CREATE INDEX "main_prediction_9afea17b" ON "main_prediction" ("instrument_id");
commit;

CREATE INDEX "main_region_a9b0c97b" ON "main_region" ("last_edited_time");
commit;

CREATE INDEX "main_region_bb5855f0" ON "main_region" ("created_time");
commit;

CREATE INDEX "main_region_b068931c" ON "main_region" ("name");
commit;

CREATE INDEX "main_region_28c1e37e" ON "main_region" ("latitude");
commit;

CREATE INDEX "main_region_ba569b80" ON "main_region" ("longitude");
commit;

CREATE INDEX "main_region_name_91f1f519_like" ON "main_region" ("name" varchar_pattern_ops);
commit;

ALTER TABLE "main_resource" ADD CONSTRAINT "main_resource_city_id_33f28ede_fk_main_city_id" FOREIGN KEY ("city_id") REFERENCES "main_city" ("id") DEFERRABLE INITIALLY DEFERRED;
commit;

ALTER TABLE "main_resource" ADD CONSTRAINT "main_resource_continent_id_caf18a42_fk_main_continent_id" FOREIGN KEY ("continent_id") REFERENCES "main_continent" ("id") DEFERRABLE INITIALLY DEFERRED;
commit;

ALTER TABLE "main_resource" ADD CONSTRAINT "main_resource_country_id_59bd0132_fk_main_country_id" FOREIGN KEY ("country_id") REFERENCES "main_country" ("id") DEFERRABLE INITIALLY DEFERRED;
commit;

ALTER TABLE "main_resource" ADD CONSTRAINT "main_resource_funding_stage_id_64e1cb2d_fk_main_fundingstage_id" FOREIGN KEY ("funding_stage_id") REFERENCES "main_fundingstage" ("id") DEFERRABLE INITIALLY DEFERRED;
commit;

ALTER TABLE "main_resource" ADD CONSTRAINT "main_resour_invested_stages_id_80ec2faf_fk_main_fundingstage_id" FOREIGN KEY ("invested_stages_id") REFERENCES "main_fundingstage" ("id") DEFERRABLE INITIALLY DEFERRED;
commit;

ALTER TABLE "main_resource" ADD CONSTRAINT "main_resource_investor_type_id_b0910386_fk_main_investortype_id" FOREIGN KEY ("investor_type_id") REFERENCES "main_investortype" ("id") DEFERRABLE INITIALLY DEFERRED;
commit;

ALTER TABLE "main_resource" ADD CONSTRAINT "main_resource_owner_id_120a2194_fk_auth_user_id" FOREIGN KEY ("owner_id") REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED;
commit;

ALTER TABLE "main_resource" ADD CONSTRAINT "main_resource_region_id_f6e5846a_fk_main_region_id" FOREIGN KEY ("region_id") REFERENCES "main_region" ("id") DEFERRABLE INITIALLY DEFERRED;
commit;

CREATE INDEX "main_resource_4562f0d0" ON "main_resource" ("resource_type");
commit;

CREATE INDEX "main_resource_d983bbbb" ON "main_resource" ("commodity_type");
commit;

CREATE INDEX "main_resource_4264c638" ON "main_resource" ("is_active");
commit;

CREATE INDEX "main_resource_11725655" ON "main_resource" ("is_public");
commit;

CREATE INDEX "main_resource_463223eb" ON "main_resource" ("is_confirm");
commit;

CREATE INDEX "main_resource_38c5f373" ON "main_resource" ("is_trusted_vc");
commit;

CREATE INDEX "main_resource_f3d6f5c9" ON "main_resource" ("is_partner");
commit;

CREATE INDEX "main_resource_d8e3caae" ON "main_resource" ("is_angel");
commit;

CREATE INDEX "main_resource_4df577bd" ON "main_resource" ("is_tips");
commit;

CREATE INDEX "main_resource_fee55b15" ON "main_resource" ("is_rocketpunch");
commit;

CREATE INDEX "main_resource_61f856e3" ON "main_resource" ("is_startup");
commit;

CREATE INDEX "main_resource_6e2900d4" ON "main_resource" ("is_investor");
commit;

CREATE INDEX "main_resource_8a084cf7" ON "main_resource" ("ticker");
commit;

CREATE INDEX "main_resource_5c731c8c" ON "main_resource" ("exchange");
commit;

CREATE INDEX "main_resource_154c1303" ON "main_resource" ("sec_cik");
commit;

CREATE INDEX "main_resource_22b6a063" ON "main_resource" ("sec_cik_int");
commit;

CREATE INDEX "main_resource_a9b0c97b" ON "main_resource" ("last_edited_time");
commit;

CREATE INDEX "main_resource_bb5855f0" ON "main_resource" ("created_time");
commit;

CREATE INDEX "main_resource_c1007e8a" ON "main_resource" ("company_name");
commit;

CREATE INDEX "main_resource_4264fa21" ON "main_resource" ("company_kor_name");
commit;

CREATE INDEX "main_resource_bc4de5a9" ON "main_resource" ("company_class");
commit;

CREATE INDEX "main_resource_f2452ee6" ON "main_resource" ("rocketpunch_url");
commit;

CREATE INDEX "main_resource_fbff80ba" ON "main_resource" ("angellist_url");
commit;

CREATE INDEX "main_resource_f06814ed" ON "main_resource" ("sec_url");
commit;

CREATE INDEX "main_resource_d69203b3" ON "main_resource" ("e27_url");
commit;

CREATE INDEX "main_resource_33780092" ON "main_resource" ("f6s_url");
commit;

CREATE INDEX "main_resource_bba37091" ON "main_resource" ("forbes_url");
commit;

CREATE INDEX "main_resource_d3380a28" ON "main_resource" ("investor_class");
commit;

CREATE INDEX "main_resource_b7eb5d9c" ON "main_resource" ("company_industry");
commit;

CREATE INDEX "main_resource_7e214e10" ON "main_resource" ("company_continent");
commit;

CREATE INDEX "main_resource_9e2b0ee2" ON "main_resource" ("company_country");
commit;

CREATE INDEX "main_resource_0693b93b" ON "main_resource" ("company_city");
commit;

CREATE INDEX "main_resource_3bd52307" ON "main_resource" ("company_state");
commit;

CREATE INDEX "main_resource_16670d4e" ON "main_resource" ("company_region");
commit;

CREATE INDEX "main_resource_8b6b622d" ON "main_resource" ("company_location");
commit;

CREATE INDEX "main_resource_6c50c7f1" ON "main_resource" ("company_location_latitude");
commit;

CREATE INDEX "main_resource_2885a201" ON "main_resource" ("company_location_longitude");
commit;

CREATE INDEX "main_resource_192c3778" ON "main_resource" ("company_established");
commit;

CREATE INDEX "main_resource_ad226066" ON "main_resource" ("company_founded_year");
commit;

CREATE INDEX "main_resource_2c93df8c" ON "main_resource" ("company_founded_month");
commit;

CREATE INDEX "main_resource_f6018d4e" ON "main_resource" ("company_founded_day");
commit;

CREATE INDEX "main_resource_b109d4cd" ON "main_resource" ("company_website");
commit;

CREATE INDEX "main_resource_c5b49fd9" ON "main_resource" ("company_number");
commit;

CREATE INDEX "main_resource_7d826fd6" ON "main_resource" ("corporate_number");
commit;

CREATE INDEX "main_resource_ee724e2f" ON "main_resource" ("investor_list_csv");
commit;

CREATE INDEX "main_resource_1bf93bcf" ON "main_resource" ("product_market_csv");
commit;

CREATE INDEX "main_resource_023e7239" ON "main_resource" ("invested_funding_stage_csv");
commit;

CREATE INDEX "main_resource_b7e28c0c" ON "main_resource" ("last_funding_amt");
commit;

CREATE INDEX "main_resource_e83ca751" ON "main_resource" ("last_funding_date");
commit;

CREATE INDEX "main_resource_cbbcbb27" ON "main_resource" ("total_funding_amt");
commit;

CREATE INDEX "main_resource_a66285ba" ON "main_resource" ("total_valuation");
commit;

CREATE INDEX "main_resource_b2337225" ON "main_resource" ("total_asset");
commit;

CREATE INDEX "main_resource_74cf7cd2" ON "main_resource" ("total_debt");
commit;

CREATE INDEX "main_resource_86a19171" ON "main_resource" ("total_capital");
commit;

CREATE INDEX "main_resource_faf3b8e3" ON "main_resource" ("total_sales");
commit;

CREATE INDEX "main_resource_dc6fb62a" ON "main_resource" ("period_end_date");
commit;

CREATE INDEX "main_resource_7271259c" ON "main_resource" ("score1");
commit;

CREATE INDEX "main_resource_ed28b0ab" ON "main_resource" ("score2");
commit;

CREATE INDEX "main_resource_f6f63d76" ON "main_resource" ("score3");
commit;

CREATE INDEX "main_resource_a164b067" ON "main_resource" ("score4");
commit;

CREATE INDEX "main_resource_3d3a97ef" ON "main_resource" ("score5");
commit;

CREATE INDEX "main_resource_259764f4" ON "main_resource" ("invested_stages_csv");
commit;

CREATE INDEX "main_resource_fe284ac2" ON "main_resource" ("invested_success");
commit;

CREATE INDEX "main_resource_20ef32af" ON "main_resource" ("invested_success_amt");
commit;

CREATE INDEX "main_resource_9a8daa8f" ON "main_resource" ("invested_founder_csv");
commit;

CREATE INDEX "main_resource_5630e841" ON "main_resource" ("invested_market_csv");
commit;

CREATE INDEX "main_resource_0704c6f5" ON "main_resource" ("invested_continent_csv");
commit;

CREATE INDEX "main_resource_c7141997" ON "main_resource" ("city_id");
commit;

CREATE INDEX "main_resource_071e6d87" ON "main_resource" ("continent_id");
commit;

CREATE INDEX "main_resource_93bfec8a" ON "main_resource" ("country_id");
commit;

CREATE INDEX "main_resource_d3342098" ON "main_resource" ("funding_stage_id");
commit;

CREATE INDEX "main_resource_40cf68f8" ON "main_resource" ("invested_stages_id");
commit;

CREATE INDEX "main_resource_674d1b03" ON "main_resource" ("investor_type_id");
commit;

CREATE INDEX "main_resource_5e7b1936" ON "main_resource" ("owner_id");
commit;

CREATE INDEX "main_resource_0f442f96" ON "main_resource" ("region_id");
commit;

CREATE INDEX "main_resource_resource_type_823f13bc_like" ON "main_resource" ("resource_type" varchar_pattern_ops);
commit;

CREATE INDEX "main_resource_commodity_type_ba818312_like" ON "main_resource" ("commodity_type" varchar_pattern_ops);
commit;

CREATE INDEX "main_resource_ticker_af17e385_like" ON "main_resource" ("ticker" varchar_pattern_ops);
commit;

CREATE INDEX "main_resource_exchange_96bb0f15_like" ON "main_resource" ("exchange" varchar_pattern_ops);
commit;

CREATE INDEX "main_resource_sec_cik_815fc3a4_like" ON "main_resource" ("sec_cik" varchar_pattern_ops);
commit;

CREATE INDEX "main_resource_sec_cik_int_dd3c4955_like" ON "main_resource" ("sec_cik_int" varchar_pattern_ops);
commit;

CREATE INDEX "main_resource_company_name_706c98ca_like" ON "main_resource" ("company_name" varchar_pattern_ops);
commit;

CREATE INDEX "main_resource_company_kor_name_e72c9b0f_like" ON "main_resource" ("company_kor_name" varchar_pattern_ops);
commit;

CREATE INDEX "main_resource_company_class_12a91305_like" ON "main_resource" ("company_class" varchar_pattern_ops);
commit;

CREATE INDEX "main_resource_rocketpunch_url_38797bf8_like" ON "main_resource" ("rocketpunch_url" varchar_pattern_ops);
commit;

CREATE INDEX "main_resource_angellist_url_ca3b6e27_like" ON "main_resource" ("angellist_url" varchar_pattern_ops);
commit;

CREATE INDEX "main_resource_sec_url_133ed9fe_like" ON "main_resource" ("sec_url" varchar_pattern_ops);
commit;

CREATE INDEX "main_resource_e27_url_233b58d1_like" ON "main_resource" ("e27_url" varchar_pattern_ops);
commit;

CREATE INDEX "main_resource_f6s_url_feaa6f9c_like" ON "main_resource" ("f6s_url" varchar_pattern_ops);
commit;

CREATE INDEX "main_resource_forbes_url_8fb6b3cb_like" ON "main_resource" ("forbes_url" varchar_pattern_ops);
commit;

CREATE INDEX "main_resource_investor_class_2dcc38fe_like" ON "main_resource" ("investor_class" varchar_pattern_ops);
commit;

CREATE INDEX "main_resource_company_industry_92cf8b70_like" ON "main_resource" ("company_industry" varchar_pattern_ops);
commit;

CREATE INDEX "main_resource_company_continent_0fb52f64_like" ON "main_resource" ("company_continent" varchar_pattern_ops);
commit;

CREATE INDEX "main_resource_company_country_ce0b9a58_like" ON "main_resource" ("company_country" varchar_pattern_ops);
commit;

CREATE INDEX "main_resource_company_city_02d30e42_like" ON "main_resource" ("company_city" varchar_pattern_ops);
commit;

CREATE INDEX "main_resource_company_state_933a1bd0_like" ON "main_resource" ("company_state" varchar_pattern_ops);
commit;

CREATE INDEX "main_resource_company_region_0692a0b1_like" ON "main_resource" ("company_region" varchar_pattern_ops);
commit;

CREATE INDEX "main_resource_company_location_8014e7d4_like" ON "main_resource" ("company_location" varchar_pattern_ops);
commit;

CREATE INDEX "main_resource_company_established_e68ee3a7_like" ON "main_resource" ("company_established" varchar_pattern_ops);
commit;

CREATE INDEX "main_resource_company_website_f6874394_like" ON "main_resource" ("company_website" varchar_pattern_ops);
commit;

CREATE INDEX "main_resource_company_number_564cab8e_like" ON "main_resource" ("company_number" varchar_pattern_ops);
commit;

CREATE INDEX "main_resource_corporate_number_8b22a0df_like" ON "main_resource" ("corporate_number" varchar_pattern_ops);
commit;

CREATE INDEX "main_resource_investor_list_csv_61fc4d35_like" ON "main_resource" ("investor_list_csv" varchar_pattern_ops);
commit;

CREATE INDEX "main_resource_product_market_csv_a49174af_like" ON "main_resource" ("product_market_csv" varchar_pattern_ops);
commit;

CREATE INDEX "main_resource_invested_funding_stage_csv_55de5e0c_like" ON "main_resource" ("invested_funding_stage_csv" varchar_pattern_ops);
commit;

CREATE INDEX "main_resource_slug_4a9907dd_like" ON "main_resource" ("slug" varchar_pattern_ops);
commit;

CREATE INDEX "main_resource_invested_stages_csv_0764843b_like" ON "main_resource" ("invested_stages_csv" varchar_pattern_ops);
commit;

CREATE INDEX "main_resource_invested_founder_csv_68106918_like" ON "main_resource" ("invested_founder_csv" varchar_pattern_ops);
commit;

CREATE INDEX "main_resource_invested_market_csv_03337b34_like" ON "main_resource" ("invested_market_csv" varchar_pattern_ops);
commit;

CREATE INDEX "main_resource_invested_continent_csv_6b182876_like" ON "main_resource" ("invested_continent_csv" varchar_pattern_ops);
commit;

ALTER TABLE "main_state" ADD CONSTRAINT "main_state_continent_id_fd5c09c3_fk_main_continent_id" FOREIGN KEY ("continent_id") REFERENCES "main_continent" ("id") DEFERRABLE INITIALLY DEFERRED;
commit;

ALTER TABLE "main_state" ADD CONSTRAINT "main_state_country_id_83be6689_fk_main_country_id" FOREIGN KEY ("country_id") REFERENCES "main_country" ("id") DEFERRABLE INITIALLY DEFERRED;
commit;

CREATE INDEX "main_state_a9b0c97b" ON "main_state" ("last_edited_time");
commit;

CREATE INDEX "main_state_bb5855f0" ON "main_state" ("created_time");
commit;

CREATE INDEX "main_state_b068931c" ON "main_state" ("name");
commit;

CREATE INDEX "main_state_28c1e37e" ON "main_state" ("latitude");
commit;

CREATE INDEX "main_state_ba569b80" ON "main_state" ("longitude");
commit;

CREATE INDEX "main_state_071e6d87" ON "main_state" ("continent_id");
commit;

CREATE INDEX "main_state_93bfec8a" ON "main_state" ("country_id");
commit;

CREATE INDEX "main_state_name_8533872e_like" ON "main_state" ("name" varchar_pattern_ops);
commit;

ALTER TABLE "main_system" ADD CONSTRAINT "main_system_c2instrument_id_f94e5ddd_fk_main_instrument_id" FOREIGN KEY ("c2instrument_id") REFERENCES "main_instrument" ("id") DEFERRABLE INITIALLY DEFERRED;
commit;

ALTER TABLE "main_system" ADD CONSTRAINT "main_system_ibinstrument_id_32676a3f_fk_main_instrument_id" FOREIGN KEY ("ibinstrument_id") REFERENCES "main_instrument" ("id") DEFERRABLE INITIALLY DEFERRED;
commit;

CREATE INDEX "main_system_2af72f10" ON "main_system" ("version");
commit;

CREATE INDEX "main_system_54b53072" ON "main_system" ("system");
commit;

CREATE INDEX "main_system_b068931c" ON "main_system" ("name");
commit;

CREATE INDEX "main_system_72701e21" ON "main_system" ("c2id");
commit;

CREATE INDEX "main_system_6596891a" ON "main_system" ("c2api");
commit;

CREATE INDEX "main_system_5ece3b5a" ON "main_system" ("c2qty");
commit;

CREATE INDEX "main_system_73875049" ON "main_system" ("ibqty");
commit;

CREATE INDEX "main_system_3ca59627" ON "main_system" ("trade_freq");
commit;

CREATE INDEX "main_system_48b578af" ON "main_system" ("ibmult");
commit;

CREATE INDEX "main_system_1267705f" ON "main_system" ("c2mult");
commit;

CREATE INDEX "main_system_521345a9" ON "main_system" ("signal");
commit;

CREATE INDEX "main_system_5fa7c197" ON "main_system" ("c2instrument_id");
commit;

CREATE INDEX "main_system_bbff59fd" ON "main_system" ("ibinstrument_id");
commit;

CREATE INDEX "main_system_version_a3ac338d_like" ON "main_system" ("version" varchar_pattern_ops);
commit;

CREATE INDEX "main_system_system_649abd73_like" ON "main_system" ("system" varchar_pattern_ops);
commit;

CREATE INDEX "main_system_name_1d11a37c_like" ON "main_system" ("name" varchar_pattern_ops);
commit;

CREATE INDEX "main_system_c2id_90f59312_like" ON "main_system" ("c2id" varchar_pattern_ops);
commit;

CREATE INDEX "main_system_c2api_483489f9_like" ON "main_system" ("c2api" varchar_pattern_ops);
commit;

CREATE INDEX "main_system_signal_b6c424af_like" ON "main_system" ("signal" varchar_pattern_ops);
commit;

CREATE INDEX "main_resource_d5582625" ON "main_resource" ("state_id");
commit;

ALTER TABLE "main_resource" ADD CONSTRAINT "main_resource_state_id_f56e49a0_fk_main_state_id" FOREIGN KEY ("state_id") REFERENCES "main_state" ("id") DEFERRABLE INITIALLY DEFERRED;
commit;

CREATE INDEX "main_instrument_e2f3ef5b" ON "main_instrument" ("resource_id");
commit;

ALTER TABLE "main_instrument" ADD CONSTRAINT "main_instrument_resource_id_1e24756a_fk_main_resource_id" FOREIGN KEY ("resource_id") REFERENCES "main_resource" ("id") DEFERRABLE INITIALLY DEFERRED;
commit;

CREATE INDEX "main_feed_9afea17b" ON "main_feed" ("instrument_id");
commit;

ALTER TABLE "main_feed" ADD CONSTRAINT "main_feed_instrument_id_119f233f_fk_main_instrument_id" FOREIGN KEY ("instrument_id") REFERENCES "main_instrument" ("id") DEFERRABLE INITIALLY DEFERRED;
commit;

CREATE INDEX "main_companyresource_e2f3ef5b" ON "main_companyresource" ("resource_id");
commit;

ALTER TABLE "main_companyresource" ADD CONSTRAINT "main_companyresource_resource_id_1d9934af_fk_main_resource_id" FOREIGN KEY ("resource_id") REFERENCES "main_resource" ("id") DEFERRABLE INITIALLY DEFERRED;
commit;

CREATE INDEX "main_companyinvestor_d3342098" ON "main_companyinvestor" ("funding_stage_id");
commit;

ALTER TABLE "main_companyinvestor" ADD CONSTRAINT "main_companyi_funding_stage_id_1d4e2c15_fk_main_fundingstage_id" FOREIGN KEY ("funding_stage_id") REFERENCES "main_fundingstage" ("id") DEFERRABLE INITIALLY DEFERRED;
commit;

CREATE INDEX "main_companyinvestor_c1cbbdc1" ON "main_companyinvestor" ("investor_id");
commit;

ALTER TABLE "main_companyinvestor" ADD CONSTRAINT "main_companyinvestor_investor_id_cc10970f_fk_main_company_id" FOREIGN KEY ("investor_id") REFERENCES "main_company" ("id") DEFERRABLE INITIALLY DEFERRED;
commit;

CREATE INDEX "main_companyinvestor_5e7b1936" ON "main_companyinvestor" ("owner_id");
commit;

ALTER TABLE "main_companyinvestor" ADD CONSTRAINT "main_companyinvestor_owner_id_119001a4_fk_main_company_id" FOREIGN KEY ("owner_id") REFERENCES "main_company" ("id") DEFERRABLE INITIALLY DEFERRED;
commit;

CREATE INDEX "main_companyinvestingevent_d3342098" ON "main_companyinvestingevent" ("funding_stage_id");
commit;

ALTER TABLE "main_companyinvestingevent" ADD CONSTRAINT "main_companyi_funding_stage_id_7525da49_fk_main_fundingstage_id" FOREIGN KEY ("funding_stage_id") REFERENCES "main_fundingstage" ("id") DEFERRABLE INITIALLY DEFERRED;
commit;

ALTER TABLE "main_companyinvestingevent_investor" ADD CONSTRAINT "b27363c9b83b288394ddd43ef9e9116c" FOREIGN KEY ("companyinvestingevent_id") REFERENCES "main_companyinvestingevent" ("id") DEFERRABLE INITIALLY DEFERRED;
commit;

ALTER TABLE "main_companyinvestingevent_investor" ADD CONSTRAINT "main_com_companyinvestor_id_bd115879_fk_main_companyinvestor_id" FOREIGN KEY ("companyinvestor_id") REFERENCES "main_companyinvestor" ("id") DEFERRABLE INITIALLY DEFERRED;
commit;

ALTER TABLE "main_companyinvestingevent_investor" ADD CONSTRAINT "main_companyinvestingeve_companyinvestingevent_id_a04ba487_uniq" UNIQUE ("companyinvestingevent_id", "companyinvestor_id");
commit;

CREATE INDEX "main_companyinvestingevent_investor_7f9cf1a9" ON "main_companyinvestingevent_investor" ("companyinvestingevent_id");
commit;

CREATE INDEX "main_companyinvestingevent_investor_479444e9" ON "main_companyinvestingevent_investor" ("companyinvestor_id");
commit;

CREATE INDEX "main_companyinvestingevent_5e7b1936" ON "main_companyinvestingevent" ("owner_id");
commit;

ALTER TABLE "main_companyinvestingevent" ADD CONSTRAINT "main_companyinvestingevent_owner_id_c8b6b297_fk_main_company_id" FOREIGN KEY ("owner_id") REFERENCES "main_company" ("id") DEFERRABLE INITIALLY DEFERRED;
commit;

CREATE INDEX "main_company_071e6d87" ON "main_company" ("continent_id");
commit;

ALTER TABLE "main_company" ADD CONSTRAINT "main_company_continent_id_5a6c5aaf_fk_main_continent_id" FOREIGN KEY ("continent_id") REFERENCES "main_continent" ("id") DEFERRABLE INITIALLY DEFERRED;
commit;

CREATE INDEX "main_company_93bfec8a" ON "main_company" ("country_id");
commit;

ALTER TABLE "main_company" ADD CONSTRAINT "main_company_country_id_3f3cb0e9_fk_main_country_id" FOREIGN KEY ("country_id") REFERENCES "main_country" ("id") DEFERRABLE INITIALLY DEFERRED;
commit;

CREATE INDEX "main_company_d3342098" ON "main_company" ("funding_stage_id");
commit;

ALTER TABLE "main_company" ADD CONSTRAINT "main_company_funding_stage_id_9a040000_fk_main_fundingstage_id" FOREIGN KEY ("funding_stage_id") REFERENCES "main_fundingstage" ("id") DEFERRABLE INITIALLY DEFERRED;
commit;

CREATE INDEX "main_company_40cf68f8" ON "main_company" ("invested_stages_id");
commit;

ALTER TABLE "main_company" ADD CONSTRAINT "main_compan_invested_stages_id_3bdb298d_fk_main_fundingstage_id" FOREIGN KEY ("invested_stages_id") REFERENCES "main_fundingstage" ("id") DEFERRABLE INITIALLY DEFERRED;
commit;

CREATE INDEX "main_company_674d1b03" ON "main_company" ("investor_type_id");
commit;

ALTER TABLE "main_company" ADD CONSTRAINT "main_company_investor_type_id_7ee71cba_fk_main_investortype_id" FOREIGN KEY ("investor_type_id") REFERENCES "main_investortype" ("id") DEFERRABLE INITIALLY DEFERRED;
commit;

CREATE INDEX "main_company_5e7b1936" ON "main_company" ("owner_id");
commit;

ALTER TABLE "main_company" ADD CONSTRAINT "main_company_owner_id_66a76e83_fk_auth_user_id" FOREIGN KEY ("owner_id") REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED;
commit;

CREATE INDEX "main_company_0f442f96" ON "main_company" ("region_id");
commit;

ALTER TABLE "main_company" ADD CONSTRAINT "main_company_region_id_bc485d27_fk_main_region_id" FOREIGN KEY ("region_id") REFERENCES "main_region" ("id") DEFERRABLE INITIALLY DEFERRED;
commit;

CREATE INDEX "main_company_d5582625" ON "main_company" ("state_id");
commit;

ALTER TABLE "main_company" ADD CONSTRAINT "main_company_state_id_71d64464_fk_main_state_id" FOREIGN KEY ("state_id") REFERENCES "main_state" ("id") DEFERRABLE INITIALLY DEFERRED;
commit;

CREATE INDEX "main_city_071e6d87" ON "main_city" ("continent_id");
commit;

ALTER TABLE "main_city" ADD CONSTRAINT "main_city_continent_id_f5fcac3e_fk_main_continent_id" FOREIGN KEY ("continent_id") REFERENCES "main_continent" ("id") DEFERRABLE INITIALLY DEFERRED;
commit;

CREATE INDEX "main_city_93bfec8a" ON "main_city" ("country_id");
commit;

ALTER TABLE "main_city" ADD CONSTRAINT "main_city_country_id_df1a0601_fk_main_country_id" FOREIGN KEY ("country_id") REFERENCES "main_country" ("id") DEFERRABLE INITIALLY DEFERRED;
commit;

CREATE INDEX "main_city_d5582625" ON "main_city" ("state_id");
commit;

ALTER TABLE "main_city" ADD CONSTRAINT "main_city_state_id_f92848c7_fk_main_state_id" FOREIGN KEY ("state_id") REFERENCES "main_state" ("id") DEFERRABLE INITIALLY DEFERRED;
commit;

CREATE INDEX "main_bidask_9afea17b" ON "main_bidask" ("instrument_id");
commit;

ALTER TABLE "main_bidask" ADD CONSTRAINT "main_bidask_instrument_id_b25166cf_fk_main_instrument_id" FOREIGN KEY ("instrument_id") REFERENCES "main_instrument" ("id") DEFERRABLE INITIALLY DEFERRED;
commit;


COMMIT;
commit;

