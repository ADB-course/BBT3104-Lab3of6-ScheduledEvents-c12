-- CREATE EVN_average_customer_waiting_time_every_1_hour
CREATE EVENT EVN_average_customer_waiting_time_every_1_hour
ON SCHEDULE EVERY 1 HOUR
DO
BEGIN
    INSERT INTO customer_service_kpi (customer_service_KPI_average_waiting_time_minutes)
    SELECT 
        AVG(TIMESTAMPDIFF(MINUTE, customer_service_ticket_raise_time, CURRENT_TIMESTAMP)) 
    FROM customer_service_ticket
    WHERE customer_service_ticket_raise_time >= NOW() - INTERVAL 1 HOUR;
END;
