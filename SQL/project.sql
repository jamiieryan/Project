-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 01, 2016 at 08:55 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_createUser` (IN `p_name` VARCHAR(50), IN `p_username` VARCHAR(50), IN `p_password` VARCHAR(255))  BEGIN
    if ( select exists (select 1 from tbl_user where user_username = p_username) ) THEN
     
        select 'Username Exists !!';
     
    ELSE
     
        insert into tbl_user
        (
            user_name,
            user_username,
            user_password
        )
        values
        (
            p_name,
            p_username,
            p_password
        );
     
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_validateLogin` (IN `p_username` VARCHAR(50))  BEGIN
    select * from tbl_user where user_username = p_username;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `art`
--

CREATE TABLE `art` (
  `id` int(11) NOT NULL,
  `title` varchar(500) NOT NULL,
  `body` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `art`
--

INSERT INTO `art` (`id`, `title`, `body`) VALUES
(3, 'Galaxies', 'Galaxies are sprawling space systems composed of dust, gas, and countless stars. The number of galaxies cannot be counted—the observable universe alone may contain 100 billion. Some of these distant systems are similar to our own Milky Way galaxy, while others are quite different.\r\n\r\nGalaxies with less than a billion stars are considered small galaxies. In our own galaxy, the sun is just one of about 100 billion stars.\r\n\r\nGalaxies are classified into three main types: spiral galaxies, elliptical galaxies, and irregular galaxies.\r\n\r\nSpiral galaxies, such as the Milky Way, consist of a flat disk with a bulging center and surrounding spiral arms. The galaxy''s disk includes stars, planets, dust, and gas—all of which rotate around the galactic center in a regular manner.\r\n\r\nThis spinning motion, at speeds of hundreds of kilometers per second, may cause matter in the disk to take on a distinctive spiral shape like a cosmic pinwheel. Some spiral galaxies obtain even more interesting shapes that earn them descriptive names, such as sombrero galaxies.\r\n\r\nOlder stars reside in the bulge at the center of the galactic disk. Many new stars also form in spiral systems, and their disks are surrounded by a halo, which scientists believe is rich with mysterious dark matter.\r\n\r\nElliptical galaxies are shaped as their name suggests. They are generally round but stretch longer along one axis than along the other. They may be nearly circular or so elongated that they take on a cigarlike appearance.\r\n\r\nElliptical galaxies contain many older stars, up to one trillion, but little dust and other interstellar matter. Their stars orbit the galactic center, like those in the disks of spiral galaxies, but they do so in more random directions. Few new stars are known to form in elliptical galaxies.\r\n\r\nThe universe''s largest known galaxies are giant elliptical galaxies, which may be as much as two million light-years long. Elliptical galaxies may also be small, in which case they are dubbed dwarf elliptical galaxies.\r\n\r\nGalaxies that are not spiral or elliptical are called irregular galaxies. Irregular galaxies appear misshapen and lack a distinct form, often because they are within the gravitational influence of other galaxies close by.\r\n\r\nGalactic Mergers\r\n\r\nSome galaxies occur alone or in pairs, but they are more often parts of larger associations known as groups, clusters, and superclusters.\r\n\r\nGalaxies in such groups often interact and even merge together in a dynamic cosmic dance of interacting gravity. Mergers cause gases to flow towards the galactic center, which can trigger phenomena like rapid star formation.\r\n\r\nOur own Milky Way may someday merge with the Andromeda galaxy—just two million light-years away and visible to the naked eye from Earth''s Northern Hemisphere.\r\n\r\nThese intergalactic processes may be part of natural evolution by which irregular galaxies transform into one of the other shapes, and by which spiral galaxies eventually become elliptical galaxies—as scientists believe they must.\r\n\r\nGalaxy Origins\r\n\r\nMost astronomers suggest that galaxies formed shortly after a cosmic big bang that began the universe some 10 billion to 20 billion years ago. In the milliseconds following this explosion, clouds of gases began to coalesce, collapse, and compress under gravity to form the building blocks of galaxies.\r\n\r\nScientists are divided on just how galaxies first formed. Some believe that smaller clusters of about one million stars, known as globular clusters, formed first and later gathered into galaxies. Others believe that galaxies formed first and that only later did the stars within them begin to gather into smaller clusters.'),
(2, 'Trees save how many lives a year in the United States?', '(NaturalNews) Trees are naturally helping to save hundreds of lives per year. In fact, in the first broad-scale approximation of its kind, researchers have estimated that trees save over 850 lives per year. Not only that, but they also can help reduce and prevent more than 670,000 cases of severe respiratory symptoms as well.\r\n\r\nThe study illustrates the importance of trees not only for sequestering carbon but also for helping to remove pollutants from the air. The research indicated that the benefits of trees are especially important in urban areas due to their close proximity to humans and because 80% of the United States population lives in urban areas.\r\n\r\nThe Study\r\nThe study, which was published in the journal Environmental Pollution and conducted by scientists from the Davey Institute and the U.S. Forest Service, calculated how helpful trees were in removing four EPA quality standard indicators. These four air pollutants were ozone, sulfur dioxide, nitrogen dioxide and particulate matter less than 2.5 microns. By removing these pollutants, the researchers estimated that trees help save $7 billion annually in human health costs that are associated with air pollution by merely improving air quality by less than 1 percent. That 1 percent saves a hefty cost to humans.\r\n\r\nWhile there was a bigger improvement in air quality in rural areas, the effect that this improvement had on human health was greater in urban areas. Dave Nowak, who was part of the U.S. Forest Service research team, said, In terms of impacts on human health, trees in urban areas are substantially more important than rural trees due to their proximity to people. We found that in general, the greater the tree cover, the greater the pollution removal, and the greater the removal and population density, the greater the value of human health benefits.\r\n\r\nTrees Improve Our Health\r\nNot only do trees help reduce air pollution and therefore help us breathe easier, but it has also been found that simply touching a tree or being near one can make you feel healthier and happier. By helping to improve reaction times, depression, concentration levels, etc., trees and plants can help improve your mental outlook and overall sense of well-being.\r\n\r\nResearch presented at a 2009 American Association for the Advancement of Science conference in Chicago indicated that people who live in areas that have more trees, parks, grass and green areas live longer and had improved mental and physical health. One study even indicated that your overall health could be predicted by the total amount of green space within a 1- to 3-mile radius of your home.\r\n\r\nConclusion\r\nWhile this study was carried out in the United States, these results could be correlated for the rest of the world''s trees, parks and green spaces. Trees can help benefit us in so many ways and, in fact, they are actually saving lives. From improving the quality of our air to increasing our mental/physical health to saving us billions of dollars in medical bills, they are one of our biggest natural assets. Maybe we should all plant a tree today!\r\n'),
(4, 'Half Of The Population Of The World Is Dirt Poor – And The Global Elite Want To Keep It That Way', 'Could you survive on just $2.50 a day? According to Compassion International, approximately half of the population of the entire planet currently lives on $2.50 a day or less. Meanwhile, those hoarding wealth at the very top of the global pyramid are rapidly becoming a lot wealthier. Don’t get me wrong – I am a very big believer in working hard and contributing something of value to society, and those that work the hardest and contribute the most should be able to reap the rewards. In this article I am in no way, shape or form criticizing true capitalism, because if true capitalism were actually being practiced all over the planet we would have far, far less poverty today. Instead, our planet is dominated by a heavily socialized debt-based central banking system that systematically transfers wealth from hard working ordinary citizens to the global elite. Those at the very top of the pyramid know that they are impoverishing everyone else, and they very much intend to keep it that way.\r\n\r\nLet’s start with some of the hard numbers. According to Zero Hedge, Credit Suisse had just released their yearly report on global wealth, and it shows that 45.6 percent of all the wealth in the world is controlled by just 0.7 percent of the people…\r\n\r\nAs Credit Suisse tantalizingly shows year after year, the number of people who control just shy of a majority of global net worth, or 45.6% of the roughly $255 trillion in household wealth, is declining progressively relative to the total population of the world, and in 2016 the number of people who are worth more than $1 million was just 33 million, roughly 0.7% of the world’s population of adults. On the other end of the pyramid, some 3.5 billion adults had a net worth of less than $10,000, accounting for just about $6 trillion in household wealth.\r\nAnd since this is a yearly report, we can go back and see how things have changed over time. When Zero Hedge did this, it was discovered that the wealth of those at the very top “has nearly doubled” over the past six years, and meanwhile the poor have gotten even poorer…\r\n\r\nIncidentally, we tracked down the first Credit Suisse report we found in this series from 2010, where the total wealth of the top “layer” in the pyramid was a modest $69.2 trillion for the world’s millionaires. It has nearly doubled in the 6 years since then. Meanwhile, the world’s poorest have gotten, you got it, poorer, as those adults who were worth less than $10,000 in 2010 had a combined net worth of $8.2 trillion, a number which has since declined to $6.1 trillion in 2016 despite a half a billion increase in the sample size.\r\nIf these trends continue at this pace, it won’t be too long before the global elite have virtually all of the wealth and the rest of us have virtually nothing.\r\n\r\nPerhaps you are fortunate enough to still have a good job, and you live in a large home and you will sleep in a warm bed tonight.\r\n\r\nWell, you should consider yourself to be very blessed, because that is definitely not the case for most of the rest of the world. The following 11 facts about global poverty come from dosomething.com, and I want you to really let these numbers sink in for a moment…\r\n\r\nNearly 1/2 of the world’s population — more than 3 billion people — live on less than $2.50 a day. More than 1.3 billion live in extreme poverty — less than $1.25 a day.\r\n1 billion children worldwide are living in poverty. According to UNICEF, 22,000 children die each day due to poverty.\r\n805 million people worldwide do not have enough food to eat. Food banks are especially important in providing food for people that can’t afford it themselves. Run a food drive outside your local grocery store so people in your community have enough to eat. Sign up for Supermarket Stakeout.\r\nMore than 750 million people lack adequate access to clean drinking water. Diarrhea caused by inadequate drinking water, sanitation, and hand hygiene kills an estimated 842,000 people every year globally, or approximately 2,300 people per day.\r\nIn 2011, 165 million children under the age 5 were stunted (reduced rate of growth and development) due to chronic malnutrition.\r\nPreventable diseases like diarrhea and pneumonia take the lives of 2 million children a year who are too poor to afford proper treatment.\r\nAs of 2013, 21.8 million children under 1 year of age worldwide had not received the three recommended doses of vaccine against diphtheria, tetanus and pertussis.\r\n1/4 of all humans live without electricity — approximately 1.6 billion people.\r\n80% of the world population lives on less than $10 a day.\r\nOxfam estimates that it would take $60 billion annually to end extreme global poverty–that’s less than 1/4 the income of the top 100 richest billionaires.\r\nThe World Food Programme says, “The poor are hungry and their hunger traps them in poverty.” Hunger is the number one cause of death in the world, killing more than HIV/AIDS, malaria, and tuberculosis combined.\r\nSo how did we get here?\r\n\r\nDebt is the primary mechanism that takes wealth from ordinary people like you and me and puts it into the hands of the global elite.\r\n\r\nIn my recent article entitled “Why Donald Trump Must Shut Down The Federal Reserve And Start Issuing Debt-Free Money“, I discussed how the Federal Reserve was designed to entrap the U.S. government in an endless debt spiral from which it could never possibly escape. And that is precisely what has happened, as the U.S. national debt has gotten more than 5000 times larger since the Federal Reserve was created in 1913.\r\n\r\nIn that very same year, the federal income tax was instituted, and that is a key part of the program for the global elite. You see, the income tax is how wealth is transferred from us to the government. And then a continuously growing national debt is how that wealth is transferred from the government to the elite.\r\n\r\nIt is a very complicated system, but at the end of the day it is all about taking money from us and getting it into their pockets.\r\n\r\nAnd at this point more than 99.9 percent of the population of the world lives in a country with a central bank, and almost every nation on the planet has some form of income tax.\r\n\r\nIt is a global system that is designed to create as much debt as possible, and I recently shared with my readers that the total amount of debt in the world has hit a staggering all-time record high of 152 trillion dollars.\r\n\r\nInterestingly, the Bible actually foretells of a time when rich men would hoard wealth in the last days. The following are the first five verses of the Book of James in the Modern English Version…\r\n\r\nCome now, you rich men, weep and howl for your miseries that shall come upon you. 2 Your riches are corrupted and your garments are moth-eaten. 3 Your gold and silver are corroded, and their corrosion will be a witness against you and will eat your flesh like fire. You have stored up treasures for the last days. 4 Indeed the wages that you kept back by fraud from the laborers who harvested your fields are crying, and the cries of those who harvested have entered into the ears of the Lord of Hosts. 5 You have lived in pleasure on the earth and have been wayward. You have nourished your hearts as in a day of slaughter.\r\nSo much of the time we focus on the other great sins that we see all around us, but the truth is that one of the greatest sins of all in our world today is the sin of greed.\r\n\r\nThe borrower is the servant of the lender, and the global elite have used various forms of debt to turn the rest of the planet into their debt slaves.\r\n\r\nAs debt levels race higher and higher all over the planet, the elite are using the magic of compound interest to grab a bigger and bigger share of the pie.\r\n\r\nGiven enough time, those at the very top would have virtually everything and the rest of us would have virtually nothing. The middle class is shrinking all over the globe, and the gap between the wealthy and the poor continues to grow at an astounding pace.\r\n\r\nBut the vast majority of people out there have no idea how money, debt, taxes and central banks really work, and so they have no idea that this is purposely being done to them.\r\n\r\nSo please share this article with as many people as you can. The truth is that we don’t have to have this much global poverty, and if we correctly identify the root causes of this poverty we can start working on some real solutions.\r\n\r\nAbout the author: Michael Snyder is the founder and publisher of The Economic Collapse Blog and The Most Important News. Michael’s controversial new book about Bible prophecy entitled “The Rapture Verdict” is available in paperback and for the Kindle on Amazon.com.');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `user_id` bigint(20) NOT NULL,
  `user_name` varchar(45) DEFAULT NULL,
  `user_username` varchar(45) DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  `bio` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`user_id`, `user_name`, `user_username`, `user_password`, `bio`) VALUES
(1, 'Jamie', 'jamie@test.ie', 'pbkdf2:sha1:1000$zn7YamXa$2917e1c3087b0bd1f10780947b6c9cd89131566c', 'Hello this is a sample body of text. Hello this is a sample body of text. Hello this is a sample body of text. Hello this is a sample body of text. Hello this is a sample body of text. Hello this is a sample body of text. Hello this is a sample body of text. Hello this is a sample body of text. Hello this is a sample body of text. Hello this is a sample body of text. Hello this is a sample body of text. Hello this is a sample body of text. Hello this is a sample body of text. Hello this is a sample body of text. Hello this is a sample body of text. Hello this is a sample body of text. '),
(2, 'John', 'John@Doe.ie', 'pbkdf2:sha1:1000$5sgyt3ag$aa1ec27b8ed4eeeaa7ee63342c474846b813f89e', ''),
(3, 'Mark', 'marky@mark.ie', 'pbkdf2:sha1:1000$KdeTRQaC$b0cce4fd825200381241599b49ff4b94bc199ecd', ''),
(4, 'mike', 'mike@mike.ie', 'pbkdf2:sha1:1000$W5q1xdYD$811ce72ee3ed05302f64d5a7d52c7c39d913d22f', ''),
(5, 'jane', 'janey@jane.ie', 'pbkdf2:sha1:1000$sAQsAfBX$f1064d972ca5bfa84ad16c172af5fcb8362f27fb', ''),
(6, 'lez', 'lez@lez.ie', 'pbkdf2:sha1:1000$BBAAueos$ac92195a692283b2328f7e11d2beb2cf55ceb9ed', ''),
(7, 'mack', 'macl@mack.ie', 'pbkdf2:sha1:1000$rar0T0JL$758c42a75abf5cd24acd400cfcae918f28329bff', ''),
(8, 'linda', 'linda@a.ie', 'pbkdf2:sha1:1000$SIY7MEXd$04dffea8cc9824f3926656d9cf494db8d3621784', ''),
(9, 'johnny', 'johnny@vegas.ie', 'pbkdf2:sha1:1000$vjWmqAwZ$0b2bc1780fb8613c6d0d20995f60648584a0913c', ''),
(10, 'lee', 'lee@lee.ie', 'pbkdf2:sha1:1000$6n0xZhUO$2f7cf22817835034e6db609b663bbecb013b4c58', ''),
(11, 'mick', 'mick@mick.ie', 'pbkdf2:sha1:1000$jofJZpdt$edda6abae3ee74ed6951b88130480b99b02f57b8', ''),
(12, 'jame', 'jame@jame.ie', 'pbkdf2:sha1:1000$uFb4u0MN$57d7d5d184d91f4b21edc0b736e48486cb09a7a7', ''),
(13, 'cian', 'cian@cian.ie', 'pbkdf2:sha1:1000$stJ1Upq6$e711d631bbc2c525da0fe5f1579a3e0e06a0ede5', ''),
(14, 'j', 'j@j.ie', 'pbkdf2:sha1:1000$8FmxcTY5$a36975729d84da3902926ecaf6da26dac2d1a6bd', ''),
(15, 'successful', 'success@suc.ie', 'pbkdf2:sha1:1000$rUXR7r7E$6f86c77ffa9015feedef1479b010cfcdb1e0fd64', ''),
(16, 'test', 'test@test.ie', 'pbkdf2:sha1:1000$C7Io44Ix$e89e179a3b79ca8b74d431388f5480d32c3135dc', ''),
(17, 'steve', 'steve@welsh.ie', 'pbkdf2:sha1:1000$mLlOb2r4$0decbdb250f64ff54b35449e5abc5c07148a26a4', ''),
(18, 'Robert', 'Robert@ryan.ie', 'pbkdf2:sha1:1000$BsUPW1ge$56c443027f589c99c8ff46f553e40af2cee04d41', ''),
(19, 'testing', 'test@testt.ie', 'pbkdf2:sha1:1000$OdBiODzu$686453291192da0f854497036f8f431174327735', ''),
(20, 'Martin', 'martin@martin.ie', 'pbkdf2:sha1:1000$ck6N0CVE$f49ebba1ec93b74eb273a9201ffc8fb482325e51', ''),
(21, 'Martin', 'm@mk.ie', 'pbkdf2:sha1:1000$zKWPy6kH$afcb47d9aecf748fcda0918440fbc8d50f45c614', ''),
(22, 'Brian', 'brianegan@gmit.ie', 'pbkdf2:sha1:1000$g8y68GMQ$408740c21b75672d00c86192efa3b2b0d636b879', ''),
(23, 'john', 'jon@j.ie', 'pbkdf2:sha1:1000$KKghbZo0$e144dd66a33b052fe64d59676f2f54429e1b3b27', ''),
(24, 'Donnie Donowittz', 'donnie@donnie.ie', 'pbkdf2:sha1:1000$lbnQDAL4$0a9ed53b351c867a38fd74540028f399c144f1e4', '');

-- --------------------------------------------------------

--
-- Table structure for table `user_posts`
--

CREATE TABLE `user_posts` (
  `user_id` varchar(45) NOT NULL,
  `date_time` varchar(45) NOT NULL,
  `post_content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_posts`
--

INSERT INTO `user_posts` (`user_id`, `date_time`, `post_content`) VALUES
('1', '2016-11-28 11:31:19.336150', 'hello'),
('1', '2016-11-28 11:43:40.646774', 'post2'),
('1', '2016-11-28 12:09:37.819931', 'jamuie'),
('1', '2016-11-28 12:33:41.763628', 'hello'),
('23', '2016-11-28 13:52:03.054832', 'hello I''m John'),
('3', '2016-11-28 15:42:14.866900', 'hello'),
('1', '2016-11-29 14:53:09.369225', 'hello again'),
('1', '2016-12-01 11:31:29.011719', 'post content '),
('1', '2016-12-01 18:06:52.589022', 'hello'),
('1', '2016-12-01 18:16:47.564703', 'Hello this is a sample body of text. Hello this is a sample body of text. Hello this is a sample body of text. Hello this is a sample body of text. Hello this is a sample body of text. Hello this is a sample body of text. Hello this is a sample body of text. Hello this is a sample body of text. Hello this is a sample body of text. Hello this is a sample body of text. Hello this is a sample body of text. Hello this is a sample body of text. Hello this is a sample body of text. Hello this is a sample body of text. Hello this is a sample body of text. Hello this is a sample body of text.'),
('24', '2016-12-01 18:44:54.732559', 'hello'),
('24', '2016-12-01 18:45:17.113890', 'world'),
('24', '2016-12-01 18:45:26.091558', 'again'),
('7', '2016-12-01 18:48:38.210760', 'text'),
('9', '2016-12-01 19:13:17.930878', 'hello');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `user_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
