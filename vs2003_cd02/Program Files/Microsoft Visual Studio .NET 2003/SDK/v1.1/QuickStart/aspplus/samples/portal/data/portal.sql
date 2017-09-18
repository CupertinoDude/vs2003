if exists (select * from sysobjects where id = object_id(N'[dbo].[CreatePersonalizationAccount]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[CreatePersonalizationAccount]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[GetPublicModules]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetPublicModules]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[GetSiteLinks]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[GetSiteLinks]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[LoadPersonalizationSettings]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[LoadPersonalizationSettings]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[SavePersonalizationSettings]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[SavePersonalizationSettings]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[sp_CreateProfile]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_CreateProfile]
GO

if exists (select * from sysobjects where id = object_id(N'[dbo].[sp_ValidateUser]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ValidateUser]
GO

SET QUOTED_IDENTIFIER  OFF    SET ANSI_NULLS  ON 
GO



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
   DECLARE @PageIndex VARCHAR(50)
   DECLARE @BackColor varchar(15)
   DECLARE @LeftColor varchar(15)
   DECLARE @HeadColor varchar(15)
   DECLARE @SubheadColor varchar(15)
   DECLARE @ColorScheme varchar(15)
   DECLARE @SiteDirectory_Links VARCHAR(200)
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


CREATE Procedure GetPublicModules As
 SELECT * FROM Modules WHERE Private != 1
 return 

GO
SET QUOTED_IDENTIFIER  OFF    SET ANSI_NULLS  ON 
GO

SET QUOTED_IDENTIFIER  OFF    SET ANSI_NULLS  ON 
GO



Create Procedure GetSiteLinks As
            SELECT * FROM SiteDirectory
 return 

GO
SET QUOTED_IDENTIFIER  OFF    SET ANSI_NULLS  ON 
GO

SET QUOTED_IDENTIFIER  OFF    SET ANSI_NULLS  ON 
GO


CREATE Procedure LoadPersonalizationSettings
 (
  @UserId varchar(50)
 )
As
 SELECT * FROM Personalization WHERE UserID=@UserId
 return 

GO
SET QUOTED_IDENTIFIER  OFF    SET ANSI_NULLS  ON 
GO

SET QUOTED_IDENTIFIER  OFF    SET ANSI_NULLS  ON 
GO


CREATE Procedure SavePersonalizationSettings
 (
  @UserId varchar(50),
  @PageNames varchar(8000),
  @PageModules_0L varchar(8000),
  @PageModules_0R varchar(8000),
  @PageModules_1L varchar(8000),
  @PageModules_1R varchar(8000),
  @PageModules_2L varchar(8000),
  @PageModules_2R varchar(8000),
  @PageIndex varchar(200),
  @SiteDirectory_Links varchar(200),
  @BackColor varchar(15),
  @LeftColor varchar(15),
  @HeadColor varchar(15),
  @SubheadColor varchar(15),
  @ColorScheme varchar(15),
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




CREATE proc sp_CreateProfile @UserId   varchar(15), @Password varchar(15), @FirstName varchar(15), @LastName varchar(15),
@Address   varchar(50), @State varchar(2), @Zip varchar(5), @Phone varchar(15),@City   varchar(50)
as
insert into UserData 
values (@UserId , @Password , @FirstName , @LastName ,@Address, @State, @Zip, @Phone ,@City )

return

GO
SET QUOTED_IDENTIFIER  OFF    SET ANSI_NULLS  ON 
GO

SET QUOTED_IDENTIFIER  OFF    SET ANSI_NULLS  ON 
GO



CREATE proc sp_ValidateUser  @UserId   varchar(20), @Password varchar(15) , @IsValid Int  output
as 
if (select count(*) from UserData where Userid= @UserId and Password = @Password ) = 1
    select @ISValid = 1
else 
    select @IsValid = 0 
return

GO
SET QUOTED_IDENTIFIER  OFF    SET ANSI_NULLS  ON 
GO

