BEGIN;
commit;

--
-- Create model City
--
CREATE TABLE "feed_city" ("id" serial NOT NULL PRIMARY KEY, "is_save" boolean NOT NULL, "is_confirm" boolean NOT NULL, "last_edited_time" timestamp with time zone NOT NULL, "created_time" timestamp with time zone NOT NULL, "name" varchar(500) NOT NULL, "latitude" integer NOT NULL, "longitude" integer NOT NULL);
commit;

--
-- Create model Company
--
CREATE TABLE "feed_company" ("id" serial NOT NULL PRIMARY KEY, "is_private_company_all" boolean NOT NULL, "is_private_company_class" boolean NOT NULL, "is_private_investor_class" boolean NOT NULL, "is_private_company_short" boolean NOT NULL, "is_private_company_long" boolean NOT NULL, "is_private_company_industry" boolean NOT NULL, "is_private_company_country" boolean NOT NULL, "is_private_company_city" boolean NOT NULL, "is_private_company_state" boolean NOT NULL, "is_private_company_region" boolean NOT NULL, "is_private_company_employee" boolean NOT NULL, "is_private_corporation" boolean NOT NULL, "is_private_company_established" boolean NOT NULL, "is_private_company_founded_year" boolean NOT NULL, "is_private_patent" boolean NOT NULL, "is_private_team" boolean NOT NULL, "is_private_company_fundraising" boolean NOT NULL, "is_private_company_logo" boolean NOT NULL, "is_private_company_website" boolean NOT NULL, "is_private_company_founded_day" boolean NOT NULL, "is_private_company_founded_month" boolean NOT NULL, "is_private_company_name" boolean NOT NULL, "company_favorite_count" integer NOT NULL, "company_recommendation_count" integer NOT NULL, "is_active" boolean NOT NULL, "is_public" boolean NOT NULL, "is_save" boolean NOT NULL, "is_confirm" boolean NOT NULL, "is_trusted_vc" boolean NOT NULL, "is_partner" boolean NOT NULL, "is_angel" boolean NOT NULL, "is_government" boolean NOT NULL, "is_tips" boolean NOT NULL, "is_dcamp" boolean NOT NULL, "is_rocketpunch" boolean NOT NULL, "is_dart" boolean NOT NULL, "is_bizinkorea" boolean NOT NULL, "is_startup" boolean NOT NULL, "is_investor" boolean NOT NULL, "ticker" varchar(100) NULL, "exchange" varchar(100) NULL, "sec_cik" varchar(100) NULL, "sec_cik_int" varchar(100) NULL, "partner_order" integer NOT NULL, "last_edited_time" timestamp with time zone NOT NULL, "created_time" timestamp with time zone NULL, "company_name" varchar(1000) NOT NULL, "company_kor_name" varchar(1000) NULL, "company_class" varchar(15) NOT NULL, "tips_start_date" date NULL, "rocketpunch_url" varchar(1001) NULL, "angellist_url" varchar(702) NULL, "sec_url" varchar(701) NULL, "e27_url" varchar(700) NULL, "f6s_url" varchar(703) NULL, "forbes_url" varchar(707) NULL, "investor_class" varchar(1000) NOT NULL, "company_short" varchar(10001) NOT NULL, "company_long" text NOT NULL, "company_industry" varchar(5002) NOT NULL, "company_continent" varchar(300) NULL, "company_country" varchar(300) NOT NULL, "company_city" varchar(300) NOT NULL, "company_state" varchar(300) NULL, "company_region" varchar(300) NULL, "company_location" varchar(1003) NULL, "company_location_latitude" integer NOT NULL, "company_location_longitude" integer NOT NULL, "company_employee" varchar(20) NOT NULL, "corporation" varchar(10) NOT NULL, "company_established" varchar(30) NULL, "company_founded_year" integer NULL, "company_founded_month" integer NULL, "company_founded_day" integer NULL, "company_website" varchar(1007) NOT NULL, "company_logo" varchar(1008) NOT NULL, "company_fundraising" varchar(300) NOT NULL, "company_fundraising_currency" varchar(300) NULL, "company_fundraising_highlight" varchar(300) NULL, "company_fundraising_deck" varchar(1009) NULL, "company_number" varchar(210) NULL, "corporate_number" varchar(211) NULL, "employee_total" integer NOT NULL, "employee_total_month_ago" integer NOT NULL, "employee_added_this_month" integer NOT NULL, "employee_growth_month" integer NOT NULL, "employee_total_6month_ago" integer NOT NULL, "employee_added_in_6month" integer NOT NULL, "employee_growth_6month" integer NOT NULL, "employee_added_since_funding" integer NOT NULL, "employee_months_since_funding" integer NOT NULL, "employee_growth_since_funding" integer NOT NULL, "investor_list_csv" varchar(5012) NULL, "product_list_csv" varchar(5013) NULL, "product_market_csv" varchar(5014) NULL, "invested_funding_stage_csv" varchar(5015) NULL, "traffic_growth_month" integer NOT NULL, "last_funding_amt" double precision NOT NULL, "last_funding_date" timestamp with time zone NULL, "last_funding_months_ago" integer NOT NULL, "total_funding_amt" double precision NOT NULL, "funding_stage_name" varchar(116) NULL, "product_app_store" varchar(217) NULL, "product_google_play" varchar(218) NULL, "company_top_keywords" varchar(5019) NULL, "company_interests" varchar(5020) NULL, "company_alerts" varchar(221) NULL, "traffic_monthly_unique" integer NOT NULL, "traffic_monthly_unique_week_ago" integer NOT NULL, "traffic_monthly_weekly_growth" integer NOT NULL, "traffic_monthly_unique_month_ago" integer NOT NULL, "traffic_monthly_monthly_growth" integer NOT NULL, "traffic_mobile_download" integer NOT NULL, "traffic_mobile_download_week_ago" integer NOT NULL, "traffic_mobile_download_weekly_growth" integer NOT NULL, "traffic_mobile_download_month_ago" integer NOT NULL, "traffic_mobile_download_monthly_growth" integer NOT NULL, "revenue" double precision NOT NULL, "total_valuation" double precision NOT NULL, "total_asset" double precision NOT NULL, "total_debt" double precision NOT NULL, "total_capital" double precision NOT NULL, "total_sales" double precision NOT NULL, "net_income" double precision NOT NULL, "operating_income" double precision NOT NULL, "ratio_sales_net" double precision NOT NULL, "ratio_sales_operating" double precision NOT NULL, "period_end_date" timestamp with time zone NULL, "investor_fund_sold_3yr" integer NOT NULL, "investor_last_funding_date" timestamp with time zone NULL, "investor_portfolio_size" integer NOT NULL, "investor_total_deals" integer NOT NULL, "score1" double precision NOT NULL, "score2" double precision NOT NULL, "score3" double precision NOT NULL, "score4" double precision NOT NULL, "score5" double precision NOT NULL, "company_linkedin_page" varchar(1017) NULL, "company_facebook_page" varchar(1018) NULL, "company_twitter" varchar(1019) NULL, "crawl_source" varchar(200) NULL, "slug" varchar(50) NULL UNIQUE, "invested_stages_csv" varchar(5013) NULL, "invested_success" integer NOT NULL, "invested_success_amt" double precision NOT NULL, "invested_founder_csv" varchar(5014) NULL, "invested_market_csv" varchar(5015) NULL, "invested_continent_csv" varchar(5016) NULL, "city_id" integer NULL);
commit;

--
-- Create model CompanyInvestingEvent
--
CREATE TABLE "feed_companyinvestingevent" ("id" serial NOT NULL PRIMARY KEY, "event_round" varchar(300) NULL, "event_investors" varchar(500) NULL, "event_investors_id" varchar(500) NULL, "last_edited_time" timestamp with time zone NOT NULL, "created_time" timestamp with time zone NOT NULL, "is_user_input" boolean NOT NULL, "is_tips" boolean NOT NULL, "is_rocketpunch" boolean NOT NULL, "event_day" integer NULL, "event_month" integer NULL, "event_year" integer NULL, "event_currency" varchar(100) NULL, "event_amount" varchar(200) NULL, "invest_currency" varchar(3) NULL, "invest_amt" double precision NOT NULL, "invest_date" timestamp with time zone NULL, "crawl_source" varchar(200) NULL);
commit;

--
-- Create model CompanyInvestor
--
CREATE TABLE "feed_companyinvestor" ("id" serial NOT NULL PRIMARY KEY, "last_edited_time" timestamp with time zone NOT NULL, "created_time" timestamp with time zone NULL, "is_user_input" boolean NOT NULL, "investor_day" integer NULL, "investor_month" integer NULL, "investor_year" integer NULL, "investor_currency" varchar(100) NULL, "investor_amount" varchar(200) NULL, "invest_currency" varchar(3) NULL, "invest_amt" double precision NOT NULL, "invest_date" timestamp with time zone NULL, "is_active" boolean NOT NULL, "is_tips" boolean NOT NULL, "is_rocketpunch" boolean NOT NULL, "is_estimate" boolean NOT NULL, "crawl_source" varchar(200) NULL);
commit;

--
-- Create model CompanyResource
--
CREATE TABLE "feed_companyresource" ("id" serial NOT NULL PRIMARY KEY, "company_id" integer NOT NULL);
commit;

--
-- Create model Continent
--
CREATE TABLE "feed_continent" ("id" serial NOT NULL PRIMARY KEY, "is_save" boolean NOT NULL, "is_confirm" boolean NOT NULL, "last_edited_time" timestamp with time zone NOT NULL, "created_time" timestamp with time zone NOT NULL, "name" varchar(500) NOT NULL, "latitude" integer NOT NULL, "longitude" integer NOT NULL, "crawl_source" varchar(200) NULL, "company_count" integer NOT NULL, "company_investor_count" integer NOT NULL, "company_startup_count" integer NOT NULL, "company_public_count" integer NOT NULL, "user_count" integer NOT NULL);
commit;

--
-- Create model Country
--
CREATE TABLE "feed_country" ("id" serial NOT NULL PRIMARY KEY, "is_save" boolean NOT NULL, "is_confirm" boolean NOT NULL, "last_edited_time" timestamp with time zone NOT NULL, "created_time" timestamp with time zone NOT NULL, "name" varchar(500) NOT NULL, "latitude" integer NOT NULL, "longitude" integer NOT NULL, "company_count" integer NOT NULL, "company_investor_count" integer NOT NULL, "company_startup_count" integer NOT NULL, "company_public_count" integer NOT NULL, "user_count" integer NOT NULL, "continent_id" integer NOT NULL);
commit;

--
-- Create model FundingStage
--
CREATE TABLE "feed_fundingstage" ("id" serial NOT NULL PRIMARY KEY, "name" varchar(500) NOT NULL, "created_at" timestamp with time zone NULL, "updated_at" timestamp with time zone NULL, "count" integer NULL, "stage_step" integer NULL, "crawl_source" varchar(200) NULL);
commit;

--
-- Create model InvestorType
--
CREATE TABLE "feed_investortype" ("id" serial NOT NULL PRIMARY KEY, "name" varchar(500) NOT NULL, "slug" varchar(50) NULL UNIQUE, "created_at" timestamp with time zone NULL, "updated_at" timestamp with time zone NULL);
commit;

--
-- Create model Region
--
CREATE TABLE "feed_region" ("id" serial NOT NULL PRIMARY KEY, "is_save" boolean NOT NULL, "is_confirm" boolean NOT NULL, "last_edited_time" timestamp with time zone NOT NULL, "created_time" timestamp with time zone NOT NULL, "name" varchar(500) NOT NULL, "latitude" integer NOT NULL, "longitude" integer NOT NULL, "crawl_source" varchar(200) NULL);
commit;

--
-- Create model State
--
CREATE TABLE "feed_state" ("id" serial NOT NULL PRIMARY KEY, "is_save" boolean NOT NULL, "is_confirm" boolean NOT NULL, "last_edited_time" timestamp with time zone NOT NULL, "created_time" timestamp with time zone NOT NULL, "name" varchar(500) NOT NULL, "latitude" integer NOT NULL, "longitude" integer NOT NULL, "continent_id" integer NOT NULL, "country_id" integer NOT NULL);
commit;

--
-- Add field angellist_url to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "angellist_url" varchar(702) NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "angellist_url" DROP DEFAULT;
commit;

--
-- Add field company_alerts to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "company_alerts" varchar(221) NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "company_alerts" DROP DEFAULT;
commit;

--
-- Add field company_city to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "company_city" varchar(300) DEFAULT '' NOT NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "company_city" DROP DEFAULT;
commit;

--
-- Add field company_class to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "company_class" varchar(15) DEFAULT 'Public' NOT NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "company_class" DROP DEFAULT;
commit;

--
-- Add field company_continent to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "company_continent" varchar(300) NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "company_continent" DROP DEFAULT;
commit;

--
-- Add field company_country to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "company_country" varchar(300) DEFAULT '' NOT NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "company_country" DROP DEFAULT;
commit;

--
-- Add field company_employee to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "company_employee" varchar(20) DEFAULT '' NOT NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "company_employee" DROP DEFAULT;
commit;

--
-- Add field company_established to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "company_established" varchar(30) DEFAULT '1000-01-01' NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "company_established" DROP DEFAULT;
commit;

--
-- Add field company_facebook_page to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "company_facebook_page" varchar(1018) DEFAULT '' NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "company_facebook_page" DROP DEFAULT;
commit;

--
-- Add field company_favorite_count to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "company_favorite_count" integer DEFAULT 0 NOT NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "company_favorite_count" DROP DEFAULT;
commit;

--
-- Add field company_founded_day to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "company_founded_day" integer DEFAULT 1 NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "company_founded_day" DROP DEFAULT;
commit;

--
-- Add field company_founded_month to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "company_founded_month" integer DEFAULT 1 NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "company_founded_month" DROP DEFAULT;
commit;

--
-- Add field company_founded_year to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "company_founded_year" integer DEFAULT 2006 NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "company_founded_year" DROP DEFAULT;
commit;

--
-- Add field company_fundraising to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "company_fundraising" varchar(300) DEFAULT '' NOT NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "company_fundraising" DROP DEFAULT;
commit;

--
-- Add field company_fundraising_currency to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "company_fundraising_currency" varchar(300) NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "company_fundraising_currency" DROP DEFAULT;
commit;

--
-- Add field company_fundraising_deck to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "company_fundraising_deck" varchar(1009) NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "company_fundraising_deck" DROP DEFAULT;
commit;

--
-- Add field company_fundraising_highlight to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "company_fundraising_highlight" varchar(300) NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "company_fundraising_highlight" DROP DEFAULT;
commit;

--
-- Add field company_industry to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "company_industry" varchar(5002) DEFAULT '' NOT NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "company_industry" DROP DEFAULT;
commit;

--
-- Add field company_interests to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "company_interests" varchar(5020) NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "company_interests" DROP DEFAULT;
commit;

--
-- Add field company_kor_name to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "company_kor_name" varchar(1000) NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "company_kor_name" DROP DEFAULT;
commit;

--
-- Add field company_linkedin_page to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "company_linkedin_page" varchar(1017) DEFAULT '' NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "company_linkedin_page" DROP DEFAULT;
commit;

--
-- Add field company_location to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "company_location" varchar(1003) NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "company_location" DROP DEFAULT;
commit;

--
-- Add field company_location_latitude to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "company_location_latitude" integer DEFAULT 0 NOT NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "company_location_latitude" DROP DEFAULT;
commit;

--
-- Add field company_location_longitude to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "company_location_longitude" integer DEFAULT 0 NOT NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "company_location_longitude" DROP DEFAULT;
commit;

--
-- Add field company_logo to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "company_logo" varchar(1008) DEFAULT 'img/company/noimg.png' NOT NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "company_logo" DROP DEFAULT;
commit;

--
-- Add field company_long to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "company_long" text DEFAULT '' NOT NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "company_long" DROP DEFAULT;
commit;

--
-- Add field company_number to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "company_number" varchar(210) NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "company_number" DROP DEFAULT;
commit;

--
-- Add field company_recommendation_count to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "company_recommendation_count" integer DEFAULT 0 NOT NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "company_recommendation_count" DROP DEFAULT;
commit;

--
-- Add field company_region to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "company_region" varchar(300) NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "company_region" DROP DEFAULT;
commit;

--
-- Add field company_short to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "company_short" varchar(10001) DEFAULT '' NOT NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "company_short" DROP DEFAULT;
commit;

--
-- Add field company_state to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "company_state" varchar(300) NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "company_state" DROP DEFAULT;
commit;

--
-- Add field company_top_keywords to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "company_top_keywords" varchar(5019) DEFAULT '' NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "company_top_keywords" DROP DEFAULT;
commit;

--
-- Add field company_twitter to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "company_twitter" varchar(1019) DEFAULT '' NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "company_twitter" DROP DEFAULT;
commit;

--
-- Add field company_website to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "company_website" varchar(1007) DEFAULT '' NOT NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "company_website" DROP DEFAULT;
commit;

--
-- Add field corporate_number to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "corporate_number" varchar(211) NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "corporate_number" DROP DEFAULT;
commit;

--
-- Add field corporation to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "corporation" varchar(10) DEFAULT '' NOT NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "corporation" DROP DEFAULT;
commit;

--
-- Add field crawl_source to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "crawl_source" varchar(200) DEFAULT '' NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "crawl_source" DROP DEFAULT;
commit;

--
-- Add field e27_url to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "e27_url" varchar(700) NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "e27_url" DROP DEFAULT;
commit;

--
-- Add field employee_added_in_6month to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "employee_added_in_6month" integer DEFAULT 0 NOT NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "employee_added_in_6month" DROP DEFAULT;
commit;

--
-- Add field employee_added_since_funding to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "employee_added_since_funding" integer DEFAULT 0 NOT NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "employee_added_since_funding" DROP DEFAULT;
commit;

--
-- Add field employee_added_this_month to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "employee_added_this_month" integer DEFAULT 0 NOT NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "employee_added_this_month" DROP DEFAULT;
commit;

--
-- Add field employee_growth_6month to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "employee_growth_6month" integer DEFAULT 0 NOT NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "employee_growth_6month" DROP DEFAULT;
commit;

--
-- Add field employee_growth_month to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "employee_growth_month" integer DEFAULT 0 NOT NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "employee_growth_month" DROP DEFAULT;
commit;

--
-- Add field employee_growth_since_funding to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "employee_growth_since_funding" integer DEFAULT 0 NOT NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "employee_growth_since_funding" DROP DEFAULT;
commit;

--
-- Add field employee_months_since_funding to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "employee_months_since_funding" integer DEFAULT 0 NOT NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "employee_months_since_funding" DROP DEFAULT;
commit;

--
-- Add field employee_total to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "employee_total" integer DEFAULT 0 NOT NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "employee_total" DROP DEFAULT;
commit;

--
-- Add field employee_total_6month_ago to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "employee_total_6month_ago" integer DEFAULT 0 NOT NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "employee_total_6month_ago" DROP DEFAULT;
commit;

--
-- Add field employee_total_month_ago to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "employee_total_month_ago" integer DEFAULT 0 NOT NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "employee_total_month_ago" DROP DEFAULT;
commit;

--
-- Add field f6s_url to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "f6s_url" varchar(703) NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "f6s_url" DROP DEFAULT;
commit;

--
-- Add field forbes_url to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "forbes_url" varchar(707) NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "forbes_url" DROP DEFAULT;
commit;

--
-- Add field funding_stage_name to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "funding_stage_name" varchar(116) NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "funding_stage_name" DROP DEFAULT;
commit;

--
-- Add field invested_continent_csv to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "invested_continent_csv" varchar(5016) NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "invested_continent_csv" DROP DEFAULT;
commit;

--
-- Add field invested_founder_csv to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "invested_founder_csv" varchar(5014) NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "invested_founder_csv" DROP DEFAULT;
commit;

--
-- Add field invested_funding_stage_csv to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "invested_funding_stage_csv" varchar(5015) NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "invested_funding_stage_csv" DROP DEFAULT;
commit;

--
-- Add field invested_market_csv to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "invested_market_csv" varchar(5015) NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "invested_market_csv" DROP DEFAULT;
commit;

--
-- Add field invested_stages_csv to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "invested_stages_csv" varchar(5013) NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "invested_stages_csv" DROP DEFAULT;
commit;

--
-- Add field invested_success to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "invested_success" integer DEFAULT  -1 NOT NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "invested_success" DROP DEFAULT;
commit;

--
-- Add field invested_success_amt to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "invested_success_amt" double precision DEFAULT  -1.0 NOT NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "invested_success_amt" DROP DEFAULT;
commit;

--
-- Add field investor_class to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "investor_class" varchar(1000) DEFAULT '' NOT NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "investor_class" DROP DEFAULT;
commit;

--
-- Add field investor_fund_sold_3yr to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "investor_fund_sold_3yr" integer DEFAULT 0 NOT NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "investor_fund_sold_3yr" DROP DEFAULT;
commit;

--
-- Add field investor_last_funding_date to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "investor_last_funding_date" timestamp with time zone NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "investor_last_funding_date" DROP DEFAULT;
commit;

--
-- Add field investor_list_csv to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "investor_list_csv" varchar(5012) NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "investor_list_csv" DROP DEFAULT;
commit;

--
-- Add field investor_portfolio_size to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "investor_portfolio_size" integer DEFAULT 0 NOT NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "investor_portfolio_size" DROP DEFAULT;
commit;

--
-- Add field investor_total_deals to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "investor_total_deals" integer DEFAULT 0 NOT NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "investor_total_deals" DROP DEFAULT;
commit;

--
-- Add field is_angel to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "is_angel" boolean DEFAULT false NOT NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "is_angel" DROP DEFAULT;
commit;

--
-- Add field is_confirm to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "is_confirm" boolean DEFAULT false NOT NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "is_confirm" DROP DEFAULT;
commit;

--
-- Add field is_government to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "is_government" boolean DEFAULT false NOT NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "is_government" DROP DEFAULT;
commit;

--
-- Add field is_investor to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "is_investor" boolean DEFAULT false NOT NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "is_investor" DROP DEFAULT;
commit;

--
-- Add field is_partner to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "is_partner" boolean DEFAULT false NOT NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "is_partner" DROP DEFAULT;
commit;

--
-- Add field is_rocketpunch to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "is_rocketpunch" boolean DEFAULT false NOT NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "is_rocketpunch" DROP DEFAULT;
commit;

--
-- Add field is_save to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "is_save" boolean DEFAULT false NOT NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "is_save" DROP DEFAULT;
commit;

--
-- Add field is_startup to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "is_startup" boolean DEFAULT true NOT NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "is_startup" DROP DEFAULT;
commit;

--
-- Add field is_tips to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "is_tips" boolean DEFAULT false NOT NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "is_tips" DROP DEFAULT;
commit;

--
-- Add field is_trusted_vc to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "is_trusted_vc" boolean DEFAULT false NOT NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "is_trusted_vc" DROP DEFAULT;
commit;

--
-- Add field last_funding_amt to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "last_funding_amt" double precision DEFAULT 0.0 NOT NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "last_funding_amt" DROP DEFAULT;
commit;

--
-- Add field last_funding_date to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "last_funding_date" timestamp with time zone DEFAULT '2000-01-01T00:00:00+00:00'::timestamptz NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "last_funding_date" DROP DEFAULT;
commit;

--
-- Add field last_funding_months_ago to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "last_funding_months_ago" integer DEFAULT 0 NOT NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "last_funding_months_ago" DROP DEFAULT;
commit;

--
-- Add field net_income to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "net_income" double precision DEFAULT 0.0 NOT NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "net_income" DROP DEFAULT;
commit;

--
-- Add field operating_income to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "operating_income" double precision DEFAULT 0.0 NOT NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "operating_income" DROP DEFAULT;
commit;

--
-- Add field owner to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "owner_id" integer NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "owner_id" DROP DEFAULT;
commit;

--
-- Add field period_end_date to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "period_end_date" timestamp with time zone NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "period_end_date" DROP DEFAULT;
commit;

--
-- Add field product_app_store to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "product_app_store" varchar(217) NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "product_app_store" DROP DEFAULT;
commit;

--
-- Add field product_google_play to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "product_google_play" varchar(218) NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "product_google_play" DROP DEFAULT;
commit;

--
-- Add field product_list_csv to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "product_list_csv" varchar(5013) NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "product_list_csv" DROP DEFAULT;
commit;

--
-- Add field product_market_csv to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "product_market_csv" varchar(5014) NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "product_market_csv" DROP DEFAULT;
commit;

--
-- Add field ratio_sales_net to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "ratio_sales_net" double precision DEFAULT 0.0 NOT NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "ratio_sales_net" DROP DEFAULT;
commit;

--
-- Add field ratio_sales_operating to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "ratio_sales_operating" double precision DEFAULT 0.0 NOT NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "ratio_sales_operating" DROP DEFAULT;
commit;

--
-- Add field revenue to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "revenue" double precision DEFAULT 0.0 NOT NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "revenue" DROP DEFAULT;
commit;

--
-- Add field rocketpunch_url to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "rocketpunch_url" varchar(1001) NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "rocketpunch_url" DROP DEFAULT;
commit;

--
-- Add field score1 to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "score1" double precision DEFAULT 0.0 NOT NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "score1" DROP DEFAULT;
commit;

--
-- Add field score2 to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "score2" double precision DEFAULT 0.0 NOT NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "score2" DROP DEFAULT;
commit;

--
-- Add field score3 to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "score3" double precision DEFAULT 0.0 NOT NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "score3" DROP DEFAULT;
commit;

--
-- Add field score4 to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "score4" double precision DEFAULT 0.0 NOT NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "score4" DROP DEFAULT;
commit;

--
-- Add field score5 to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "score5" double precision DEFAULT 0.0 NOT NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "score5" DROP DEFAULT;
commit;

--
-- Add field sec_url to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "sec_url" varchar(701) NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "sec_url" DROP DEFAULT;
commit;

--
-- Add field slug to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "slug" varchar(50) NULL UNIQUE;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "slug" DROP DEFAULT;
commit;

--
-- Add field tips_start_date to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "tips_start_date" date NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "tips_start_date" DROP DEFAULT;
commit;

--
-- Add field total_asset to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "total_asset" double precision DEFAULT 0.0 NOT NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "total_asset" DROP DEFAULT;
commit;

--
-- Add field total_capital to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "total_capital" double precision DEFAULT 0.0 NOT NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "total_capital" DROP DEFAULT;
commit;

--
-- Add field total_debt to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "total_debt" double precision DEFAULT 0.0 NOT NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "total_debt" DROP DEFAULT;
commit;

--
-- Add field total_funding_amt to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "total_funding_amt" double precision DEFAULT 0.0 NOT NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "total_funding_amt" DROP DEFAULT;
commit;

--
-- Add field total_sales to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "total_sales" double precision DEFAULT 0.0 NOT NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "total_sales" DROP DEFAULT;
commit;

--
-- Add field total_valuation to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "total_valuation" double precision DEFAULT 0.0 NOT NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "total_valuation" DROP DEFAULT;
commit;

--
-- Add field traffic_growth_month to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "traffic_growth_month" integer DEFAULT 0 NOT NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "traffic_growth_month" DROP DEFAULT;
commit;

--
-- Add field traffic_mobile_download to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "traffic_mobile_download" integer DEFAULT 0 NOT NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "traffic_mobile_download" DROP DEFAULT;
commit;

--
-- Add field traffic_mobile_download_month_ago to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "traffic_mobile_download_month_ago" integer DEFAULT 0 NOT NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "traffic_mobile_download_month_ago" DROP DEFAULT;
commit;

--
-- Add field traffic_mobile_download_monthly_growth to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "traffic_mobile_download_monthly_growth" integer DEFAULT 0 NOT NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "traffic_mobile_download_monthly_growth" DROP DEFAULT;
commit;

--
-- Add field traffic_mobile_download_week_ago to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "traffic_mobile_download_week_ago" integer DEFAULT 0 NOT NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "traffic_mobile_download_week_ago" DROP DEFAULT;
commit;

--
-- Add field traffic_mobile_download_weekly_growth to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "traffic_mobile_download_weekly_growth" integer DEFAULT 0 NOT NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "traffic_mobile_download_weekly_growth" DROP DEFAULT;
commit;

--
-- Add field traffic_monthly_monthly_growth to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "traffic_monthly_monthly_growth" integer DEFAULT 0 NOT NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "traffic_monthly_monthly_growth" DROP DEFAULT;
commit;

--
-- Add field traffic_monthly_unique to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "traffic_monthly_unique" integer DEFAULT 0 NOT NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "traffic_monthly_unique" DROP DEFAULT;
commit;

--
-- Add field traffic_monthly_unique_month_ago to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "traffic_monthly_unique_month_ago" integer DEFAULT 0 NOT NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "traffic_monthly_unique_month_ago" DROP DEFAULT;
commit;

--
-- Add field traffic_monthly_unique_week_ago to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "traffic_monthly_unique_week_ago" integer DEFAULT 0 NOT NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "traffic_monthly_unique_week_ago" DROP DEFAULT;
commit;

--
-- Add field traffic_monthly_weekly_growth to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "traffic_monthly_weekly_growth" integer DEFAULT 0 NOT NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "traffic_monthly_weekly_growth" DROP DEFAULT;
commit;

--
-- Alter field company_name on resource
--
ALTER TABLE "feed_resource" ALTER COLUMN "company_name" TYPE varchar(1000) USING "company_name"::varchar(1000);
commit;

--
-- Add field resource to companyresource
--
ALTER TABLE "feed_companyresource" ADD COLUMN "resource_id" integer NOT NULL;
commit;

ALTER TABLE "feed_companyresource" ALTER COLUMN "resource_id" DROP DEFAULT;
commit;

--
-- Add field funding_stage to companyinvestor
--
ALTER TABLE "feed_companyinvestor" ADD COLUMN "funding_stage_id" integer NULL;
commit;

ALTER TABLE "feed_companyinvestor" ALTER COLUMN "funding_stage_id" DROP DEFAULT;
commit;

--
-- Add field investor to companyinvestor
--
ALTER TABLE "feed_companyinvestor" ADD COLUMN "investor_id" integer NOT NULL;
commit;

ALTER TABLE "feed_companyinvestor" ALTER COLUMN "investor_id" DROP DEFAULT;
commit;

--
-- Add field owner to companyinvestor
--
ALTER TABLE "feed_companyinvestor" ADD COLUMN "owner_id" integer NOT NULL;
commit;

ALTER TABLE "feed_companyinvestor" ALTER COLUMN "owner_id" DROP DEFAULT;
commit;

--
-- Add field funding_stage to companyinvestingevent
--
ALTER TABLE "feed_companyinvestingevent" ADD COLUMN "funding_stage_id" integer NULL;
commit;

ALTER TABLE "feed_companyinvestingevent" ALTER COLUMN "funding_stage_id" DROP DEFAULT;
commit;

--
-- Add field investor to companyinvestingevent
--
CREATE TABLE "feed_companyinvestingevent_investor" ("id" serial NOT NULL PRIMARY KEY, "companyinvestingevent_id" integer NOT NULL, "companyinvestor_id" integer NOT NULL);
commit;

--
-- Add field owner to companyinvestingevent
--
ALTER TABLE "feed_companyinvestingevent" ADD COLUMN "owner_id" integer NULL;
commit;

ALTER TABLE "feed_companyinvestingevent" ALTER COLUMN "owner_id" DROP DEFAULT;
commit;

--
-- Add field continent to company
--
ALTER TABLE "feed_company" ADD COLUMN "continent_id" integer NULL;
commit;

ALTER TABLE "feed_company" ALTER COLUMN "continent_id" DROP DEFAULT;
commit;

--
-- Add field country to company
--
ALTER TABLE "feed_company" ADD COLUMN "country_id" integer NULL;
commit;

ALTER TABLE "feed_company" ALTER COLUMN "country_id" DROP DEFAULT;
commit;

--
-- Add field funding_stage to company
--
ALTER TABLE "feed_company" ADD COLUMN "funding_stage_id" integer NULL;
commit;

ALTER TABLE "feed_company" ALTER COLUMN "funding_stage_id" DROP DEFAULT;
commit;

--
-- Add field invested_stages to company
--
ALTER TABLE "feed_company" ADD COLUMN "invested_stages_id" integer NULL;
commit;

ALTER TABLE "feed_company" ALTER COLUMN "invested_stages_id" DROP DEFAULT;
commit;

--
-- Add field investor_type to company
--
ALTER TABLE "feed_company" ADD COLUMN "investor_type_id" integer NULL;
commit;

ALTER TABLE "feed_company" ALTER COLUMN "investor_type_id" DROP DEFAULT;
commit;

--
-- Add field owner to company
--
ALTER TABLE "feed_company" ADD COLUMN "owner_id" integer NOT NULL;
commit;

ALTER TABLE "feed_company" ALTER COLUMN "owner_id" DROP DEFAULT;
commit;

--
-- Add field region to company
--
ALTER TABLE "feed_company" ADD COLUMN "region_id" integer NULL;
commit;

ALTER TABLE "feed_company" ALTER COLUMN "region_id" DROP DEFAULT;
commit;

--
-- Add field state to company
--
ALTER TABLE "feed_company" ADD COLUMN "state_id" integer NULL;
commit;

ALTER TABLE "feed_company" ALTER COLUMN "state_id" DROP DEFAULT;
commit;

--
-- Add field continent to city
--
ALTER TABLE "feed_city" ADD COLUMN "continent_id" integer NOT NULL;
commit;

ALTER TABLE "feed_city" ALTER COLUMN "continent_id" DROP DEFAULT;
commit;

--
-- Add field country to city
--
ALTER TABLE "feed_city" ADD COLUMN "country_id" integer NOT NULL;
commit;

ALTER TABLE "feed_city" ALTER COLUMN "country_id" DROP DEFAULT;
commit;

--
-- Add field state to city
--
ALTER TABLE "feed_city" ADD COLUMN "state_id" integer NULL;
commit;

ALTER TABLE "feed_city" ALTER COLUMN "state_id" DROP DEFAULT;
commit;

--
-- Add field city to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "city_id" integer NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "city_id" DROP DEFAULT;
commit;

--
-- Add field continent to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "continent_id" integer NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "continent_id" DROP DEFAULT;
commit;

--
-- Add field country to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "country_id" integer NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "country_id" DROP DEFAULT;
commit;

--
-- Add field funding_stage to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "funding_stage_id" integer NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "funding_stage_id" DROP DEFAULT;
commit;

--
-- Add field invested_stages to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "invested_stages_id" integer NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "invested_stages_id" DROP DEFAULT;
commit;

--
-- Add field investor_type to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "investor_type_id" integer NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "investor_type_id" DROP DEFAULT;
commit;

--
-- Add field region to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "region_id" integer NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "region_id" DROP DEFAULT;
commit;

--
-- Add field state to resource
--
ALTER TABLE "feed_resource" ADD COLUMN "state_id" integer NULL;
commit;

ALTER TABLE "feed_resource" ALTER COLUMN "state_id" DROP DEFAULT;
commit;

CREATE INDEX "feed_city_a9b0c97b" ON "feed_city" ("last_edited_time");
commit;

CREATE INDEX "feed_city_bb5855f0" ON "feed_city" ("created_time");
commit;

CREATE INDEX "feed_city_b068931c" ON "feed_city" ("name");
commit;

CREATE INDEX "feed_city_28c1e37e" ON "feed_city" ("latitude");
commit;

CREATE INDEX "feed_city_ba569b80" ON "feed_city" ("longitude");
commit;

CREATE INDEX "feed_city_name_9665acd7_like" ON "feed_city" ("name" varchar_pattern_ops);
commit;

ALTER TABLE "feed_company" ADD CONSTRAINT "feed_company_city_id_79d6519e_fk_feed_city_id" FOREIGN KEY ("city_id") REFERENCES "feed_city" ("id") DEFERRABLE INITIALLY DEFERRED;
commit;

CREATE INDEX "feed_company_4264c638" ON "feed_company" ("is_active");
commit;

CREATE INDEX "feed_company_11725655" ON "feed_company" ("is_public");
commit;

CREATE INDEX "feed_company_463223eb" ON "feed_company" ("is_confirm");
commit;

CREATE INDEX "feed_company_38c5f373" ON "feed_company" ("is_trusted_vc");
commit;

CREATE INDEX "feed_company_f3d6f5c9" ON "feed_company" ("is_partner");
commit;

CREATE INDEX "feed_company_d8e3caae" ON "feed_company" ("is_angel");
commit;

CREATE INDEX "feed_company_4df577bd" ON "feed_company" ("is_tips");
commit;

CREATE INDEX "feed_company_9e1a2164" ON "feed_company" ("is_dcamp");
commit;

CREATE INDEX "feed_company_fee55b15" ON "feed_company" ("is_rocketpunch");
commit;

CREATE INDEX "feed_company_ade1cc8a" ON "feed_company" ("is_dart");
commit;

CREATE INDEX "feed_company_a2a803c4" ON "feed_company" ("is_bizinkorea");
commit;

CREATE INDEX "feed_company_61f856e3" ON "feed_company" ("is_startup");
commit;

CREATE INDEX "feed_company_6e2900d4" ON "feed_company" ("is_investor");
commit;

CREATE INDEX "feed_company_8a084cf7" ON "feed_company" ("ticker");
commit;

CREATE INDEX "feed_company_5c731c8c" ON "feed_company" ("exchange");
commit;

CREATE INDEX "feed_company_154c1303" ON "feed_company" ("sec_cik");
commit;

CREATE INDEX "feed_company_22b6a063" ON "feed_company" ("sec_cik_int");
commit;

CREATE INDEX "feed_company_a9b0c97b" ON "feed_company" ("last_edited_time");
commit;

CREATE INDEX "feed_company_bb5855f0" ON "feed_company" ("created_time");
commit;

CREATE INDEX "feed_company_c1007e8a" ON "feed_company" ("company_name");
commit;

CREATE INDEX "feed_company_4264fa21" ON "feed_company" ("company_kor_name");
commit;

CREATE INDEX "feed_company_bc4de5a9" ON "feed_company" ("company_class");
commit;

CREATE INDEX "feed_company_f2452ee6" ON "feed_company" ("rocketpunch_url");
commit;

CREATE INDEX "feed_company_fbff80ba" ON "feed_company" ("angellist_url");
commit;

CREATE INDEX "feed_company_f06814ed" ON "feed_company" ("sec_url");
commit;

CREATE INDEX "feed_company_d69203b3" ON "feed_company" ("e27_url");
commit;

CREATE INDEX "feed_company_33780092" ON "feed_company" ("f6s_url");
commit;

CREATE INDEX "feed_company_bba37091" ON "feed_company" ("forbes_url");
commit;

CREATE INDEX "feed_company_d3380a28" ON "feed_company" ("investor_class");
commit;

CREATE INDEX "feed_company_b7eb5d9c" ON "feed_company" ("company_industry");
commit;

CREATE INDEX "feed_company_7e214e10" ON "feed_company" ("company_continent");
commit;

CREATE INDEX "feed_company_9e2b0ee2" ON "feed_company" ("company_country");
commit;

CREATE INDEX "feed_company_0693b93b" ON "feed_company" ("company_city");
commit;

CREATE INDEX "feed_company_3bd52307" ON "feed_company" ("company_state");
commit;

CREATE INDEX "feed_company_16670d4e" ON "feed_company" ("company_region");
commit;

CREATE INDEX "feed_company_8b6b622d" ON "feed_company" ("company_location");
commit;

CREATE INDEX "feed_company_6c50c7f1" ON "feed_company" ("company_location_latitude");
commit;

CREATE INDEX "feed_company_2885a201" ON "feed_company" ("company_location_longitude");
commit;

CREATE INDEX "feed_company_192c3778" ON "feed_company" ("company_established");
commit;

CREATE INDEX "feed_company_ad226066" ON "feed_company" ("company_founded_year");
commit;

CREATE INDEX "feed_company_2c93df8c" ON "feed_company" ("company_founded_month");
commit;

CREATE INDEX "feed_company_f6018d4e" ON "feed_company" ("company_founded_day");
commit;

CREATE INDEX "feed_company_b109d4cd" ON "feed_company" ("company_website");
commit;

CREATE INDEX "feed_company_c5b49fd9" ON "feed_company" ("company_number");
commit;

CREATE INDEX "feed_company_7d826fd6" ON "feed_company" ("corporate_number");
commit;

CREATE INDEX "feed_company_ee724e2f" ON "feed_company" ("investor_list_csv");
commit;

CREATE INDEX "feed_company_1bf93bcf" ON "feed_company" ("product_market_csv");
commit;

CREATE INDEX "feed_company_023e7239" ON "feed_company" ("invested_funding_stage_csv");
commit;

CREATE INDEX "feed_company_b7e28c0c" ON "feed_company" ("last_funding_amt");
commit;

CREATE INDEX "feed_company_e83ca751" ON "feed_company" ("last_funding_date");
commit;

CREATE INDEX "feed_company_cbbcbb27" ON "feed_company" ("total_funding_amt");
commit;

CREATE INDEX "feed_company_a66285ba" ON "feed_company" ("total_valuation");
commit;

CREATE INDEX "feed_company_b2337225" ON "feed_company" ("total_asset");
commit;

CREATE INDEX "feed_company_74cf7cd2" ON "feed_company" ("total_debt");
commit;

CREATE INDEX "feed_company_86a19171" ON "feed_company" ("total_capital");
commit;

CREATE INDEX "feed_company_faf3b8e3" ON "feed_company" ("total_sales");
commit;

CREATE INDEX "feed_company_dc6fb62a" ON "feed_company" ("period_end_date");
commit;

CREATE INDEX "feed_company_7271259c" ON "feed_company" ("score1");
commit;

CREATE INDEX "feed_company_ed28b0ab" ON "feed_company" ("score2");
commit;

CREATE INDEX "feed_company_f6f63d76" ON "feed_company" ("score3");
commit;

CREATE INDEX "feed_company_a164b067" ON "feed_company" ("score4");
commit;

CREATE INDEX "feed_company_3d3a97ef" ON "feed_company" ("score5");
commit;

CREATE INDEX "feed_company_259764f4" ON "feed_company" ("invested_stages_csv");
commit;

CREATE INDEX "feed_company_fe284ac2" ON "feed_company" ("invested_success");
commit;

CREATE INDEX "feed_company_20ef32af" ON "feed_company" ("invested_success_amt");
commit;

CREATE INDEX "feed_company_9a8daa8f" ON "feed_company" ("invested_founder_csv");
commit;

CREATE INDEX "feed_company_5630e841" ON "feed_company" ("invested_market_csv");
commit;

CREATE INDEX "feed_company_0704c6f5" ON "feed_company" ("invested_continent_csv");
commit;

CREATE INDEX "feed_company_c7141997" ON "feed_company" ("city_id");
commit;

CREATE INDEX "feed_company_ticker_1defaf98_like" ON "feed_company" ("ticker" varchar_pattern_ops);
commit;

CREATE INDEX "feed_company_exchange_4ab3e587_like" ON "feed_company" ("exchange" varchar_pattern_ops);
commit;

CREATE INDEX "feed_company_sec_cik_850a413d_like" ON "feed_company" ("sec_cik" varchar_pattern_ops);
commit;

CREATE INDEX "feed_company_sec_cik_int_f2b2ca0f_like" ON "feed_company" ("sec_cik_int" varchar_pattern_ops);
commit;

CREATE INDEX "feed_company_company_name_5e575df3_like" ON "feed_company" ("company_name" varchar_pattern_ops);
commit;

CREATE INDEX "feed_company_company_kor_name_864cb15b_like" ON "feed_company" ("company_kor_name" varchar_pattern_ops);
commit;

CREATE INDEX "feed_company_company_class_aedf5206_like" ON "feed_company" ("company_class" varchar_pattern_ops);
commit;

CREATE INDEX "feed_company_rocketpunch_url_84f91831_like" ON "feed_company" ("rocketpunch_url" varchar_pattern_ops);
commit;

CREATE INDEX "feed_company_angellist_url_07effa3f_like" ON "feed_company" ("angellist_url" varchar_pattern_ops);
commit;

CREATE INDEX "feed_company_sec_url_861a664a_like" ON "feed_company" ("sec_url" varchar_pattern_ops);
commit;

CREATE INDEX "feed_company_e27_url_1619be31_like" ON "feed_company" ("e27_url" varchar_pattern_ops);
commit;

CREATE INDEX "feed_company_f6s_url_0a6f8850_like" ON "feed_company" ("f6s_url" varchar_pattern_ops);
commit;

CREATE INDEX "feed_company_forbes_url_d5f9a925_like" ON "feed_company" ("forbes_url" varchar_pattern_ops);
commit;

CREATE INDEX "feed_company_investor_class_fff0edac_like" ON "feed_company" ("investor_class" varchar_pattern_ops);
commit;

CREATE INDEX "feed_company_company_industry_30e64c65_like" ON "feed_company" ("company_industry" varchar_pattern_ops);
commit;

CREATE INDEX "feed_company_company_continent_ab867d9a_like" ON "feed_company" ("company_continent" varchar_pattern_ops);
commit;

CREATE INDEX "feed_company_company_country_81e3f073_like" ON "feed_company" ("company_country" varchar_pattern_ops);
commit;

CREATE INDEX "feed_company_company_city_983c7979_like" ON "feed_company" ("company_city" varchar_pattern_ops);
commit;

CREATE INDEX "feed_company_company_state_0593def8_like" ON "feed_company" ("company_state" varchar_pattern_ops);
commit;

CREATE INDEX "feed_company_company_region_fb054d0e_like" ON "feed_company" ("company_region" varchar_pattern_ops);
commit;

CREATE INDEX "feed_company_company_location_3d8de653_like" ON "feed_company" ("company_location" varchar_pattern_ops);
commit;

CREATE INDEX "feed_company_company_established_67038a48_like" ON "feed_company" ("company_established" varchar_pattern_ops);
commit;

CREATE INDEX "feed_company_company_website_37720fff_like" ON "feed_company" ("company_website" varchar_pattern_ops);
commit;

CREATE INDEX "feed_company_company_number_8d9aab27_like" ON "feed_company" ("company_number" varchar_pattern_ops);
commit;

CREATE INDEX "feed_company_corporate_number_ebcf9637_like" ON "feed_company" ("corporate_number" varchar_pattern_ops);
commit;

CREATE INDEX "feed_company_investor_list_csv_5ab30abe_like" ON "feed_company" ("investor_list_csv" varchar_pattern_ops);
commit;

CREATE INDEX "feed_company_product_market_csv_2beebcd2_like" ON "feed_company" ("product_market_csv" varchar_pattern_ops);
commit;

CREATE INDEX "feed_company_invested_funding_stage_csv_2caf81e5_like" ON "feed_company" ("invested_funding_stage_csv" varchar_pattern_ops);
commit;

CREATE INDEX "feed_company_slug_9775fb03_like" ON "feed_company" ("slug" varchar_pattern_ops);
commit;

CREATE INDEX "feed_company_invested_stages_csv_62462ab8_like" ON "feed_company" ("invested_stages_csv" varchar_pattern_ops);
commit;

CREATE INDEX "feed_company_invested_founder_csv_208c9cee_like" ON "feed_company" ("invested_founder_csv" varchar_pattern_ops);
commit;

CREATE INDEX "feed_company_invested_market_csv_94e7b1fe_like" ON "feed_company" ("invested_market_csv" varchar_pattern_ops);
commit;

CREATE INDEX "feed_company_invested_continent_csv_dca3c0cd_like" ON "feed_company" ("invested_continent_csv" varchar_pattern_ops);
commit;

CREATE INDEX "feed_companyinvestingevent_e04d39f6" ON "feed_companyinvestingevent" ("event_round");
commit;

CREATE INDEX "feed_companyinvestingevent_a9b0c97b" ON "feed_companyinvestingevent" ("last_edited_time");
commit;

CREATE INDEX "feed_companyinvestingevent_bb5855f0" ON "feed_companyinvestingevent" ("created_time");
commit;

CREATE INDEX "feed_companyinvestingevent_4df577bd" ON "feed_companyinvestingevent" ("is_tips");
commit;

CREATE INDEX "feed_companyinvestingevent_fee55b15" ON "feed_companyinvestingevent" ("is_rocketpunch");
commit;

CREATE INDEX "feed_companyinvestingevent_e7136bc0" ON "feed_companyinvestingevent" ("event_day");
commit;

CREATE INDEX "feed_companyinvestingevent_64a46b37" ON "feed_companyinvestingevent" ("event_month");
commit;

CREATE INDEX "feed_companyinvestingevent_3b200b75" ON "feed_companyinvestingevent" ("event_year");
commit;

CREATE INDEX "feed_companyinvestingevent_2b660b3e" ON "feed_companyinvestingevent" ("invest_currency");
commit;

CREATE INDEX "feed_companyinvestingevent_1c5f0b93" ON "feed_companyinvestingevent" ("invest_amt");
commit;

CREATE INDEX "feed_companyinvestingevent_40802acb" ON "feed_companyinvestingevent" ("invest_date");
commit;

CREATE INDEX "feed_companyinvestingevent_event_round_35dc15c5_like" ON "feed_companyinvestingevent" ("event_round" varchar_pattern_ops);
commit;

CREATE INDEX "feed_companyinvestingevent_invest_currency_32444ef4_like" ON "feed_companyinvestingevent" ("invest_currency" varchar_pattern_ops);
commit;

CREATE INDEX "feed_companyinvestor_a9b0c97b" ON "feed_companyinvestor" ("last_edited_time");
commit;

CREATE INDEX "feed_companyinvestor_bb5855f0" ON "feed_companyinvestor" ("created_time");
commit;

CREATE INDEX "feed_companyinvestor_a669ba6c" ON "feed_companyinvestor" ("is_user_input");
commit;

CREATE INDEX "feed_companyinvestor_e4c5f499" ON "feed_companyinvestor" ("investor_day");
commit;

CREATE INDEX "feed_companyinvestor_6443feea" ON "feed_companyinvestor" ("investor_month");
commit;

CREATE INDEX "feed_companyinvestor_e840ed8f" ON "feed_companyinvestor" ("investor_year");
commit;

CREATE INDEX "feed_companyinvestor_c1b77059" ON "feed_companyinvestor" ("investor_currency");
commit;

CREATE INDEX "feed_companyinvestor_353c5b1f" ON "feed_companyinvestor" ("investor_amount");
commit;

CREATE INDEX "feed_companyinvestor_2b660b3e" ON "feed_companyinvestor" ("invest_currency");
commit;

CREATE INDEX "feed_companyinvestor_1c5f0b93" ON "feed_companyinvestor" ("invest_amt");
commit;

CREATE INDEX "feed_companyinvestor_40802acb" ON "feed_companyinvestor" ("invest_date");
commit;

CREATE INDEX "feed_companyinvestor_4264c638" ON "feed_companyinvestor" ("is_active");
commit;

CREATE INDEX "feed_companyinvestor_4df577bd" ON "feed_companyinvestor" ("is_tips");
commit;

CREATE INDEX "feed_companyinvestor_fee55b15" ON "feed_companyinvestor" ("is_rocketpunch");
commit;

CREATE INDEX "feed_companyinvestor_347a36a7" ON "feed_companyinvestor" ("is_estimate");
commit;

CREATE INDEX "feed_companyinvestor_investor_currency_1fbeddeb_like" ON "feed_companyinvestor" ("investor_currency" varchar_pattern_ops);
commit;

CREATE INDEX "feed_companyinvestor_investor_amount_df7556dc_like" ON "feed_companyinvestor" ("investor_amount" varchar_pattern_ops);
commit;

CREATE INDEX "feed_companyinvestor_invest_currency_b7987ac7_like" ON "feed_companyinvestor" ("invest_currency" varchar_pattern_ops);
commit;

ALTER TABLE "feed_companyresource" ADD CONSTRAINT "feed_companyresource_company_id_571051f5_fk_feed_company_id" FOREIGN KEY ("company_id") REFERENCES "feed_company" ("id") DEFERRABLE INITIALLY DEFERRED;
commit;

CREATE INDEX "feed_companyresource_447d3092" ON "feed_companyresource" ("company_id");
commit;

CREATE INDEX "feed_continent_a9b0c97b" ON "feed_continent" ("last_edited_time");
commit;

CREATE INDEX "feed_continent_bb5855f0" ON "feed_continent" ("created_time");
commit;

CREATE INDEX "feed_continent_b068931c" ON "feed_continent" ("name");
commit;

CREATE INDEX "feed_continent_28c1e37e" ON "feed_continent" ("latitude");
commit;

CREATE INDEX "feed_continent_ba569b80" ON "feed_continent" ("longitude");
commit;

CREATE INDEX "feed_continent_225d95cb" ON "feed_continent" ("company_count");
commit;

CREATE INDEX "feed_continent_1a1d3fe1" ON "feed_continent" ("company_investor_count");
commit;

CREATE INDEX "feed_continent_43f5deee" ON "feed_continent" ("company_startup_count");
commit;

CREATE INDEX "feed_continent_e4dfb059" ON "feed_continent" ("company_public_count");
commit;

CREATE INDEX "feed_continent_68c7b353" ON "feed_continent" ("user_count");
commit;

CREATE INDEX "feed_continent_name_44c0a5ed_like" ON "feed_continent" ("name" varchar_pattern_ops);
commit;

ALTER TABLE "feed_country" ADD CONSTRAINT "feed_country_continent_id_4a829f2f_fk_feed_continent_id" FOREIGN KEY ("continent_id") REFERENCES "feed_continent" ("id") DEFERRABLE INITIALLY DEFERRED;
commit;

CREATE INDEX "feed_country_a9b0c97b" ON "feed_country" ("last_edited_time");
commit;

CREATE INDEX "feed_country_bb5855f0" ON "feed_country" ("created_time");
commit;

CREATE INDEX "feed_country_b068931c" ON "feed_country" ("name");
commit;

CREATE INDEX "feed_country_28c1e37e" ON "feed_country" ("latitude");
commit;

CREATE INDEX "feed_country_ba569b80" ON "feed_country" ("longitude");
commit;

CREATE INDEX "feed_country_225d95cb" ON "feed_country" ("company_count");
commit;

CREATE INDEX "feed_country_1a1d3fe1" ON "feed_country" ("company_investor_count");
commit;

CREATE INDEX "feed_country_43f5deee" ON "feed_country" ("company_startup_count");
commit;

CREATE INDEX "feed_country_e4dfb059" ON "feed_country" ("company_public_count");
commit;

CREATE INDEX "feed_country_68c7b353" ON "feed_country" ("user_count");
commit;

CREATE INDEX "feed_country_071e6d87" ON "feed_country" ("continent_id");
commit;

CREATE INDEX "feed_country_name_e9c276ad_like" ON "feed_country" ("name" varchar_pattern_ops);
commit;

CREATE INDEX "feed_fundingstage_b068931c" ON "feed_fundingstage" ("name");
commit;

CREATE INDEX "feed_fundingstage_fde81f11" ON "feed_fundingstage" ("created_at");
commit;

CREATE INDEX "feed_fundingstage_afd1a1a8" ON "feed_fundingstage" ("updated_at");
commit;

CREATE INDEX "feed_fundingstage_name_a2700713_like" ON "feed_fundingstage" ("name" varchar_pattern_ops);
commit;

CREATE INDEX "feed_investortype_slug_8f1fcea0_like" ON "feed_investortype" ("slug" varchar_pattern_ops);
commit;

CREATE INDEX "feed_region_a9b0c97b" ON "feed_region" ("last_edited_time");
commit;

CREATE INDEX "feed_region_bb5855f0" ON "feed_region" ("created_time");
commit;

CREATE INDEX "feed_region_b068931c" ON "feed_region" ("name");
commit;

CREATE INDEX "feed_region_28c1e37e" ON "feed_region" ("latitude");
commit;

CREATE INDEX "feed_region_ba569b80" ON "feed_region" ("longitude");
commit;

CREATE INDEX "feed_region_name_9c3cddab_like" ON "feed_region" ("name" varchar_pattern_ops);
commit;

ALTER TABLE "feed_state" ADD CONSTRAINT "feed_state_continent_id_b4f559b2_fk_feed_continent_id" FOREIGN KEY ("continent_id") REFERENCES "feed_continent" ("id") DEFERRABLE INITIALLY DEFERRED;
commit;

ALTER TABLE "feed_state" ADD CONSTRAINT "feed_state_country_id_41b89122_fk_feed_country_id" FOREIGN KEY ("country_id") REFERENCES "feed_country" ("id") DEFERRABLE INITIALLY DEFERRED;
commit;

CREATE INDEX "feed_state_a9b0c97b" ON "feed_state" ("last_edited_time");
commit;

CREATE INDEX "feed_state_bb5855f0" ON "feed_state" ("created_time");
commit;

CREATE INDEX "feed_state_b068931c" ON "feed_state" ("name");
commit;

CREATE INDEX "feed_state_28c1e37e" ON "feed_state" ("latitude");
commit;

CREATE INDEX "feed_state_ba569b80" ON "feed_state" ("longitude");
commit;

CREATE INDEX "feed_state_071e6d87" ON "feed_state" ("continent_id");
commit;

CREATE INDEX "feed_state_93bfec8a" ON "feed_state" ("country_id");
commit;

CREATE INDEX "feed_state_name_92170e4c_like" ON "feed_state" ("name" varchar_pattern_ops);
commit;

CREATE INDEX "feed_resource_fbff80ba" ON "feed_resource" ("angellist_url");
commit;

CREATE INDEX "feed_resource_angellist_url_5906378e_like" ON "feed_resource" ("angellist_url" varchar_pattern_ops);
commit;

CREATE INDEX "feed_resource_0693b93b" ON "feed_resource" ("company_city");
commit;

CREATE INDEX "feed_resource_company_city_f250f033_like" ON "feed_resource" ("company_city" varchar_pattern_ops);
commit;

CREATE INDEX "feed_resource_bc4de5a9" ON "feed_resource" ("company_class");
commit;

CREATE INDEX "feed_resource_company_class_2a3840ab_like" ON "feed_resource" ("company_class" varchar_pattern_ops);
commit;

CREATE INDEX "feed_resource_7e214e10" ON "feed_resource" ("company_continent");
commit;

CREATE INDEX "feed_resource_company_continent_ccecfee1_like" ON "feed_resource" ("company_continent" varchar_pattern_ops);
commit;

CREATE INDEX "feed_resource_9e2b0ee2" ON "feed_resource" ("company_country");
commit;

CREATE INDEX "feed_resource_company_country_b4b3077c_like" ON "feed_resource" ("company_country" varchar_pattern_ops);
commit;

CREATE INDEX "feed_resource_192c3778" ON "feed_resource" ("company_established");
commit;

CREATE INDEX "feed_resource_company_established_7b2c8097_like" ON "feed_resource" ("company_established" varchar_pattern_ops);
commit;

CREATE INDEX "feed_resource_f6018d4e" ON "feed_resource" ("company_founded_day");
commit;

CREATE INDEX "feed_resource_2c93df8c" ON "feed_resource" ("company_founded_month");
commit;

CREATE INDEX "feed_resource_ad226066" ON "feed_resource" ("company_founded_year");
commit;

CREATE INDEX "feed_resource_b7eb5d9c" ON "feed_resource" ("company_industry");
commit;

CREATE INDEX "feed_resource_company_industry_777bda86_like" ON "feed_resource" ("company_industry" varchar_pattern_ops);
commit;

CREATE INDEX "feed_resource_4264fa21" ON "feed_resource" ("company_kor_name");
commit;

CREATE INDEX "feed_resource_company_kor_name_3858d01f_like" ON "feed_resource" ("company_kor_name" varchar_pattern_ops);
commit;

CREATE INDEX "feed_resource_8b6b622d" ON "feed_resource" ("company_location");
commit;

CREATE INDEX "feed_resource_company_location_ca5fe2a9_like" ON "feed_resource" ("company_location" varchar_pattern_ops);
commit;

CREATE INDEX "feed_resource_6c50c7f1" ON "feed_resource" ("company_location_latitude");
commit;

CREATE INDEX "feed_resource_2885a201" ON "feed_resource" ("company_location_longitude");
commit;

CREATE INDEX "feed_resource_c5b49fd9" ON "feed_resource" ("company_number");
commit;

CREATE INDEX "feed_resource_company_number_77ef41f3_like" ON "feed_resource" ("company_number" varchar_pattern_ops);
commit;

CREATE INDEX "feed_resource_16670d4e" ON "feed_resource" ("company_region");
commit;

CREATE INDEX "feed_resource_company_region_847f69a8_like" ON "feed_resource" ("company_region" varchar_pattern_ops);
commit;

CREATE INDEX "feed_resource_3bd52307" ON "feed_resource" ("company_state");
commit;

CREATE INDEX "feed_resource_company_state_d110c9a5_like" ON "feed_resource" ("company_state" varchar_pattern_ops);
commit;

CREATE INDEX "feed_resource_b109d4cd" ON "feed_resource" ("company_website");
commit;

CREATE INDEX "feed_resource_company_website_0b93b616_like" ON "feed_resource" ("company_website" varchar_pattern_ops);
commit;

CREATE INDEX "feed_resource_7d826fd6" ON "feed_resource" ("corporate_number");
commit;

CREATE INDEX "feed_resource_corporate_number_5b198a3a_like" ON "feed_resource" ("corporate_number" varchar_pattern_ops);
commit;

CREATE INDEX "feed_resource_d69203b3" ON "feed_resource" ("e27_url");
commit;

CREATE INDEX "feed_resource_e27_url_44b674ba_like" ON "feed_resource" ("e27_url" varchar_pattern_ops);
commit;

CREATE INDEX "feed_resource_33780092" ON "feed_resource" ("f6s_url");
commit;

CREATE INDEX "feed_resource_f6s_url_e8800456_like" ON "feed_resource" ("f6s_url" varchar_pattern_ops);
commit;

CREATE INDEX "feed_resource_bba37091" ON "feed_resource" ("forbes_url");
commit;

CREATE INDEX "feed_resource_forbes_url_621c7a70_like" ON "feed_resource" ("forbes_url" varchar_pattern_ops);
commit;

CREATE INDEX "feed_resource_0704c6f5" ON "feed_resource" ("invested_continent_csv");
commit;

CREATE INDEX "feed_resource_invested_continent_csv_35d6d04a_like" ON "feed_resource" ("invested_continent_csv" varchar_pattern_ops);
commit;

CREATE INDEX "feed_resource_9a8daa8f" ON "feed_resource" ("invested_founder_csv");
commit;

CREATE INDEX "feed_resource_invested_founder_csv_feb1e24b_like" ON "feed_resource" ("invested_founder_csv" varchar_pattern_ops);
commit;

CREATE INDEX "feed_resource_023e7239" ON "feed_resource" ("invested_funding_stage_csv");
commit;

CREATE INDEX "feed_resource_invested_funding_stage_csv_ead477dd_like" ON "feed_resource" ("invested_funding_stage_csv" varchar_pattern_ops);
commit;

CREATE INDEX "feed_resource_5630e841" ON "feed_resource" ("invested_market_csv");
commit;

CREATE INDEX "feed_resource_invested_market_csv_5beda24f_like" ON "feed_resource" ("invested_market_csv" varchar_pattern_ops);
commit;

CREATE INDEX "feed_resource_259764f4" ON "feed_resource" ("invested_stages_csv");
commit;

CREATE INDEX "feed_resource_invested_stages_csv_b119f8a2_like" ON "feed_resource" ("invested_stages_csv" varchar_pattern_ops);
commit;

CREATE INDEX "feed_resource_fe284ac2" ON "feed_resource" ("invested_success");
commit;

CREATE INDEX "feed_resource_20ef32af" ON "feed_resource" ("invested_success_amt");
commit;

CREATE INDEX "feed_resource_d3380a28" ON "feed_resource" ("investor_class");
commit;

CREATE INDEX "feed_resource_investor_class_18c09a80_like" ON "feed_resource" ("investor_class" varchar_pattern_ops);
commit;

CREATE INDEX "feed_resource_ee724e2f" ON "feed_resource" ("investor_list_csv");
commit;

CREATE INDEX "feed_resource_investor_list_csv_54807d48_like" ON "feed_resource" ("investor_list_csv" varchar_pattern_ops);
commit;

CREATE INDEX "feed_resource_d8e3caae" ON "feed_resource" ("is_angel");
commit;

CREATE INDEX "feed_resource_463223eb" ON "feed_resource" ("is_confirm");
commit;

CREATE INDEX "feed_resource_6e2900d4" ON "feed_resource" ("is_investor");
commit;

CREATE INDEX "feed_resource_f3d6f5c9" ON "feed_resource" ("is_partner");
commit;

CREATE INDEX "feed_resource_fee55b15" ON "feed_resource" ("is_rocketpunch");
commit;

CREATE INDEX "feed_resource_61f856e3" ON "feed_resource" ("is_startup");
commit;

CREATE INDEX "feed_resource_4df577bd" ON "feed_resource" ("is_tips");
commit;

CREATE INDEX "feed_resource_38c5f373" ON "feed_resource" ("is_trusted_vc");
commit;

CREATE INDEX "feed_resource_b7e28c0c" ON "feed_resource" ("last_funding_amt");
commit;

CREATE INDEX "feed_resource_e83ca751" ON "feed_resource" ("last_funding_date");
commit;

CREATE INDEX "feed_resource_5e7b1936" ON "feed_resource" ("owner_id");
commit;

ALTER TABLE "feed_resource" ADD CONSTRAINT "feed_resource_owner_id_191ed937_fk_auth_user_id" FOREIGN KEY ("owner_id") REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED;
commit;

CREATE INDEX "feed_resource_dc6fb62a" ON "feed_resource" ("period_end_date");
commit;

CREATE INDEX "feed_resource_1bf93bcf" ON "feed_resource" ("product_market_csv");
commit;

CREATE INDEX "feed_resource_product_market_csv_89b8cc1c_like" ON "feed_resource" ("product_market_csv" varchar_pattern_ops);
commit;

CREATE INDEX "feed_resource_f2452ee6" ON "feed_resource" ("rocketpunch_url");
commit;

CREATE INDEX "feed_resource_rocketpunch_url_c82a278a_like" ON "feed_resource" ("rocketpunch_url" varchar_pattern_ops);
commit;

CREATE INDEX "feed_resource_7271259c" ON "feed_resource" ("score1");
commit;

CREATE INDEX "feed_resource_ed28b0ab" ON "feed_resource" ("score2");
commit;

CREATE INDEX "feed_resource_f6f63d76" ON "feed_resource" ("score3");
commit;

CREATE INDEX "feed_resource_a164b067" ON "feed_resource" ("score4");
commit;

CREATE INDEX "feed_resource_3d3a97ef" ON "feed_resource" ("score5");
commit;

CREATE INDEX "feed_resource_f06814ed" ON "feed_resource" ("sec_url");
commit;

CREATE INDEX "feed_resource_sec_url_d10b06e3_like" ON "feed_resource" ("sec_url" varchar_pattern_ops);
commit;

CREATE INDEX "feed_resource_slug_9f66723e_like" ON "feed_resource" ("slug" varchar_pattern_ops);
commit;

CREATE INDEX "feed_resource_b2337225" ON "feed_resource" ("total_asset");
commit;

CREATE INDEX "feed_resource_86a19171" ON "feed_resource" ("total_capital");
commit;

CREATE INDEX "feed_resource_74cf7cd2" ON "feed_resource" ("total_debt");
commit;

CREATE INDEX "feed_resource_cbbcbb27" ON "feed_resource" ("total_funding_amt");
commit;

CREATE INDEX "feed_resource_faf3b8e3" ON "feed_resource" ("total_sales");
commit;

CREATE INDEX "feed_resource_a66285ba" ON "feed_resource" ("total_valuation");
commit;

CREATE INDEX "feed_companyresource_e2f3ef5b" ON "feed_companyresource" ("resource_id");
commit;

ALTER TABLE "feed_companyresource" ADD CONSTRAINT "feed_companyresource_resource_id_a473b9f1_fk_feed_resource_id" FOREIGN KEY ("resource_id") REFERENCES "feed_resource" ("id") DEFERRABLE INITIALLY DEFERRED;
commit;

CREATE INDEX "feed_companyinvestor_d3342098" ON "feed_companyinvestor" ("funding_stage_id");
commit;

ALTER TABLE "feed_companyinvestor" ADD CONSTRAINT "feed_companyi_funding_stage_id_97b802f8_fk_feed_fundingstage_id" FOREIGN KEY ("funding_stage_id") REFERENCES "feed_fundingstage" ("id") DEFERRABLE INITIALLY DEFERRED;
commit;

CREATE INDEX "feed_companyinvestor_c1cbbdc1" ON "feed_companyinvestor" ("investor_id");
commit;

ALTER TABLE "feed_companyinvestor" ADD CONSTRAINT "feed_companyinvestor_investor_id_3bcd20de_fk_feed_company_id" FOREIGN KEY ("investor_id") REFERENCES "feed_company" ("id") DEFERRABLE INITIALLY DEFERRED;
commit;

CREATE INDEX "feed_companyinvestor_5e7b1936" ON "feed_companyinvestor" ("owner_id");
commit;

ALTER TABLE "feed_companyinvestor" ADD CONSTRAINT "feed_companyinvestor_owner_id_5af338ae_fk_feed_company_id" FOREIGN KEY ("owner_id") REFERENCES "feed_company" ("id") DEFERRABLE INITIALLY DEFERRED;
commit;

CREATE INDEX "feed_companyinvestingevent_d3342098" ON "feed_companyinvestingevent" ("funding_stage_id");
commit;

ALTER TABLE "feed_companyinvestingevent" ADD CONSTRAINT "feed_companyi_funding_stage_id_edb12483_fk_feed_fundingstage_id" FOREIGN KEY ("funding_stage_id") REFERENCES "feed_fundingstage" ("id") DEFERRABLE INITIALLY DEFERRED;
commit;

ALTER TABLE "feed_companyinvestingevent_investor" ADD CONSTRAINT "d712b834a0f440555f0755a2e74d04b1" FOREIGN KEY ("companyinvestingevent_id") REFERENCES "feed_companyinvestingevent" ("id") DEFERRABLE INITIALLY DEFERRED;
commit;

ALTER TABLE "feed_companyinvestingevent_investor" ADD CONSTRAINT "feed_com_companyinvestor_id_fb245131_fk_feed_companyinvestor_id" FOREIGN KEY ("companyinvestor_id") REFERENCES "feed_companyinvestor" ("id") DEFERRABLE INITIALLY DEFERRED;
commit;

ALTER TABLE "feed_companyinvestingevent_investor" ADD CONSTRAINT "feed_companyinvestingeve_companyinvestingevent_id_6c279914_uniq" UNIQUE ("companyinvestingevent_id", "companyinvestor_id");
commit;

CREATE INDEX "feed_companyinvestingevent_investor_7f9cf1a9" ON "feed_companyinvestingevent_investor" ("companyinvestingevent_id");
commit;

CREATE INDEX "feed_companyinvestingevent_investor_479444e9" ON "feed_companyinvestingevent_investor" ("companyinvestor_id");
commit;

CREATE INDEX "feed_companyinvestingevent_5e7b1936" ON "feed_companyinvestingevent" ("owner_id");
commit;

ALTER TABLE "feed_companyinvestingevent" ADD CONSTRAINT "feed_companyinvestingevent_owner_id_6d5db2c9_fk_feed_company_id" FOREIGN KEY ("owner_id") REFERENCES "feed_company" ("id") DEFERRABLE INITIALLY DEFERRED;
commit;

CREATE INDEX "feed_company_071e6d87" ON "feed_company" ("continent_id");
commit;

ALTER TABLE "feed_company" ADD CONSTRAINT "feed_company_continent_id_cc50b45e_fk_feed_continent_id" FOREIGN KEY ("continent_id") REFERENCES "feed_continent" ("id") DEFERRABLE INITIALLY DEFERRED;
commit;

CREATE INDEX "feed_company_93bfec8a" ON "feed_company" ("country_id");
commit;

ALTER TABLE "feed_company" ADD CONSTRAINT "feed_company_country_id_4da20df2_fk_feed_country_id" FOREIGN KEY ("country_id") REFERENCES "feed_country" ("id") DEFERRABLE INITIALLY DEFERRED;
commit;

CREATE INDEX "feed_company_d3342098" ON "feed_company" ("funding_stage_id");
commit;

ALTER TABLE "feed_company" ADD CONSTRAINT "feed_company_funding_stage_id_3f223dcd_fk_feed_fundingstage_id" FOREIGN KEY ("funding_stage_id") REFERENCES "feed_fundingstage" ("id") DEFERRABLE INITIALLY DEFERRED;
commit;

CREATE INDEX "feed_company_40cf68f8" ON "feed_company" ("invested_stages_id");
commit;

ALTER TABLE "feed_company" ADD CONSTRAINT "feed_compan_invested_stages_id_b12614ba_fk_feed_fundingstage_id" FOREIGN KEY ("invested_stages_id") REFERENCES "feed_fundingstage" ("id") DEFERRABLE INITIALLY DEFERRED;
commit;

CREATE INDEX "feed_company_674d1b03" ON "feed_company" ("investor_type_id");
commit;

ALTER TABLE "feed_company" ADD CONSTRAINT "feed_company_investor_type_id_0cc5b214_fk_feed_investortype_id" FOREIGN KEY ("investor_type_id") REFERENCES "feed_investortype" ("id") DEFERRABLE INITIALLY DEFERRED;
commit;

CREATE INDEX "feed_company_5e7b1936" ON "feed_company" ("owner_id");
commit;

ALTER TABLE "feed_company" ADD CONSTRAINT "feed_company_owner_id_1815af23_fk_auth_user_id" FOREIGN KEY ("owner_id") REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED;
commit;

CREATE INDEX "feed_company_0f442f96" ON "feed_company" ("region_id");
commit;

ALTER TABLE "feed_company" ADD CONSTRAINT "feed_company_region_id_dd62d6b9_fk_feed_region_id" FOREIGN KEY ("region_id") REFERENCES "feed_region" ("id") DEFERRABLE INITIALLY DEFERRED;
commit;

CREATE INDEX "feed_company_d5582625" ON "feed_company" ("state_id");
commit;

ALTER TABLE "feed_company" ADD CONSTRAINT "feed_company_state_id_a24ad87a_fk_feed_state_id" FOREIGN KEY ("state_id") REFERENCES "feed_state" ("id") DEFERRABLE INITIALLY DEFERRED;
commit;

CREATE INDEX "feed_city_071e6d87" ON "feed_city" ("continent_id");
commit;

ALTER TABLE "feed_city" ADD CONSTRAINT "feed_city_continent_id_c2e33fc1_fk_feed_continent_id" FOREIGN KEY ("continent_id") REFERENCES "feed_continent" ("id") DEFERRABLE INITIALLY DEFERRED;
commit;

CREATE INDEX "feed_city_93bfec8a" ON "feed_city" ("country_id");
commit;

ALTER TABLE "feed_city" ADD CONSTRAINT "feed_city_country_id_e49425d5_fk_feed_country_id" FOREIGN KEY ("country_id") REFERENCES "feed_country" ("id") DEFERRABLE INITIALLY DEFERRED;
commit;

CREATE INDEX "feed_city_d5582625" ON "feed_city" ("state_id");
commit;

ALTER TABLE "feed_city" ADD CONSTRAINT "feed_city_state_id_e9958507_fk_feed_state_id" FOREIGN KEY ("state_id") REFERENCES "feed_state" ("id") DEFERRABLE INITIALLY DEFERRED;
commit;

CREATE INDEX "feed_resource_c7141997" ON "feed_resource" ("city_id");
commit;

ALTER TABLE "feed_resource" ADD CONSTRAINT "feed_resource_city_id_014ea983_fk_feed_city_id" FOREIGN KEY ("city_id") REFERENCES "feed_city" ("id") DEFERRABLE INITIALLY DEFERRED;
commit;

CREATE INDEX "feed_resource_071e6d87" ON "feed_resource" ("continent_id");
commit;

ALTER TABLE "feed_resource" ADD CONSTRAINT "feed_resource_continent_id_d6a8495c_fk_feed_continent_id" FOREIGN KEY ("continent_id") REFERENCES "feed_continent" ("id") DEFERRABLE INITIALLY DEFERRED;
commit;

CREATE INDEX "feed_resource_93bfec8a" ON "feed_resource" ("country_id");
commit;

ALTER TABLE "feed_resource" ADD CONSTRAINT "feed_resource_country_id_00ebb216_fk_feed_country_id" FOREIGN KEY ("country_id") REFERENCES "feed_country" ("id") DEFERRABLE INITIALLY DEFERRED;
commit;

CREATE INDEX "feed_resource_d3342098" ON "feed_resource" ("funding_stage_id");
commit;

ALTER TABLE "feed_resource" ADD CONSTRAINT "feed_resource_funding_stage_id_35016e1c_fk_feed_fundingstage_id" FOREIGN KEY ("funding_stage_id") REFERENCES "feed_fundingstage" ("id") DEFERRABLE INITIALLY DEFERRED;
commit;

CREATE INDEX "feed_resource_40cf68f8" ON "feed_resource" ("invested_stages_id");
commit;

ALTER TABLE "feed_resource" ADD CONSTRAINT "feed_resour_invested_stages_id_39edbae1_fk_feed_fundingstage_id" FOREIGN KEY ("invested_stages_id") REFERENCES "feed_fundingstage" ("id") DEFERRABLE INITIALLY DEFERRED;
commit;

CREATE INDEX "feed_resource_674d1b03" ON "feed_resource" ("investor_type_id");
commit;

ALTER TABLE "feed_resource" ADD CONSTRAINT "feed_resource_investor_type_id_4fce7c9e_fk_feed_investortype_id" FOREIGN KEY ("investor_type_id") REFERENCES "feed_investortype" ("id") DEFERRABLE INITIALLY DEFERRED;
commit;

CREATE INDEX "feed_resource_0f442f96" ON "feed_resource" ("region_id");
commit;

ALTER TABLE "feed_resource" ADD CONSTRAINT "feed_resource_region_id_6a0632d1_fk_feed_region_id" FOREIGN KEY ("region_id") REFERENCES "feed_region" ("id") DEFERRABLE INITIALLY DEFERRED;
commit;

CREATE INDEX "feed_resource_d5582625" ON "feed_resource" ("state_id");
commit;

ALTER TABLE "feed_resource" ADD CONSTRAINT "feed_resource_state_id_963a379b_fk_feed_state_id" FOREIGN KEY ("state_id") REFERENCES "feed_state" ("id") DEFERRABLE INITIALLY DEFERRED;
commit;


COMMIT;
commit;

