package com.sdc.seouldreamcellbe.util;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.temporal.TemporalAdjusters;

public class DateUtil {

    /**
     * A record to hold a pair of dates representing a range.
     */
    public record DateRange(LocalDate startDate, LocalDate endDate) {}

    /**
     * Calculates a date range based on various optional time parameters.
     * The priority is: year+month, year+quarter, year+half, year, and finally the explicit start/end date.
     * If no parameters are provided, it defaults to the current calendar year.
     *
     * @param startDate The start date of the period requested by the user.
     * @param endDate   The end date of the period requested by the user.
     * @param year      The specific year for the query.
     * @param month     The specific month (1-12) of the year.
     * @param quarter   The specific quarter (1-4) of the year.
     * @param half      The specific half (1-2) of the year.
     * @return A {@link DateRange} object.
     */
    public static DateRange calculateDateRangeFromParams(LocalDate startDate, LocalDate endDate, Integer year, Integer month, Integer quarter, Integer half) {
        if (year != null) {
            if (month != null) {
                // Year and Month provided
                LocalDate monthStart = LocalDate.of(year, month, 1);
                LocalDate monthEnd = monthStart.with(TemporalAdjusters.lastDayOfMonth());
                return new DateRange(monthStart, monthEnd);
            } else if (quarter != null) {
                // Year and Quarter provided
                LocalDate quarterStart = LocalDate.of(year, (quarter - 1) * 3 + 1, 1);
                LocalDate quarterEnd = quarterStart.plusMonths(2).with(TemporalAdjusters.lastDayOfMonth());
                return new DateRange(quarterStart, quarterEnd);
            } else if (half != null) {
                // Year and Half provided
                LocalDate halfStart = LocalDate.of(year, (half - 1) * 6 + 1, 1);
                LocalDate halfEnd = halfStart.plusMonths(5).with(TemporalAdjusters.lastDayOfMonth());
                return new DateRange(halfStart, halfEnd);
            } else {
                // Only Year provided
                LocalDate yearStart = LocalDate.of(year, 1, 1);
                LocalDate yearEnd = LocalDate.of(year, 12, 31);
                return new DateRange(yearStart, yearEnd);
            }
        }

        // Fallback to provided startDate and endDate if year is not specified
        if (startDate != null && endDate != null) {
            return new DateRange(startDate, endDate);
        }

        // Default to current year if no specific range or period is given
        int currentYear = LocalDate.now().getYear();
        LocalDate yearStart = LocalDate.of(currentYear, 1, 1);
        LocalDate yearEnd = LocalDate.of(currentYear, 12, 31);
        
        LocalDate finalStartDate = (startDate == null) ? yearStart : startDate;
        LocalDate finalEndDate = (endDate == null) ? yearEnd : endDate;
        
        return new DateRange(finalStartDate, finalEndDate);
    }

    /**
     * Calculates the effective date range. If a specific range is requested, it is used.
     * If the range is open (one or both dates are null), it defaults to the current calendar year.
     *
     * @param requestedStartDate The start date of the period requested by the user.
     * @param requestedEndDate   The end date of the period requested by the user.
     * @return A {@link DateRange} object containing the effective start and end dates.
     */
    public static DateRange calculateEffectiveDateRange(LocalDate requestedStartDate, LocalDate requestedEndDate) {
        // If a full range is provided, use it.
        if (requestedStartDate != null && requestedEndDate != null) {
            return new DateRange(requestedStartDate, requestedEndDate);
        }

        // Default to current year if range is open
        int currentYear = LocalDate.now().getYear();
        LocalDate yearStart = LocalDate.of(currentYear, 1, 1);
        LocalDate yearEnd = LocalDate.of(currentYear, 12, 31);
        
        LocalDate finalStartDate = (requestedStartDate == null) ? yearStart : requestedStartDate;
        LocalDate finalEndDate = (requestedEndDate == null) ? yearEnd : requestedEndDate;

        return new DateRange(finalStartDate, finalEndDate);
    }

    /**
     * Calculates the start (Sunday) and end (Saturday) of the week for a given date.
     *
     * @param date The date for which to find the week range.
     * @return A {@link DateRange} object for the week.
     */
    public static DateRange getWeekRange(LocalDate date) {
        LocalDate sunday = date.with(TemporalAdjusters.previousOrSame(DayOfWeek.SUNDAY));
        LocalDate saturday = date.with(TemporalAdjusters.nextOrSame(DayOfWeek.SATURDAY));
        return new DateRange(sunday, saturday);
    }
}
