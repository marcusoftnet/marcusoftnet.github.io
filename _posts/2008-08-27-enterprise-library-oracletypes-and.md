---
layout: post
title: Enterprise Library, OracleTypes and their mapping
date: '2008-08-27T08:46:00.003+02:00'
author: Marcus Hammarberg
tags:
  - Tools
  - .NET
  - Life of a consultant
modified_time: '2010-12-14T16:23:30.932+01:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-9201356354710801780
blogger_orig_url: http://www.marcusoft.net/2008/08/enterprise-library-oracletypes-and.html
---

Things has been quite hectic since we are closing in on a sprint
demo... Seems to be working now, fingers crossed.

I have done a lot of findings the last days and most of them has to do
with [Oracle](http://www.oracle.com/). This has to do with me not having
any experience with [Oracle](http://www.oracle.com/).

We are using [Enterprise Library 4](http://www.codeplex.com/entlib) to
access the Oracle database and it's stored procedures. It internal is
using the [ODP.NET client access
components](http://www.oracle.com/technology/software/tech/windows/odpnet/index.html).

One problem we have encountered is that the data types used by
Enterprise Library is generic (DBCommand, DBTypes etc) and it is mapped
to the Oracle equivalents (OracleCommand, OracleTypes). So I needed a
[chart](http://msdn.microsoft.com/en-us/library/yk72thhd(VS.80).aspx) on
my table showing me how to map between them.

But after a while I found a better way. Enterprise Library is exposing a
OracleDatabase with the Oracle-flavor of the command types. By using
that database I can use the same datatypes (NUMBER for example) as
defined in the database.

To accomplish this I did some very small but useful tricks:

- The OracleDatabase doesn't have a factory that takes the
    connectionstring-name as parameter. So I used the standard factory
    to get the connection-string and passed it as a parameter into the
    constructor of the OracleDatabase-class. Like so:
       New OracleDatabase(DatabaseFactory.CreateDatabase(CONNECTIONSTRING_CONFIG_GBP).ConnectionString)

- To get a OracleCommand rather than the standard DbCommand I created
    a method that simple cast into the right command:
       Private Function SkapaOracleSPCommand(ByVal spNamn As String) As OracleCommand
                Return DirectCast(m_gbpDB.GetStoredProcCommand(spNamn), OracleCommand)
        End Function

- Finally I created two methods that creates OracleParameters, one for
    in (with null-handling) and one for out-parameter (no value or size
    set):
           Private Function CreateOracleOutParameter(ByVal namn As String, ByVal typ As OracleType) As OracleParameter
                Dim parameter As New OracleParameter(namn, typ)
                parameter.Direction = ParameterDirection.Output
                Return parameter
            End Function
           Private Function CreateOracleInParameter(ByVal namn As String, ByVal typ As OracleType, ByVal varde As Object) As OracleParameter
                Dim parameter As New OracleParameter(namn, typ)
                parameter.Direction = ParameterDirection.Input
               parameter.Value = varde
                If varde Is Nothing Then
                    parameter.IsNullable = True
                    parameter.Value = DBNull.Value
                End If
               Return parameter
            End Function

   I then use these methods to add parameters to my command:
       cmd.Parameters.Add(CreateOracleInParameter("IN_UPPDRAGSNR", OracleType.VarChar, uppdrag.FaktureringsUppdragsID.ToString()))
        cmd.Parameters.Add(CreateOracleOutParameter(paramUtNamn, OracleType.Number))

So that's an easy way to use Oracle-types when using Enterprise Library
(4) and get around the hustle and bustle to map the two back and forth.
