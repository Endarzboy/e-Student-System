-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 17, 2018 at 06:34 PM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `oasesfinalprojectdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `UserID` varchar(44) NOT NULL,
  `DeptID` varchar(44) NOT NULL,
  `CollegeID` varchar(44) NOT NULL,
  `EmailAddress` varchar(44) NOT NULL,
  `UserName` varchar(44) NOT NULL,
  `Password` varchar(44) NOT NULL,
  `Role` varchar(44) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`UserID`, `DeptID`, `CollegeID`, `EmailAddress`, `UserName`, `Password`, `Role`) VALUES
('au001', 'd1001', 'Coll111', 'maregu200@gmail.com', 'mara', 'mara', 'admin'),
('deanu005', 'd1002', 'Coll111', 'maregu2006@gmail.com', 'girum', 'girum', 'dean'),
('deanu1256', 'd1003', 'Coll122', 'maregu2006@gmail.com', 'yoni', 'yoni', 'dean'),
('deanu188', 'd1005', 'Coll212', 'maregu2006@gmail.com', 'asma', 'asme', 'dean'),
('instu011', 'd1001', 'Coll111', 'john@cs.com', 'jo', 'jo', 'instructor'),
('instu012', 'd1001', 'Coll111', 'amare@cs.com', 'amare', 'amare', 'department'),
('instu013', 'd1001', 'Coll111', 'tnbit@cs.com', 'tnbit', 'tnbit', 'instructor'),
('instu014', 'd1001', 'Coll111', 'fikir@cs.cin', 'fkr', 'fkr', 'instructor'),
('instu111', 'd1002', 'Coll111', 'instructor123@yahoo.com', 'abe', 'abe', 'instructor'),
('instu112', 'd1002', 'Coll111', 'maregu2008@gmail.com', 'yeshi', 'yeshi', 'department'),
('instu113', 'd1002', 'Coll111', 'alex@it.com', 'alex', 'alex', 'instructor'),
('instu114', 'd1002', 'Coll111', 'kebe@it.com', 'kebe', 'kebe', 'instructor'),
('instu115', 'd1002', 'Coll111', 'maregu2008@gmail.com', 'selu', 'mar', 'instructor'),
('instu211', 'd1003', 'Coll122', 'lema@ee.com', 'lema', 'lema', 'instructor'),
('instu212', 'd1003', 'Coll122', 'seifu@ee.com', 'seifu', 'seifu', 'department'),
('instu213', 'd1003', 'Coll122', 'zeresenay@ee.com', 'zedo', 'zedo', 'instructor'),
('instu214', 'd1003', 'Coll122', 'kinfe@ee.com', 'knfe', 'knfe', 'instructor'),
('instu311', 'd1004', 'Coll122', 'haben@ce.com', 'hab', 'hab', 'instructor'),
('instu312', 'd1004', 'Coll122', 'dagi@ce.com', 'dagi', 'dagi', 'instructor'),
('instu313', 'd1004', 'Coll122', 'fitsum@ce.com', 'fitse', 'fitse', 'instructor'),
('instu314', 'd1004', 'Coll122', 'mengie@ce.com', 'mengie', 'mengie', 'department'),
('instu411', 'd1005', 'Coll212', 'destaw@as.com', 'destsh', 'destsh', 'instructor'),
('instu412', 'd1005', 'Coll212', 'asrie@as.com', 'asrat', 'asrat', 'department'),
('instu413', 'd1005', 'Coll212', 'wube@as.com', 'wub', 'wub', 'instructor'),
('instu414', 'd1005', 'Coll212', 'bel@as.com', 'bel', 'bel', 'instructor'),
('stu1001', 'd1001', 'Coll111', 'fikir@cs.cin', 'stud12', 'stud12', 'student'),
('stu1002', 'd1001', 'Coll111', 'zeresenay@ee.com', 'stud13', 'stud13', 'student'),
('stu1003', 'd1001', 'Coll111', 'fikir@cs.cin', 'stud14', 'stud14', 'student'),
('stu1004', 'd1001', 'Coll111', 'zeresenay@ee.com', 'stud15', 'stud15', 'student'),
('stu1005', 'd1002', 'Coll111', 'zeresenay@ee.com', 'baye', 'baye', 'student'),
('stu1006', 'd1002', 'Coll111', 'alex@it.com', 'stud21', 'stud21', 'student'),
('stu1007', 'd1002', 'Coll111', 'lema@ee.com', 'stud2', 'stud2', 'student'),
('stu1008', 'd1002', 'Coll111', 'alex@it.com', 'stud23', 'stud23', 'student'),
('stu1009', 'd1003', 'Coll122', 'zeresenay@ee.com', 'stud33', 'stud33', 'student'),
('stu1010', 'd1003', 'Coll122', 'fikir@cs.cin', 'stud32', 'stud32', 'student'),
('stu1011', 'd1003', 'Coll122', 'zeresenay@ee.com', 'stud31', 'stud31', 'student'),
('stu1012', 'd1003', 'Coll122', 'alex@it.com', 'stud3', 'stud3', 'student'),
('stu1013', 'd1004', 'Coll122', 'lema@ee.com', 'abc', 'abc', 'student'),
('stu1014', 'd1004', 'Coll122', 'alex@it.com', 'stud1', 'stud1', 'student'),
('stu1015', 'd1004', 'Coll122', 'zeresenay@ee.com', 'stud2', 'stud2', 'student'),
('stu1016', 'd1004', 'Coll122', 'dept4@stud.com', 'fkr1', 'fkr', 'student'),
('stu1017', 'd1005', 'Coll212', 'stud@dp.05.com', 'kali', 'kal', 'student'),
('stu1018', 'd1005', 'Coll212', 'lema@ee.com', 'stud5', 'stud5', 'student'),
('stu1019', 'd1005', 'Coll212', 'zeresenay@ee.com', 'stud51', 'stud51', 'student'),
('stu1020', 'd1005', 'Coll212', 'zeresenay@ee.com', 'stud53', 'stud53', 'student'),
('stu1243', 'd1001', 'Coll111', 'zeresenay@ee.com', 'stud1', 'stud11', 'student');

-- --------------------------------------------------------

--
-- Table structure for table `answertbl`
--

CREATE TABLE `answertbl` (
  `AnswerID` int(11) NOT NULL,
  `QuestionID` varchar(44) NOT NULL,
  `ExamID` varchar(44) NOT NULL,
  `StudentID` varchar(44) NOT NULL,
  `CourseID` varchar(44) NOT NULL,
  `DeptID` varchar(44) NOT NULL,
  `AnswerSelected` varchar(44) NOT NULL,
  `ExamDate` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `assignmentresult`
--

CREATE TABLE `assignmentresult` (
  `AssignResultID` varchar(55) NOT NULL,
  `StudentID` varchar(44) NOT NULL,
  `CourseID` varchar(44) NOT NULL,
  `DeptID` varchar(44) NOT NULL,
  `StreamID` varchar(44) NOT NULL,
  `InstructorID` varchar(44) NOT NULL,
  `AssignID` varchar(44) NOT NULL,
  `Score` double NOT NULL,
  `Mark` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `assignmenttopost`
--

CREATE TABLE `assignmenttopost` (
  `AssignID` varchar(44) NOT NULL,
  `Title` varchar(100) NOT NULL,
  `Description` text NOT NULL,
  `CourseID` varchar(44) NOT NULL,
  `DeptID` varchar(44) NOT NULL,
  `AssignmentFile` mediumblob NOT NULL,
  `FileName` varchar(44) NOT NULL,
  `FileSize` int(55) NOT NULL,
  `PostedDate` date NOT NULL,
  `DeadLine` date NOT NULL,
  `InstructorID` varchar(44) NOT NULL,
  `Batch` int(40) NOT NULL,
  `Semester` int(44) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `college`
--

CREATE TABLE `college` (
  `CollegeID` varchar(44) NOT NULL,
  `CollegeName` varchar(44) NOT NULL,
  `Description` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `college`
--

INSERT INTO `college` (`CollegeID`, `CollegeName`, `Description`) VALUES
('Coll111', 'Computing', 'Computing and Informatics'),
('Coll122', 'Engineering', 'Engineering and Technology'),
('Coll212', 'Agriculture', 'College of Dry Land and Agriculture'),
('Coll2321', 'Medicine', 'College of Health');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `CourseCode` varchar(44) NOT NULL,
  `Title` varchar(44) NOT NULL,
  `CreditHrs` int(44) NOT NULL,
  `PreReq` varchar(44) NOT NULL,
  `DeptID` varchar(44) NOT NULL,
  `CollegeID` varchar(44) NOT NULL,
  `StreamID` varchar(44) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `courseoffer`
--

CREATE TABLE `courseoffer` (
  `CourseID` varchar(44) NOT NULL,
  `DeptID` varchar(44) NOT NULL,
  `CollegeID` varchar(44) NOT NULL,
  `InstructorID` varchar(44) NOT NULL,
  `AcademicYear` int(55) NOT NULL,
  `Semester` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `coursetostudent`
--

CREATE TABLE `coursetostudent` (
  `CourseID` varchar(44) NOT NULL,
  `DeptID` varchar(44) NOT NULL,
  `CollegeID` varchar(44) NOT NULL,
  `StudentID` varchar(44) NOT NULL,
  `AcademicYear` int(22) NOT NULL,
  `Semester` int(22) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `DeptID` varchar(44) NOT NULL,
  `DeptName` varchar(44) NOT NULL,
  `CollegeID` varchar(44) NOT NULL,
  `Description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `exam`
--

CREATE TABLE `exam` (
  `ExamID` varchar(44) NOT NULL,
  `ExamTitle` varchar(44) NOT NULL,
  `CourseID` varchar(44) NOT NULL,
  `DeptID` varchar(44) NOT NULL,
  `StreamID` varchar(44) NOT NULL,
  `StartTime` datetime NOT NULL,
  `EndTime` datetime NOT NULL,
  `InstructorID` varchar(44) NOT NULL,
  `ScheduleID` varchar(44) NOT NULL,
  `Mark` int(44) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exam`
--

INSERT INTO `exam` (`ExamID`, `ExamTitle`, `CourseID`, `DeptID`, `StreamID`, `StartTime`, `EndTime`, `InstructorID`, `ScheduleID`, `Mark`) VALUES
('Final-Exam101', 'AI Final Examination', 'ai2004', 'd1002', 'st1002', '2018-03-17 14:00:00', '2018-03-17 15:00:00', 'instu115', 'Es002', 50),
('MidExam1001', 'AI Mid-Term Exam', 'ai2004', 'd1002', 'st1002', '2018-03-18 17:00:00', '2018-03-18 17:50:00', 'instu115', 'Es001', 30),
('Quiz11', 'Livestock Quiz', 'liv3001', 'd1005', 'st1005', '2018-03-18 00:00:00', '2018-03-13 00:00:00', 'instu412', 'ESAS0121', 30);

-- --------------------------------------------------------

--
-- Table structure for table `examresult`
--

CREATE TABLE `examresult` (
  `ExamResultID` varchar(44) NOT NULL,
  `StudentID` varchar(44) NOT NULL,
  `CourseID` varchar(44) NOT NULL,
  `DeptID` varchar(44) NOT NULL,
  `ExamID` varchar(44) NOT NULL,
  `ScoreObtained` double NOT NULL,
  `DateOfExam` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `examresult`
--

INSERT INTO `examresult` (`ExamResultID`, `StudentID`, `CourseID`, `DeptID`, `ExamID`, `ScoreObtained`, `DateOfExam`) VALUES
('ERes-3fe4a5ce2d5fcf85', 'stu1007', 'ai2004', 'd1002', 'MidExam1001', 18, '2018-03-18');

-- --------------------------------------------------------

--
-- Table structure for table `examschedule`
--

CREATE TABLE `examschedule` (
  `ScheduleID` varchar(44) NOT NULL,
  `CourseID` varchar(44) NOT NULL,
  `DeptID` varchar(44) NOT NULL,
  `DateOfExam` date NOT NULL,
  `ExamNotice` text NOT NULL,
  `ExamTime` varchar(33) NOT NULL,
  `Invigilator` varchar(55) NOT NULL,
  `Batch` int(44) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `examschedule`
--

INSERT INTO `examschedule` (`ScheduleID`, `CourseID`, `DeptID`, `DateOfExam`, `ExamNotice`, `ExamTime`, `Invigilator`, `Batch`) VALUES
('Es001', 'sad5001', 'd1002', '2018-02-11', 'This is the first exam schedule set by Department of Information Technology for the course Artificial Intelligence.', '8:00 AM, LT', 'Abebe Kebede', 3),
('Es002', 'net2012', 'd1002', '2018-03-23', 'This is the first exam schedule set by Department of Information Technology for the course Computer Graphics.', '2:00 AM, LT', 'Hilinaye Assefa', 4),
('Es003', 'net2012', 'd1002', '2018-03-15', 'This is the first exam schedule set by Department of Information Technology for the course Networking.', '2:00 AM, LT', 'Selamye Yemane', 4),
('Es004', 'res2012', 'd1002', '2018-03-07', 'This is the first exam schedule set by Department of Information Technology for the course Research Method.', '4:30 AM, LT', 'Fikir Assefa', 3),
('Es005', 'sad5001', 'd1002', '2018-02-23', 'This is the first exam schedule set by Department of Information Technology for the course System Analysis and Design.', '10:00 AM, LT', 'Mieraf Assefa', 2),
('Es11', 'dp1004', 'd1001', '2018-02-28', 'This is the first exam schedule set by Department of Information Technology for the course Advanced Database', '2:00 AM, LT', 'Mastewal Arega', 1),
('ESAS0121', 'liv3001', 'd1005', '2018-02-24', 'On the day mentioned above you animal science department students of 4th year,have a final exam.', '8:00 AM, LT', 'Selamye Yemane', 4),
('ESAS11', 'afed1031', 'd1005', '2018-03-01', 'This is to notify that you will have mid-term exam on the day above. for the course Animal Nutrition', '10:00 AM, LT', 'Adisu Abebe', 3),
('Esce112', 'con1004', 'd1004', '2018-02-25', 'This is the final exam of the course Construction', '8:00 AM, LT', 'Asmare Kelela', 3),
('ESce999', 'str1001', 'd1004', '2018-03-01', 'This is to announce that on the day specified above there is a final exam for the course Structural design', '2:00 AM, LT', 'Mastewal Arega', 6),
('ESEE01', 'cir1002', 'd1003', '2018-02-24', 'This is the first exam of the course Circuit Design.', '10:00 AM, LT', 'Mieraf Assefa', 1),
('ESEE11', 'com1003', 'd1003', '2018-02-25', 'on the above specified day you will have final exam of your course Communication', '4:30 AM, LT', 'Asmare Kelela', 2);

-- --------------------------------------------------------

--
-- Table structure for table `handout`
--

CREATE TABLE `handout` (
  `HandoutID` varchar(44) NOT NULL,
  `CourseID` varchar(44) NOT NULL,
  `HandoutFile` mediumblob NOT NULL,
  `FileName` varchar(44) NOT NULL,
  `FileSize` int(55) NOT NULL,
  `StreamID` varchar(44) NOT NULL,
  `DeptID` varchar(44) NOT NULL,
  `InstructorID` varchar(44) NOT NULL,
  `Batch` int(11) NOT NULL,
  `Semester` int(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `handout`
--

INSERT INTO `handout` (`HandoutID`, `CourseID`, `HandoutFile`, `FileName`, `FileSize`, `StreamID`, `DeptID`, `InstructorID`, `Batch`, `Semester`) VALUES
('ho3fd90deecd6a89fe', 'ai2004', 0x89504e470d0a1a0a0000000d494844520000026b000001170806000000f24403c3000000017352474200aece1ce90000000467414d410000b18f0bfc6105000000097048597300000ec300000ec301c76fa864000048cd49444154785eed9d5b8c5dd779dff514240dd0c67da981bc184612f8a1400328488ce4c570f920dbb293a75a8f7e6a0c041c1870224a9e181908ac651a62d51989a244c9238754caaa96cb996a2499b218d7542d593495a14cd96214220a2dd3246d51977132863a1056d7b76efb5bdfbaec7d2e33b3cf39ff1fb030b3cf5ed76f7d6badff59fb726e500000000000a0b740ac0100000000f418883500000000801e03b10600000000d06320d600000000007a0cc41a00000000408f81580300000000e831106b00000000003d06620d00000000a0c740ac0100000000f418883500000000801e03b10600000000d06320d600000000007a0cc41a00000000408f81580300000000e831106b00000000003d06620d00000000a0c740ac0100000000f418883500000000801e03b10600000000d06320d600000000007a0cc41a00000000408f81580300000000e831106b00000000003d06620d00000000a0c740ac0100000000f418883500000000801e03b10600000000d06320d600000000007a0cc41a00000000408f81580300000000e831106b00000000003d6600b1765e1ddbb74fedd3e1d8cbee2390f2f23163a37dfb8e698bf59919e8cf89e90bc6cf4ea9831352e76bcf1cb4f6bdeb94bae63e9b1d9af1b3ef11eaa96bead45dee7826ed31246faeab95c307d4fcedce76f30beaf80f7e1a6c79f099ddb664d3afbb5f972e4cc7bc7efe91bccd879d7342ba7d07d5a99fe90fc2da30397682581b928dd7cfa8c71e399d3accac8bb58dcbeaccd78fa9d33420768a5299106b0ddbd02f106b76fc40ac0dc9bb17d4f13b9ccd42d8afd62ef5492041ac0dcd08730ec45a0ac4da30fce8b8ede89cc3ccb458d393aff986ec06c48e50291362cdb13dfd32ecc4391d40ac8d4c189f07d5cac50df7a1e63d88b5e1e9cb3a3dda9c03b19602b1360cbea331290bbc8feca458ab9409b1e6d89e7e996db176513db64036dda716be71d17cb27ed41eef5b3ca5ae9b4f40153f3ebf72b2c7fe336962ad2f8c36e78c5bac6d7cf7904db7ef907a8ebe175c3da90e98e37deaf88f6c9cbe03b1360c106b0520d64606626d42d850cf1d269bee5387be6b77852e3dbedfdae3d10be618b43011f328c4da70f44baca9571f530b946ee131fd354bf3ee19b56ceab7a84ebd6162f49eb188b56040ba1cf0de86baf8ec31b578c7bcfdecf67975e0f09abae077b9dbce33e27cafabf51387d4812fda3ad08da80797d7d4f937b65cec3c1b174fabe3870faa8579974e97b7ff9e63ead4cbd75536259f40362ea895ffeaeaa9cb5bfcc649f530fd9f04e690058190b5d17e97f7be79b570d721b5f262a14e844e73f9851575e8cb2c8d6ec76973f9c0f7cd200b7ca13fa309744b5d7f519779d7829a7771e7f72faa63cf5e541befb9f80e3fb864482638d3f6e3519efbbeb85f2d3e72aab52f25ad65467dd1bd2d115bd7d5f967785fe97477e874cf9c57d707ab2e43d685f565ab58d3695f3ea58eddb3bff16953a783ead0a3a715bf9a4474ee17dfce2fb17e717e79bc60a368e2a47e7d66391a9fed7d3a585b02baae34171c8cfaa4830ff93114f9de0175e8c41975b95456858bdf583079f86fe65bdf5f36c7a5457de0b9c843f7fe88f6dab4cb6aad32675079916d290dcd332f5caefafcd61be7d5a94716d57edf97ce3fabf5f4731af71f3dae0f1e5e51675e8f8d1bfc2613aced4a022916005b6fd0c309cc9e661ea9f80d31b09f77abcbe66b64eb264f9a5b1e2bd9b9bac65cd05f0318e4eb4f2c8bf9478f8fa2cf96d769c3286320371766e6d0ce73cec645759afb99a9c7ba99573b89b541e69c8de7d4218a1376bd2fa9b52f51ba717e29de5ec62bd68e9e54a7166d9c24dca18db2a11dff1e36e1c8f39b2e4347946f29ddedfbd5f1974542428bbb3347dd37dd42d87ff48cba2e07931f485f39a40e899b5f17be7e32d8200e0388b55a5b7438f0c425978241f77014d3ccabc5bff5f51ac4f1dac4da8a3af568d97e0bcbebd1a4d26980be79461ddb9f8f6782eecb63dfef7e01a9bb583ba28e0dd096c0d5e7d491e4066816ee585667de74713bb3a9eb6d17f9342c6811b852166b553f70e176fd4df1aa8bafe9d42f574fa9452696b2414f72d7c458093efd9563ea5869dc17c7e7e06d31bcbdae966b7d4236cc95b779413df6955c7c1774596baf65d255b09756d837f34b6b6abfce2b5924879d8b349b2f1f57fbfd939285b0a0bf00ca9a5f7ae240366e0899fe24ae7df788dd81288485af65eaf99e5ef86ab6d56191f95bf09b4cb07ed92e90569ea9d8458fcbf5b75d12ce507e3e5a5de6efc9d8b9bac634bbb29bafadd5eb3b9ff3d98a581b650cb4d98ed9adf39c53ea3f9dd749774b416cf351e61c77db42d8f5de526796f5b1d994980cc62bd69ca18e3d7b496d1871bba5365ef58b8f76dc793d39df7e401d7ff1b2daa4f3ef6da96b2f2c87c9e1c013972951400eea038faeab6befda735b57d7d571ef7834a9475bad5beac2a37e41d46266f5bcba6c0ad4bc7b4d9d5f5d0cdf2a1674e7453a3c2cf036df35f7356debed4beab29f0082a0c97474485f106b262ca823cf5c54d77d5bdebea8d682e32daad362a2f1dfe0c9b6942ed8f692fe3617899f318a3517c8e6dc7667bee6edbaa01e4baef6341358dc1f1afee4979e64565e763ea0d9ba7a5ead84857b411dff51d4232d54ca4cda72465d7a9bb5252ca099b6f0fade7144adbd7c4d6d99c9684b6d5e66be77c763eaa29c8c2b5cfbdb4557a6f6cb27980f687f7eec2e2e5ed2be6cfc808d21626b535d7ef1b83ae027bfafadc73e5db3d17b7a12f3edfcca71b57e7933a4dddabcacd61f6d16fde517e35c639f9e5707bf5e1a9f87d473459f1ea42d5b6afd6beef3c53575f14d76e64d3d86bc0f2d3ca62ec805d78f2f2aef053f3fd974a78ef8baa4f51c9d11e6a2b79f53879c1d168e9c4ada1beabdef805ae353e7e535773fce825a7e41d8f6856341582c3e1b7f45d9fad1f130172f1c5953e7af7a23c57de2efd1f35cf6c290bebc08ff69c6583aaf95e7d13681e402f757b19670d16318dacf3bd645cf11a75eddb0796ed18e4f237a875a637ec6c4ccfe63eaf4a5eb61fe89e6fd64ed6bea15afd3238c814d9da7b7dd7e6aa7ab0bd9bce817953987cfadba6dc1679cddb8f02d8a3513069b73269db18b357fff06872bede5efa7ca3d9c5f3e133935cf37f7ed516de96f0aaed3a3c11926abf81b1de7da337ed114131d1b4872320b1427194d485f166b391ba9cd33ea883bbffc7d6685b74fab45f3f9823a762ef3ad870fa4318b3539291bf4b7e815b37dbc4fed7f5cee0296076898d0697291bb2504edb4f8c9e4cb6b2a96ed352a93026fcbd1f5d47f2a6d69ad2fb37bd14f24ef697f7537a51f7c3ae397b443f1657b3ee9cb77d7d5b29bc4726388d878d6f9f497d654dc9ab28db65eb497eef6ddae17da6cb61beaf43db65c6923eed3d9f6301b45e373e8b6f827cce8f50eee230edd874297fabe74509d64e7431b690c9576f99cef258bfca88c3017051fd4e3e152ee0b01f3273e675cf75f08c47ceaa17bebe8b231ede635d6b8dcf85e61d76d538f272b40b8f0ba1e6c17cd5b01badc34af16be44bbe6c2f6c579b483402a7c49bab4eac4a11803c3fb7987ba14e688ebcffa9bda855065f3527eee605f4a32579c0c7cde8fbed034f5e2f3fa286320f8e1c231b59e49bae92eff879bf70dbe1ee99c13c6766b7e75b136d09c33058c59ace981e0542ea739af3b2733c0c2793168c3e77a80ad67f2259a8e77370e6a42bae41b36a3b450878174409dcc2dd2447192d184f425b196b7918e919d1442ba64016e083618ab582b2c889a20aee9febb88d2006dda561d40afad98cb48b5b253ca93c2f06df1f733e4046943c96f8bf857be147d404faa61a2127d79e9a43aa817bc795a6c0a694bbe57b3d1a56f1e54fbe91e94c2c24e94fabb199fbabcc238cb8dcfe1dbd23c817970f5522abeb3b8cb1d9457a58da1bc4a5b8661f8b968d3ec4aedbf438bcfa20fe6e78cf0e4db82b66fd7cbf4ee126e7dece5ca6b1eb458d0f6cd5dca2de26d3e84582bdaa4300686f7f3f6bac82b420126a6a32fe8a18e8535e63d9db7fb3253fb22b8f9c211970f1f474dbd9a797d9431d0b4bf68736a27f9a9fe92b4f69afb2cd443ce398db82ffb7533ffc636d7b51976ce9902c62bd60a82a26d512b9d0f9f1f7e2e7f4f11111ec16d9c223c427f74dd7e50e0c2a32e1ecfbf30d8238a938ca6903eb4a5f8987a7e52086da93d61166c50a97342a13f59fd73c29a1858acbdb7de9475ce7d96c5ef9c14761fb3942605cdb06df137a3ea207d3dc23f6154115f9cb6716078e394db496defcbadcd0db5f1c62575e185536a6579513537e9cbb4151b256ca9cd8d0d75fdd20575e69915b5cc6e9a2e8ab5da02107c73b1fad455d7b684cba714e886e4a36beaf4ab97d566d1fe4ce089893f22f4f9205f14da19692e92bc67fbe6f2abebeaf413c7d8c346a26decf2295d2a5ab86759ad3cb3ae2ebdd15cfa9334af36a8fb5db03febf326ad0e7493f7f28a3a75ee92ba1eaebf1628cea3ed02a9388f14e6df94ae7ede569705f5d8abeea30ca1ff799e6d750c63a6b2614084b982d781d928cc5d238c81f79ab97bb0575c94e69c5cfd52fc7890f51de79c33698c57ac0d28c63ca5f3e1f3441430c2d373dec19ac17520b74dcac896db65b01727194d217d9b0d78bd1b072d4d148230c8da26284ea13f3bb47f60b116faa865f2e9dade88d2a4a019b62da1be5d431711c416e4da4413da93ab333d45baa61716da95f265e7824c5bb1119179e22c1b447f0f363e65d943b6e5bd6beab987f237ebcf7f999e746ceec5b1347ede355405fa408c381711f4c4dca387d441fff47c21c8f1b27961451dccdd10ee9f98f3f7a33942f95d4354cf4d75e1c4c146ecb0e09f9cf6f7154514e7d1d23cd0f465b18f6a637e283f6fab4b7dec87f9858ff9b679899d2f7dc9b4e4ec51ffac6b08698be3b78d827d82c0ac7f29f2fe28fd7ab43967b29922b1e685c08813648705be3cc9680ae9db6cc0ebdd386869a21040aca56512c3b625d4b76be836298c26d6e453a4741fd04175e8e871b5f2cc19b54ebb4b2f96da5bb15174cfa30e7a31a7d73b1c7b74459d7a615d5dbcbca9d60bfd3dd8f8e4658fd2160bdd8cbdfeccf168772984fdc7d97d3ebeeddd839cdf8667c4b9483e31f7c5fde6751dc71f5d53a7cf5d5097debcac4ed6c60bdd00feea69b516ed54fa404f91376942f95d436e1e7bf79abaf82c0970fe5a0c17e633f77515e7d1d23cd0f465b18f4a637e683f6fab4b7dec87f985efacb6cd4bec3cc49af08ca1e79cc96732c45aed124266cbb3eba587a1bef510c549465348df66031d233b29ece665d0525e038bb5f7ba5e066dea94bf593947a14c62d8b68409a54d5c0e46f081da1bdb0bc29bdf20bcfc827f3255506c6fc946fc46e6657546ecb6784afd1dda53139fe15ea8e6e6e3d1da92819e5634a2a4d9dd691e8e692eadd77d6f7b187e2ee237fcafa98bfe29e688c1bedc6cbde9046e7882bce993f050c2b87e4d400bc5eb97d6d5a9470f354ff7c94bbcbe8f933971dc626d143f6fab4b7d8ec8cedf6dbeddf5326810255cf8e46c34c218082f8fdd86cba095baf8cbed45b136e09c330d4c8658abdc9c1b6e2664f7cb7549c76ffe8c6e74ecb2481427194d217d9b0d748ceca410d2d51e30e878bf494ca13f3bb47f60b1c6da567dc0e082bf07acfead2ba654a666e8b634f778747ed2b30be11eb7cc6b0c3c853a877a56ee690a6fd04fda5bb251e303e57b049b9b7d8b62ad72236f6e7c0edd96d74faa457a30615e7f5618d717beee76ecc2386337c0efc2d36143cf456121aedc13c516d266ced850ebfffda07930412e7481f084391bfb5d7c33c7c6ba3a7e17bd783733fe1cc507a08af3e8b8c5da287ede5e97e21c51785ab7755eeaf8804163d7b6070c4619038d5d8a0f52b8fce7f7ef5787c26eadaf87f48b2e7529d97cf839671a980cb1a643f6b177b6b51d39d2585edd511848848f93738642fa361be81879076d7b75077f7f50adce0985feecd0fe76b1968aaded7f754746e08dd0964b27dca25f7a745e73ed69dda77439e5cb7a212e7ecd63b0becabe8a86db40d439d4f39ed37abacba017cd636e6148db5bb251e303a54561e345ffba061d4a624d87fceb689a3af1f139745bc2ae63f9951f41ac3121b8f1bc7b6aaee47b9acd73ba9de6b51f87d4e982e8188a61e7222ed6b26bda96bafccdc6fe7cce080f01945ef9c1e69446085e522b35df24b47fd265577aedc7816ff87787355f6c0e149eee0b8ba75c60fdf8dc41b136b89fb7d7a53447847e956f33689d97c6ffea8e51c640dbab3b682730fd62e1eb91cecb6173a15097e6153115b1a6c32073ce343031628d1c81bf10367e31a974e8f84594f4e2bce28b28e5c4d461816f5ec1d05c7a0d14d2b7d940c7287e9b685e201abf7038b241a6cc3a85feecd0feb2586bb6db17ff56fc1241f452dc83ea31f62254f952dcec7b808a54ca1ca52d7c32e42f82d49897687ebdb9e4565aa472f07708f1170ec72f39a510d7b9f916addbf978f3325df5ee7575e985c7c4cde4b2bd251b35ef96a289738db7f1cd4bea0c6ba309c246b5f119bdb8f38ee3ea025bac866fcb96ee2f3f16c4cb74755afe22d248cc71112c7ccfa70b97ea96f9bbc7c6c1907311db95895f364be3febc5a130f59447346107a3acfe865ba62ce10628e2f92fb1f4ad3352f6dd6a292b97ce307f1cbbecde569f6d2d4649cf8f1b9ed626d143fef20d628d08b76fde555e18b8948ef302f511f362fc5e5f34fe6a5b891e029d868943110cd85f4825ef7f25fbad4fdeaa9e6575ee8fd7c2601519997f9fb24ef606d932fc4d6a126d6069973a681c9106bb59f96c8ddb84a74f98997879e2bff14486d20e96ff84798435108d7f30be9db6ca06314c59a1968c59fe65950cb5febcb65d00df5dc1177ce077eaf46879f9b3af2ddbc75ca54ca1ca92d9a0e3f4f53fa99a0329bead213cd022dc3fc3d8b6ea11575a6092e12e622e80978e5f9936ec7447e89a8d8e8d25a3439ca307fd78a7aee9b4e5ce9c9984fbbc1a7ab3f3377443d27c7e7286dd10bc7f19a0fe9b0ffd1ccce508774f3f768f1325ea56619722eda78b179237f2eec7fe8b43ae585a0b8a7957e29a3e4632614e6cdd674f48551fe245c757eb2a1fab34bdb2ed63443fb797b5d8e3cc276e544c8fa6287798968ffb9293d4e2ec8dc2b361a650cb4cd85d1433dc4086b81f6b1c5453b5e8a626dd039670a980cb1469fd363d7fc87dcd98fbe96d16afb55adb6f9eb01e617d4c1c3c7d569ffd32092ae03e9c24af363f43a842dd942fa361be81865b146f81f4a0e8f9dd3fb93f4b71cfa2db78e758ed90eb1a6d9bca056f8d360f2be24fa4991a81d7a82f03fdc9dbd89ba03a532476d0b91f9f1e2561fea80ff916def97e61507e607917dbf64eaecc6007f8d83f921e5f0a3f2cd4de9c9e59e4abf243f886d7e249cfd7077b89417dfcf147c9a6ce7eab6dfe7d1363e47694bee47c3bbf449ee47ac4d5be907d10b0f3a8c8d21e6228df4139ba6f971f4f0b046e69e38dfafcd0fb25b1b2f3fd1fc444f8ef487dcbb8c517a150bd996d5b5cdb67e7c2673e2368835cd707edead2eb69fbc5fb9b9b9f48bf283ccd7ef5ecb8e93721fb6d8689431501ab3d91fc0d7b4ae05223f5d8f03dab7d7dfd80a734b51ac0d33e74c380388b59da75de000c33937f8c7f524170000800a1d84e3aed0d77a81518158eb3bf42dccbc5fe954e1a6fbcde6a7444abb43000000c648ffc5da60afda007d0762adefb0c7eccd0de9ffdcecf1d2cdb1a7c3bd30f14dbf000000b68b9e89b577b7cca5dce6a95679df2a987420d62680a16efa050000b04df44bac35ef257441de1f06261e88b50961e3f533e66763d29b7e4fa9f36f4ce91d950000d04bfa24d6aeabe70efb9bfee7d5fee553dbf35433d8557a2dd60000000000661d883500000000801e03b10600000000d06320d600000000007a0cc41a00000000408f81580300000000e831106b00000000003d06620d00000000a0c740ac0100000000f418883500000000801e03b10600000000d06320d600000000007a0cc41a00000000408f81580300000000e831106b00000000003d06620d00000000a0c740ac0100000000f418883500000000801e03b10600000000d06320d600000000007a0cc41a00000000408f81580300000000e831106b00000000003d06620d00000000a0c740ac0100000000f418883500000000801e03b10600000000d06320d600000000007a0cc41a00000000408f81580300000000e831106b00000000003d06620d00000000a0c740ac0100000000f418883500000000801e03b10600000000d06320d600000000007a0cc41a00000000408f81580300000000e831106b00000000003d06620d00000000a0c740ac0100000000f418883500000000801e03b10600000000d06320d600000000007a0cc41a00000000408f298ab52b27e6d49e3d7bb261e9ac8db3be583f1e8ab34b6acfe2ba3b188675b564eab9a4ffeb2f64dfb91357dc1100000000409e91c49a6464b146428dca1849acf51f6f5b883500000000b4d12ad66a82a2cbce5a2cfae6d4ea557742e2855a086c674c9cab8b1cb1b3767555cdd1f1de55b5eaea17eae1cf5188046293c72aaf7f2222afa8d5bdee9c8bcf63041b2e2eb972e6d4b1a3dc1e3ae87a516bc6b22b0900000080a9635bc55a2cd47c285c9e2c89b5e473178abb6f05b126c3deb9e4f34628f93cd2d0d8430a351f1a419ab45f0bb31f643e8358030000004089c12f833a7141d4c59a17334c9c39e15514805e980521d608a254489576e94a62cdc76f8498af87af7753af264e28d7d7cdb75f1e6b82cd5cfdc3318b43f8cf6b42180000000080d846b156de9d2aee8a49b1c62e61e6c44e23e03805b116f2f00230dd014bc45a546e2c3e65db2d71ba92288358030000004057b6f1326845ac09f1154876d672a2a9a9dbb68b35be2b18d2d9cff275805803000000c078d946b1168b9b4e6ce765d0a1c41a2b7784cba0106b0000000018965d78c0800b2f811740263831157dc642e952ea98c59a0c4d9c4648c6a196af25b68bada7b41d0000000000b1ad628d9082ad965f2c80d8ce99106cf53cc629d6c6f4ea8ea4be5c0c42ac01000000a04c51accd3642f00100000000ec12106b5920d600000000d00f20d6b240ac01000000a01f14c5da030f3c808080808080808080b0cb013b6b00000000003d06620d00000000a0c740ac0100000000f418883500000000801e03b10600000000d06320d600000000007a0cc41a00000000408f81580300000000e831106b00000000003d06620d00000000a0c740ac0100000000f418883500000000801e03b10600000000d06320d600000000007a0cc41a00000000408f81580300000000e83145b176e5c49cdab3674f1af6aeaa2bfafcfaa2fe7f71ddc4e5fff79ab34bba0d4b6a026a3a71187f71be91e5eaaa9aab9d6fe58a5addbb47cd9d183e07c3b03e30403a397696ceba13c342b6db33a756afbae32264a32ef1c06ed33a5e00008051176b95c904620d70eafe320e113121624dc633c723b6bdb358d38c2c8ac14e00b106001884a1c51a07620d54fd85ecde17ffd8711f58574be3d85d1b001a8f3b591e181c883500c0206ccbce9a49eb2f0315f3f03b25ab66310b71cd2e422ead8d1ff2f50bae89cf175f1b2fbb58b9857a95d52f8e6717d6fc3949396eb1fd85f28dfdd8712daec1b579c9a5f39f97ed2e6cc7859329c79f13bb37bc2f929d1d9ee79cae8b2ebbd0d739f110b579b11150fcf3104c7dbdbf5009fe7fe13b94711bad7675f985e0daedd2853a2eaeb2f6d7c45f57b116fb930f269da997ab87ffff44d36f72b7d1f841451c473666f1e8f339dd17c606197bda7637f1a339c2d5cbf841266fa2546ed1cf0a6de57e1eda5eb58b9b138c9fe973beec52b99aa8aedc16511ad9afb5f9a3fb78010000c980f7ac358b129fb8a3499c2d6a849ce01bfce4e5e3ba892e9afc9b092f5e80d2853b4c8c265d61f1f4c224aaab9fa4799e1a3ff9b309bca112376abf6b63545e93cedbd8d7ddd8cab7bf5657679b6631d244e5c676cfd9ce964936676da43cc202224486c8dfe429e2e6171f510611e5e56c94ebb3a80fb8cd7d9af85cd3c60aa66c16d71c8bfa394a7e6d3e67b689fa4d60fb38d3b61622fb723bb8be8fcfb17e22cc67f93273fde6fdc8b6ab5cd7c81e9ab48eecbca8575c2eefcbd8cf227bc93c5ddfc5e347c4cddac5f947289fa8f837fdcfe252bbb9df8534a60c6f2fde268d39d7f855ceee717d0000a0ccd877d69a89cd114d681c31b925c762328d8817195357573eff3f2159985999997a266df1888998c36d61908b002f431c47366fad6b5c7ecdee26df6c7ddda291b317951ff5bf2d9f2f7ebcbca2bf14ec5ab45140f63f2fd3fedf9e47869a5d19497b58fea6fefc5cc91f4c9a920f57906de1f99bffe33c137b96ea93692b6f67928f409e8f6c9494c9fb2f6f6343d26f2c9dcc531ef3b455bb64caa7b491bfda38267db1df6c9c389dc3941ffb1f95cffdb5647700006863cc62cd4d667aa28b439785431e8bc5da4da03ebf391e974d945497749275240b039b50a3fc59c82d5e997c2ce9a41cc595e9c47164f34c19a1ae72d1ea60779377e6736fe770ceb5378edf04db3629a43454df4e8b588b8d0c9938d16799f399c5324bcdae9e4c1cfe59e3ef1eb287f07113bfe28b2592bed5f0cf32e74d5fb5d5c790f61bf7b9b45d31f27ce4af49bd7859197f71447918585c99a73ce6fd54b54bea2fe69c2e478610c7f59f0f4ddd6d5ee15c345ed9e73e98f233eda7f8b9f102000019b67f67ad889c40e5319fe0dae2dae3a5b394a6b260f3c9ddc0f231937d252d27b3307892058f9729cb17c791cdcd395e86ac6b5c7e77bbbb3ae6fad6e4eb6c4ee517fb5fda5fd49d93b16bd5469ae4bc819769ffafe551248927da52ea5b962eb19f4c63e2e6fda34e41d4f0fc791f39127b95da20dbaae1fd96b77b833c1ff57952666dfc3292fe60e9649ef298a7adda25533ea52dfa778c6967d6b76c5d4dbea6fc5c1ca26e7700006863fc0f1888c9b73cd1c9094c1ea7937d5c4666f2d39f55274099ce1cfbc93f5f3e2fa3a152d7a8fdb97a335b88e3c8e6b5ba260ba32697973bce2eb2749ce443edf0c7dcfe1ab118c6fdeada99b53dcfd311d5d5a575c7910d22b8cde334e198b5b148cdaea6aef1821f607536f6646d32c7bece19d1d00dde3e01ef27977f686bae3cf399b74d4c6c5fdb5e5fa6f41349b5cf791d0db12d65bf366565e2f932649ef298fb91b343de2e39db8abe66f1131fa472ccb1f40f9b6fbe8cd8b655db0100400be3176b1a3b31e9cf4ce01338474e6ef9c92e4c8c6e91354197952c2c6eb28d2764819bdcbb3e0d1ae59f10c7e5e546ed97937e98b035e238b2b93be79ff8a410ea2a172d47d9ee6e7108e7641d9a7391fdfc02983ba7317de0ce9927ed0afe42f1623bf3b4ba9ee6093eaa93b0bf0f265fee1fee7fffe46288e3a03615eae2ed9af381d87e4d30e7595f59dfd37d13e2883e64697df0b633e7737e25fa214ac7fbdbfdcf9fba94fd522cc3c1fb8dc7b3ed2aa7d331589b5dbf793b273e29c6af262a97f74fe4672c0f99a73c667d52b78b9c5b1c51b9f1f9a8ae491dd8b9c85ef5f983e7198f174ac76d0700003145b136794cd984c717a24987da52130174be24aeb21416df803ebf38487e83d12e6a6a683f1d3aad460a96046b1b298ea79e56bb0000c0e4323d626de005bfe74c93583302a25948e39d1f2b2e06133f2d624d2fdc4b4521373a238935ddaf2309a9365142e7a7691c7405620d0030c54c8558b39717a66ca29e2ab1a6894484b85c34b0b868116bdbcc683b6b23521525b1289e2920d6000053cc145d060500000000983e20d600000000007a4c07b1e62e59edd6659f89a5e5529db9cc499701e7d4ea33cd25cfae97d876f5521cc860c749ee7eb4f1f4557ce9d896e3eef7f37ed4b34b80f6f604170aedef126726309771c76383c16d2a6e4be0a12ff73ff6f0b6106be741c79db3f52cde570a46a25dacd12031af2998a2fba776849a5813e7d844d47561a778bb75cfd644b163f732ed9058e393bc13fcfdf2035d4f5ec7161132dc8237858c51ac1906caafecbbbd01620dcc382d62cd8a8aa5b32dbb442043bb581b6561a7272a7b3db9f6851e88b5f13009622d534788b5dd01626ddb81ef829da42ed6cc80b703c4bc6ea1f5db809bac5de083dfa4f7e79205277d49a91d08229f425c83abab7f89acffbc58aefe8f045338c72735b708da2006a39f04dbceedd575c98ab54cb96c229262ad5c7f46adbe0c9b377f99ab881be5c3ea6edaa5e39a97d736e778dde27696fd2062907c7ddc505fb1c0646dc0eb21da1a28d5d5896dfee25dd747015ea6b36baeadbc4f5bfba088aba7f701d157e1f3c83f75e07eedcf85f2757b5c3e732756e33a9de5f9f0760bff0df52f7c1eca8c2c17b0e35cd8a0d606d15fe95c32405b127bb49d77e7b2be6689c6ab0ed1b890ede275cfd8c9dac687b89c60373676f27dcd3e2b22c65282eb5b565fdb4e6f2bd9f78d0dadbfafb2f3748ef7615b5c87b1393b8e6cc96d63eb526e4b4cb5bf443dfdbae3f3cefaae41dac3069bb718c7898f5160ed04c051156bc691c3602727cb39a6c73a6876718d069a73649f6f98606d3a3f78a201e11ddb4f92515a578673fa68b089016e2703578ba86d7c808b76521e6192b2032d4c0451fea2fdaeae517d02b9b8361f5ec75afd1b6af58d91934b64db5c3ebe6c39f18bb6e526eed036ee079241f24df2e17d51b141adfc6a5ded39d9aec6feb12f48bfe5f07eabf7410d5b5e1457d82bb1a74ce3cf339ff2798438fed8c7f1c751fd7d7a59a74c1d933ac5487b24f1a336cafc451f0dd896d41eddede56d1ed9c3c58fcf097f12752bf59db44b765e2c96a59176ace2da9d098d3fb3b162f216750be5b0789aac0d84bde3b8a28d91bde274a16ed1b901a8f6973c6e6c14f701b3790edf0f329fa28f89f300382a628d0656ec88e49cdeb113c400e618a7e693061f5c72a08963331144039697519e4088a4be268ecddb4e7eb9fabac1929be4a8fc6810d9f2cde04dca8f27ad18718eb599dbaa56ff864a7d05b21f22db0aac7d5c59b26df298f759a68e493b3c03e7cbed6bdb6d27ce8a0d92748c6a5dd3fe8becc7eb66e0f589e1e906e98318d7461ed7d4a1a963cea7a3cf4c7b859d5c1ee133192797c6d9c6a4a310ea94a963367d83b107abb3ad6fde8ebeaed139fed9a06dc9d42daa4fdb798297efe35348fa94db2cee23435456ce9fe3cf5aed96a97b99b2ef46b0f665c7b3c1e6e5cf4b7f8f8fe33166ce25bee3da68ececc61bfd1fd9d7e6d35a7f49b5bf525f96364e7c21a1e9f3c65e22df4c3fb5e70b6691b258f3135f12e2c52dc00753443c200d72e0f174e2d80c10efd89932c8b14dde7c601bf8e4c8433ac1c9cfc380f2c10da4387e134cf9b5ba25089bb0b466a09af2daebdf90afafa4c9db12d9569437a7857a688fb4ad3ce66d37ff37f98490abd320f926fd6bdbdc4cd0051b24e918d5baa67ecbed17db8eb0f1730b064f57ef831a6292275cfd7d1d4ddea2adde674dbd8c2de2f2651e491c716ccbf0c7b24e993ae6ca64c83ae7dae089dae2e1f51fb02db9bab5d92bb45f84b80f78607342c6df425b78599972a56da59d12db64f32861f38eec5ac0942bfd356ad79c9e3b627bfce9adff43a9e3c795faabbf52576efaa03a7ad39f9affd55f7d5e5df8fd0faaa73efdf970eebffda779a5befd6d1b5e7b42d7cbb5d194616de9db2a43e8f7aefcf297ea1ff6dea83e7f230f7bd53f50d9ffebbfa8253adefba0adcb2baf2436967d2069eac97c40f463ab0f02e0288a3572c4d4f92b83da385dde718d53f349830dbce87f421c1bc7f58e6dcef132d8829a293fdf863ca68e721222dc60326da6f2737188a4fc74b16f10e7589bb9ad06a97f80d75720fb21b56da11f64dbe4711297e55363e07cb97ddb7cd19d4bd231ccb9525deb622db157a53eb24f8b7d50454cf284a94353473bc9c76d8d3e7376e1e5cb3c9238d1b1ac43dbb1265726c3d883d5d9d6b7d0afaeaed139fed9406dc91c6ba2fab49dafe26c21d27b6c3e14b87ffbb82e6d942efeacd56e99ba97b179676dce31f68dc5982e598c932beaffdcf207ea7b1ffdb452bffbbb7a85d14bcc38c2effca63af7bedf56bff8c84794facf1f53477fff16f50b127c4f3dd5883b19e89c11853a7cf6b34a515a0abff11bf9323a841ffffaafab9fdca8f3b8f34e75e1d63f88fa20a6e9ffd8aeee733f4646f231304b680fcc410e957716e348d909400e5a36019841ee17361b2fe4119dd388e368319393b19b3c4c3d8dd38b3ae7f272c7b21de61c1d27f9705bb036116ea0d963d12e77aeb10747d88ad533aa57a5fe816a7d63b26d8e6cebd3b9b6f8b26419f238aa67de0fb27618285f918f39e76c5fb341728e53abab3c27ed57a98f80a7abf681c0f6b7cfd39617c57565863a98b6a675ac2d0cad7944c72e3fd727be7e4d9d9cdff03a56f373f6487c208d6feb276d20fc74a0b6b0e350fee0f68aea5f28bf5af74259d22eb12fb49fcfd6bd88ad5bce771b581c93b72fdbb583ca397142a91b7f3b1237ffef5fff8a3af75bbfa7d4e73e1776cfccce9a1154df502f7ce23f443b6b473ff807eada476f32a2ea17bff5be28afb1870ffc3b2d00dfa7fee1dfffa115719ffe8feaa90fc63b7d549f57f7dea6cfff9e7ae7d77e2dc9e3faaffc2bf5e34f7f46a9e35f56873efad1d09fb67f72f62ff858c9070170688f4ba92d2076426a268918e7682e84494b132676e988263fbf206bc471541777ce3ff149219e9cd27a45e546e7fd44ef83ac43738eb7a3195c997351fb6d3de3f31e5b7638c7da6c06391be0e5fa336af56564f30e7dc1eda1cb314fd0b9f2a46de5b1e833e907c50563c07c235bb8a7c642ff176dd0b42bbf1895ea2afa4823ed17f9827bfa3757064f57ef8318df5e9b676612776d8efa9bd78942aebefc3399878c238f233bfbb198ef2353ef96fc8c3d789f133e8e0fbcbeb2bf6af6686b4b382e3c8128e37b84af457d2ece55ebde5296b58d0fb18da4dd625fd124f951d9c2ce01592f1ea88eee3cab9b2dcfd55fb7f9bedff99d2060defdb7bf662f67fef29789bfc7c7f118b3e70a4f457efb407389f2e18795faf35b8cb03aaa4324b83ef287eae7bff93ebbfb45bb697e67cdedb625bb61d5fee27362f334e8ff7cf879b3b3f6cf1ff837a1cd3efcdf0f7e58bd73785e7ded8ffea8c9d307e3abce96de6fdb7c10004756acf51633b0e0c860161193fca450123c0e293a769496ba4d343bd9b6755dc6affeaa0db4bb362452d8f58d4410136fbd65efc7bbe596f4f2ea073ea0d46768d74d9fbf5218b5d3ec8360ac40ac01301140ac8d1d88b5f1f0e10f5b7172e79dee83e19848b12679fe79a56ebb2d7fbf9e176fb433f8da6b36feb8fb89caa75d449f3f981ab4074d10106b6066892f5555178c9e6085980b55b1568fb36d4ca958db519b92f0202142e26444a642ac7168d78d761ae972ec873e140b370a74d976714e7d9eee751ba6ddbffca5ddb5a3fb01bd60e681caa538602ad03d0a0000000c088991f7bfdf5efea44ba1a00e5d0a257145228aece64515d98f76dcbaee86f9cbae948e8b33cad3dcb7a783bf247bd34d106c5382ee4d00000060406847870401fd058343bb6e24d2f8bd6e7ff227f632a6e49557ac9d73228ff291f7c491f0a3cbae140f826d2ad03d090000000c00eda4911020f10021301ab44379f7ddb11023d146363e7c38bdc449e28b76d7daec4e02cedf3b479761e97e3630b1e85e0400000006c00b08120d607cd025522ecc7c2021470f2e0cfae000094112773e1fda89a3cfc0c4a17b0f000000e8085d76a3857f0c0f15cc2cb4cb454fcfd23be04840d57eed81ce8f0a3d08e22fb792f0a3633051e89e030000003a4297e868d1c7aeda70d0cf607131e603dd6346bb6024e2e81228eda291981bd7c31b7459941e4cf0e5d1ee282e8d4e0cbac7000000800ed0824f0b3dee551b1eb29bff6505daa5a4070a76d2962416f9ab4448c0c9071440ef8058030000d00dbae19d1678bab70a4c36f45083bf344a4f968ef85263b0bd40ac010000e8867fb020f77a093079d0c306f4e0827f671b9e1aed2d106b000000daf1afeba07babc07441ef71a397e952ff52200187cbdcbd02620dec18dffbdef7d4dffccddf208c31904d01d811fc628e2709a717f9d42876d97a03c41ad8311e79e411b5b9b98930c640360560dbf1f7aad1655030ddd0c306f4ba10ea6fba3c8aa77e7b01c41ad8318e1d3ba6fee55ffe05618c816c0ac0b642bb2bb4685318d76b2440ff2181eeef65a3cba260578158033bc6d1a347d52f7ef10b843106b22900db06ddb7e45ff340af9a00b3053d48e22f8bd2fbf5701fdbae01b106768cbffeebbf561b1b1b08630c645300b60dfff34774bf1a984de8e5bc5eb0d34b7bc1ae309058bb72624eedd9b3478439b57ad54500a002098b77de79a75378f5ab9fd273c30d217ceaabaf36e75f79487dea864fa9875e89d3f4257c6bbea97714e6bfa5cfbfaa1efa13df1efe7f3eafb690176beb6a89c6e6a2bc647545adeedda396cebac381b069cd98bff3909af3e3feea6af3ff98585fccd51dec38fe4dfbb4b332a697a652df1aff337ea3fb79efaaf6ac98b0ceec940f98ba2ce951c3f0f5f341d4255a0b791b0669d7d9257d6ccb6d5f5b69fcede25a4baff8f03f89854ba2bbc2e0624d38a17532e1e86022c8f5e776f2f0c30feb31ff566b78fa0b246efe523d1d3e7b5afda59e243ef9d0dfdbe31f3ea83e79c327d5833f6cd2f42998fa7fe1e9ecb9b7defa7bf5a01668b62dfcff5cdcf640364d71622d1151238835b6b044028dff3f2620d67a0089337a1a9016e771dd604e3ee4fbd5f9cd5c2240d897829df08120caf81a66c74f334eecf1dc093753f2b1e0eb3b4cbba4586b5b5b29ef1d9caf136887cd5f12a55f5e003bcac8626d3b266bb033ec86587bf3cd37ebe1e52346881d79597cfef4bc9e23e6d5c95a9c9e8493b76bb176fbc9ecb9385c5047fe588bb5072f64ce750b35b1460b46dcbf238ab59caf6cc3f88758eb01fef73fc7f123e206f23de627c66f96d492eeeb20820ce4bbf6f3edf6012b86f47858e4e22b0ff749396f46c743b6abebda1a7626770bff23fef8b9b11d6764b1167fe61603e3fccc298dd3e96313bcf3c98523f76dc6c58dd24b67b5e9f2e71ac8c9a3c123161fd30e9f0f6f63f42d4ac307101b98e5b22bf5cbdac57fae8f4f383bea4075e7750c6d29c4b5581bf3768749c7b4cbc6e7ed35e7fde76c5231f6d3fdda6cf1b3fee9c8f2f2b2ba7efd7a35bc72e46675c31f3fa05ec99c0be1fc03eae61b6e560f1c2101e72e31defecd28ce37493015ce9932fcb9a8ac57d4035a3c95d2d5f2e4c1c42b9eb765dc7ce415f1bf3ddfb50c1fc8a6297e2cd9bfd21fb80f16fd9ec37d85fafcbc1c03dc0fba8d4743c1ffad8fae9abaca7386d2b8d144fe2bdad336c6fd38a6c0c7cccc415f00b4ff9997df8e6b41a63ee336377da8e755310f9bbed0f34e98a73c910f36fd63fb9bcdcf269ef30999b7e08a1e1fe69c49d35dacc5f1c51c3b48bb583ef13a6a297ec6edb21bd07d6be41f78e06447195cacb10163037772ebb8b183f985c31ed93c988332c7353b01dc914d3e6281f183c11ce4068a98d83d62f0d0a009e9d8a0096dc80c28032fc3fc5f9bd86bf52bdbc5e71bd7a1c9271bd7b7cd1ddb7c45f91a3e59987c984de2e3386d32290ec157bffa55f5f39fffbc1a9ebc4d8b94db9ecc9e0be1a5fbb55863f1dcf1179eb2e77ff88016639fba5ffdd0c47f527d419fbbf9811fdab84f7d41cf335f504f9a733f54f77faac9c7a40b65db73f93cedb990a708a60d543f1eb269e37c0629c307b2690af3ad8c6f87b154f37b098fcbfd38f2e99abf4b62ffe7f95b5f6bd299e3e09795714379741ae32ecfc2f8b2c7a57a4f3974f9d35fea1ae30b514d3f71df32be41fd41fd19f735f56dd43f224eb92f854f7545e49710cda90ef719f94dfa79c776b172ad1fdbfc9a90a953c87f17f1bf64417e82ddb51d6370b1c626434334b1a5e2201d086c40d139971fe56d7602dc3139b5cdc72d22b25c22e3b84d3a091f3ce9408a26125e67597f53a64bcbffcf513b5fb38b4c278f795a732e9e309af6a4fdc1db1af7a78d1b4d3cac7f121b0dc1430f3da47ef6b39f55c393fbb4b0d9f764f65c08e70eab4fdcf00975f89cffec4975bb9e3c6e7f8afe7f591dd622e713f7bf1ce2bf7cff27b4083aac5ed6ff27f93f75bb9e776e574ffa7851be3ed83c6dfe2e503a97671cb7ad0dbc7ee9ff5dcbf0816c9ac27c898e843fa49f3b129f64243e971903e6ff383d95911d8f95b264bd223f4dd2b1b69a73c2871d493d785d659ebc4db386df3519f34de435fbd339db67cdbc2c7d8063854dea0346e00c3347557c31e42dfd91c58fea3a48bb58b9f15cec30e7851ff6c537fd65f2ec6d18603b185dacb905c00ec4541ca469d8e41a9c98d2e5fe9a041a9b6ff8c6114ddcec731f0a0396068aa91b397ca8535ae768f0ca81cc074bdbc091691955bbc87ce531cf37530793b7b141da363e59c475709352126c39d12433240f3ef8a0ba7af56a35fce0b0164c9fbc4ffd20732e84f5fb8c58bb6fdd7fb6a66ed313c76d4fc8ff6d68f2fc81baef935a1c1dfe413877f589dbf49c739b5ae371757a1b7c1936cf68a7cc84261d0f6bb7ea73b7ae259fdbc0ebc0ff1fac0c1fc8a6297c8c698c8fd0b1f507fb798bdf4b4a3ec7ff3771a4ffe4fd263f9758a4aff1b8d57143883af0b6f2cf6de0f566edce8ca999c0df8f34cecb9f8e30f77a8c8dadcdc37c45fde0fa36f681b8ffcc1518e1a7268f92efb621fb3fe0e6c4c87f33e326190f1ddbc5ca4dfd9ac89465ead403dff4be825fb4d831b65daca503219e5cc979f98e1a95b174423b7c528ec7a63765b081d1093768d67519bc8e727188ea2ceb9f0ccccac0a99dafd945a693c73cad39c7162b4dd39eb43f785be3feb471793e9cc4464370e4c81175e5ca957af8bb43eae3377c5c1dfabbcae7499cc7ad405ba3ff5f5287b400faf87d2f85b42fddf7712dd60ea997f4ff8f1b21f578387765cd8ab5c7fd310b26ae4967f3b4f9b787a48c28f0faa5ff772dc307b2694a3cc608dbd74b7a9c359f57fd5e92f85c660c98ff0be92595b264bd223fad8d1b8149e7e2529ed1bcc49179caf1362bd0c24b0bf0363ce997d89ffb8afb9fdf941ff980ec9f427fcd69df1e6a8ecafa225b6722326b1cf79721db15cfc59e96b2761b12f5f40b07b814ba238c2ed68cc379e7c93897737a3f99f209341ceb6f4a73cc81e99b5393879c8cb9a890e5950698c79ea76f67d1e41e0d569b6718506670c8faf381591b38f9fad9bc2a7691f9ca635e5f57bf527dcde410faccb5dfc595fd298f79da68921992071e7840fdf4a73f6d0d8fff05ed28ed538f87cfce192173c35f3c6e8f5f7462ed457ffe71b54f2f32fb1eb7c7e79c383bc7ce7dfcbe7336eee3fb58de71bea65c5f860e261f771ce7e9e2b2631e643e71b065dafaf0ff072bc307b2694aec5b16e7d7fcf39adf4b129fcb8d8141c6a3a823cb47fa5aec97e57123fdd7d4d91f476d8dd3c973719b6684b7de6a76d5b601636fee5bc6c6dee6de371b9ba7a226f6b1a6bfb8cfe5fcbe03b2ff7d1985b110f98e269a63076e978d9bf82e11b5db11e5bfcbdc728bf519fa9503b0ed0c2ed6f46090a1191c7ce0308c83f9f839e76369cc713e4e28331a447680e6cfa598c19271f6a86d62d0d83436cc9d58d5e5b9fae5ea9a10d72fb24dc92e325f79cc2717776e69b1a97fb98c25b5ca27cd70aeb1076f6bf27962f7b6b6c7dc7ffffdea273ff949a7b07eefc7f43ca0c58a0b1fbb77bd39fffd7bd5c76ef898baf7fb3efeaaba55c7b9f57ffbe39fa8d53f6fd2def0e7abe1730a51de37dfabd6c3b97575efcd2cdd0db7aa55962eca539ce3c1c4136536c19661dbc3ffb7e7bb96e103d934a5b06819bf893faff97d44c6e74cdf4bdf7465873c6be331f2cda65ed2d792852c4a17fb60ecbff1b978fe62e778db88a44d3380bfac35b6577508c8a6491f3636977d1cfb80173daedfcefafe719ff37cb9c0a1ff6b3eedc9f6bf2f8f0559bfcce703b58b951bfb6613e41836f16a636a27b9fb6eeb3377dee93e00dbc940626d1ae895b38f83095a580e1f3eac5e7ffd75843106b2290023e3175efabb2d90b09a31013c76ac384dbe84ed1624ecc967f090c18e306362ad67ce3e0e264cacfdf8c73f46186380580363e1739fb30bef36dcaf16a09da469faa2bcd3d05cdf65a770bba17bd4bcbfd03d6b5776bd4633c1ec8835bfb53d6d93c50489b543870ea97ffaa77f421863209b023032fe550cf40ead6d842e034ed597e51da3273b93f47bb1745f23f90abd678d8ec18e303b620dec3a242c5e7bed3584310688353016fc8f74d3830600e4f0973d29d0c305d851db5120d6c08e71efbdf7aa7ffcc77f441863209b023032b44b4297b400c8412f49f6bb6963fc650bd01d8835b0633cf5d453ea9e7bee411863209b023012feb51d1ffa90fb000006fd06a8176adb7c991c94815803008059c6ffd623fdd414001c08b5de00b1060000b38c7fc7da673feb3e0040c32f7d42a8ed3a106b000030cbd07bb26851a65d1400e8b2b87f3a1842ad3740ac0100c02c03b1063cf4f0807f3507fd8550eb0d106b000030cbd08b9521d600fd7a053d114cbe403b6b788d4baf805803008059869e28f60b34983de81709fc8fb29358c3afa2f41288350000986568b1f697beb050cf16f4625bff4264f281575e712740dfc88b35fa0db7cc2ffe13f473217bfaf0fb64dbc14efc7493b1ed929a9c3b01ecefa9ce9de8d2e383c4dd39cc8ff7d34f8d69bb7f9dfcd7fce4583feb0ac0aef0ed6fdb059b02fdee23987ee8feb4f7bfdff6f9473e82cb9e3d272fd634668193a26ce284c68040ac659874b1b6ae96d8170ff36503620d8014126cf4f41f2dde1ffe307659a6993bef6cee4fa357b6d0ee2ae83545b1e617b966318b17bda904622dc33488b55c9f42ac0190f0da6b56a8d1224e8b392dea607a2001cefb971e2a00134145ac6998b04877daac78b397976211d7ec5e58b2bb7406bf60ae3679513c239ad8b18bede3fb3283e831f1b900b2f18ac2d2b4abc9272cd842ac9976f878a2fecda5b5f49c84e7b3b4c8c41ad563ef925a326df2e516dae828e69521aa3f172cae5f97d8f948b444f6b7f52b8a9a625cd707a68efa9cf387a2ddbced4fb8f83a548554a90f23621fa5388d6f7adf6bd245f662fe9ba314d7e6afede0cf658562c3307d4469a2f61a3fcaf9a06fa3185fee2c512c9fe036766d6ac65479fc832980efbcd0e28edf839c7c789fd27d6ad8399d28ea624d6326f3bd73918849163a33a937e7ed82d52c606d62ad111c6e01f0719d10f00b81c927e4cbeb60ff0f0b864957123162a7c52d8a26ae170c744e2c80d102c9d3f8369416f75c5c7f6ccec50b5db98d9a5a5e924cfd43beaedc7cffe5ca64c711b5b8ae7ebcdfcdf982ddbce82bf47d4ca50f13ac4ff97c1a3bc4758f7d54b44b10c7b5f9fbb8267f3916b80d38546f76ae731f65d2e5ebea6c2cfa362aa354beb09b69733816f6e1e3064c0f7c1786023d314837a483c9829ef6a5df7df5fd48bf4c80cb9e1347ab58f38b66b4182493733c79c793be9be8b30b965c14e571bc60c4c48b241739fcff36ec22e4167ade2eb758e6ca96edb371f362a11ab792ce9211021dcb8dc92cd23c1d6f774bdf4654e3a6e9aaf53779c5f64ee21788fa3021f6a126cfb4ae515f53dd3af9ac2bdfc59575e6e7ead87c3bf5916953ee7f89c89328fa4c4bf9a61c67235397380f6a77d647c0e4434f88fa1bd1696786dec786c5beff90d8a60707bc48a3dd34ec904e2ced628d4fd29e64228f17b0ee0b965cf8e4b128db94abf336614ecdf1b86c01a1f2a3fa46b845c9e533b7b720d688a83c9fa7aca3a665018ce2f2852e97aed8c641cad59872e27c3a09814c9ec585b81a57d6b7a5fed2f61ae3375c68046c5ede4e511f26c43ed4f826af8f8dd3d8dd875c9ee978185aac0ddb479a6067fabc2806333637f9709be7cb4febcdda6deae6d3b190ed2b3015d09382f494a85ff849bc1d3fee4e82de41bf4ae12f79d22b39d05713cf70624d2c1c7251e8be60c9c5441ef3b2dbe2dae3a5b394a6b4706be422d822183ca60d2e9e6c5f9227a31a3749576fe328e546c7321d6f774bdf4654e3a6e9aaf53779c57e96c4f7c8fa57eca07389fcb7c933ad6be4e345d2760d2bd664dce8b8d647049dd7f9aeebfcb37d63b0758d6cc8f21da87c6e47539792bdc15443bb3537ddd48836daada1a748417fa09d4fdf3fb8e439350c27d6e4826526f66621e1c2262c1863126bf162925934f567a5c5d110d5d5e5e9ebca16c46491a574fe385ac844bd24c2366641f469a37c889636e6ca8dd23798727c7d9d102a2ec4911010757069b99d1b6a71edb9285daefe22ad3cce0a28934fa10f13ba88357d24fa3bb29f208e6bf3f7f944824793f81163f83e226cb9e41f591b19a46d629b57cb1776f3638b8fc5a66f631b801940de0785fbd9761fb2bf17d2b4ab76e2843b01a68121c51ad12c16e982c1cfe905869ef0cb2e5872d2cf2f02216fb380b97cf5a2221746bfe0d4170dbf80b9ba9d658ba058104dfebebc68a1d4b9b8c5cb84c262ece171e7169774196ef1940b32d1d2c6a64eceae2591e2175f0aba7eb40313ea398010a078f44462d9a6a5b8b22f2d45bbb93a2c2d325b15cbacf46142ec438d3dd3fac5fd5db0ab238a2bfb871dd7c4da687de4eb50aba76ba3f1b9a69cd8e685f209e68bfe89d2669cf37ed781b5d9a4e3f980e9855efde0dfcd467ff1aa8f9d872e51d30e1abfec891f609f3a3a88b549821690d2a23d854cd3a2981123a08e11825c2425e405f370ccd8d802dd91f7b39158a07ba6c0f6430f7f78b14c628dfa01bf4430954c97589bf26ff4f1e2ec7697aa8bf50401b13620b6ffd31d6fce0862cdf447b36b677744ebbb8d60c6a1fbd9e8c7e0bd6823f140c724dce865bb607cd07d689ff94c636b1269b80c3dd54c8d58b39784a67db117979ea6499842ac75c75fbe6c15eaa3edacc59785d137a02374098eee61f397e57ca01d37fa69237a3211bb3fc343b6f3f7a6d1ae1a5e6e3b134c8d58030000d02368f7876e72a75d1f7a6a940b370af4c25dbac70df7577587ece9df7947e217426d66d03d0e0000006c3374998e76d56877cd0b0e1f4878d02553126ff42a10bc6ea2812e21d3030464236f2f3c7d3b73e85e070000007618da51237196db75a3409f9380a3f786d1ab42666917a9641b3a265b809943f73e000000b08bd04e1aeda891402181c6779164a0cba774733d89384a330d0f2fd07d68b4eb48edcaed3ad2ce1a2e79ce34da13000000809ee1051cbd9e82c40afdcea514323cd0f94912717ef78cff58be0fb89f0f08b4570000000013021771f4f0028934ffaeb15ca0f3748f97bf9cba5b028876cfe80101ba674fee1c920825a18927654101ed25000000c084432287441cfdaa821771b59d380a148702c52731e703bd1b8ef22a85d2cdfd74a992c7234149228cff34970fd83d0303a03d0600000098527297532948f1b4dd81041b09371282d83d0303a23d080000009851fc2e18ed72f1dd350a74f9d48bbb6102e541975e21cec08840ac0100000000f418883500000000801e03b106769dcb972fabef7ce73bea5bdffa16c20c05ea73ea7b0000007520d6c0ae438bf63befbce38ec0ac407d4e7d0f0000a00ec41ad875689705cc26e87b00006807620dec3a58b06717f43d0000b403b106761d2cd8b30bfa1e0000da815803bb0e16ecd9057d0f0000ed40ac815d070bf6ec82be0700807686126b574ecca93d7bf684307782fd4edad55535b7674ead5e75c76008d6d552ceb60957d4eadeb6385db179993ebdf350d3873bd09fe35eb0df589d5337de78a30e77ab97dc6711d756d49c394f614ead5c739f831d07620d0000da1958acad2fd282bea4e584c70a8b2018fa20d626bc0e460cef5dd5f229253e3746b17676a9e9575ef7de8bb597d4dd5a74dd1d1c521e4be2f356d815441dd87620d60000a09dc1c45a69e12e2df4bbc584d7c108b2c5bcdad856b19613881329d62abb6566578d9d97c76024feeccffecced5836813e2b01b1060000ed0c24d66a3b3e01bfb89f2001e72eab45c2835d6e33a1d9a5a35dbbb9c5259d5e7feecb31f9b1f842c4d89d3e7eaeb984b887890c5377ff396f8311294b6ac9d429274a447d5bcb379f66eb10c3e3ec514b67eda7513da31d4c8d11c5ee9c6983176bab2caf384db1dd1c9e2fd5f73c13688958cbd79b306509fb74a175c15ebf3bdefd0a02eb0db5b2b7110577af5be1e68fe756df700938999db5bd2b2a17130ccef3cf3f1fecef037d5602620d0000da1948ac1961d2b6187b71e5e3b9e3488c843ce29da1f412ab3d1f0481100e26af2040585e5260f09d3f4dd40e2754b8e8e0e4ea1bb525573e91881c8e886bea506a574caecca66dee386a5ba1dd121e97d73d6ac7206deccef0628d0e723b6bfc380713798bb8003a6ef8ee5a6d578d805803008076b649acf105dceec4e4c5903d1789b55afe91a811c28123ea40f946f1cc79274c84a0911871941524b6fca85d949717523521939c8bdb32a858e36de336acb65bd245ac65d227650cc18e8a3593969d97798391e1bb6bb55d3502620d0000dad9becba0418808b1664481161426cca93926367262cd7ce6e3efd5f143de151118d5c10a9aa64c1fdcf916b14658c126d2b9f2e33c2964048f2429733bc45a4bbb255dc45ad4772cb409f816b64facd9ffbd70a0cba2e9654fbbcb96bf640a868576d4da76d5088835000068673c0f18941677031755525cc4c78958937945c7a950098874d5dd9f0e628d63ea68c4922d3fbf63a849ecc048cec56d198f586b69b7a48b5833ff77b755577672670d626d67a01db5b65d3502620d0000da194cac698c18c8ec0a059195089154ac85b86ea7c60b0a2e340c26af4610d9b29bbca5a809e9651d842033e9fc718b5893753269dd71b67c7f9cd881234496a943b95d9cf85c5dac55db2de17179dda376c8f26cdf761684055a176c71e9d2be6e639c97417d5e60a781580300807606166b845df44938d9102dd6894811972b8d287069b5a8e0e2420a23c27ce6e22f9d157969f87929626c1af381a833ab5f8b58e379d910c78dca8fcea57588b16df169799c9a58b3f6f565b588354db1dd924e628d88eb9d9425faaf0b5d16ec9716f9e5cc152dc81a81e5cfd9ddb116b1461881e6f38350db4d20d60000a09da1c41a00e3040bf6ec82be0700807620d6c0ae83057b7641df0300403b106b60d7c1823dbba0ef0100a01d8835b0eb60c19e5dd0f70000d00ec41ad875b060cf2ee87b00006807620dec3a58b06717f43d0000b403b106769def7ce73bea9d77de71476056a03ea7be0700005007620dec3a972f5f368b36edb220cc4ea03ea7be0700005007620d00000000a0c740ac0100000000f418883500000000801e03b10600000000d06320d600000000007a0cc41a00000000408f81580300000000e831106b00000000003d06620d00000000a0c740ac0100000000f418883500000000801e03b10600000000d06320d600000000007a0cc41a00000000408f81580300000000e831106b00000000003d06620d00000000a0c740ac0100000000f418883500000000801e03b10600000000d06320d600000000007a0cc41a00000000408f81580300000000e831106b00000000003d06620d00000000a0c740ac0100000000f418883500000000801e03b10600000000d06320d600000000007a0cc41a00000000408f81580300000000e831106b00000000003d06620d00000000a0b728f5ff0102a2dde900a1df2b0000000049454e44ae426082, 'e.PNG', 18744, 'st1002', 'd1002', 'instu115', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `instructor`
--

CREATE TABLE `instructor` (
  `InstructorID` varchar(44) NOT NULL,
  `FullName` varchar(44) NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `Address` varchar(44) NOT NULL,
  `DeptID` varchar(44) NOT NULL,
  `CollegeID` varchar(44) NOT NULL,
  `StreamID` varchar(44) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `NotifID` varchar(55) NOT NULL,
  `InstructorID` varchar(44) NOT NULL,
  `CourseID` varchar(44) NOT NULL,
  `AssignID` varchar(44) NOT NULL,
  `Notification` text NOT NULL,
  `dateOfNotify` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `questiontble`
--

CREATE TABLE `questiontble` (
  `QuestionID` varchar(44) NOT NULL,
  `ExamID` varchar(44) NOT NULL,
  `CourseID` varchar(44) NOT NULL,
  `ExamNumber` int(44) NOT NULL,
  `Questions` text NOT NULL,
  `Option1` text NOT NULL,
  `Option2` text,
  `Option3` text,
  `Option4` text,
  `Answer` text NOT NULL,
  `Weight` double NOT NULL,
  `InstructorID` varchar(55) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stream`
--

CREATE TABLE `stream` (
  `StreamID` varchar(44) NOT NULL,
  `StreamName` varchar(44) NOT NULL,
  `DeptID` varchar(44) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stream`
--

INSERT INTO `stream` (`StreamID`, `StreamName`, `DeptID`) VALUES
('s1003', 'IS', 'd1001'),
('s1004', 'PE', 'd1003'),
('st1001', 'CS', 'd1001'),
('st1002', 'IT', 'd1002'),
('st1003', 'CE', 'd1003'),
('st1005', 'Com E', 'd1003');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `StudentID` varchar(44) NOT NULL,
  `FullName` varchar(44) NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `Address` text NOT NULL,
  `DeptID` varchar(44) NOT NULL,
  `CollegeID` varchar(44) NOT NULL,
  `StreamID` varchar(44) NOT NULL,
  `Batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `submittedassignments`
--

CREATE TABLE `submittedassignments` (
  `AssignID` varchar(44) NOT NULL,
  `CourseID` varchar(44) NOT NULL,
  `DeptID` varchar(44) NOT NULL,
  `StreamID` varchar(44) NOT NULL,
  `AssignFile` mediumblob NOT NULL,
  `FileName` varchar(55) NOT NULL,
  `FileSize` int(55) NOT NULL,
  `SubmittedDate` date NOT NULL,
  `Batch` int(11) NOT NULL,
  `InstructorID` varchar(44) NOT NULL,
  `StudentID` varchar(44) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`UserID`);

--
-- Indexes for table `answertbl`
--
ALTER TABLE `answertbl`
  ADD PRIMARY KEY (`AnswerID`),
  ADD KEY `QuestionID` (`QuestionID`,`ExamID`,`StudentID`,`CourseID`,`DeptID`);

--
-- Indexes for table `assignmentresult`
--
ALTER TABLE `assignmentresult`
  ADD PRIMARY KEY (`AssignResultID`),
  ADD KEY `StudentID` (`StudentID`,`CourseID`,`DeptID`,`StreamID`,`InstructorID`,`AssignID`);

--
-- Indexes for table `assignmenttopost`
--
ALTER TABLE `assignmenttopost`
  ADD PRIMARY KEY (`AssignID`),
  ADD KEY `CourseID` (`CourseID`,`DeptID`,`InstructorID`);

--
-- Indexes for table `college`
--
ALTER TABLE `college`
  ADD PRIMARY KEY (`CollegeID`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`CourseCode`);

--
-- Indexes for table `courseoffer`
--
ALTER TABLE `courseoffer`
  ADD UNIQUE KEY `CourseID_3` (`CourseID`,`DeptID`,`InstructorID`),
  ADD KEY `CourseID` (`CourseID`,`DeptID`,`InstructorID`),
  ADD KEY `CourseID_2` (`CourseID`,`DeptID`,`InstructorID`);

--
-- Indexes for table `coursetostudent`
--
ALTER TABLE `coursetostudent`
  ADD UNIQUE KEY `CourseID_2` (`CourseID`,`DeptID`,`StudentID`),
  ADD KEY `CourseID` (`CourseID`,`DeptID`),
  ADD KEY `StudentID` (`StudentID`),
  ADD KEY `CourseID_3` (`CourseID`),
  ADD KEY `CourseID_4` (`CourseID`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`DeptID`),
  ADD KEY `CollegeID` (`CollegeID`);

--
-- Indexes for table `exam`
--
ALTER TABLE `exam`
  ADD PRIMARY KEY (`ExamID`),
  ADD KEY `CourseID` (`CourseID`,`DeptID`,`StreamID`,`InstructorID`,`ScheduleID`);

--
-- Indexes for table `examresult`
--
ALTER TABLE `examresult`
  ADD PRIMARY KEY (`ExamResultID`);

--
-- Indexes for table `examschedule`
--
ALTER TABLE `examschedule`
  ADD PRIMARY KEY (`ScheduleID`),
  ADD KEY `CourseID` (`CourseID`,`DeptID`);

--
-- Indexes for table `handout`
--
ALTER TABLE `handout`
  ADD PRIMARY KEY (`HandoutID`),
  ADD KEY `CourseID` (`CourseID`,`StreamID`,`DeptID`),
  ADD KEY `InstructorID` (`InstructorID`);

--
-- Indexes for table `instructor`
--
ALTER TABLE `instructor`
  ADD PRIMARY KEY (`InstructorID`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`NotifID`),
  ADD KEY `InstructorID` (`InstructorID`,`CourseID`);

--
-- Indexes for table `questiontble`
--
ALTER TABLE `questiontble`
  ADD PRIMARY KEY (`QuestionID`),
  ADD KEY `ExamID` (`ExamID`),
  ADD KEY `InstructorID` (`InstructorID`);

--
-- Indexes for table `stream`
--
ALTER TABLE `stream`
  ADD PRIMARY KEY (`StreamID`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`StudentID`);

--
-- Indexes for table `submittedassignments`
--
ALTER TABLE `submittedassignments`
  ADD KEY `CourseID` (`CourseID`,`DeptID`,`StreamID`,`InstructorID`),
  ADD KEY `StudentID` (`StudentID`),
  ADD KEY `AssignID` (`AssignID`),
  ADD KEY `AssignID_2` (`AssignID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answertbl`
--
ALTER TABLE `answertbl`
  MODIFY `AnswerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=192;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
