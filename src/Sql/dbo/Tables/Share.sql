﻿CREATE TABLE [dbo].[Share] (
    [Id]            UNIQUEIDENTIFIER    NOT NULL,
    [UserId]        UNIQUEIDENTIFIER    NOT NULL,
    [CipherId]      UNIQUEIDENTIFIER    NOT NULL,
    [Key]           VARCHAR(MAX)        NULL,
    [Permissions]   VARCHAR(MAX)        NULL,
    [Status]        TINYINT             NOT NULL,
    [CreationDate]  DATETIME2 (7)       NOT NULL,
    [RevisionDate]  DATETIME2 (7)       NOT NULL,
    CONSTRAINT [PK_Share] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Share_Cipher] FOREIGN KEY ([CipherId]) REFERENCES [dbo].[Cipher] ([Id]),
    CONSTRAINT [FK_Share_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_Share_CipherId_Status]
    ON [dbo].[Share]([CipherId] ASC, [Status] ASC);
