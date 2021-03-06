/**
 * Content	: Bangladesh Application Schema
 * Date		: 01 September 2021
 * Designer	: saif zaman and md.aamroni
 * Version	: 1.0
 *	Company	: aDecoder
 */

-- Database
CREATE DATABASE app_country_collection_rdb CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;


-- Divisions
CREATE TABLE IF NOT EXISTS `app_divisions` (
   `id` BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`title_en` varchar(255) NOT NULL,
	`title_bn` varchar(255) NOT NULL,
	`created_at` datetime NULL,
   `updated_at` datetime NULL,
   `deleted_at` datetime NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE utf8mb4_general_ci AUTO_INCREMENT=1;


-- Districts
CREATE TABLE IF NOT EXISTS `app_districts` (
   `id` BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`division_id` BIGINT NOT NULL,
	`title_en` varchar(255) NOT NULL,
	`title_bn` varchar(255) NOT NULL,
	`created_at` datetime NULL,
   `updated_at` datetime NULL,
   `deleted_at` datetime NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE utf8mb4_general_ci AUTO_INCREMENT=1;


-- Upazila
CREATE TABLE IF NOT EXISTS `app_upazilas` (
   `id` BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`division_id` BIGINT NOT NULL,
	`district_id` BIGINT NOT NULL,
	`title_en` varchar(255) NOT NULL,
	`title_bn` varchar(255) NOT NULL,
	`created_at` datetime NULL,
   `updated_at` datetime NULL,
   `deleted_at` datetime NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE utf8mb4_general_ci AUTO_INCREMENT=1;


-- Zip Code
CREATE TABLE IF NOT EXISTS `app_zip_codes` (
   `id` BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`division_id` BIGINT NOT NULL,
	`district_id` BIGINT NOT NULL,
	`upazila_id` BIGINT NOT NULL,
	`title_en` varchar(255) NOT NULL,
	`title_bn` varchar(255) NOT NULL,
	`code_en` varchar(32) NOT NULL,
	`code_bn` varchar(32) NOT NULL,
	`created_at` datetime NULL,
   `updated_at` datetime NULL,
   `deleted_at` datetime NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE utf8mb4_general_ci AUTO_INCREMENT=1;


-- Foreign Key Relation
ALTER TABLE `app_districts` 
ADD FOREIGN KEY (`division_id`) REFERENCES `app_divisions`(`id`) 
ON DELETE RESTRICT 
ON UPDATE RESTRICT;

ALTER TABLE `app_upazilas` 
ADD FOREIGN KEY (`division_id`) REFERENCES `app_divisions`(`id`), 
ADD FOREIGN KEY (`district_id`) REFERENCES `app_districts`(`id`)
ON DELETE RESTRICT 
ON UPDATE RESTRICT;

ALTER TABLE `app_zip_codes` 
ADD FOREIGN KEY (`division_id`) REFERENCES `app_divisions`(`id`), 
ADD FOREIGN KEY (`district_id`) REFERENCES `app_districts`(`id`), 
ADD FOREIGN KEY (`upazila_id`) REFERENCES `app_upazilas`(`id`)
ON DELETE RESTRICT 
ON UPDATE RESTRICT;


-- Create Divisions
INSERT INTO `app_divisions`
	(`id`, `title_en`, `title_bn`, `created_at`)
VALUES
	(1, "Chittagong", "চট্টগ্রাম", NOW()),
	(2, "Dhaka", "ঢাকা", NOW()),
	(3, "Rajshahi", "রাজশাহী", NOW()),
	(4, "Sylhet", "সিলেট", NOW()),
	(5, "Mymensingh", "ময়মনসিংহ", NOW()),
	(6, "Barisal", "বরিশাল", NOW()),
	(7, "Rangpur", "রংপুর", NOW()),
	(8, "Khulna", "খুলনা", NOW());


-- Create Districts
INSERT INTO `app_districts`
	(`id`, `division_id`, `title_en`, `title_bn`, `created_at`)
VALUES
	(1, 1, "Bandarban", "বান্দরবান", NOW()),
	(2, 1, "Brahmanbaria", "ব্রাহ্মণবাড়িয়া", NOW()),
	(3, 1, "Chandpur", "চাঁদপুর", NOW()),
	(4, 1, "Chittagong", "চট্টগ্রাম", NOW()),
	(5, 1, "Comilla", "কুমিল্লা", NOW()),
	(6, 1, "Cox\'s Bazar", "কক্সবাজার", NOW()),
	(7, 1, "Feni", "ফেনী", NOW()),
	(8, 1, "Khagrachhari", "খাগড়াছড়ি", NOW()),
	(9, 1, "Lakshmipur", "লক্ষ্মীপুর", NOW()),
	(10, 1, "Noakhali", "নোয়াখালী", NOW()),
	(11, 1, "Rangamati", "রাঙ্গামাটি", NOW()),	
	(12, 2, "Dhaka", "ঢাকা", NOW()),
	(13, 2, "Faridpur", "ফরিদপুর", NOW()),
	(14, 2, "Gazipur", "গাজীপুর", NOW()),
	(15, 2, "Gopalganj", "গোপালগঞ্জ", NOW()),
	(16, 2, "Kishoreganj", "কিশোরগঞ্জ", NOW()),
	(17, 2, "Madaripur", "মাদারীপুর", NOW()),
	(18, 2, "Manikganj", "মানিকগঞ্জ", NOW()),
	(19, 2, "Munshiganj", "মুন্সিগঞ্জ", NOW()),
	(20, 2, "Narayanganj", "নারায়ণগঞ্জ", NOW()),
	(21, 2, "Narsingdi", "নরসিংদী", NOW()),
	(22, 2, "Rajbari", "রাজবাড়ী", NOW()),
	(23, 2, "Shariatpur", "শরীয়তপুর", NOW()),
	(24, 2, "Tangail", "টাঙ্গাইল", NOW()),
	(25, 3, "Bogra", "বগুড়া", NOW()),
	(26, 3, "Joypurhat", "জয়পুরহাট", NOW()),
	(27, 3, "Naogaon", "নওগাঁ", NOW()),
	(28, 3, "Natore", "নাটোর", NOW()),
	(29, 3, "Chapainawabganj", "চাঁপাইনবাবগঞ্জ", NOW()),
	(30, 3, "Pabna", "পাবনা", NOW()),
	(31, 3, "Rajshahi", "রাজশাহী", NOW()),
	(32, 3, "Sirajganj", "সিরাজগঞ্জ", NOW()),
	(33, 4, "Habiganj", "হবিগঞ্জ", NOW()),
	(34, 4, "Moulvibazar", "মৌলভীবাজার", NOW()),
	(35, 4, "Sunamganj", "সুনামগঞ্জ", NOW()),
	(36, 4, "Sylhet", "সিলেট", NOW()),
	(37, 5, "Jamalpur", "জামালপুর", NOW()),
	(38, 5, "Mymensingh", "ময়মনসিংহ", NOW()),
	(39, 5, "Netrokona", "নেত্রকোণা", NOW()),
	(40, 5, "Sherpur", "শেরপুর", NOW()),
	(41, 6, "Barguna", "বরগুনা", NOW()),
	(42, 6, "Barisal", "বরিশাল", NOW()),
	(43, 6, "Bhola", "ভোলা", NOW()),
	(44, 6, "Jhalokati", "ঝালকাঠি", NOW()),
	(45, 6, "Patuakhali", "পটুয়াখালী", NOW()),
	(46, 6, "Pirojpur", "পিরোজপুর", NOW()),
	(47, 7, "Dinajpur", "দিনাজপুর", NOW()),
	(48, 7, "Gaibandha", "গাইবান্ধা", NOW()),
	(49, 7, "Kurigram", "কুড়িগ্রাম", NOW()),
	(50, 7, "Lalmonirhat", "লালমনিরহাট", NOW()),
	(51, 7, "Nilphamari", "নীলফামারী", NOW()),
	(52, 7, "Panchagarh", "পঞ্চগড়", NOW()),
	(53, 7, "Rangpur", "রংপুর", NOW()),
	(54, 7, "Thakurgaon", "ঠাকুরগাঁও", NOW()),
	(55, 8, "Bagerhat", "বাগেরহাট", NOW()),
	(56, 8, "Chuadanga", "চুয়াডাঙ্গা", NOW()),
	(57, 8, "Jessore", "যশোর", NOW()),
	(58, 8, "Jhenaidah", "ঝিনাইদহ", NOW()),
	(59, 8, "Khulna", "খুলনা", NOW()),
	(60, 8, "Kushtia", "কুষ্টিয়া", NOW()),
	(61, 8, "Kushtia", "মাগুরা", NOW()),
	(62, 8, "Meherpur", "মেহেরপুর", NOW()),
	(63, 8, "Narail", "নড়াইল", NOW()),
	(64, 8, "Satkhira", "সাতক্ষীরা", NOW());


-- Create Upazila
INSERT INTO `app_upazilas`
	(`id`, `division_id`, `district_id`, `title_en`, `title_bn`, `created_at`)
VALUES
	(1, 1, 1, "Ali Kadam", "আলী কদম", NOW()),
	(2, 1, 1, "Bandarban Sadar", "বান্দরবান সদর", NOW()),
	(3, 1, 1, "Lama", "লামা", NOW()),
	(4, 1, 1, "Naikhongchhari", "নাইখংছড়ি", NOW()),
	(5, 1, 1, "Rowangchhari", "রোয়াংছড়ি", NOW()),
	(6, 1, 1, "Ruma", "রুমা", NOW()),
	(7, 1, 1, "Thanchi", "থানচি", NOW()),
	(8, 1, 2, "Akhaura", "আখাউড়া", NOW()),
	(9, 1, 2, "Bancharampur", "বাঞ্ছারামপুর", NOW()),
	(10, 1, 2, "Brahmanbaria Sadar", "ব্রাহ্মণবাড়িয়া সদর", NOW()),
	(11, 1, 2, "Kasba", "কসবা", NOW()),
	(12, 1, 2, "Nabinagar", "নবীনগর", NOW()),
	(13, 1, 2, "Nasirnagar", "নাসিরনগর", NOW()),
	(14, 1, 2, "Sarail", "সরাইল", NOW()),
	(15, 1, 2, "Ashuganj", "আশুগঞ্জ", NOW()),
	(16, 1, 2, "Bijoynagar", "বিজয়নগর", NOW()),
	(17, 1, 3, "Chandpur Sadar", "চাঁদপুর সদর", NOW()),
	(18, 1, 3, "Faridganj", "ফরিদগঞ্জ", NOW()),
	(19, 1, 3, "Haimchar", "হাইমচর", NOW()),
	(20, 1, 3, "Haziganj", "হাজীগঞ্জ", NOW()),
	(21, 1, 3, "Kachua", "কচুয়া", NOW()),
	(22, 1, 3, "Matlab Dakshin", "মতলব দক্ষিণ", NOW()),
	(23, 1, 3, "Matlab Uttar", "মতলব উত্তর", NOW()),
	(24, 1, 3, "Shahrasti", "শাহরাস্তি", NOW()),
	(25, 1, 4, "Anwara", "আনোয়ারা", NOW()),
	(26, 1, 4, "Banshkhali", "বাঁশখালী", NOW()),
	(27, 1, 4, "Boalkhali", "বোয়ালখালী", NOW()),
	(28, 1, 4, "Chandanaish", "চন্দনাইশ", NOW()),
	(29, 1, 4, "Fatikchhari", "ফটিকছড়ি", NOW()),
	(30, 1, 4, "Hathazari", "হাটহাজারী", NOW()),
	(31, 1, 4, "Karnaphuli", "কর্ণফুলী", NOW()),
	(32, 1, 4, "Lohagara", "লোহাগাড়া", NOW()),
	(33, 1, 4, "Mirsharai", "মিরসরাই", NOW()),
	(34, 1, 4, "Patiya", "পটিয়া", NOW()),
	(35, 1, 4, "Rangunia", "রাঙ্গুনিয়া", NOW()),
	(36, 1, 4, "Raozan", "রাওজান", NOW()),
	(37, 1, 4, "Sandwip", "সন্দ্বীপ", NOW()),
	(38, 1, 4, "Satkania", "সাতকানিয়া", NOW()),
	(39, 1, 4, "Sitakunda", "সীতাকুণ্ড", NOW()),
	(40, 1, 5, "Barura", "বরুড়া", NOW()),
	(41, 1, 5, "Brahmanpara", "ব্রাহ্মণপাড়া", NOW()),
	(42, 1, 5, "Burichang", "বুড়িচং", NOW()),
	(43, 1, 5, "Chandina", "চান্দিনা", NOW()),
	(44, 1, 5, "Chauddagram", "চৌদ্দগ্রাম", NOW()),
	(45, 1, 5, "Daudkandi", "দাউদকান্দি", NOW()),
	(46, 1, 5, "Debidwar", "দেবিদ্বার", NOW()),
	(47, 1, 5, "Homna", "হোমনা", NOW()),
	(48, 1, 5, "Laksam", "লাকসাম", NOW()),
	(49, 1, 5, "Lalmai", "লালমাই", NOW()),
	(50, 1, 5, "Muradnagar", "মুরাদনগর", NOW()),
	(51, 1, 5, "Nangalkot", "নাঙ্গলকোট", NOW()),
	(52, 1, 5, "Comilla Adarsha Sadar", "কুমিল্লা আদর্শ সদর", NOW()),
	(53, 1, 5, "Meghna", "মেঘনা", NOW()),
	(54, 1, 5, "Titas", "তিতাস", NOW()),
	(55, 1, 5, "Monohargonj", "মনোহরগঞ্জ", NOW()),
	(56, 1, 5, "Comilla Sadar Dakshin", "কুমিল্লা সদর দক্ষিণ", NOW()),
	(57, 1, 6, "Chakaria", "চকরিয়া", NOW()),
	(58, 1, 6, "Cox\'s Bazar Sadar", "কক্সবাজার সদর", NOW()),
	(59, 1, 6, "Kutubdia", "কুতুবদিয়া", NOW()),
	(60, 1, 6, "Maheshkhali", "মহেশখালী", NOW()),
	(61, 1, 6, "Ramu", "রামু", NOW()),
	(62, 1, 6, "Teknaf", "টেকনাফ", NOW()),
	(63, 1, 6, "Ukhia", "উখিয়া", NOW()),
	(64, 1, 6, "Pekua", "পেকুয়া", NOW()),
	(65, 1, 6, "Eidgaon", "ঈদগাঁও", NOW()),	
	(66, 1, 7, "Chhagalnaiya", "ছাগলনাইয়া", NOW()),
	(67, 1, 7, "Daganbhuiyan", "দাগনভূঁইয়া", NOW()),
	(68, 1, 7, "Feni Sadar", "ফেনী সদর", NOW()),
	(69, 1, 7, "Parshuram", "পরশুরাম", NOW()),
	(70, 1, 7, "Sonagazi", "সোনাগাজী", NOW()),
	(71, 1, 7, "Fulgazi", "ফুলগাজী", NOW()),
	(72, 1, 8, "Dighinala", "দীঘিনালা", NOW()),
	(73, 1, 8, "Khagrachhari", "খাগড়াছড়ি", NOW()),
	(74, 1, 8, "Lakshmichhari", "লক্ষ্মীছড়ি", NOW()),
	(75, 1, 8, "Mahalchhari", "মহালছড়ি", NOW()),
	(76, 1, 8, "Manikchhari", "মানিকছড়ি", NOW()),
	(77, 1, 8, "Matiranga", "মাটিরাঙ্গা", NOW()),
	(78, 1, 8, "Panchhari", "পানছড়ি", NOW()),
	(79, 1, 8, "Ramgarh", "রামগড়", NOW()),
	(80, 1, 9, "Lakshmipur Sadar", "লক্ষ্মীপুর সদর", NOW()),
	(81, 1, 9, "Raipur", "রায়পুর", NOW()),
	(82, 1, 9, "Ramganj", "রামগঞ্জ", NOW()),
	(83, 1, 9, "Ramgati", "রামগতি", NOW()),
	(84, 1, 9, "Kamalnagar", "কমলনগর", NOW()),
	(85, 1, 10, "Begumganj", "বেগমগঞ্জ", NOW()),
	(86, 1, 10, "Noakhali Sadar", "নোয়াখালী সদর", NOW()),
	(87, 1, 10, "Chatkhil", "চাটখিল", NOW()),
	(88, 1, 10, "Companiganj", "কোম্পানীগঞ্জ", NOW()),
	(89, 1, 10, "Hatiya", "হাতিয়া", NOW()),
	(90, 1, 10, "Senbagh", "সেনবাগ", NOW()),
	(91, 1, 10, "Sonaimuri", "সোনাইমুড়ি", NOW()),
	(92, 1, 10, "Subarnachar", "সুবর্ণচর", NOW()),
	(93, 1, 10, "Kabirhat", "কবিরহাট", NOW()),
	(94, 1, 11, "Bagaichhari", "বগাইছড়ি", NOW()),
	(95, 1, 11, "Barkal", "বরকল", NOW()),
	(96, 1, 11, "Kawkhali (Betbunia)", "কাউখালী (বেতবুনিয়া)", NOW()),
	(97, 1, 11, "Belaichhari", "বেলাছড়ি", NOW()),
	(98, 1, 11, "Kaptai", "কাপ্তাই", NOW()),
	(99, 1, 11, "Juraichhari", "জুরাইছড়ি", NOW()),
	(100, 1, 11, "Langadu", "লাঙ্গাদু", NOW()),
	(101, 1, 11, "Naniyachar", "ননিয়াচর", NOW()),
	(102, 1, 11, "Rajasthali", "রাজস্থলী", NOW()),
	(103, 1, 11, "Rangamati Sadar", "রাঙ্গামাটি সদর", NOW()),
	(104, 2, 12, "Dhamrai", "ধামরাই", NOW()),
	(105, 2, 12, "Dohar", "দোহার", NOW()),
	(106, 2, 12, "Keraniganj", "কেরানীগঞ্জ", NOW()),
	(107, 2, 12, "Nawabganj", "নবাবগঞ্জ", NOW()),
	(108, 2, 12, "Savar", "সাভার", NOW()),
	(109, 2, 12, "Tejgaon Circle", "তেজগাঁও সার্কেল", NOW()),
	(110, 2, 13, "Alfadanga", "আলফাডাঙ্গা", NOW()),
	(111, 2, 13, "Bhanga", "ভাঙ্গা", NOW()),
	(112, 2, 13, "Charbhadrasan", "চরভদ্রাসন", NOW()),
	(113, 2, 13, "Faridpur Sadar", "ফরিদপুর সদর", NOW()),
	(114, 2, 13, "Madhukhali", "মধুখালী", NOW()),
	(115, 2, 13, "Nagarkanda", "ফরিদপুর", NOW()),
	(116, 2, 13, "Sadarpur", "সদরপুর", NOW()),
	(117, 2, 13, "Saltha", "সালথা", NOW()),
	(118, 2, 14, "Gazipur Sadar", "গাজীপুর সদর", NOW()),
	(119, 2, 14, "Kaliakair", "কালিয়াকৈর", NOW()),
	(120, 2, 14, "Kaliganj", "কালীগঞ্জ", NOW()),
	(121, 2, 14, "Kapasia", "কাপাসিয়া", NOW()),
	(122, 2, 14, "Sreepur", "শ্রীপুর", NOW()),
	(123, 2, 15, "Gopalganj Sadar", "গোপালগঞ্জ সদর", NOW()),
	(124, 2, 15, "Kashiani", "কাশিয়ানী", NOW()),
	(125, 2, 15, "Kotalipara", "কোটালীপাড়া", NOW()),
	(126, 2, 15, "Muksudpur", "মুকসুদপুর", NOW()),
	(127, 2, 15, "Tungipara", "টুঙ্গিপাড়া", NOW()),
	(128, 2, 16, "Austagram", "অষ্টগ্রাম", NOW()),
	(129, 2, 16, "Bajitpur", "বাজিতপুর", NOW()),
	(130, 2, 16, "Bhairab", "ভৈরব", NOW()),
	(131, 2, 16, "Hossainpur", "হোসেনপুর", NOW()),
	(132, 2, 16, "Itna", "ইটনা", NOW()),
	(133, 2, 16, "Karimganj", "করিমগঞ্জ", NOW()),
	(134, 2, 16, "Katiadi", "কটিয়াদী", NOW()),
	(135, 2, 16, "Kishoreganj Sadar", "কিশোরগঞ্জ সদর", NOW()),
	(136, 2, 16, "Kuliarchar", "কুলিয়ারচর", NOW()),
	(137, 2, 16, "Kuliarchar", "কিশোরগঞ্জ", NOW()),
	(138, 2, 16, "Mithamain", "মিঠামইন", NOW()),
	(139, 2, 16, "Nikli", "নিকলি", NOW()),
	(140, 2, 16, "Pakundia", "পাকুন্দিয়া", NOW()),
	(141, 2, 16, "Tarail", "তাড়াইল", NOW()),
	(142, 2, 17, "Rajoir", "রাজাইর", NOW()),
	(143, 2, 17, "Madaripur Sadar", "মাদারীপুর সদর", NOW()),
	(144, 2, 17, "Kalkini", "কালকিনি", NOW()),
	(145, 2, 17, "Shibchar", "শিবচর", NOW()),
	(146, 2, 18, "Daulatpur", "দৌলতপুর", NOW()),
	(147, 2, 18, "Ghior", "ঘিওর", NOW()),
	(148, 2, 18, "Harirampur", "হরিরামপুর", NOW()),
	(149, 2, 18, "Manikganj Sadar", "মানিকগঞ্জ সদর", NOW()),
	(150, 2, 18, "Saturia", "সাটুরিয়া", NOW()),
	(151, 2, 18, "Shivalaya", "শিবালয়", NOW()),
	(152, 2, 18, "Singair", "সিঙ্গাইর", NOW()),
	(153, 2, 19, "Gazaria", "গজারিয়া", NOW()),
	(154, 2, 19, "Lohajang", "লৌহজং", NOW()),
	(155, 2, 19, "Munshiganj Sadar", "মুন্সিগঞ্জ সদর", NOW()),
	(156, 2, 19, "Sirajdikhan", "সিরাজদিখান", NOW()),
	(157, 2, 19, "Sreenagar", "শ্রীনগর", NOW()),
	(158, 2, 19, "Tongibari", "টঙ্গীবাড়ি", NOW()),	
	(159, 2, 20, "Araihazar", "আড়াইহাজার", NOW()),
	(160, 2, 20, "Bandar", "বন্দর", NOW()),
	(161, 2, 20, "Narayanganj Sadar", "নারায়ণগঞ্জ সদর", NOW()),
	(162, 2, 20, "Rupganj", "রূপগঞ্জ", NOW()),
	(163, 2, 20, "Sonargaon", "সোনারগাঁ", NOW()),	
	(164, 2, 21, "Narsingdi Sadar", "নরসিংদী সদর", NOW()),
	(165, 2, 21, "Belabo", "বেলাবো", NOW()),
	(166, 2, 21, "Monohardi", "মনোহার্দি", NOW()),
	(167, 2, 21, "Palash", "পলাশ", NOW()),
	(168, 2, 21, "Raipura", "রায়পুরা", NOW()),
	(169, 2, 21, "Shibpur", "শিবপুর", NOW()),
	(170, 2, 22, "Baliakandi", "বালিয়াকান্দি", NOW()),
	(171, 2, 22, "Goalandaghat", "গোয়ালন্দঘাট", NOW()),
	(172, 2, 22, "Pangsha", "পাংশা", NOW()),
	(173, 2, 22, "Rajbari Sadar", "রাজবাড়ী সদর", NOW()),
	(174, 2, 22, "Kalukhali", "কালুখালী", NOW()),
	(175, 2, 23, "Bhedarganj", "ভেদরগঞ্জ", NOW()),
	(176, 2, 23, "Damudya", "দামুদ্যা", NOW()),
	(177, 2, 23, "Gosairhat", "গোসাইরহাট", NOW()),
	(178, 2, 23, "Naria", "নড়িয়া", NOW()),
	(179, 2, 23, "Shariatpur Sadar", "শরীয়তপুর সদর", NOW()),
	(180, 2, 23, "Zajira", "জাজিরা", NOW()),
	(181, 2, 23, "Shakhipur", "শখিপুর", NOW()),
	(182, 2, 24, "Gopalpur", "গোপালপুর", NOW()),
	(183, 2, 24, "Basail", "বাসাইল", NOW()),
	(184, 2, 24, "Bhuapur", "ভূয়াপুর", NOW()),
	(185, 2, 24, "Delduar", "দেলদুয়ার", NOW()),
	(186, 2, 24, "Ghatail", "ঘাটাইল", NOW()),
	(187, 2, 24, "Kalihati", "কালিহাতী", NOW()),
	(188, 2, 24, "Madhupur", "মধুপুর", NOW()),
	(189, 2, 24, "Mirzapur", "মির্জাপুর", NOW()),
	(190, 2, 24, "Nagarpur", "নাগরপুর", NOW()),
	(191, 2, 24, "Sakhipur", "সখীপুর", NOW()),
	(192, 2, 24, "Dhanbari", "ধনবাড়ি", NOW()),
	(193, 2, 24, "Tangail Sadar", "টাঙ্গাইল সদর", NOW()),
	(194, 3, 25, "Adamdighi", "আদমদীঘি", NOW()),
	(195, 3, 25, "Bogura Sadar", "বগুড়া সদর", NOW()),
	(196, 3, 25, "Dhunat", "ধুনট", NOW()),
	(197, 3, 25, "Dhupchanchia", "দুপচাঁচিয়া", NOW()),
	(198, 3, 25, "Gabtali", "গাবতলী", NOW()),
	(199, 3, 25, "Kahaloo", "কাহালু", NOW()),
	(200, 3, 25, "Nandigram", "নন্দীগ্রাম", NOW()),
	(201, 3, 25, "Sariakandi", "সারিয়াকান্দি", NOW()),
	(202, 3, 25, "Shajahanpur", "শাজাহানপুর", NOW()),
	(203, 3, 25, "Sherpur", "শেরপুর", NOW()),
	(204, 3, 25, "Shibganj", "শিবগঞ্জ", NOW()),
	(205, 3, 25, "Sonatola", "সোনাতলা", NOW()),
	(206, 3, 26, "Akkelpur", "আক্কেলপুর", NOW()),
	(207, 3, 26, "Joypurhat Sadar", "জয়পুরহাট সদর", NOW()),
	(208, 3, 26, "Kalai", "কালাই", NOW()),
	(209, 3, 26, "Khetlal", "ক্ষেতলাল", NOW()),
	(210, 3, 26, "Panchbibi", "পাঁচবিবি", NOW()),
	(211, 3, 27, "Atrai", "আত্রাই", NOW()),
	(212, 3, 27, "Badalgachhi", "বদলগাছি", NOW()),
	(213, 3, 27, "Manda", "মান্দা", NOW()),
	(214, 3, 27, "Dhamoirhat", "ধামুইরহাট", NOW()),
	(215, 3, 27, "Mohadevpur", "মহাদেবপুর", NOW()),
	(216, 3, 27, "Naogaon Sadar", "নওগাঁ সদর", NOW()),
	(217, 3, 27, "Niamatpur", "নিয়ামতপুর", NOW()),
	(218, 3, 27, "Patnitala", "পত্নীতলা", NOW()),
	(219, 3, 27, "Porsha", "পোরশা", NOW()),
	(220, 3, 27, "Raninagar", "রাণীনগর", NOW()),
	(221, 3, 27, "Sapahar", "সাপাহার", NOW()),
	(222, 3, 28, "Bagatipara", "বাগাতিপাড়া", NOW()),
	(223, 3, 28, "Baraigram", "বড়াইগ্রাম", NOW()),
	(224, 3, 28, "Gurudaspur", "গুরুদাসপুর", NOW()),
	(225, 3, 28, "Lalpur", "লালপুর", NOW()),
	(226, 3, 28, "Natore Sadar", "নাটোর সদর", NOW()),
	(227, 3, 28, "Singra", "সিংড়া", NOW()),
	(228, 3, 28, "Naldanga", "নলডাঙ্গা", NOW()),
	(229, 3, 29, "Bholahat", "ভোলাহাট", NOW()),
	(230, 3, 29, "Gomastapur", "গোমস্তাপুর", NOW()),
	(231, 3, 29, "Nachole", "নাচোলে", NOW()),
	(232, 3, 29, "Nawabganj Sadar", "নবাবগঞ্জ সদর", NOW()),
	(233, 3, 29, "Shibganj", "শিবগঞ্জ", NOW()),
	(234, 3, 30, "Atgharia", "আটঘরিয়া", NOW()),
	(235, 3, 30, "Bera", "বেরা", NOW()),
	(236, 3, 30, "Bhangura", "ভাঙ্গুড়া", NOW()),
	(237, 3, 30, "Chatmohar", "চাটমোহর", NOW()),
	(238, 3, 30, "Faridpur", "ফরিদপুর", NOW()),
	(239, 3, 30, "Ishwardi", "ঈশ্বরদী", NOW()),
	(240, 3, 30, "Pabna Sadar", "পাবনা সদর", NOW()),
	(241, 3, 30, "Santhia", "সাঁথিয়া", NOW()),
	(242, 3, 30, "Sujanagar", "সুজানগর", NOW()),
	(243, 3, 31, "Bagha", "বাঘা", NOW()),
	(244, 3, 31, "Bagmara", "বাগমারা", NOW()),
	(245, 3, 31, "Charghat", "চারঘাট", NOW()),
	(246, 3, 31, "Durgapur", "দুর্গাপুর", NOW()),
	(247, 3, 31, "Godagari", "গোদাগাড়ী", NOW()),
	(248, 3, 31, "Mohanpur", "মোহনপুর", NOW()),
	(249, 3, 31, "Paba", "পবা", NOW()),
	(250, 3, 31, "Puthia", "পুঠিয়া", NOW()),
	(251, 3, 31, "Tanore", "তানোর", NOW()),
	(252, 3, 32, "Belkuchi", "বেলকুচি", NOW()),
	(253, 3, 32, "Chauhali", "চৌহালী", NOW()),
	(254, 3, 32, "Kamarkhanda", "কামারখন্দ", NOW()),
	(255, 3, 32, "Kazipur", "কাজিপুর", NOW()),
	(256, 3, 32, "Raiganj", "রায়গঞ্জ", NOW()),
	(257, 3, 32, "Shahjadpur", "শাহজাদপুর", NOW()),
	(258, 3, 32, "Sirajganj Sadar", "সিরাজগঞ্জ সদর", NOW()),
	(259, 3, 32, "Tarash", "তাড়াশ", NOW()),
	(260, 3, 32, "Ullahpara", "উল্লাপাড়া", NOW()),
	(261, 4, 33, "Ajmiriganj", "আজমিরীগঞ্জ", NOW()),
	(262, 4, 33, "Bahubal", "বাহুবল", NOW()),
	(263, 4, 33, "Baniyachong", "বানিয়াচং", NOW()),
	(264, 4, 33, "Chunarughat", "চুনারুঘাট", NOW()),
	(265, 4, 33, "Habiganj Sadar", "হবিগঞ্জ সদর", NOW()),
	(266, 4, 33, "Lakhai", "লাখাই", NOW()),
	(267, 4, 33, "Madhabpur", "মাধবপুর", NOW()),
	(268, 4, 33, "Nabiganj", "নবীগঞ্জ", NOW()),
	(269, 4, 33, "Shayestaganj", "শায়েস্তাগঞ্জ", NOW()),
	(270, 4, 34, "Barlekha", "বড়লেখা", NOW()),
	(271, 4, 34, "Juri", "জুরি", NOW()),
	(272, 4, 34, "Kamalganj", "কমলগঞ্জ", NOW()),
	(273, 4, 34, "Kulaura", "কুলাউড়া", NOW()),
	(274, 4, 34, "Moulvibazar Sadar", "মৌলভীবাজার সদর", NOW()),
	(275, 4, 34, "Rajnagar", "রাজনগর", NOW()),
	(276, 4, 34, "Sreemangal", "শ্রীমঙ্গল", NOW()),
	(277, 4, 35, "Bishwamvarpur", "বিশ্বম্বরপুর", NOW()),
	(278, 4, 35, "Chhatak", "ছাতক", NOW()),
	(279, 4, 35, "Shantiganj", "সুনামগঞ্জ", NOW()),
	(280, 4, 35, "Derai", "ডেরাই", NOW()),
	(281, 4, 35, "Dharamapasha", "ধরমপাশা", NOW()),
	(282, 4, 35, "Dowarabazar", "দোয়ারাবাজার", NOW()),
	(283, 4, 35, "Jagannathpur", "জগন্নাথপুর", NOW()),
	(284, 4, 35, "Jamalganj", "জামালগঞ্জ", NOW()),
	(285, 4, 35, "Sullah", "সুল্লা", NOW()),
	(286, 4, 35, "Sunamganj Sadar", "সুনামগঞ্জ সদর", NOW()),
	(287, 4, 35, "Tahirpur", "তাহিরপুর", NOW()),
	(288, 4, 35, "South Sunamganj", "দক্ষিণ সুনামগঞ্জ", NOW()),
	(289, 4, 36, "Balaganj", "বালাগঞ্জ", NOW()),
	(290, 4, 36, "Beanibazar", "বিয়ানীবাজার", NOW()),
	(291, 4, 36, "Bishwanath", "বিশ্বনাথ", NOW()),
	(292, 4, 36, "Companigonj", "কোম্পানীগঞ্জ", NOW()),
	(293, 4, 36, "Dakshin Surma", "দক্ষিণ সুরমা", NOW()),
	(294, 4, 36, "Fenchuganj", "ফেঞ্চুগঞ্জ", NOW()),
	(295, 4, 36, "Golapganj", "গোলাপগঞ্জ", NOW()),
	(296, 4, 36, "Gowainghat", "গোয়াইনঘাট", NOW()),
	(297, 4, 36, "Jaintiapur", "জৈন্তিয়াপুর", NOW()),
	(298, 4, 36, "Kanaighat", "কানাইঘাট", NOW()),
	(299, 4, 36, "Osmani Nagar", "ওসমানী নগর", NOW()),
	(300, 4, 36, "Sylhet Sadar", "সিলেট সদর", NOW()),
	(301, 4, 36, "Zakiganj", "জকিগঞ্জ", NOW()),
	(302, 5, 37, "Baksiganj", "বকশিগঞ্জ", NOW()),
	(303, 5, 37, "Dewanganj", "দেওয়ানগঞ্জ", NOW()),
	(304, 5, 37, "Islampur", "ইসলামপুর", NOW()),
	(305, 5, 37, "Jamalpur Sadar", "জামালপুর সদর", NOW()),
	(306, 5, 37, "Madarganj", "মাদারগঞ্জ", NOW()),
	(307, 5, 37, "Melandaha", "মেলান্দহ", NOW()),
	(308, 5, 37, "Sarishabari", "সরিষাবাড়ী", NOW()),
	(309, 5, 38, "Trishal", "ত্রিশাল", NOW()),
	(310, 5, 38, "Dhobaura", "ধোবাউড়া", NOW()),
	(311, 5, 38, "Fulbaria", "ফুলবাড়িয়া", NOW()),
	(312, 5, 38, "Gafargaon", "গাফফারগাঁও", NOW()),
	(313, 5, 38, "Gauripur", "গৌরীপুর", NOW()),
	(314, 5, 38, "Haluaghat", "ময়মনসিংহ", NOW()),
	(315, 5, 38, "Ishwarganj", "ঈশ্বরগঞ্জ", NOW()),
	(316, 5, 38, "Mymensingh Sadar", "ময়মনসিংহ সদর", NOW()),
	(317, 5, 38, "Muktagachha", "মুক্তাগাছা", NOW()),
	(318, 5, 38, "Nandail", "নান্দাইল", NOW()),
	(319, 5, 38, "Phulpur", "ফুলপুর", NOW()),
	(320, 5, 38, "Bhaluka", "ভালুকা", NOW()),
	(321, 5, 38, "Tara Khanda", "তারা খান্দা", NOW()),
	(322, 5, 39, "Atpara", "আটপাড়া", NOW()),
	(323, 5, 39, "Barhatta", "বারহাট্টা", NOW()),
	(324, 5, 39, "Durgapur", "দুর্গাপুর", NOW()),
	(325, 5, 39, "Khaliajuri", "খালিয়াজুরি", NOW()),
	(326, 5, 39, "Kalmakanda", "কলমাকান্দা", NOW()),
	(327, 5, 39, "Kendua", "কেন্দুয়া", NOW()),
	(328, 5, 39, "Madan", "মদন", NOW()),
	(329, 5, 39, "Mohanganj", "মোহনগঞ্জ", NOW()),
	(330, 5, 39, "Netrokona Sadar", "নেত্রকোণা সদর", NOW()),
	(331, 5, 39, "Purbadhala", "পূর্বধলা", NOW()),
	(332, 5, 40, "Jhenaigati", "ঝিনাইগাতী", NOW()),
	(333, 5, 40, "Nakla", "নকলা", NOW()),
	(334, 5, 40, "Nalitabari", "নালিতাবাড়ি", NOW()),
	(335, 5, 40, "Sherpur Sadar", "শেরপুর সদর", NOW()),
	(336, 5, 40, "Sreebardi", "শ্রীবর্দি", NOW()),
	(337, 6, 41, "Amtali", "আমতলী", NOW()),
	(338, 6, 41, "Bamna", "বামনা", NOW()),
	(339, 6, 41, "Barguna Sadar", "বরগুনা সদর", NOW()),
	(340, 6, 41, "Betagi", "বেতাগী", NOW()),
	(341, 6, 41, "Patharghata", "পাথরঘাটা", NOW()),
	(342, 6, 41, "Taltali", "তালতলী", NOW()),
	(343, 6, 42, "Agailjhara", "আগাইলঝাড়া", NOW()),
	(344, 6, 42, "Babuganj", "বাবুগঞ্জ", NOW()),
	(345, 6, 42, "Bakerganj", "বাকেরগঞ্জ", NOW()),
	(346, 6, 42, "Banaripara", "বানারীপাড়া", NOW()),
	(347, 6, 42, "Gaurnadi", "গৌরনদী", NOW()),
	(348, 6, 42, "Hizla", "হিজলা", NOW()),
	(349, 6, 42, "Barisal Sadar", "বরিশাল সদর", NOW()),
	(350, 6, 42, "Mehendiganj", "মেহেন্দিগঞ্জ", NOW()),
	(351, 6, 42, "Muladi", "মুলাদী", NOW()),
	(352, 6, 42, "Wazirpur", "উজিরপুর", NOW()),
	(353, 6, 43, "Bhola Sadar", "ভোলা সদর", NOW()),
	(354, 6, 43, "Burhanuddin", "বুরহানউদ্দিন", NOW()),
	(355, 6, 43, "Char Fasson", "চর ফ্যাসন", NOW()),
	(356, 6, 43, "Daulatkhan", "দৌলতখান", NOW()),
	(357, 6, 43, "Lalmohan", "লালমোহন", NOW()),
	(358, 6, 43, "Manpura", "মনপুরা", NOW()),
	(359, 6, 43, "Tazumuddin", "তজুমদ্দিন", NOW()),
	(360, 6, 44, "Jhalokati Sadar", "ঝালকাঠি সদর", NOW()),
	(361, 6, 44, "Kathalia", "কাঠালিয়া", NOW()),
	(362, 6, 44, "Nalchity", "নলচিটি", NOW()),
	(363, 6, 44, "Rajapur", "রাজাপুর", NOW()),
	(364, 6, 45, "Bauphal", "বাউফল", NOW()),
	(365, 6, 45, "Dashmina", "দশমিনা", NOW()),
	(366, 6, 45, "Galachipa", "গলাচিপা", NOW()),
	(367, 6, 45, "Kalapara", "কলাপাড়া", NOW()),
	(368, 6, 45, "Mirzaganj", "মির্জাগঞ্জ", NOW()),
	(369, 6, 45, "Patuakhali Sadar", "পটুয়াখালী সদর", NOW()),
	(370, 6, 45, "Rangabali", "রাঙ্গাবালি", NOW()),
	(371, 6, 45, "Dumki", "দুমকি", NOW()),
	(372, 6, 46, "Bhandaria", "ভান্ডারিয়া", NOW()),
	(373, 6, 46, "Kawkhali", "কাউখালী", NOW()),
	(374, 6, 46, "Mathbaria", "মঠবাড়িয়া", NOW()),
	(375, 6, 46, "Nazirpur", "নাজিরপুর", NOW()),
	(376, 6, 46, "Pirojpur Sadar", "পিরোজপুর সদর", NOW()),
	(377, 6, 46, "Nesarabad (Swarupkati)", "নেসারাবাদ (স্বরূপকাটি)", NOW()),
	(378, 6, 46, "Indurkani", "জিয়ানগোর", NOW()),
	(379, 7, 47, "Birampur", "বিরামপুর", NOW()),
	(380, 7, 47, "Birganj", "বীরগঞ্জ", NOW()),
	(381, 7, 47, "Biral", "বিরল", NOW()),
	(382, 7, 47, "Bochaganj", "বোচাগঞ্জ", NOW()),
	(383, 7, 47, "Chirirbandar", "চিরিরবন্দর", NOW()),
	(384, 7, 47, "Phulbari", "ফুলবাড়ি", NOW()),
	(385, 7, 47, "Ghoraghat", "ঘোড়াঘাট", NOW()),
	(386, 7, 47, "Hakimpur", "হাকিমপুর", NOW()),
	(387, 7, 47, "Kaharole", "কাহারোল", NOW()),
	(388, 7, 47, "Khansama", "খানসামা", NOW()),
	(389, 7, 47, "Dinajpur Sadar", "দিনাজপুর সদর", NOW()),
	(390, 7, 47, "Nawabganj", "নবাবগঞ্জ", NOW()),
	(391, 7, 47, "Parbatipur", "পার্বতীপুর", NOW()),
	(392, 7, 48, "Phulchhari", "ফুলছড়ি", NOW()),
	(393, 7, 48, "Gaibandha Sadar", "গাইবান্ধা সদর", NOW()),
	(394, 7, 48, "Gobindaganj", "গোবিন্দগঞ্জ", NOW()),
	(395, 7, 48, "Palashbari", "পলাশবাড়ি", NOW()),
	(396, 7, 48, "Sadullapur", "সাদুল্লাপুর", NOW()),
	(397, 7, 48, "Sughatta", "সুঘট্টা", NOW()),
	(398, 7, 48, "Sundarganj", "সুন্দরগঞ্জ", NOW()),
	(399, 7, 49, "Bhurungamari", "ভুরুঙ্গামারী", NOW()),
	(400, 7, 49, "Char Rajibpur", "চর রাজিবপুর", NOW()),
	(401, 7, 49, "Chilmari", "চিলমারী", NOW()),
	(402, 7, 49, "Phulbari", "ফুলবাড়ি", NOW()),
	(403, 7, 49, "Kurigram Sadar", "কুড়িগ্রাম সদর", NOW()),
	(404, 7, 49, "Nageshwari", "নাগেশ্বরী", NOW()),
	(405, 7, 49, "Rajarhat", "রাজারহাট", NOW()),
	(406, 7, 49, "Raomari", "রাওমারী", NOW()),
	(407, 7, 49, "Ulipur", "উলিপুর", NOW()),
	(408, 7, 50, "Aditmari", "আদিতমারী", NOW()),
	(409, 7, 50, "Hatibandha", "হাতীবান্ধা", NOW()),
	(410, 7, 50, "Kaliganj", "কালীগঞ্জ", NOW()),
	(411, 7, 50, "Lalmonirhat Sadar", "লালমনিরহাট সদর", NOW()),
	(412, 7, 50, "Patgram", "পাটগ্রাম", NOW()),
	(413, 7, 51, "Dimla", "ডিমলা", NOW()),
	(414, 7, 51, "Domar", "ডোমার", NOW()),
	(415, 7, 51, "Jaldhaka", "জলঢাকা", NOW()),
	(416, 7, 51, "Kishoreganj", "কিশোরগঞ্জ", NOW()),
	(417, 7, 51, "Nilphamari Sadar", "নীলফামারী সদর", NOW()),
	(418, 7, 51, "Saidpur", "সৈয়দপুর", NOW()),
	(419, 7, 52, "Atwari", "আটোয়ারী", NOW()),
	(420, 7, 52, "Boda", "বোদা", NOW()),
	(421, 7, 52, "Debiganj", "দেবীগঞ্জ", NOW()),
	(422, 7, 52, "Panchagarh Sadar", "পঞ্চগড় সদর", NOW()),
	(423, 7, 52, "Tetulia", "তেতুলিয়া", NOW()),
	(424, 7, 53, "Badarganj", "বদরগঞ্জ", NOW()),
	(425, 7, 53, "Gangachhara", "গঙ্গাছড়া", NOW()),
	(426, 7, 53, "Kaunia", "কাউনিয়া", NOW()),
	(427, 7, 53, "Rangpur Sadar", "রংপুর সদর", NOW()),
	(428, 7, 53, "Mithapukur", "মিঠাপুকুর", NOW()),
	(429, 7, 53, "Pirgachha", "পীরগাছা", NOW()),
	(430, 7, 53, "Pirganj", "পীরগঞ্জ", NOW()),
	(431, 7, 53, "Taraganj", "তারাগঞ্জ", NOW()),
	(432, 7, 54, "Baliadangi", "বালিয়াডাঙ্গী", NOW()),
	(433, 7, 54, "Haripur", "হরিপুর", NOW()),
	(434, 7, 54, "Pirganj", "পীরগঞ্জ", NOW()),
	(435, 7, 54, "Ranisankail", "রানিসংকাইল", NOW()),
	(436, 7, 54, "Thakurgaon Sadar", "ঠাকুরগাঁও সদর", NOW());


INSERT INTO `app_upazilas`
	(`id`, `division_id`, `district_id`, `title_en`, `title_bn`, `created_at`)
VALUES
	(437, 8, 55, "Bagerhat Sadar", "বাগেরহাট সদর", NOW()),
	(438, 8, 55, "Chitalmari", "চিতলমারী", NOW()),
	(439, 8, 55, "Fakirhat", "ফকিরহাট", NOW()),
	(440, 8, 55, "Kachua", "কচুয়া", NOW()),
	(441, 8, 55, "Mollahat", "মোল্লাহাট", NOW()),
	(442, 8, 55, "Mongla", "মংলা", NOW()),
	(443, 8, 55, "Morrelganj", "মোড়েলগঞ্জ", NOW()),
	(444, 8, 55, "Rampal", "রামপাল", NOW()),
	(445, 8, 55, "Sarankhola", "সারানখোলা", NOW()),
	(446, 8, 56, "Alamdanga", "আলমডাঙ্গা", NOW()),
	(447, 8, 56, "Chuadanga Sadar", "চুয়াডাঙ্গা সদর", NOW()),
	(448, 8, 56, "Damurhuda", "দামুড়হুদা", NOW()),
	(449, 8, 56, "Jibannagar", "জীবননগর", NOW()),	
	(450, 8, 57, "Abhaynagar", "অভয়নগর", NOW()),
	(451, 8, 57, "Bagherpara", "বাঘেরপাড়া", NOW()),
	(452, 8, 57, "Chaugachha", "চৌগাছা", NOW()),
	(453, 8, 57, "Jhikargachha", "ঝিকরগাছা", NOW()),
	(454, 8, 57, "Keshabpur", "কেশবপুর", NOW()),
	(455, 8, 57, "Jessore Sadar", "যশোর সদর", NOW()),
	(456, 8, 57, "Manirampur", "মণিরামপুর", NOW()),
	(457, 8, 57, "Sharsha", "শার্শা", NOW()),
	(458, 8, 58, "Harinakunda", "হরিনাকুন্ড", NOW()),
	(459, 8, 58, "Jhenaidah Sadar", "ঝিনাইদহ সদর", NOW()),
	(460, 8, 58, "Kaliganj", "কালীগঞ্জ", NOW()),
	(461, 8, 58, "Kotchandpur", "কোটচাঁদপুর", NOW()),
	(462, 8, 58, "Maheshpur", "মহেশপুর", NOW()),
	(463, 8, 58, "Shailkupa", "শৈলকুপা", NOW()),
	(464, 8, 59, "Batiaghata", "বটিয়াঘাটা", NOW()),
	(465, 8, 59, "Dacope", "ডাকোপ", NOW()),
	(466, 8, 59, "Dumuria", "ডুমুরিয়া", NOW()),
	(467, 8, 59, "Dighalia", "দিঘলিয়া", NOW()),
	(468, 8, 59, "Koyra", "কয়রা", NOW()),
	(469, 8, 59, "Paikgachha", "পাইকগাছা", NOW()),
	(470, 8, 59, "Phultala", "ফুলতলা", NOW()),
	(471, 8, 59, "Rupsha", "রূপশা", NOW()),
	(472, 8, 59, "Terokhada", "তেরোখাদা", NOW()),	
	(473, 8, 60, "Bheramara", "ভেড়ামারা", NOW()),
	(474, 8, 60, "Daulatpur", "দৌলতপুর", NOW()),
	(475, 8, 60, "Khoksa", "খোকসা", NOW()),
	(476, 8, 60, "Kumarkhali", "কুমারখালী", NOW()),
	(477, 8, 60, "Kushtia Sadar", "কুষ্টিয়া সদর", NOW()),
	(478, 8, 60, "Mirpur", "মিরপুর", NOW()),	
	(479, 8, 61, "Magura Sadar", "মাগুরা সদর", NOW()),
	(480, 8, 61, "Mohammadpur", "মোহাম্মদপুর", NOW()),
	(481, 8, 61, "Shalikha", "শালিখা", NOW()),
	(482, 8, 61, "Sreepur", "শ্রীপুর", NOW()),
	(483, 8, 62, "Gangni", "গাংনী", NOW()),
	(484, 8, 62, "Meherpur Sadar", "মেহেরপুর সদর", NOW()),
	(485, 8, 62, "Mujibnagar", "মুজিবনগর", NOW()),
	(486, 8, 63, "Kalia", "কালিয়া", NOW()),
	(487, 8, 63, "Lohagara", "লোহাগাড়া", NOW()),
	(488, 8, 63, "Narail Sadar", "নড়াইল সদর", NOW()),
	(489, 8, 63, "Naragati", "নারাগতি", NOW()),	
	(490, 8, 64, "Assasuni", "আসাসুনি", NOW()),
	(491, 8, 64, "Debhata", "দেবহাটা", NOW()),
	(492, 8, 64, "Kalaroa", "কলারোয়া", NOW()),
	(493, 8, 64, "Kaliganj", "কালীগঞ্জ", NOW()),
	(494, 8, 64, "Satkhira Sadar", "সাতক্ষীরা সদর", NOW()),
	(495, 8, 64, "Shyamnagar", "শ্যামনগর", NOW()),
	(496, 8, 64, "Tala", "তালা", NOW());