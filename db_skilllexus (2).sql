-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 13 Jun 2025 pada 09.06
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_skilllexus`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `accounts`
--

CREATE TABLE `accounts` (
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `accounts`
--

INSERT INTO `accounts` (`username`, `password`, `email`) VALUES
('najwa', '1', 'najwa@gmail.com'),
('tes', '1', 'tes@gmail.com');

-- --------------------------------------------------------

--
-- Struktur dari tabel `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `sender_username` varchar(50) DEFAULT NULL,
  `receiver_username` varchar(50) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `skill`
--

CREATE TABLE `skill` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `owner_username` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `skill`
--

INSERT INTO `skill` (`id`, `name`, `category`, `description`, `owner_username`) VALUES
(22, 'nyanyi', 'music', 'bisa nyanyi lagu barat', 'najwa'),
(23, 'coding', 'programming', 'bisa java', 'tes');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tradepost`
--

CREATE TABLE `tradepost` (
  `id` int(11) NOT NULL,
  `owner_username` varchar(50) DEFAULT NULL,
  `desired_skill_id` int(11) DEFAULT NULL,
  `offered_skill_id` int(11) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tradepost`
--

INSERT INTO `tradepost` (`id`, `owner_username`, `desired_skill_id`, `offered_skill_id`, `description`) VALUES
(10, 'tes', 22, 23, 'No description provided');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `username` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`username`) VALUES
('najwa'),
('tes');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`username`);

--
-- Indeks untuk tabel `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sender_username` (`sender_username`),
  ADD KEY `receiver_username` (`receiver_username`);

--
-- Indeks untuk tabel `skill`
--
ALTER TABLE `skill`
  ADD PRIMARY KEY (`id`),
  ADD KEY `owner_username` (`owner_username`);

--
-- Indeks untuk tabel `tradepost`
--
ALTER TABLE `tradepost`
  ADD PRIMARY KEY (`id`),
  ADD KEY `owner_username` (`owner_username`),
  ADD KEY `desired_skill_id` (`desired_skill_id`),
  ADD KEY `offered_skill_id` (`offered_skill_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT untuk tabel `skill`
--
ALTER TABLE `skill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `tradepost`
--
ALTER TABLE `tradepost`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`sender_username`) REFERENCES `users` (`username`),
  ADD CONSTRAINT `message_ibfk_2` FOREIGN KEY (`receiver_username`) REFERENCES `users` (`username`);

--
-- Ketidakleluasaan untuk tabel `skill`
--
ALTER TABLE `skill`
  ADD CONSTRAINT `skill_ibfk_1` FOREIGN KEY (`owner_username`) REFERENCES `users` (`username`);

--
-- Ketidakleluasaan untuk tabel `tradepost`
--
ALTER TABLE `tradepost`
  ADD CONSTRAINT `tradepost_ibfk_1` FOREIGN KEY (`owner_username`) REFERENCES `users` (`username`),
  ADD CONSTRAINT `tradepost_ibfk_2` FOREIGN KEY (`desired_skill_id`) REFERENCES `skill` (`id`),
  ADD CONSTRAINT `tradepost_ibfk_3` FOREIGN KEY (`offered_skill_id`) REFERENCES `skill` (`id`);

--
-- Ketidakleluasaan untuk tabel `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`username`) REFERENCES `accounts` (`username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
