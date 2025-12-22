package com.sdc.seouldreamcellbe.service;

import com.sdc.seouldreamcellbe.domain.Attendance;
import com.sdc.seouldreamcellbe.domain.Member;
import com.sdc.seouldreamcellbe.repository.AttendanceRepository;
import com.sdc.seouldreamcellbe.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class ExcelExportService {

    private final MemberRepository memberRepository;
    private final AttendanceRepository attendanceRepository;

    public byte[] exportCellMembers(Long cellId) throws IOException {
        List<Member> members = memberRepository.findByCell_IdAndActive(cellId, true);

        try (Workbook workbook = new XSSFWorkbook(); ByteArrayOutputStream out = new ByteArrayOutputStream()) {
            Sheet sheet = workbook.createSheet("Members");

            // Header
            String[] headers = {"ID", "Name", "Gender", "BirthDate", "Phone", "Email", "JoinYear", "Address"};
            Row headerRow = sheet.createRow(0);
            for (int col = 0; col < headers.length; col++) {
                Cell cell = headerRow.createCell(col);
                cell.setCellValue(headers[col]);
            }

            // Body
            int rowIdx = 1;
            for (Member member : members) {
                Row row = sheet.createRow(rowIdx++);

                row.createCell(0).setCellValue(member.getId());
                row.createCell(1).setCellValue(member.getName());
                row.createCell(2).setCellValue(member.getGender() != null ? member.getGender().toString() : "");
                row.createCell(3).setCellValue(member.getBirthDate() != null ? member.getBirthDate().toString() : "");
                row.createCell(4).setCellValue(member.getPhone());
                row.createCell(5).setCellValue(member.getEmail());
                row.createCell(6).setCellValue(member.getJoinYear() != null ? member.getJoinYear() : 0);
                row.createCell(7).setCellValue(member.getAddress());
            }

            workbook.write(out);
            return out.toByteArray();
        }
    }

    public byte[] exportCellAttendances(Long cellId, LocalDate startDate, LocalDate endDate) throws IOException {
        List<Attendance> attendances = attendanceRepository.findByMember_Cell_IdAndDateBetweenWithMemberAndCreatedBy(cellId, startDate, endDate);

        try (Workbook workbook = new XSSFWorkbook(); ByteArrayOutputStream out = new ByteArrayOutputStream()) {
            Sheet sheet = workbook.createSheet("Attendances");

            // Header
            String[] headers = {"Date", "MemberName", "Status", "Memo", "RecordedBy"};
            Row headerRow = sheet.createRow(0);
            for (int col = 0; col < headers.length; col++) {
                Cell cell = headerRow.createCell(col);
                cell.setCellValue(headers[col]);
            }

            // Body
            int rowIdx = 1;
            for (Attendance attendance : attendances) {
                Row row = sheet.createRow(rowIdx++);

                row.createCell(0).setCellValue(attendance.getDate() != null ? attendance.getDate().toString() : "");
                row.createCell(1).setCellValue(attendance.getMember() != null ? attendance.getMember().getName() : "N/A");
                row.createCell(2).setCellValue(attendance.getStatus() != null ? attendance.getStatus().toString() : "");
                row.createCell(3).setCellValue(attendance.getMemo());
                row.createCell(4).setCellValue(attendance.getCreatedBy() != null ? attendance.getCreatedBy().getUsername() : "N/A");
            }
            
            workbook.write(out);
            return out.toByteArray();
        }
    }
}
