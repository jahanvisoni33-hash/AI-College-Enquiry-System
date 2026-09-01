# Database Connection Guide

## Database Name

college_enquiry

## Database Management System

MySQL

## Database Server

localhost

## Default Port

3306

## Database Purpose

The database stores information required by the AI Chatbot College
Enquiry System for ACNJ University.

## Main Tables

- university_info
- departments
- courses
- admissions
- fees
- facilities
- faqs
- admins
- chat_history
- feedback

## Important Relationships

- departments → courses
- courses → admissions
- courses → fees
- chat_history → feedback

## Backend Connection

The backend should connect to the MySQL database named:

college_enquiry

The backend developer should create their own local database
credentials/configuration.

Do NOT upload MySQL passwords or other private credentials to GitHub.

## Database File

The complete database export is available in:

database/college_enquiry.sql

## SQL Queries

Frequently used queries are available in:

database/queries.sql
