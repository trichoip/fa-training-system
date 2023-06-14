-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 14, 2023 lúc 06:26 PM
-- Phiên bản máy phục vụ: 10.4.27-MariaDB
-- Phiên bản PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `fa_training_system`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `assessments`
--

CREATE TABLE `assessments` (
  `id` bigint(20) NOT NULL,
  `assignment` float DEFAULT NULL,
  `final` float DEFAULT NULL,
  `final_practice` float DEFAULT NULL,
  `final_theory` float DEFAULT NULL,
  `gpa` float DEFAULT NULL,
  `quiz` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `attendees`
--

CREATE TABLE `attendees` (
  `id` bigint(20) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `classes`
--

CREATE TABLE `classes` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `last_modified_at` datetime(6) DEFAULT NULL,
  `code` varchar(50) NOT NULL,
  `duration` int(11) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `last_modified_by` bigint(20) DEFAULT NULL,
  `program_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `class_details`
--

CREATE TABLE `class_details` (
  `id` bigint(20) NOT NULL,
  `accepted` int(11) DEFAULT NULL,
  `actual` int(11) DEFAULT NULL,
  `contact_point` varchar(255) DEFAULT NULL,
  `detail_location` varchar(255) DEFAULT NULL,
  `finish_at` time DEFAULT NULL,
  `others` varchar(200) DEFAULT NULL,
  `planned` int(11) DEFAULT NULL,
  `start_at` time DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  `attendee_id` bigint(20) DEFAULT NULL,
  `class_id` bigint(20) NOT NULL,
  `location_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `class_schedules`
--

CREATE TABLE `class_schedules` (
  `id` bigint(20) NOT NULL,
  `study_date` date DEFAULT NULL,
  `class_detail_id` bigint(20) DEFAULT NULL,
  `session_id` bigint(20) DEFAULT NULL,
  `trainer_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `deliveries`
--

CREATE TABLE `deliveries` (
  `id` bigint(20) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `file_storage`
--

CREATE TABLE `file_storage` (
  `id` bigint(20) NOT NULL,
  `date` datetime(6) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `format_types`
--

CREATE TABLE `format_types` (
  `id` bigint(20) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lessons`
--

CREATE TABLE `lessons` (
  `id` bigint(20) NOT NULL,
  `duration` int(11) DEFAULT NULL,
  `index` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `delivery_id` bigint(20) DEFAULT NULL,
  `format_type_id` bigint(20) DEFAULT NULL,
  `output_standard_id` bigint(20) DEFAULT NULL,
  `unit_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `levels`
--

CREATE TABLE `levels` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `locations`
--

CREATE TABLE `locations` (
  `id` bigint(20) NOT NULL,
  `city` varchar(45) NOT NULL,
  `code` varchar(45) NOT NULL,
  `fsu` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `materials`
--

CREATE TABLE `materials` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `file_url` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `lesson_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `output_standards`
--

CREATE TABLE `output_standards` (
  `id` bigint(20) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `programs`
--

CREATE TABLE `programs` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `last_modified_at` datetime(6) DEFAULT NULL,
  `activated` bit(1) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `last_modified_by` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `program_syllabus`
--

CREATE TABLE `program_syllabus` (
  `program_id` bigint(20) NOT NULL,
  `syllabus_id` bigint(20) NOT NULL,
  `syllabus_index` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `permissions` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sessions`
--

CREATE TABLE `sessions` (
  `id` bigint(20) NOT NULL,
  `index` int(11) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `syllabus_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `syllabuses`
--

CREATE TABLE `syllabuses` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `last_modified_at` datetime(6) DEFAULT NULL,
  `attendee_number` int(11) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `course_objective` text DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `technical_requirement` text DEFAULT NULL,
  `version` float DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `last_modified_by` bigint(20) DEFAULT NULL,
  `assessment_id` bigint(20) DEFAULT NULL,
  `level_id` bigint(20) DEFAULT NULL,
  `training_principle_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `training_principle`
--

CREATE TABLE `training_principle` (
  `id` bigint(20) NOT NULL,
  `marking` text DEFAULT NULL,
  `others` text DEFAULT NULL,
  `re_test` text DEFAULT NULL,
  `training` text DEFAULT NULL,
  `waiver_criteria` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `units`
--

CREATE TABLE `units` (
  `id` bigint(20) NOT NULL,
  `index` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `total_duration_lesson` double DEFAULT NULL,
  `session_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `activated` bit(1) NOT NULL,
  `avatar_url` varchar(255) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `code` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `gender` bit(1) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `level_id` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_class_detail`
--

CREATE TABLE `user_class_detail` (
  `class_detail_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `assessments`
--
ALTER TABLE `assessments`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `attendees`
--
ALTER TABLE `attendees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_75u38dvm5ht4p4tudfqbb1prh` (`type`);

--
-- Chỉ mục cho bảng `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_ivcaxrbwnp0dosg2gj4i3sxpq` (`code`),
  ADD KEY `FKbiegjf3djr7vcre1jxun3lbhh` (`created_by`),
  ADD KEY `FKd9jxhyf732e1o7ayctf7yuugp` (`last_modified_by`),
  ADD KEY `FKthmk4awc7ft3lg8ud2behicfs` (`program_id`);

--
-- Chỉ mục cho bảng `class_details`
--
ALTER TABLE `class_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKrox1p5mwmlawehs4sqae6f2cu` (`attendee_id`),
  ADD KEY `FKjuc5vv7suu2rg9fe9j14nl5vp` (`class_id`),
  ADD KEY `FKqa7bkgps47qjh7cxwsa9gqwks` (`location_id`);

--
-- Chỉ mục cho bảng `class_schedules`
--
ALTER TABLE `class_schedules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK3hr653l17gogn08c6or9junst` (`class_detail_id`),
  ADD KEY `FK5upcw2hwhgv5gbkggmk42r7wc` (`session_id`),
  ADD KEY `FKfgq5lye3c64by4udqajlr279g` (`trainer_id`);

--
-- Chỉ mục cho bảng `deliveries`
--
ALTER TABLE `deliveries`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `file_storage`
--
ALTER TABLE `file_storage`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `format_types`
--
ALTER TABLE `format_types`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `lessons`
--
ALTER TABLE `lessons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK18qao7xmeh7a8e1i0s3q3ik0e` (`delivery_id`),
  ADD KEY `FKemvrikd529cwhlk515kim2gve` (`format_type_id`),
  ADD KEY `FK8r17xqds2ig0mlk9jm0e53wcm` (`output_standard_id`),
  ADD KEY `FKfsvqlgk1jdfcd1h8biuwy55rn` (`unit_id`);

--
-- Chỉ mục cho bảng `levels`
--
ALTER TABLE `levels`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_e1ejnmsswocdocld1t1iwsvr5` (`name`);

--
-- Chỉ mục cho bảng `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `materials`
--
ALTER TABLE `materials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKj3unvdjwlsccmqod6jl4w0vcp` (`created_by`),
  ADD KEY `FK24ruqpibfurlhb345nmqh08n` (`lesson_id`);

--
-- Chỉ mục cho bảng `output_standards`
--
ALTER TABLE `output_standards`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `programs`
--
ALTER TABLE `programs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKlrp6u3c081ppocuppb676c7gy` (`created_by`),
  ADD KEY `FK4cyb4heqhy4xgoy2pfuuwjqdq` (`last_modified_by`);

--
-- Chỉ mục cho bảng `program_syllabus`
--
ALTER TABLE `program_syllabus`
  ADD PRIMARY KEY (`program_id`,`syllabus_index`),
  ADD KEY `FK8ks7nksqr16bpi4niyc86j8ap` (`syllabus_id`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_ofx66keruapi6vyqpv6f2or37` (`name`);

--
-- Chỉ mục cho bảng `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKh0x2ptmxtqkfbjhbkoevwkts7` (`syllabus_id`);

--
-- Chỉ mục cho bảng `syllabuses`
--
ALTER TABLE `syllabuses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK1ysb28n6acuj6ka2qbk7jfxl9` (`created_by`),
  ADD KEY `FKavtmf636td29vit0r4hufwr0a` (`last_modified_by`),
  ADD KEY `FKog7ydovun9by8gil6ohde5x1t` (`assessment_id`),
  ADD KEY `FKtlybknyldvpkfyk329rgo8hlw` (`level_id`),
  ADD KEY `FK16ekmmrw5ng1rbw8310ix75pt` (`training_principle_id`);

--
-- Chỉ mục cho bảng `training_principle`
--
ALTER TABLE `training_principle`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKggkr7eghfph2og9yk21721di8` (`session_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_71vrxovabe8x9tom8xwefi3e7` (`code`),
  ADD UNIQUE KEY `UK_6dotkott2kjsp8vw4d0m25fb7` (`email`),
  ADD KEY `FKhjemv8nqu3o0rutwrhlgca5in` (`level_id`),
  ADD KEY `FKp56c1712k691lhsyewcssf40f` (`role_id`);

--
-- Chỉ mục cho bảng `user_class_detail`
--
ALTER TABLE `user_class_detail`
  ADD KEY `FKjhfajenjj6qnbiugckn0j7kak` (`user_id`),
  ADD KEY `FKq6rrotmrcevydf36copjv6ppb` (`class_detail_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `assessments`
--
ALTER TABLE `assessments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `attendees`
--
ALTER TABLE `attendees`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `classes`
--
ALTER TABLE `classes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `class_details`
--
ALTER TABLE `class_details`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `class_schedules`
--
ALTER TABLE `class_schedules`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `deliveries`
--
ALTER TABLE `deliveries`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `file_storage`
--
ALTER TABLE `file_storage`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `format_types`
--
ALTER TABLE `format_types`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `lessons`
--
ALTER TABLE `lessons`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `levels`
--
ALTER TABLE `levels`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `locations`
--
ALTER TABLE `locations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `materials`
--
ALTER TABLE `materials`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `output_standards`
--
ALTER TABLE `output_standards`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `programs`
--
ALTER TABLE `programs`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `syllabuses`
--
ALTER TABLE `syllabuses`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `training_principle`
--
ALTER TABLE `training_principle`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `classes`
--
ALTER TABLE `classes`
  ADD CONSTRAINT `FKbiegjf3djr7vcre1jxun3lbhh` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FKd9jxhyf732e1o7ayctf7yuugp` FOREIGN KEY (`last_modified_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FKthmk4awc7ft3lg8ud2behicfs` FOREIGN KEY (`program_id`) REFERENCES `programs` (`id`);

--
-- Các ràng buộc cho bảng `class_details`
--
ALTER TABLE `class_details`
  ADD CONSTRAINT `FKjuc5vv7suu2rg9fe9j14nl5vp` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`),
  ADD CONSTRAINT `FKqa7bkgps47qjh7cxwsa9gqwks` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`),
  ADD CONSTRAINT `FKrox1p5mwmlawehs4sqae6f2cu` FOREIGN KEY (`attendee_id`) REFERENCES `attendees` (`id`);

--
-- Các ràng buộc cho bảng `class_schedules`
--
ALTER TABLE `class_schedules`
  ADD CONSTRAINT `FK3hr653l17gogn08c6or9junst` FOREIGN KEY (`class_detail_id`) REFERENCES `class_details` (`id`),
  ADD CONSTRAINT `FK5upcw2hwhgv5gbkggmk42r7wc` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`),
  ADD CONSTRAINT `FKfgq5lye3c64by4udqajlr279g` FOREIGN KEY (`trainer_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `lessons`
--
ALTER TABLE `lessons`
  ADD CONSTRAINT `FK18qao7xmeh7a8e1i0s3q3ik0e` FOREIGN KEY (`delivery_id`) REFERENCES `deliveries` (`id`),
  ADD CONSTRAINT `FK8r17xqds2ig0mlk9jm0e53wcm` FOREIGN KEY (`output_standard_id`) REFERENCES `output_standards` (`id`),
  ADD CONSTRAINT `FKemvrikd529cwhlk515kim2gve` FOREIGN KEY (`format_type_id`) REFERENCES `format_types` (`id`),
  ADD CONSTRAINT `FKfsvqlgk1jdfcd1h8biuwy55rn` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`);

--
-- Các ràng buộc cho bảng `materials`
--
ALTER TABLE `materials`
  ADD CONSTRAINT `FK24ruqpibfurlhb345nmqh08n` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`),
  ADD CONSTRAINT `FKj3unvdjwlsccmqod6jl4w0vcp` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `programs`
--
ALTER TABLE `programs`
  ADD CONSTRAINT `FK4cyb4heqhy4xgoy2pfuuwjqdq` FOREIGN KEY (`last_modified_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FKlrp6u3c081ppocuppb676c7gy` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `program_syllabus`
--
ALTER TABLE `program_syllabus`
  ADD CONSTRAINT `FK8ks7nksqr16bpi4niyc86j8ap` FOREIGN KEY (`syllabus_id`) REFERENCES `syllabuses` (`id`),
  ADD CONSTRAINT `FKdfxu0lcxgkxe849mafs4i6v9m` FOREIGN KEY (`program_id`) REFERENCES `programs` (`id`);

--
-- Các ràng buộc cho bảng `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `FKh0x2ptmxtqkfbjhbkoevwkts7` FOREIGN KEY (`syllabus_id`) REFERENCES `syllabuses` (`id`);

--
-- Các ràng buộc cho bảng `syllabuses`
--
ALTER TABLE `syllabuses`
  ADD CONSTRAINT `FK16ekmmrw5ng1rbw8310ix75pt` FOREIGN KEY (`training_principle_id`) REFERENCES `training_principle` (`id`),
  ADD CONSTRAINT `FK1ysb28n6acuj6ka2qbk7jfxl9` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FKavtmf636td29vit0r4hufwr0a` FOREIGN KEY (`last_modified_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FKog7ydovun9by8gil6ohde5x1t` FOREIGN KEY (`assessment_id`) REFERENCES `assessments` (`id`),
  ADD CONSTRAINT `FKtlybknyldvpkfyk329rgo8hlw` FOREIGN KEY (`level_id`) REFERENCES `levels` (`id`);

--
-- Các ràng buộc cho bảng `units`
--
ALTER TABLE `units`
  ADD CONSTRAINT `FKggkr7eghfph2og9yk21721di8` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`);

--
-- Các ràng buộc cho bảng `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `FKhjemv8nqu3o0rutwrhlgca5in` FOREIGN KEY (`level_id`) REFERENCES `levels` (`id`),
  ADD CONSTRAINT `FKp56c1712k691lhsyewcssf40f` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Các ràng buộc cho bảng `user_class_detail`
--
ALTER TABLE `user_class_detail`
  ADD CONSTRAINT `FKjhfajenjj6qnbiugckn0j7kak` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FKq6rrotmrcevydf36copjv6ppb` FOREIGN KEY (`class_detail_id`) REFERENCES `class_details` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
