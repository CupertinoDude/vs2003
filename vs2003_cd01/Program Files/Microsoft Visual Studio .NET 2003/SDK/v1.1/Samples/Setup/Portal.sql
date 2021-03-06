IF (CHARINDEX('4.2', @@version) > 0 OR
    CHARINDEX('6.00', @@version) > 0 OR
    CHARINDEX('6.50', @@version) > 0 )

   CREATE DATABASE Portal ON DEFAULT = 3
ELSE
   CREATE DATABASE Portal
GO

USE Portal
GO

/****** Object:  Stored Procedure dbo.CreatePersonalizationAccount    Script Date: 11/9/2000 1:26:28 PM ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[CreatePersonalizationAccount]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CreatePersonalizationAccount]
GO

/****** Object:  Stored Procedure dbo.GetPublicModules    Script Date: 11/9/2000 1:26:28 PM ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[GetPublicModules]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetPublicModules]
GO

/****** Object:  Stored Procedure dbo.GetSiteLinks    Script Date: 11/9/2000 1:26:28 PM ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[GetSiteLinks]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetSiteLinks]
GO

/****** Object:  Stored Procedure dbo.LoadPersonalizationSettings    Script Date: 11/9/2000 1:26:28 PM ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[LoadPersonalizationSettings]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[LoadPersonalizationSettings]
GO

/****** Object:  Stored Procedure dbo.SavePersonalizationSettings    Script Date: 11/9/2000 1:26:28 PM ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[SavePersonalizationSettings]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SavePersonalizationSettings]
GO

/****** Object:  Stored Procedure dbo.sp_CreateProfile    Script Date: 11/9/2000 1:26:28 PM ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[sp_CreateProfile]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_CreateProfile]
GO

/****** Object:  Stored Procedure dbo.sp_ValidateUser    Script Date: 11/9/2000 1:26:28 PM ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[sp_ValidateUser]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ValidateUser]
GO

/****** Object:  Table [dbo].[Modules]    Script Date: 11/9/2000 1:26:28 PM ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[Modules]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Modules]
GO

/****** Object:  Table [dbo].[personalization]    Script Date: 11/9/2000 1:26:28 PM ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[personalization]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[personalization]
GO

/****** Object:  Table [dbo].[SiteDirectory]    Script Date: 11/9/2000 1:26:28 PM ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[SiteDirectory]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SiteDirectory]
GO

/****** Object:  Table [dbo].[UserData]    Script Date: 11/9/2000 1:26:28 PM ******/
if exists (select * from sysobjects where id = object_id(N'[dbo].[UserData]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[UserData]
GO

/****** Object:  Table [dbo].[Modules]    Script Date: 11/9/2000 1:26:32 PM ******/
CREATE TABLE [dbo].[Modules] (
	[Name] [nvarchar] (50) NOT NULL ,
	[Description] [ntext] NULL ,
	[Type] [nvarchar] (1) NOT NULL ,
	[Source] [nvarchar] (255) NOT NULL ,
	[DemoSource] [nvarchar] (255) NULL ,
	[Private] [bit] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[personalization]    Script Date: 11/9/2000 1:26:32 PM ******/
CREATE TABLE [dbo].[personalization] (
	[UserId] [nvarchar] (50) NOT NULL ,
	[PageNames] [ntext] NULL ,
	[PageModules_0L] [ntext] NULL ,
	[PageModules_0R] [ntext] NULL ,
	[PageModules_1L] [ntext] NULL ,
	[PageModules_1R] [ntext] NULL ,
	[PageModules_2L] [ntext] NULL ,
	[PageModules_2R] [ntext] NULL ,
	[PageIndex] [nvarchar] (50) NULL ,
	[SiteDirectory_Links] [nvarchar] (200) NULL ,
	[BackColor] [nvarchar] (15) NULL ,
	[LeftColor] [nvarchar] (15) NULL ,
	[HeadColor] [nvarchar] (15) NULL ,
	[SubheadColor] [nvarchar] (15) NULL ,
	[ColorScheme] [nvarchar] (15) NULL ,
	[FavoriteLinks_List] [ntext] NULL ,
	[FavoriteLinksLeft_List] [ntext] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[SiteDirectory]    Script Date: 11/9/2000 1:26:32 PM ******/
CREATE TABLE [dbo].[SiteDirectory] (
	[LinkIndex] [int] NOT NULL ,
	[LinkName] [nvarchar] (50) NOT NULL ,
	[LinkRef] [nvarchar] (255) NOT NULL ,
	[LinkDescription] [ntext] NULL ,
	[UserData] [bit] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[UserData]    Script Date: 11/9/2000 1:26:32 PM ******/
CREATE TABLE [dbo].[UserData] (
	[UserId] [nvarchar] (20) NOT NULL ,
	[Password] [nvarchar] (15) NOT NULL ,
	[FirstName] [nvarchar] (15) NULL ,
	[LastName] [nvarchar] (15) NULL ,
	[Address] [nvarchar] (50) NULL ,
	[State] [nvarchar] (2) NULL ,
	[Zip] [nvarchar] (5) NULL ,
	[Phone] [nvarchar] (15) NULL ,
	[City] [nvarchar] (50) NULL 
) ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER  OFF    SET ANSI_NULLS  ON 
GO

/****** Object:  Stored Procedure dbo.CreatePersonalizationAccount    Script Date: 11/9/2000 1:26:32 PM ******/



CREATE  Procedure CreatePersonalizationAccount
 (
  @UserId varchar(50)
 )
As
   DECLARE @PageNames varchar(8000)
   DECLARE @PageModules_0L varchar(8000)
   DECLARE @PageModules_0R varchar(8000)
   DECLARE @PageModules_1L varchar(8000)
   DECLARE @PageModules_1R varchar(8000)
   DECLARE @PageModules_2L varchar(8000)
   DECLARE @PageModules_2R varchar(8000)
   DECLARE @PageIndex NVARCHAR(50)
   DECLARE @BackColor nvarchar(15)
   DECLARE @LeftColor nvarchar(15)
   DECLARE @HeadColor nvarchar(15)
   DECLARE @SubheadColor nvarchar(15)
   DECLARE @ColorScheme nvarchar(15)
   DECLARE @SiteDirectory_Links NVARCHAR(200)
   DECLARE @CM_Constructors  varchar(5)  
   DECLARE @CM_Properties  varchar(5)  
   DECLARE @CM_Methods varchar(5) 
   DECLARE @CM_Fields varchar(5) 
   DECLARE @CM_Implements varchar(5) 
   DECLARE @CM_Hierarchy varchar(5) 
   DECLARE  @CM_Subclasses varchar(5)
   DECLARE @FavoriteLinks_List varchar(8000)
   DECLARE @FavoriteLinksLeft_List varchar(8000)                           
   SELECT @PageNames = CONVERT(varchar(8000),PageNames), 
    @PageModules_0L = CONVERT(varchar(8000),PageModules_0L), 
    @PageModules_0R = CONVERT(varchar(8000),PageModules_0R),
    @PageModules_1L = CONVERT(varchar(8000),PageModules_1L), 
    @PageModules_1R = CONVERT(varchar(8000),PageModules_1R),
    @PageModules_2L = CONVERT(varchar(8000),PageModules_2L), 
    @PageModules_2R = CONVERT(varchar(8000),PageModules_2R),
    @PageIndex = PageIndex,
    @SiteDirectory_Links = SiteDirectory_Links,
    @BackColor = BackColor,
    @LeftColor = LeftColor,
    @HeadColor = HeadColor,
    @SubheadColor = SubheadColor,
    @ColorScheme = ColorScheme,
    @FavoriteLinks_List = CONVERT(varchar(8000),FavoriteLinks_List),
    @FavoriteLinksLeft_List = CONVERT(varchar(8000),FavoriteLinksLeft_List)
       
    FROM Personalization Where UserId='DEFAULT'
   INSERT INTO Personalization Values ( @UserId, 
        @PageNames, 
        @PageModules_0L, 
        @PageModules_0R, 
        @PageModules_1L, 
        @PageModules_1R, 
        @PageModules_2L,
        @PageModules_2R,
        @PageIndex,
        @SiteDirectory_Links,
        @BackColor,
        @LeftColor,
        @HeadColor,
        @SubheadColor,
        @ColorScheme,
        @FavoriteLinks_List,
        @FavoriteLinksLeft_List
         )
  return


GO

SET QUOTED_IDENTIFIER  OFF    SET ANSI_NULLS  ON 
GO

SET QUOTED_IDENTIFIER  OFF    SET ANSI_NULLS  ON 
GO

/****** Object:  Stored Procedure dbo.GetPublicModules    Script Date: 11/9/2000 1:26:33 PM ******/


CREATE Procedure GetPublicModules As
 SELECT * FROM Modules WHERE Private != 1
 return 


GO

SET QUOTED_IDENTIFIER  OFF    SET ANSI_NULLS  ON 
GO

SET QUOTED_IDENTIFIER  OFF    SET ANSI_NULLS  ON 
GO

/****** Object:  Stored Procedure dbo.GetSiteLinks    Script Date: 11/9/2000 1:26:33 PM ******/



Create Procedure GetSiteLinks As
            SELECT * FROM SiteDirectory
 return 


GO

SET QUOTED_IDENTIFIER  OFF    SET ANSI_NULLS  ON 
GO

SET QUOTED_IDENTIFIER  OFF    SET ANSI_NULLS  ON 
GO

/****** Object:  Stored Procedure dbo.LoadPersonalizationSettings    Script Date: 11/9/2000 1:26:33 PM ******/


CREATE Procedure LoadPersonalizationSettings
 (
  @UserId nvarchar(50)
 )
As
 SELECT * FROM Personalization WHERE UserID=@UserId
 return 


GO

SET QUOTED_IDENTIFIER  OFF    SET ANSI_NULLS  ON 
GO

SET QUOTED_IDENTIFIER  OFF    SET ANSI_NULLS  ON 
GO

/****** Object:  Stored Procedure dbo.SavePersonalizationSettings    Script Date: 11/9/2000 1:26:33 PM ******/


CREATE Procedure SavePersonalizationSettings
 (
  @UserId nvarchar(50),
  @PageNames varchar(8000),
  @PageModules_0L varchar(8000),
  @PageModules_0R varchar(8000),
  @PageModules_1L varchar(8000),
  @PageModules_1R varchar(8000),
  @PageModules_2L varchar(8000),
  @PageModules_2R varchar(8000),
  @PageIndex nvarchar(200),
  @SiteDirectory_Links nvarchar(200),
  @BackColor nvarchar(15),
  @LeftColor nvarchar(15),
  @HeadColor nvarchar(15),
  @SubheadColor nvarchar(15),
  @ColorScheme nvarchar(15),
  @FavoriteLinks_List varchar(8000),
  @FavoriteLinksLeft_List varchar(8000)
 )
As
 UPDATE Personalization 
  SET 
   PageNames=@PageNames, 
   PageModules_0L=@PageModules_0L, 
   PageModules_0R=@PageModules_0R, 
   PageModules_1L=@PageModules_1L, 
   PageModules_1R=@PageModules_1R, 
   PageModules_2L=@PageModules_2L, 
   PageModules_2R=@PageModules_2R,
   PageIndex=@PageIndex,
   SiteDirectory_Links = @SiteDIrectory_Links,
   BackColor = @BackColor,
   LeftColor = @LeftColor,
   HeadColor = @HeadColor,
   SubheadColor = @SubheadColor,
   ColorScheme = @ColorScheme,
   FavoriteLinks_List = @FavoriteLinks_List,
   FavoriteLinksLeft_List = @FavoriteLinksLeft_List 
  WHERE UserId=@UserID
 /* set nocount on */
 return 


GO

SET QUOTED_IDENTIFIER  OFF    SET ANSI_NULLS  ON 
GO

SET QUOTED_IDENTIFIER  OFF    SET ANSI_NULLS  ON 
GO

/****** Object:  Stored Procedure dbo.sp_CreateProfile    Script Date: 11/9/2000 1:26:33 PM ******/




CREATE proc sp_CreateProfile @UserId nvarchar(20), @Password nvarchar(15), @FirstName nvarchar(15), @LastName nvarchar(15),
@Address nvarchar(50), @State nvarchar(2), @Zip nvarchar(5), @Phone nvarchar(15),@City nvarchar(50)
as
if (Select Count(*) from UserData where UserID=@UserId) = 0
    insert into UserData 
        values (@UserId , @Password , @FirstName , @LastName ,@Address, @State, @Zip, @Phone ,@City )
else
     RAISERROR ('The username you entered already exists in the database.',16,1)
return


GO

SET QUOTED_IDENTIFIER  OFF    SET ANSI_NULLS  ON 
GO

SET QUOTED_IDENTIFIER  OFF    SET ANSI_NULLS  ON 
GO

/****** Object:  Stored Procedure dbo.sp_ValidateUser    Script Date: 11/9/2000 1:26:33 PM ******/



CREATE proc sp_ValidateUser  @UserId nvarchar(20), @Password nvarchar(15) , @IsValid Int  output
as 
if (select count(*) from UserData where Userid= @UserId and Password = @Password ) = 1
    select @ISValid = 1
else 
    select @IsValid = 0 
return


GO

SET QUOTED_IDENTIFIER  OFF    SET ANSI_NULLS  ON 
GO

-- point to proper DB 
use [Portal]
GO


/* Insert data into Modules table */
INSERT INTO Modules (Name,Description,Type,Source,DemoSource,Private) VALUES ("Login","Login module for the ASP.NET portal database.","L","Modules\Login\Login.ascx","../Modules/Login/Login_Demo.aspx",-1)
INSERT INTO Modules (Name,Description,Type,Source,DemoSource,Private) VALUES ("Site Directory","The Table of Contents for the ASP.NET Portal Site (recommended).","L","Modules\SiteDirectory\SiteDirectory.ascx","../Modules/SiteDirectory/SiteDirectory_Demo.aspx",0)
INSERT INTO Modules (Name,Description,Type,Source,DemoSource,Private) VALUES ("Favorite Links (Wide)","This module allows you to manage a list of hyperlinks to your most frequently used web resources.","R","Modules\FavoriteLinks\FavoriteLinks.ascx","../Modules/FavoriteLinks/FavoriteLinks_Demo.aspx",0)
INSERT INTO Modules (Name,Description,Type,Source,DemoSource,Private) VALUES ("Favorite Links (Thin)","This module allows you to manage a list of hyperlinks to your most frequently used web resources.","L","Modules\FavoriteLinks\FavoriteLinksLeft.ascx","../Modules/FavoriteLinks/FavoriteLinksLeft_Demo.aspx",0)
INSERT INTO Modules (Name,Description,Type,Source,DemoSource,Private) VALUES ("Welcome Module","This module contains the greeting to the ASP.NET Portal Site.","R","Modules\Welcome\Welcome.ascx","../Modules/Welcome/Welcome_Demo.aspx",0)
INSERT INTO Modules (Name,Description,Type,Source,DemoSource,Private) VALUES ("Weather Module","Your current five-day forecast.","L","Modules\Static\Weather.ascx","../Modules/Static/Weather_Demo.aspx",0)
INSERT INTO Modules (Name,Description,Type,Source,DemoSource,Private) VALUES ("World News","This module provides daily-updated world news.","R","Modules\Static\WorldNews.ascx","../Modules/Static/WorldNews_Demo.aspx",0)
INSERT INTO Modules (Name,Description,Type,Source,DemoSource,Private) VALUES ("Local News","This module provides daily-updated local news.","R","Modules\Static\LocalNews.ascx","../Modules/Static/LocalNews_Demo.aspx",0)
INSERT INTO Modules (Name,Description,Type,Source,DemoSource,Private) VALUES ("Book of the Day","Featured book selected, courtesy of the Book Cellar Bookstore and Cafe.","R","Modules\BookOfTheDay\BookOfTheDay.ascx","../Modules/BookOfTheDay/BookOfTheDay_Demo.aspx",0)


/* Insert data into personalization table */
INSERT INTO personalization (UserId,PageNames,PageModules_0L,PageModules_0R,PageModules_1L,PageModules_1R,PageModules_2L,PageModules_2R,PageIndex,SiteDirectory_Links,BackColor,LeftColor,HeadColor,SubheadColor,ColorScheme,FavoriteLinks_List,FavoriteLinksLeft_List) VALUES ("ANONYMOUS","Home Page","","Modules\Welcome\Welcome.ascx","","","","","0","1,2,3,4,5,6,7,8,9","#ffffff","#eeeeee","#6699cc","#b6cbeb","blue","CATEGORY,Microsoft Links,MSN,http://www.msn.com,Hotmail,http://www.hotmail.com,HomeAdvisor,http://www.homeadvisor.com,MoneyCentral,http://www.moneycentral.com,Expedia,http://www.expedia.com,CATEGORY,Developer Links,Web Workshop,http://msdn.microsoft.com/workshop,HTML Elements,http://msdn.microsoft.com/workshop/author/html/reference/elements.asp#ie40_htmlref,CSS Attributes,http://msdn.microsoft.com/workshop/author/css/reference/attributes.asp,MSDN,http://msdn.microsoft.com","CATEGORY,Microsoft Links,MSN,http://www.msn.com,Hotmail,http://www.hotmail.com,HomeAdvisor,http://www.homeadvisor.com,MoneyCentral,http://www.moneycentral.com,Expedia,http://www.expedia.com,MSDN,http://msdn.microsoft.com")
INSERT INTO personalization (UserId,PageNames,PageModules_0L,PageModules_0R,PageModules_1L,PageModules_1R,PageModules_2L,PageModules_2R,PageIndex,SiteDirectory_Links,BackColor,LeftColor,HeadColor,SubheadColor,ColorScheme,FavoriteLinks_List,FavoriteLinksLeft_List) VALUES ("default","Home Page;Page Two;Page Three","Modules\SiteDirectory\SiteDirectory.ascx;Modules\Static\Weather.ascx","Modules\FavoriteLinks\FavoriteLinks.ascx;Modules\Static\LocalNews.ascx;Modules\BookOfTheDay\BookOfTheDay.ascx","","","","","0","1,5,6","#ffffff","#f8e094","#f8bc03","#f8e094","yellow","CATEGORY,Microsoft Links,MSN,http://www.msn.com,Hotmail,http://www.hotmail.com,HomeAdvisor,http://www.homeadvisor.com,MoneyCentral,http://www.moneycentral.com,Expedia,http://www.expedia.com,CATEGORY,Developer Links,Web Workshop,http://msdn.microsoft.com/workshop,HTML Elements,http://msdn.microsoft.com/workshop/author/html/reference/elements.asp#ie40_htmlref,CSS Attributes,http://msdn.microsoft.com/workshop/author/css/reference/attributes.asp,MSDN,http://msdn.microsoft.com","CATEGORY,Microsoft Links,MSN,http://www.msn.com,Hotmail,http://www.hotmail.com,HomeAdvisor,http://www.homeadvisor.com,MoneyCentral,http://www.moneycentral.com,Expedia,http://www.expedia.com,MSDN,http://msdn.microsoft.com")


/* Insert data into SiteDirectory table */
INSERT INTO SiteDirectory (LinkIndex,LinkName,LinkRef,LinkDescription,UserData) VALUES (1,"Home","default.aspx","The ASP.NET Portal Home Page",0)
INSERT INTO SiteDirectory (LinkIndex,LinkName,LinkRef,LinkDescription,UserData) VALUES (2,"News","constr.aspx","Stay up-to-date with local and global news",0)
INSERT INTO SiteDirectory (LinkIndex,LinkName,LinkRef,LinkDescription,UserData) VALUES (3,"Jobs","constr.aspx","Current job openings and career news",0)
INSERT INTO SiteDirectory (LinkIndex,LinkName,LinkRef,LinkDescription,UserData) VALUES (4,"Travel","constr.aspx","Travel Tickets and Planner ",0)
INSERT INTO SiteDirectory (LinkIndex,LinkName,LinkRef,LinkDescription,UserData) VALUES (5,"Search","constr.aspx","Find what you are looking for using our custom search feature",0)
INSERT INTO SiteDirectory (LinkIndex,LinkName,LinkRef,LinkDescription,UserData) VALUES (6,"Help","constr.aspx","Our support staff are always just a click away",0)

