-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-08-2019 a las 18:07:29
-- Versión del servidor: 10.1.26-MariaDB
-- Versión de PHP: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `saja`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `ACTUALIZAR_ACUDIENTE` (IN `IdAcuAntiguo` VARCHAR(15), IN `IdAcuAct` VARCHAR(15), IN `NomAcu` VARCHAR(20), IN `ApeAcu` VARCHAR(20), IN `ParentescoAcu` VARCHAR(20), IN `OcupacionAcu` VARCHAR(30), IN `DireccionAcu` VARCHAR(30), IN `TelefonoAcu` VARCHAR(15), IN `CorreoAcu` VARCHAR(30))  NO SQL
update acudientes set IdAcudiente=IdAcuAct, NomAcudiente=NomAcu, ApeAcudiente=ApeAcu, TipoAcudiente=ParentescoAcu, OcupacionAcudiente=OcupacionAcu, DireccionAcudiente=DireccionAcu, TelefonoAcudiente=TelefonoAcu, EmailAcudiente=CorreoAcu where IdAcudiente=IdAcuAntiguo$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ACTUALIZAR_AÑO_ESCOLAR` (IN `CjaCurso` INT, IN `CjaDirector` VARCHAR(15), IN `CjaJornada` VARCHAR(20), IN `CjaAño` VARCHAR(10), IN `DispoCupos` INT, IN `ID` INT, IN `CantEstud` INT, IN `Grado` VARCHAR(15))  update año_escolar set IdNombreGrado=Grado, curso=CjaCurso, IdDirector= CjaDirector, Jornada=CjaJornada,FechaAño=CjaAño, CantiEstudiantes = CantEstud,CuposDisponibles=DispoCupos where IdAño = ID$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ACTUALIZAR_DIRECTOR` (IN `ID` VARCHAR(15), IN `NOMBRES` VARCHAR(20), IN `APELLIDOS` VARCHAR(20), IN `ESTADO` VARCHAR(10), IN `ACTUAL` VARCHAR(15))  NO SQL
UPDATE directores SET IdDirector=ID, NomDirector=NOMBRES, ApeDirector=APELLIDOS, Estado=ESTADO WHERE IdDirector=ACTUAL$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ACTUALIZAR_ESTUDIANTE` (IN `IdAntiguo` VARCHAR(15), IN `IdEst` VARCHAR(15), IN `IdAcu` VARCHAR(15), IN `Nombres` VARCHAR(20), IN `Apellidos` VARCHAR(20), IN `Fecha` DATE, IN `Genero` VARCHAR(10), IN `Direccion` VARCHAR(30), IN `Telefono` VARCHAR(15), IN `Procedencia` VARCHAR(30), IN `Tipo` VARCHAR(10))  update estudiantes set IdEstudiante=IdEst, IdAcudiente=IdAcu, NomEstudiante=Nombres, ApeEstudiante=Apellidos, FechaNacimiento=Fecha, GeneroEstudiante=Genero, DireccionEstudiante=Direccion, TelefonoEstudiante=Telefono, ColegioProcedencia=Procedencia, TipoEstudiante=Tipo  where IdEstudiante=IdAntiguo$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ACTUALIZAR_GRADO` (IN `IdGrad` VARCHAR(15), IN `Est` VARCHAR(10))  NO SQL
update grados set IdNombreGrado=IdGrad, Estado=Est where IdNombreGrado = IdGrad$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ACTUALIZAR_MATRÍCULA` (IN `IdMat` INT, IN `IdA` INT, IN `IdEst` VARCHAR(15), IN `IdUser` VARCHAR(15), IN `Estad` VARCHAR(10), IN `Ant` VARCHAR(5))  NO SQL
update matriculas set matriculas.IdAño=IdA, matriculas.IdEstudiante=IdEst,
matriculas.IdUsuario=IdUser, matriculas.Estado=Estad, matriculas.Antiguo=Ant where matriculas.IdMatricula=IdMat$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ACTUALIZAR_ROL` (IN `IdRolAntiguo` VARCHAR(15), IN `IdRol` VARCHAR(15), IN `Est` VARCHAR(10))  NO SQL
    COMMENT 'actualizar tabla roles'
update roles set IdNombreRol=IdRol, Estado = Est where IdNombreRol = IdRolAntiguo$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ACTUALIZAR_USUARIO` (IN `IdUserAntiguo` VARCHAR(15), IN `IdUser` VARCHAR(15), IN `IdCargo` VARCHAR(15), IN `Nombres` VARCHAR(20), IN `Apellidos` VARCHAR(20), IN `Est` VARCHAR(10))  update usuarios set usuarios.IdUsuario = IdUser, usuarios.IdNombreRol=IdCargo, usuarios.NomUsuario=Nombres, usuarios.ApeUsuario=Apellidos, usuarios.FechaIngreso=now(), usuarios.Estado=Est where usuarios.IdUsuario=IdUserAntiguo$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ACTUALIZAR_USUARIO_CONTRASEÑA` (IN `Nick1` VARCHAR(15), IN `NickNuevo` VARCHAR(15), IN `ContraNueva` VARCHAR(15))  update usuarios set NickName=NickNuevo, Contraseña=ContraNueva where NickName=Nick1$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AGREGAR_ACUDIENTES` (IN `IdAcu` VARCHAR(15), IN `NomAcu` VARCHAR(20), IN `ApeAcu` VARCHAR(20), IN `TipoAcu` VARCHAR(20), IN `OcupacionAcu` VARCHAR(30), IN `DireccionAcu` VARCHAR(30), IN `TelefonoAcu` VARCHAR(15), IN `EmailAcu` VARCHAR(30))  insert into acudientes values(IdAcu, NomAcu, ApeAcu, TipoAcu, OcupacionAcu, DireccionAcu, TelefonoAcu, EmailAcu)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AGREGAR_DIRECTOR` (IN `IdDir` VARCHAR(15), IN `NomDir` VARCHAR(20), IN `ApeDir` VARCHAR(20))  NO SQL
insert into directores values(IdDir, NomDir, ApeDir, "ACTIVO")$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AGREGAR_ESTUDIANTE` (IN `IdEst` VARCHAR(15), IN `IdAcu` VARCHAR(15), IN `NomEst` VARCHAR(20), IN `ApeEst` VARCHAR(20), IN `FechaN` DATE, IN `GeneroEst` VARCHAR(10), IN `DireccionEst` VARCHAR(30), IN `TelefonoEst` VARCHAR(15), IN `ColegioProcede` VARCHAR(30), IN `TipoEst` VARCHAR(10))  NO SQL
insert into estudiantes values(IdEst, IdAcu, NomEst, ApeEst, FechaN, GeneroEst, DireccionEst, TelefonoEst, ColegioProcede, TipoEst)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AGREGAR_USUARIO` (IN `IdUser` VARCHAR(15), IN `IdNomRol1` VARCHAR(15), IN `Nick` VARCHAR(15), IN `Contra` VARCHAR(15), IN `NomUser` VARCHAR(20), IN `ApeUser` VARCHAR(20))  insert into usuarios values(IdUser, IdNomRol1,  NomUser, ApeUser, now(), "ACTIVO",Nick, Contra)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AÑADIR_AÑO_ESCOLAR` (IN `IdGr` VARCHAR(15), IN `IdDir` VARCHAR(15), IN `Curso1` INT, IN `Jornada1` VARCHAR(15), IN `Cupos` INT, IN `AñoE` DATE)  insert into año_escolar(IdNombreGrado,IdDirector,Curso,Jornada, FechaAño,CantiEstudiantes,CuposDisponibles) values(IdGr, IdDir, Curso1 , Jornada1, AñoE, 0 , Cupos)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AÑADIR_GRADO` (IN `NomGr` VARCHAR(15))  INSERT INTO grados VALUES(NomGr, "ACTIVO")$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AÑADIR_MATRICULA` (IN `IdCurso1` INT, IN `IdEst` VARCHAR(15), IN `IdUser` VARCHAR(15), IN `Antiguo` VARCHAR(5))  NO SQL
insert into matriculas (IdAño, IdEstudiante, IdUsuario, Estado,Antiguo) values(IdCurso1, IdEst, IdUser, "ACTIVO", Antiguo)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AÑADIR_OBSERVATORIO` (IN `IdEst` VARCHAR(15), IN `SeguimientoAcad` TEXT, IN `SeguimientoDisc` TEXT, IN `Compromiso` TEXT, IN `InfoMedica` TEXT)  insert into caracterizador(IdEstudiante, SeguimientoAcademico, SeguimientoDisciplinario, FechaSeguimiento, Compromiso, InformacionMedica) values( IdEst, SeguimientoAcad, SeguimientoDisc, now(), Compromiso, InfoMedica)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AÑADIR_ROL` (IN `IdNomRol` VARCHAR(15))  insert into roles values(IdNomRol, "ACTIVO")$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acudientes`
--

CREATE TABLE `acudientes` (
  `IdAcudiente` varchar(15) COLLATE utf8_bin NOT NULL,
  `NomAcudiente` varchar(20) COLLATE utf8_bin NOT NULL,
  `ApeAcudiente` varchar(20) COLLATE utf8_bin NOT NULL,
  `TipoAcudiente` varchar(20) COLLATE utf8_bin NOT NULL,
  `OcupacionAcudiente` varchar(30) COLLATE utf8_bin NOT NULL,
  `DireccionAcudiente` varchar(30) COLLATE utf8_bin NOT NULL,
  `TelefonoAcudiente` varchar(15) COLLATE utf8_bin NOT NULL,
  `EmailAcudiente` varchar(30) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `acudientes`
--

INSERT INTO `acudientes` (`IdAcudiente`, `NomAcudiente`, `ApeAcudiente`, `TipoAcudiente`, `OcupacionAcudiente`, `DireccionAcudiente`, `TelefonoAcudiente`, `EmailAcudiente`) VALUES
('1898', 'KAREN', 'GONZALEZ', 'MADRE', 'AMA DE CASA', 'CRR 32 NUMERO 10-12', '3025845743', 'KAREN@GMAIL.COM');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `año_escolar`
--

CREATE TABLE `año_escolar` (
  `IdAño` int(11) NOT NULL,
  `IdNombreGrado` varchar(15) COLLATE utf8_bin NOT NULL,
  `IdDirector` varchar(15) COLLATE utf8_bin NOT NULL,
  `Curso` int(11) NOT NULL,
  `Jornada` varchar(15) COLLATE utf8_bin NOT NULL,
  `FechaAño` date NOT NULL,
  `CantiEstudiantes` int(11) NOT NULL,
  `CuposDisponibles` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `año_escolar`
--

INSERT INTO `año_escolar` (`IdAño`, `IdNombreGrado`, `IdDirector`, `Curso`, `Jornada`, `FechaAño`, `CantiEstudiantes`, `CuposDisponibles`) VALUES
(1, 'SEGUNDO', '125', 1, 'MAÑANA', '2019-07-23', 0, 30),
(3, 'SEGUNDO', '125', 2, 'MAÑANA', '2019-07-20', 1, 19),
(4, 'SEGUNDO', '125', 3, 'MAÑANA', '2019-07-13', 0, 20),
(5, 'SEGUNDO', '125', 4, 'MAÑANA', '2019-07-13', 0, 20),
(6, 'SEGUNDO', '125', 5, 'MAÑANA', '2019-07-13', 0, 30),
(7, 'SEGUNDO', '125', 6, 'MAÑANA', '2019-07-13', 0, 16),
(8, 'SEGUNDO', '125', 7, 'MAÑANA', '2019-07-13', 0, 25),
(11, 'SEGUNDO', '125', 10, 'MAÑANA', '2019-07-13', 0, 40);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caracterizador`
--

CREATE TABLE `caracterizador` (
  `IdObservatorio` int(11) NOT NULL,
  `IdEstudiante` varchar(15) COLLATE utf8_bin NOT NULL,
  `SeguimientoAcademico` text COLLATE utf8_bin NOT NULL,
  `SeguimientoDisciplinario` text COLLATE utf8_bin NOT NULL,
  `FechaSeguimiento` date NOT NULL,
  `Compromiso` text COLLATE utf8_bin NOT NULL,
  `InformacionMedica` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `caracterizador`
--

INSERT INTO `caracterizador` (`IdObservatorio`, `IdEstudiante`, `SeguimientoAcademico`, `SeguimientoDisciplinario`, `FechaSeguimiento`, `Compromiso`, `InformacionMedica`) VALUES
(1, '1234792165', 'NO HACE TAREAS', 'HABLA MUCHO Y NO PONE CUIDADO', '2019-07-30', 'SE COMPROMETE A HACER LAS TAREAS', 'NINGUNA'),
(2, '1234792165', 'LLLLLLLLLLLLL', 'KKKKKKKKKKKKKK', '2019-07-30', 'FFFFFFFFFFFFFFFFFFFF', 'DDDDDDDDDDDDDDDD'),
(3, '1234792165', 'NN', 'NN', '2019-07-31', 'NN', 'NN');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `directores`
--

CREATE TABLE `directores` (
  `IdDirector` varchar(15) COLLATE utf8_bin NOT NULL,
  `NomDirector` varchar(20) COLLATE utf8_bin NOT NULL,
  `ApeDirector` varchar(20) COLLATE utf8_bin NOT NULL,
  `Estado` varchar(10) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `directores`
--

INSERT INTO `directores` (`IdDirector`, `NomDirector`, `ApeDirector`, `Estado`) VALUES
('125', 'ESTELA', 'GUTIERREZ', 'ACTIVO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiantes`
--

CREATE TABLE `estudiantes` (
  `IdEstudiante` varchar(15) COLLATE utf8_bin NOT NULL,
  `IdAcudiente` varchar(15) COLLATE utf8_bin NOT NULL,
  `NomEstudiante` varchar(20) COLLATE utf8_bin NOT NULL,
  `ApeEstudiante` varchar(20) COLLATE utf8_bin NOT NULL,
  `FechaNacimiento` date NOT NULL,
  `GeneroEstudiante` varchar(10) COLLATE utf8_bin NOT NULL,
  `DireccionEstudiante` varchar(30) COLLATE utf8_bin NOT NULL,
  `TelefonoEstudiante` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `ColegioProcedencia` varchar(30) COLLATE utf8_bin NOT NULL,
  `TipoEstudiante` varchar(10) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `estudiantes`
--

INSERT INTO `estudiantes` (`IdEstudiante`, `IdAcudiente`, `NomEstudiante`, `ApeEstudiante`, `FechaNacimiento`, `GeneroEstudiante`, `DireccionEstudiante`, `TelefonoEstudiante`, `ColegioProcedencia`, `TipoEstudiante`) VALUES
('12', '1898', 'CARLOS', 'SUAREZ', '2002-07-11', 'MASCULINO', 'CALLE 12 N 32 12', '3001247859', 'JUANITA DE ARCO', 'ANTIGUO'),
('1234792165', '1898', 'DAVID', 'MURCIA', '1999-10-12', 'MASCULINO', 'MZ 32 CASA 22', '3024332123', 'JUAN PABLO II', 'ANTIGUO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grados`
--

CREATE TABLE `grados` (
  `IdNombreGrado` varchar(15) COLLATE utf8_bin NOT NULL,
  `Estado` varchar(10) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `grados`
--

INSERT INTO `grados` (`IdNombreGrado`, `Estado`) VALUES
('SEGUNDO', 'ACTIVO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `matriculas`
--

CREATE TABLE `matriculas` (
  `IdMatricula` int(11) NOT NULL,
  `IdAño` int(11) NOT NULL,
  `IdEstudiante` varchar(15) COLLATE utf8_bin NOT NULL,
  `IdUsuario` varchar(15) COLLATE utf8_bin NOT NULL,
  `Estado` varchar(10) COLLATE utf8_bin NOT NULL,
  `Antiguo` varchar(5) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `matriculas`
--

INSERT INTO `matriculas` (`IdMatricula`, `IdAño`, `IdEstudiante`, `IdUsuario`, `Estado`, `Antiguo`) VALUES
(1, 3, '1234792165', '165', 'ACTIVO', 'SI');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `IdNombreRol` varchar(15) COLLATE utf8_bin NOT NULL,
  `Estado` varchar(10) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`IdNombreRol`, `Estado`) VALUES
('ADMINISTRADOR', 'ACTIVO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `IdUsuario` varchar(15) COLLATE utf8_bin NOT NULL,
  `IdNombreRol` varchar(15) COLLATE utf8_bin NOT NULL,
  `NomUsuario` varchar(20) COLLATE utf8_bin NOT NULL,
  `ApeUsuario` varchar(20) COLLATE utf8_bin NOT NULL,
  `FechaIngreso` datetime NOT NULL,
  `Estado` varchar(10) COLLATE utf8_bin NOT NULL,
  `NickName` varchar(15) COLLATE utf8_bin NOT NULL,
  `Contraseña` varchar(15) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`IdUsuario`, `IdNombreRol`, `NomUsuario`, `ApeUsuario`, `FechaIngreso`, `Estado`, `NickName`, `Contraseña`) VALUES
('165', 'ADMINISTRADOR', 'DAVID', 'MURCIA', '2019-08-03 11:00:29', 'ACTIVO', 'DAVID', '123');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acudientes`
--
ALTER TABLE `acudientes`
  ADD PRIMARY KEY (`IdAcudiente`);

--
-- Indices de la tabla `año_escolar`
--
ALTER TABLE `año_escolar`
  ADD PRIMARY KEY (`IdAño`),
  ADD KEY `IdDirector` (`IdDirector`),
  ADD KEY `IdGrado` (`IdNombreGrado`);

--
-- Indices de la tabla `caracterizador`
--
ALTER TABLE `caracterizador`
  ADD PRIMARY KEY (`IdObservatorio`),
  ADD KEY `IdEstudiante` (`IdEstudiante`);

--
-- Indices de la tabla `directores`
--
ALTER TABLE `directores`
  ADD PRIMARY KEY (`IdDirector`);

--
-- Indices de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD PRIMARY KEY (`IdEstudiante`),
  ADD KEY `IdAcudiente` (`IdAcudiente`);

--
-- Indices de la tabla `grados`
--
ALTER TABLE `grados`
  ADD PRIMARY KEY (`IdNombreGrado`);

--
-- Indices de la tabla `matriculas`
--
ALTER TABLE `matriculas`
  ADD PRIMARY KEY (`IdMatricula`),
  ADD KEY `IdCurso` (`IdAño`),
  ADD KEY `IdEstudiante` (`IdEstudiante`),
  ADD KEY `IdUsuario` (`IdUsuario`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`IdNombreRol`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`IdUsuario`),
  ADD KEY `IdNombreRol` (`IdNombreRol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `año_escolar`
--
ALTER TABLE `año_escolar`
  MODIFY `IdAño` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `caracterizador`
--
ALTER TABLE `caracterizador`
  MODIFY `IdObservatorio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `matriculas`
--
ALTER TABLE `matriculas`
  MODIFY `IdMatricula` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `año_escolar`
--
ALTER TABLE `año_escolar`
  ADD CONSTRAINT `año_escolar_ibfk_1` FOREIGN KEY (`IdDirector`) REFERENCES `directores` (`IdDirector`) ON UPDATE CASCADE,
  ADD CONSTRAINT `año_escolar_ibfk_2` FOREIGN KEY (`IdNombreGrado`) REFERENCES `grados` (`IdNombreGrado`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `caracterizador`
--
ALTER TABLE `caracterizador`
  ADD CONSTRAINT `caracterizador_ibfk_1` FOREIGN KEY (`IdEstudiante`) REFERENCES `estudiantes` (`IdEstudiante`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD CONSTRAINT `estudiantes_ibfk_1` FOREIGN KEY (`IdAcudiente`) REFERENCES `acudientes` (`IdAcudiente`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `matriculas`
--
ALTER TABLE `matriculas`
  ADD CONSTRAINT `matriculas_ibfk_1` FOREIGN KEY (`IdUsuario`) REFERENCES `usuarios` (`IdUsuario`) ON UPDATE CASCADE,
  ADD CONSTRAINT `matriculas_ibfk_2` FOREIGN KEY (`IdEstudiante`) REFERENCES `estudiantes` (`IdEstudiante`) ON UPDATE CASCADE,
  ADD CONSTRAINT `matriculas_ibfk_3` FOREIGN KEY (`IdAño`) REFERENCES `año_escolar` (`IdAño`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`IdNombreRol`) REFERENCES `roles` (`IdNombreRol`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
